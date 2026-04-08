---
title: Obsidian
created: 2026-04-07
updated: 2026-04-07
sources:
  - karpasky.md
tags:
  - tool
  - knowledge-management
  - markdown
---

# Obsidian

A local-first markdown knowledge base application. Files live on disk as plain `.md` files — no proprietary format, no cloud lock-in.

## Role in the LLM Wiki Pattern

Obsidian is the **viewing and browsing interface** for the wiki. The LLM writes the wiki pages; you browse them in Obsidian. (source: karpasky.md)

Key features for wiki use:
- **Graph view** — see the shape of the wiki: hubs, orphans, clusters, connections
- **Backlinks** — see what links to the current page
- **Search** — full-text search across all pages
- **`[[wiki-links]]`** — first-class cross-referencing between pages

## Recommended Plugins

| Plugin | Purpose |
|--------|---------|
| **Dataview** | Query YAML frontmatter across pages — dynamic tables and lists |
| **Web Clipper** | Browser extension to save web articles as markdown into `raw/` |
| **Marp** | Generate slide decks from markdown |
| **Graph Analysis** | Extended graph metrics and analysis |

## Configuration for This Wiki

- **Attachment folder path**: `raw/assets/` (so images land predictably)
- **Download images locally**: Bind a hotkey to download attachments for the current file
- Open the repo root as the vault — gives access to both `raw/` and `wiki/`

## Links

- [[concepts/llm-wiki-pattern]]
- [[entities/andrej-karpathy]]
- [[entities/qmd]] — complementary search tool
- [[patterns/karpathy-wiki-setup]]
