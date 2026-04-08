#!/usr/bin/env node

/**
 * MS Learn Article Chunker for Cerebro Knowledge Base
 * 
 * Splits Azure documentation articles into semantic chunks optimized for
 * wiki ingest and qmd search retrieval. Handles:
 * - YAML frontmatter extraction and propagation
 * - H2-level section splitting (primary chunk boundary)
 * - Tab group separation (Portal/PowerShell/CLI → separate chunks)
 * - Zone pivot separation (:::zone pivot="x":::)
 * - Header hierarchy preservation (each chunk knows its H1 > H2 > H3 context)
 * - Metadata enrichment per chunk
 * 
 * Usage:
 *   node chunk-article.js <input.md> [--output-dir <dir>] [--dry-run]
 *   node chunk-article.js raw/articles/nat-overview.md --output-dir /tmp/chunks
 */

const fs = require('fs');
const path = require('path');

// --- Frontmatter parser ---
function parseFrontmatter(content) {
  const match = content.match(/^---\n([\s\S]*?)\n---\n/);
  if (!match) return { metadata: {}, body: content };
  
  const raw = match[1];
  const metadata = {};
  let currentKey = null;
  
  for (const line of raw.split('\n')) {
    // Skip comments
    if (line.trim().startsWith('#')) continue;
    
    const kvMatch = line.match(/^(\w[\w.]*)\s*:\s*(.*)$/);
    if (kvMatch) {
      currentKey = kvMatch[1];
      const val = kvMatch[2].trim();
      if (val === '' || val === '|') {
        metadata[currentKey] = '';
      } else if (val.startsWith('[') || val.startsWith('"') || val.startsWith("'")) {
        metadata[currentKey] = val.replace(/^['"]|['"]$/g, '');
      } else {
        metadata[currentKey] = val;
      }
    } else if (line.match(/^\s+-\s+/) && currentKey) {
      // Array items under current key
      const item = line.replace(/^\s+-\s+/, '').trim();
      if (!Array.isArray(metadata[currentKey])) {
        metadata[currentKey] = metadata[currentKey] ? [metadata[currentKey]] : [];
      }
      metadata[currentKey].push(item);
    }
  }
  
  const body = content.slice(match[0].length);
  return { metadata, body };
}

// --- Detect article type ---
function detectArticleType(metadata) {
  const topic = (metadata['ms.topic'] || '').toLowerCase();
  if (topic) return topic;
  
  const title = (metadata.title || '').toLowerCase();
  if (title.startsWith('quickstart')) return 'quickstart';
  if (title.startsWith('tutorial')) return 'tutorial';
  if (title.includes('troubleshoot')) return 'troubleshooting';
  if (title.startsWith('what is') || title.startsWith('overview')) return 'overview';
  return 'article';
}

// --- Detect tab groups and zone pivots ---
function hasTabGroups(body) {
  return /^###\s+\[.+?\]\(#tab\//.test(body) || body.includes('(#tab/');
}

function hasZonePivots(body) {
  return body.includes('::: zone pivot=');
}

// --- Split body into H2 sections ---
function splitH2Sections(body) {
  const sections = [];
  const lines = body.split('\n');
  let currentSection = { heading: null, level: 0, lines: [], startLine: 0 };
  
  // Capture any content before the first H2 (intro paragraph under H1)
  let h1 = null;
  
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    const h1Match = line.match(/^# (.+)/);
    const h2Match = line.match(/^## (.+)/);
    
    if (h1Match && !h1) {
      h1 = h1Match[1];
      continue;
    }
    
    if (h2Match) {
      // Save previous section
      if (currentSection.heading !== null || currentSection.lines.length > 0) {
        sections.push({ ...currentSection, lines: [...currentSection.lines] });
      }
      currentSection = {
        heading: h2Match[1],
        level: 2,
        lines: [],
        startLine: i,
      };
    } else {
      currentSection.lines.push(line);
    }
  }
  
  // Push final section
  if (currentSection.heading !== null || currentSection.lines.length > 0) {
    sections.push(currentSection);
  }
  
  return { h1, sections };
}

// --- Extract tab groups from a section ---
function extractTabGroups(sectionLines) {
  const tabs = {};
  let currentTab = null;
  let nonTabContent = [];
  let inTabs = false;
  
  for (const line of sectionLines) {
    const tabMatch = line.match(/^###\s+\[(.+?)\]\(#tab\/(.+?)\)/);
    const tabEnd = line.match(/^---$/);
    
    if (tabMatch) {
      inTabs = true;
      currentTab = tabMatch[2]; // e.g., "portal", "powershell", "cli"
      if (!tabs[currentTab]) {
        tabs[currentTab] = { label: tabMatch[1], lines: [] };
      }
    } else if (tabEnd && inTabs) {
      currentTab = null;
      inTabs = false;
    } else if (currentTab) {
      tabs[currentTab].lines.push(line);
    } else {
      nonTabContent.push(line);
    }
  }
  
  return { tabs, nonTabContent };
}

// --- Extract zone pivots from body ---
function extractZonePivots(body) {
  const zones = {};
  const lines = body.split('\n');
  let currentZone = null;
  let outsideContent = [];
  
  for (const line of lines) {
    const zoneStart = line.match(/::: zone pivot="(.+?)"/);
    const zoneEnd = line.match(/^::: zone-end/);
    
    if (zoneStart) {
      currentZone = zoneStart[1];
      if (!zones[currentZone]) {
        zones[currentZone] = [];
      }
    } else if (zoneEnd) {
      currentZone = null;
    } else if (currentZone) {
      zones[currentZone].push(line);
    } else {
      outsideContent.push(line);
    }
  }
  
  return { zones, outsideContent };
}

// --- Build chunk metadata ---
function buildChunkMeta(articleMeta, h1, h2, options = {}) {
  const slug = (h2 || h1 || articleMeta.title || 'untitled')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '');
    
  const meta = {
    title: h2 || h1 || articleMeta.title,
    'chunk-of': articleMeta.title || 'Unknown',
    'ms.service': articleMeta['ms.service'] || '',
    'ms.topic': articleMeta['ms.topic'] || '',
    'article-date': articleMeta['ms.date'] || '',
    'header-path': [h1, h2].filter(Boolean).join(' > '),
    tags: [articleMeta['ms.service'], articleMeta['ms.topic']].filter(Boolean),
  };
  
  if (options.tab) {
    meta['deployment-method'] = options.tab;
    meta.tags.push(options.tab);
  }
  
  if (options.zonePivot) {
    meta['zone-pivot'] = options.zonePivot;
    meta.tags.push(options.zonePivot);
  }
  
  return { slug, meta };
}

// --- Format chunk as markdown ---
function formatChunk(meta, headerPath, content) {
  const fm = ['---'];
  for (const [k, v] of Object.entries(meta)) {
    if (Array.isArray(v)) {
      fm.push(`${k}:`);
      for (const item of v) fm.push(`  - ${item}`);
    } else {
      fm.push(`${k}: "${v}"`);
    }
  }
  fm.push('---');
  fm.push('');
  fm.push(`# ${meta.title}`);
  if (meta['header-path'] && meta['header-path'] !== meta.title) {
    fm.push('');
    fm.push(`> Part of: **${meta['chunk-of']}** — ${meta['header-path']}`);
  }
  fm.push('');
  fm.push(content.trim());
  fm.push('');
  
  return fm.join('\n');
}

// --- Main chunking logic ---
function chunkArticle(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');
  const { metadata, body } = parseFrontmatter(content);
  const articleType = detectArticleType(metadata);
  const chunks = [];
  
  // Handle zone-pivot articles (entire body is pivot-wrapped)
  if (hasZonePivots(body)) {
    const { zones, outsideContent } = extractZonePivots(body);
    
    // Chunk the outside content normally
    const { h1, sections } = splitH2Sections(outsideContent.join('\n'));
    
    // Add intro chunk if there's content before first H2
    if (sections.length > 0 && sections[0].heading === null && sections[0].lines.some(l => l.trim())) {
      const { slug, meta } = buildChunkMeta(metadata, h1, null);
      chunks.push({
        slug: slug + '-overview',
        content: formatChunk({ ...meta, title: h1 || metadata.title }, '', sections[0].lines.join('\n')),
      });
    }
    
    // Add zone-specific chunks
    for (const [pivot, lines] of Object.entries(zones)) {
      const zoneBody = lines.join('\n');
      // Zone content might have its own H2 structure or be an include
      const includeMatch = zoneBody.match(/\[!INCLUDE\s+\[.*?\]\((.*?)\)\]/);
      
      const { slug, meta } = buildChunkMeta(metadata, h1, null, { zonePivot: pivot });
      chunks.push({
        slug: `${slug}-${pivot}`,
        content: formatChunk(
          { ...meta, title: `${h1 || metadata.title} (${pivot})` },
          '',
          zoneBody
        ),
      });
    }
    
    // Process any H2 sections outside zones
    for (const section of sections) {
      if (!section.heading) continue;
      if (isSkippableSection(section.heading)) continue;
      
      const { slug, meta } = buildChunkMeta(metadata, h1, section.heading);
      chunks.push({
        slug,
        content: formatChunk(meta, '', section.lines.join('\n')),
      });
    }
    
    return { metadata, articleType, chunks };
  }
  
  // Standard article processing
  const { h1, sections } = splitH2Sections(body);
  
  for (const section of sections) {
    // Handle intro (content before first H2)
    if (section.heading === null) {
      if (section.lines.some(l => l.trim())) {
        const { slug, meta } = buildChunkMeta(metadata, h1, null);
        chunks.push({
          slug: slug + '-overview',
          content: formatChunk({ ...meta, title: h1 || metadata.title }, '', section.lines.join('\n')),
        });
      }
      continue;
    }
    
    // Skip boilerplate sections
    if (isSkippableSection(section.heading)) continue;
    
    // Check if section has tab groups
    const { tabs, nonTabContent } = extractTabGroups(section.lines);
    
    if (Object.keys(tabs).length > 0) {
      // Create a chunk per tab
      for (const [tabId, tabData] of Object.entries(tabs)) {
        const { slug, meta } = buildChunkMeta(metadata, h1, section.heading, { tab: tabId });
        const combinedContent = [...nonTabContent, '', ...tabData.lines].join('\n');
        chunks.push({
          slug: `${slug}-${tabId}`,
          content: formatChunk(
            { ...meta, title: `${section.heading} (${tabData.label})` },
            '',
            combinedContent
          ),
        });
      }
    } else {
      // Single chunk for this section
      const { slug, meta } = buildChunkMeta(metadata, h1, section.heading);
      chunks.push({
        slug,
        content: formatChunk(meta, '', section.lines.join('\n')),
      });
    }
  }
  
  return { metadata, articleType, chunks };
}

// --- Sections to skip ---
function isSkippableSection(heading) {
  const skip = [
    'next steps',
    'clean up resources',
    'related content', 
    'related articles',
    'see also',
  ];
  return skip.includes(heading.toLowerCase().trim());
}

// --- CLI ---
function main() {
  const args = process.argv.slice(2);
  
  if (args.length === 0 || args.includes('--help')) {
    console.log(`Usage: node chunk-article.js <input.md> [--output-dir <dir>] [--dry-run]`);
    console.log(`       node chunk-article.js <input.md> --summary`);
    process.exit(0);
  }
  
  const inputFile = args[0];
  const outputDir = args.includes('--output-dir') ? args[args.indexOf('--output-dir') + 1] : null;
  const dryRun = args.includes('--dry-run');
  const summaryOnly = args.includes('--summary');
  
  if (!fs.existsSync(inputFile)) {
    console.error(`File not found: ${inputFile}`);
    process.exit(1);
  }
  
  const { metadata, articleType, chunks } = chunkArticle(inputFile);
  
  if (summaryOnly) {
    console.log(`Article: ${metadata.title}`);
    console.log(`Service: ${metadata['ms.service']}`);
    console.log(`Type: ${articleType}`);
    console.log(`Chunks: ${chunks.length}`);
    console.log('---');
    for (const chunk of chunks) {
      const lines = chunk.content.split('\n');
      const wordCount = chunk.content.split(/\s+/).length;
      console.log(`  ${chunk.slug} (${wordCount} words)`);
    }
    return;
  }
  
  console.log(`Article: ${metadata.title}`);
  console.log(`Service: ${metadata['ms.service']}`);
  console.log(`Type: ${articleType}`);
  console.log(`Chunks: ${chunks.length}`);
  
  if (outputDir && !dryRun) {
    fs.mkdirSync(outputDir, { recursive: true });
  }
  
  for (const chunk of chunks) {
    const filename = `${chunk.slug}.md`;
    console.log(`  → ${filename}`);
    
    if (outputDir && !dryRun) {
      fs.writeFileSync(path.join(outputDir, filename), chunk.content);
    }
    
    if (dryRun) {
      console.log(chunk.content.split('\n').slice(0, 8).map(l => `    ${l}`).join('\n'));
      console.log('    ...');
    }
  }
}

// Export for use as module
module.exports = { chunkArticle, parseFrontmatter, detectArticleType };

if (require.main === module) {
  main();
}
