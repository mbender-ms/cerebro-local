#!/usr/bin/env node
/**
 * Cerebro Search Server (Lite)
 * 
 * Pure Node.js search server for Windows CPU-only machines.
 * Uses MiniSearch instead of qmd — no GPU, no models, no native dependencies.
 * Same search.html frontend works with both servers.
 * 
 * First run:
 *   cd cerebro-local
 *   npm install minisearch
 *   node scripts/search-server-lite.js
 * 
 * Then open http://localhost:3333
 */

const http = require('http');
const fs = require('fs');
const path = require('path');
const { URL } = require('url');

// Try to load MiniSearch
let MiniSearch;
try {
  MiniSearch = require('minisearch');
} catch {
  console.error('\n  ❌ MiniSearch not installed. Run:\n');
  console.error('     npm install minisearch\n');
  console.error('  Then try again.\n');
  process.exit(1);
}

const PORT = parseInt(process.argv.find((_, i, a) => a[i - 1] === '--port') || '3333');
const ROOT = path.resolve(__dirname, '..');
const HTML_FILE = path.join(ROOT, 'search.html');

const WIKI_DIR = path.join(ROOT, 'wiki');
const RAW_DIR = path.join(ROOT, 'raw');

// --- Index all markdown files ---

function walkDir(dir, base) {
  const results = [];
  try {
    const entries = fs.readdirSync(dir, { withFileTypes: true });
    for (const entry of entries) {
      const full = path.join(dir, entry.name);
      if (entry.isDirectory()) {
        // Skip hidden dirs and node_modules
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

function getType(filePath) {
  if (filePath.includes('/entities/')) return 'entity';
  if (filePath.includes('/concepts/')) return 'concept';
  if (filePath.includes('/comparisons/')) return 'comparison';
  if (filePath.includes('/patterns/')) return 'pattern';
  if (filePath.includes('/sources/')) return 'source';
  if (filePath.startsWith('raw/')) return 'raw';
  return 'file';
}

function getCollection(filePath) {
  if (filePath.startsWith('wiki/')) return 'wiki';
  if (filePath.startsWith('raw/')) return 'raw';
  return 'unknown';
}

function extractTitle(content) {
  // Try YAML frontmatter title
  const fmMatch = content.match(/^---\n[\s\S]*?title:\s*["']?([^\n"']+)["']?\n[\s\S]*?---/);
  if (fmMatch) return fmMatch[1].trim();
  // Try first H1
  const h1Match = content.match(/^#\s+(.+)$/m);
  if (h1Match) return h1Match[1].trim();
  return '';
}

function extractSnippet(content, maxLen = 300) {
  // Strip YAML frontmatter
  let text = content;
  if (text.startsWith('---')) {
    const endIdx = text.indexOf('---', 3);
    if (endIdx !== -1) text = text.substring(endIdx + 3);
  }
  // Strip markdown formatting
  text = text
    .replace(/^#+\s+.+$/gm, '')       // headers
    .replace(/\[([^\]]*)\]\([^)]*\)/g, '$1') // links
    .replace(/[*_`~]/g, '')            // formatting
    .replace(/^\s*[-|>].*/gm, '')      // tables, blockquotes, lists
    .replace(/\n{2,}/g, '\n')
    .trim();
  return text.substring(0, maxLen);
}

console.log('\n  🧠 Cerebro Search (Lite) — indexing...\n');

const startTime = Date.now();

// Collect all files
const wikiFiles = walkDir(WIKI_DIR, ROOT);
const rawFiles = walkDir(RAW_DIR, ROOT);
const allFiles = [...wikiFiles, ...rawFiles];

console.log(`  Found: ${wikiFiles.length} wiki + ${rawFiles.length} raw = ${allFiles.length} files`);

// Build index
const miniSearch = new MiniSearch({
  fields: ['title', 'content', 'path'],
  storeFields: ['path', 'title', 'snippet', 'collection', 'type'],
  searchOptions: {
    boost: { title: 3, path: 1.5 },
    fuzzy: 0.2,
    prefix: true,
  },
  tokenize: (text) => {
    // Custom tokenizer: split on whitespace, hyphens, slashes, dots
    return text.toLowerCase().split(/[\s\-_./\\:;,()[\]{}|<>]+/).filter(t => t.length > 1);
  },
});

const docs = [];
let indexed = 0;

for (const file of allFiles) {
  try {
    const content = fs.readFileSync(file.fullPath, 'utf8');
    const title = extractTitle(content);
    const snippet = extractSnippet(content);

    docs.push({
      id: indexed,
      path: file.relPath,
      title,
      content,
      snippet,
      collection: getCollection(file.relPath),
      type: getType(file.relPath),
    });
    indexed++;
  } catch {
    // Skip unreadable files
  }
}

miniSearch.addAll(docs);

const elapsed = ((Date.now() - startTime) / 1000).toFixed(1);
console.log(`  Indexed: ${indexed} documents in ${elapsed}s\n`);

// --- Lookup map for file content ---
const docsByPath = new Map();
for (const doc of docs) {
  docsByPath.set(doc.path, doc);
}

// --- HTTP Server ---

function handleSearch(req, res) {
  let body = '';
  req.on('data', chunk => body += chunk);
  req.on('end', () => {
    try {
      const { query, collection, mode } = JSON.parse(body);

      if (!query || !query.trim()) {
        res.writeHead(400, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ error: 'Query is required' }));
        return;
      }

      const searchOpts = {
        boost: { title: 3, path: 1.5 },
        fuzzy: mode === 'keyword' ? false : 0.2,
        prefix: true,
        combineWith: 'OR',
      };

      // Filter by collection if specified
      if (collection && collection !== 'all') {
        searchOpts.filter = (result) => result.collection === collection;
      }

      let results = miniSearch.search(query.trim(), searchOpts);

      // Limit to top 10
      results = results.slice(0, 10);

      // Normalize scores to percentages (0-100)
      const maxScore = results.length > 0 ? results[0].score : 1;

      const formatted = results.map(r => ({
        filePath: r.path,
        displayPath: r.path,
        lineNum: null,
        hash: null,
        score: Math.round((r.score / maxScore) * 100),
        content: r.snippet || '',
        collection: r.collection,
        type: r.type,
      }));

      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ results: formatted }));
    } catch (err) {
      res.writeHead(500, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ error: err.message }));
    }
  });
}

function handleGetFile(req, res, parsed) {
  const filePath = parsed.searchParams.get('path');

  if (!filePath) {
    res.writeHead(400, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: 'path parameter required' }));
    return;
  }

  const resolved = path.resolve(ROOT, filePath);
  if (!resolved.startsWith(ROOT)) {
    res.writeHead(403, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: 'Path outside repository' }));
    return;
  }

  try {
    const content = fs.readFileSync(resolved, 'utf8');
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ path: filePath, content }));
  } catch {
    res.writeHead(404, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: `File not found: ${filePath}` }));
  }
}

const server = http.createServer(async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.writeHead(200);
    res.end();
    return;
  }

  const parsed = new URL(req.url, `http://${req.headers.host}`);

  if (req.method === 'GET' && (parsed.pathname === '/' || parsed.pathname === '/search.html')) {
    try {
      const html = fs.readFileSync(HTML_FILE, 'utf8');
      res.writeHead(200, { 'Content-Type': 'text/html' });
      res.end(html);
    } catch {
      res.writeHead(404, { 'Content-Type': 'text/plain' });
      res.end('search.html not found');
    }
    return;
  }

  if (req.method === 'POST' && parsed.pathname === '/api/search') {
    handleSearch(req, res);
    return;
  }

  if (req.method === 'GET' && parsed.pathname === '/api/file') {
    handleGetFile(req, res, parsed);
    return;
  }

  if (req.method === 'GET' && parsed.pathname === '/api/status') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({
      status: `Cerebro Search (Lite)\n\nEngine: MiniSearch (pure JavaScript, no GPU required)\nDocuments: ${indexed}\nWiki: ${wikiFiles.length} files\nRaw: ${rawFiles.length} files\nIndex time: ${elapsed}s\nSearch: BM25 + fuzzy matching + prefix search`
    }));
    return;
  }

  res.writeHead(404, { 'Content-Type': 'text/plain' });
  res.end('Not found');
});

server.listen(PORT, '127.0.0.1', () => {
  console.log(`  🧠 Cerebro Search (Lite) → http://localhost:${PORT}\n`);
  console.log(`  Engine:  MiniSearch (pure JS — no GPU, no models)`);
  console.log(`  Docs:    ${indexed} (${wikiFiles.length} wiki + ${rawFiles.length} raw)`);
  console.log(`  Port:    ${PORT}\n`);
  console.log(`  Press Ctrl+C to stop.\n`);
});
