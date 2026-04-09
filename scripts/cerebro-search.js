#!/usr/bin/env node
/**
 * cerebro-search — CLI search for cerebro-local knowledge base
 * 
 * Drop-in alternative to qmd for CPU-only Windows machines.
 * Uses MiniSearch (pure JavaScript) — no GPU, no models.
 * Caches index to disk for fast subsequent searches.
 * 
 * Usage:
 *   node scripts/cerebro-search.js query "natural language question"
 *   node scripts/cerebro-search.js query "question" -c wiki
 *   node scripts/cerebro-search.js query "question" -c raw
 *   node scripts/cerebro-search.js search "exact keywords"
 *   node scripts/cerebro-search.js status
 *   node scripts/cerebro-search.js rebuild          # force re-index
 * 
 * First run indexes all files (~12s) and caches to .qmd/search-index.json.
 * Subsequent runs load from cache (~2s).
 */

const fs = require('fs');
const path = require('path');

let MiniSearch;
try {
  MiniSearch = require('minisearch');
} catch {
  console.error('\n  MiniSearch not installed. Run: npm install minisearch\n');
  process.exit(1);
}

const ROOT = path.resolve(__dirname, '..');
const WIKI_DIR = path.join(ROOT, 'wiki');
const RAW_DIR = path.join(ROOT, 'raw');
const CACHE_DIR = path.join(ROOT, '.qmd');
const INDEX_FILE = path.join(CACHE_DIR, 'search-index.json');
const META_FILE = path.join(CACHE_DIR, 'search-meta.json');

// --- File utilities ---

function walkDir(dir, base) {
  const results = [];
  try {
    const entries = fs.readdirSync(dir, { withFileTypes: true });
    for (const entry of entries) {
      const full = path.join(dir, entry.name);
      if (entry.isDirectory()) {
        if (entry.name.startsWith('.') || entry.name === 'node_modules') continue;
        results.push(...walkDir(full, base));
      } else if (entry.name.endsWith('.md')) {
        const relPath = path.relative(base, full).replace(/\\/g, '/');
        results.push({ fullPath: full, relPath });
      }
    }
  } catch { }
  return results;
}

function getType(p) {
  if (p.includes('/entities/')) return 'entity';
  if (p.includes('/concepts/')) return 'concept';
  if (p.includes('/comparisons/')) return 'comparison';
  if (p.includes('/patterns/')) return 'pattern';
  if (p.includes('/sources/')) return 'source';
  if (p.startsWith('raw/')) return 'raw';
  return 'file';
}

function getCollection(p) {
  if (p.startsWith('wiki/')) return 'wiki';
  if (p.startsWith('raw/')) return 'raw';
  return 'unknown';
}

function extractTitle(content) {
  const fmMatch = content.match(/^---\n[\s\S]*?title:\s*["']?([^\n"']+)["']?\n[\s\S]*?---/);
  if (fmMatch) return fmMatch[1].trim();
  const h1Match = content.match(/^#\s+(.+)$/m);
  if (h1Match) return h1Match[1].trim();
  return '';
}

function extractSnippet(content, maxLen = 200) {
  let text = content;
  if (text.startsWith('---')) {
    const endIdx = text.indexOf('---', 3);
    if (endIdx !== -1) text = text.substring(endIdx + 3);
  }
  text = text
    .replace(/^#+\s+.+$/gm, '')
    .replace(/\[([^\]]*)\]\([^)]*\)/g, '$1')
    .replace(/[*_`~]/g, '')
    .replace(/^\s*[-|>].*/gm, '')
    .replace(/\n{2,}/g, '\n')
    .trim();
  return text.substring(0, maxLen);
}

// --- Index management ---

function buildIndex() {
  const startTime = Date.now();
  process.stderr.write('Indexing files...');

  const wikiFiles = walkDir(WIKI_DIR, ROOT);
  const rawFiles = walkDir(RAW_DIR, ROOT);
  const allFiles = [...wikiFiles, ...rawFiles];

  const miniSearch = new MiniSearch({
    fields: ['title', 'content', 'path'],
    storeFields: ['path', 'title', 'snippet', 'collection', 'type'],
    searchOptions: {
      boost: { title: 3, path: 1.5 },
      fuzzy: 0.2,
      prefix: true,
    },
    tokenize: (text) => {
      return text.toLowerCase().split(/[\s\-_./\\:;,()[\]{}|<>]+/).filter(t => t.length > 1);
    },
  });

  const docs = [];
  let indexed = 0;

  for (const file of allFiles) {
    try {
      const content = fs.readFileSync(file.fullPath, 'utf8');
      docs.push({
        id: indexed,
        path: file.relPath,
        title: extractTitle(content),
        content,
        snippet: extractSnippet(content),
        collection: getCollection(file.relPath),
        type: getType(file.relPath),
      });
      indexed++;
    } catch { }
  }

  miniSearch.addAll(docs);

  // Save to cache
  if (!fs.existsSync(CACHE_DIR)) fs.mkdirSync(CACHE_DIR, { recursive: true });
  fs.writeFileSync(INDEX_FILE, JSON.stringify(miniSearch));
  fs.writeFileSync(META_FILE, JSON.stringify({
    indexed,
    wiki: wikiFiles.length,
    raw: rawFiles.length,
    built: new Date().toISOString(),
    elapsed: ((Date.now() - startTime) / 1000).toFixed(1),
  }));

  const elapsed = ((Date.now() - startTime) / 1000).toFixed(1);
  process.stderr.write(` ${indexed} docs in ${elapsed}s\n`);

  return miniSearch;
}

function loadIndex() {
  // Check if cache exists and is reasonably fresh
  if (fs.existsSync(INDEX_FILE) && fs.existsSync(META_FILE)) {
    try {
      const startTime = Date.now();
      const json = fs.readFileSync(INDEX_FILE, 'utf8');
      const miniSearch = MiniSearch.loadJSON(json, {
        fields: ['title', 'content', 'path'],
        storeFields: ['path', 'title', 'snippet', 'collection', 'type'],
        tokenize: (text) => {
          return text.toLowerCase().split(/[\s\-_./\\:;,()[\]{}|<>]+/).filter(t => t.length > 1);
        },
      });
      const elapsed = ((Date.now() - startTime) / 1000).toFixed(1);
      process.stderr.write(`Loaded cached index in ${elapsed}s\n`);
      return miniSearch;
    } catch {
      // Cache corrupted, rebuild
    }
  }
  return buildIndex();
}

// --- Search ---

function doSearch(miniSearch, query, collection, mode) {
  const searchOpts = {
    boost: { title: 3, path: 1.5 },
    fuzzy: mode === 'keyword' ? false : 0.2,
    prefix: true,
    combineWith: 'OR',
  };

  if (collection && collection !== 'all') {
    searchOpts.filter = (result) => result.collection === collection;
  }

  let results = miniSearch.search(query, searchOpts);
  results = results.slice(0, 10);

  const maxScore = results.length > 0 ? results[0].score : 1;

  return results.map(r => ({
    path: r.path,
    score: Math.round((r.score / maxScore) * 100),
    type: r.type,
    collection: r.collection,
    snippet: r.snippet || '',
  }));
}

function formatResults(results, query) {
  if (results.length === 0) {
    console.log(`No results for "${query}"`);
    return;
  }

  for (const r of results) {
    // Output in qmd-like format
    console.log(`qmd://${r.path}`);
    console.log(`Score:  ${r.score}%`);
    if (r.snippet) {
      // Show first 2 lines of snippet
      const lines = r.snippet.split('\n').filter(l => l.trim()).slice(0, 2);
      for (const line of lines) {
        console.log(line);
      }
    }
    console.log('');
  }
}

// --- CLI ---

function printUsage() {
  console.log(`
  cerebro-search — CLI search for cerebro-local (CPU-only, no qmd)

  Usage:
    cerebro-search query "question"           Search with fuzzy matching
    cerebro-search query "question" -c wiki   Search wiki only
    cerebro-search query "question" -c raw    Search raw articles only
    cerebro-search search "keywords"          Exact keyword search (no fuzzy)
    cerebro-search get <file>                 Print file content
    cerebro-search status                     Show index stats
    cerebro-search rebuild                    Force re-index

  Output format matches qmd for agent compatibility.

  Setup:
    npm install minisearch    (one-time)
`);
}

const args = process.argv.slice(2);
const command = args[0];

if (!command || command === '--help' || command === '-h') {
  printUsage();
  process.exit(0);
}

// Parse -c flag
let collection = 'all';
const cIdx = args.indexOf('-c');
if (cIdx !== -1 && args[cIdx + 1]) {
  collection = args[cIdx + 1];
  args.splice(cIdx, 2);
}

// Parse -n flag
let maxResults = 5;
const nIdx = args.indexOf('-n');
if (nIdx !== -1 && args[nIdx + 1]) {
  maxResults = parseInt(args[nIdx + 1]);
  args.splice(nIdx, 2);
}

switch (command) {
  case 'query': {
    const query = args.slice(1).join(' ');
    if (!query) { console.error('Usage: cerebro-search query "question"'); process.exit(1); }
    const index = loadIndex();
    const results = doSearch(index, query, collection, 'fuzzy');
    formatResults(results.slice(0, maxResults), query);
    break;
  }

  case 'search': {
    const query = args.slice(1).join(' ');
    if (!query) { console.error('Usage: cerebro-search search "keywords"'); process.exit(1); }
    const index = loadIndex();
    const results = doSearch(index, query, collection, 'keyword');
    formatResults(results.slice(0, maxResults), query);
    break;
  }

  case 'get': {
    const filePath = args[1];
    if (!filePath) { console.error('Usage: cerebro-search get <file>'); process.exit(1); }
    const resolved = path.resolve(ROOT, filePath);
    if (!resolved.startsWith(ROOT)) { console.error('Path outside repository'); process.exit(1); }
    try {
      console.log(fs.readFileSync(resolved, 'utf8'));
    } catch {
      console.error(`File not found: ${filePath}`);
      process.exit(1);
    }
    break;
  }

  case 'status': {
    if (fs.existsSync(META_FILE)) {
      const meta = JSON.parse(fs.readFileSync(META_FILE, 'utf8'));
      console.log(`Cerebro Search (Lite)\n`);
      console.log(`Engine:    MiniSearch (pure JavaScript, no GPU)`);
      console.log(`Documents: ${meta.indexed} (${meta.wiki} wiki + ${meta.raw} raw)`);
      console.log(`Index:     ${INDEX_FILE}`);
      console.log(`Built:     ${meta.built} (${meta.elapsed}s)`);
      console.log(`Search:    BM25 + fuzzy matching + prefix search`);
    } else {
      console.log('No index found. Run: cerebro-search rebuild');
    }
    break;
  }

  case 'rebuild': {
    buildIndex();
    console.log('Index rebuilt.');
    break;
  }

  default:
    console.error(`Unknown command: ${command}`);
    printUsage();
    process.exit(1);
}
