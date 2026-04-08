#!/usr/bin/env node
/**
 * Cerebro Search Server
 * 
 * Tiny HTTP server that bridges the browser to qmd CLI.
 * No dependencies — uses only Node.js built-ins.
 * 
 * Usage:
 *   node scripts/search-server.js [--port 3333]
 * 
 * Then open http://localhost:3333 in your browser.
 */

const http = require('http');
const { execFile } = require('child_process');
const fs = require('fs');
const path = require('path');
const { URL } = require('url');

const PORT = parseInt(process.argv.find((_, i, a) => a[i - 1] === '--port') || '3333');
const ROOT = path.resolve(__dirname, '..');
const HTML_FILE = path.join(ROOT, 'search.html');
const QMD = 'qmd';

function runQmd(args, cwd) {
  return new Promise((resolve, reject) => {
    execFile(QMD, args, { cwd, maxBuffer: 1024 * 1024, timeout: 30000 }, (err, stdout, stderr) => {
      if (err && !stdout) {
        reject(new Error(stderr || err.message));
      } else {
        resolve(stdout);
      }
    });
  });
}

function parseQmdOutput(raw) {
  const results = [];
  const blocks = raw.split(/(?=qmd:\/\/)/);
  
  for (const block of blocks) {
    if (!block.trim()) continue;
    
    const lines = block.trim().split('\n');
    const firstLine = lines[0] || '';
    
    // Extract file path from qmd:// URI
    const uriMatch = firstLine.match(/^qmd:\/\/(.+?)(?::(\d+))?\s*(#\w+)?$/);
    if (!uriMatch) continue;
    
    const filePath = uriMatch[1];
    const lineNum = uriMatch[2] || null;
    const hash = uriMatch[3] || null;
    
    // Extract score
    let score = null;
    const scoreLine = lines.find(l => /^Score:\s/.test(l));
    if (scoreLine) {
      const scoreMatch = scoreLine.match(/(\d+)%/);
      if (scoreMatch) score = parseInt(scoreMatch[1]);
    }
    
    // Extract content (everything after Score line or first line)
    const contentStart = scoreLine ? lines.indexOf(scoreLine) + 1 : 1;
    const content = lines.slice(contentStart).join('\n').trim();
    
    // Determine collection and clean path
    let collection = 'unknown';
    let displayPath = filePath;
    if (filePath.startsWith('wiki/')) {
      collection = 'wiki';
      displayPath = filePath;
    } else if (filePath.startsWith('raw/')) {
      collection = 'raw';
      displayPath = filePath;
    }
    
    // Determine type from path
    let type = 'file';
    if (filePath.includes('/entities/')) type = 'entity';
    else if (filePath.includes('/concepts/')) type = 'concept';
    else if (filePath.includes('/comparisons/')) type = 'comparison';
    else if (filePath.includes('/patterns/')) type = 'pattern';
    else if (filePath.includes('/sources/')) type = 'source';
    else if (filePath.startsWith('raw/')) type = 'raw';
    
    results.push({ filePath, displayPath, lineNum, hash, score, content, collection, type });
  }
  
  return results;
}

async function handleSearch(req, res) {
  let body = '';
  req.on('data', chunk => body += chunk);
  req.on('end', async () => {
    try {
      const { query, collection, mode } = JSON.parse(body);
      
      if (!query || !query.trim()) {
        res.writeHead(400, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ error: 'Query is required' }));
        return;
      }
      
      // Build qmd command
      const args = [mode === 'keyword' ? 'search' : 'query', query.trim()];
      if (collection && collection !== 'all') {
        args.push('-c', collection);
      }
      
      const output = await runQmd(args, ROOT);
      const results = parseQmdOutput(output);
      
      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ results, raw: output }));
    } catch (err) {
      res.writeHead(500, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ error: err.message }));
    }
  });
}

async function handleGetFile(req, res, parsed) {
  const filePath = parsed.searchParams.get('path');
  
  if (!filePath) {
    res.writeHead(400, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: 'path parameter required' }));
    return;
  }
  
  // Security: ensure path stays within repo
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
  } catch (err) {
    res.writeHead(404, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: `File not found: ${filePath}` }));
  }
}

const server = http.createServer(async (req, res) => {
  // CORS headers for local dev
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  
  if (req.method === 'OPTIONS') {
    res.writeHead(200);
    res.end();
    return;
  }
  
  const parsed = new URL(req.url, `http://${req.headers.host}`);
  
  // Serve HTML
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
  
  // Search API
  if (req.method === 'POST' && parsed.pathname === '/api/search') {
    await handleSearch(req, res);
    return;
  }
  
  // File viewer API
  if (req.method === 'GET' && parsed.pathname === '/api/file') {
    await handleGetFile(req, res, parsed);
    return;
  }
  
  // Status
  if (req.method === 'GET' && parsed.pathname === '/api/status') {
    try {
      const output = await runQmd(['status'], ROOT);
      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ status: output }));
    } catch (err) {
      res.writeHead(500, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ error: err.message }));
    }
    return;
  }
  
  res.writeHead(404, { 'Content-Type': 'text/plain' });
  res.end('Not found');
});

server.listen(PORT, '127.0.0.1', () => {
  console.log(`\n  🧠 Cerebro Search → http://localhost:${PORT}\n`);
  console.log(`  Repo:    ${ROOT}`);
  console.log(`  qmd:     ${QMD}`);
  console.log(`  Port:    ${PORT}\n`);
  console.log(`  Press Ctrl+C to stop.\n`);
});
