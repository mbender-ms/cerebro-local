---
title: qmd
created: 2026-04-07
updated: 2026-04-07
sources:
  - karpasky.md
tags:
  - tool
  - search
  - cli
---

# qmd

A local search engine for markdown files by Tobi Lütke. Provides hybrid BM25/vector search with LLM re-ranking, all on-device. Available as both a CLI and an MCP server.

GitHub: https://github.com/tobi/qmd
NPM: `@tobilu/qmd`

## Role in the LLM Wiki Pattern

Karpathy recommends qmd as the search tool when the wiki outgrows the `index.md` file (~100+ pages). At small scale, reading the index is sufficient. At larger scale, you need proper search. (source: karpasky.md)

## Search Modes

| Command | Type | Description |
|---------|------|-------------|
| `qmd query <text>` | Hybrid | Auto-expands query + BM25 + vector + LLM reranking (recommended) |
| `qmd search <text>` | BM25 | Full-text keyword search, no LLM |
| `qmd vsearch <text>` | Vector | Semantic similarity only |

## Key Features

- **Collections**: Index separate directories (`wiki`, `raw`) as named collections
- **Context descriptions**: Attach human-written summaries to collections for better search
- **Embeddings**: Local embedding model (embeddinggemma-300M), no API calls
- **Reranking**: Local reranker (Qwen3-Reranker-0.6B), no API calls
- **Query expansion**: Local model (qmd-query-expansion-1.7B) for expanding queries
- **MCP server**: `qmd mcp` — lets AI agents use it as a native tool
- **Update**: `qmd update` re-indexes; `qmd embed` refreshes vectors

## Usage in This Knowledge Base

```bash
qmd query "your search terms"           # hybrid search across all collections
qmd query "query" -c wiki               # wiki pages only
qmd query "query" -c raw                # raw sources only
qmd get wiki/entities/some-entity.md    # get a specific file
qmd update && qmd embed                 # refresh after changes
```

## Links

- [[concepts/llm-wiki-pattern]]
- [[entities/obsidian]] — complementary viewing tool
