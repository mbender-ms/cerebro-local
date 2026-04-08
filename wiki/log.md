---
title: Operations Log
created: 2026-04-07
updated: 2026-04-07
---

# Operations Log

> Append-only chronological record of wiki operations.
> Each entry: `## [YYYY-MM-DD] operation | Title`
> Parse with: `grep "^## \[" wiki/log.md | tail -10`

## [2026-04-07] init | Knowledge base initialized

Created directory structure, schema, index, and log. Ready for first ingest.

## [2026-04-07] ingest | LLM Wiki by Andrej Karpathy

Source: `raw/articles/karpasky.md` (GitHub Gist, April 2026)

Pages created (11):
- `wiki/sources/karpathy-llm-wiki.md` — source summary
- `wiki/entities/andrej-karpathy.md` — person
- `wiki/entities/obsidian.md` — tool
- `wiki/entities/qmd.md` — tool
- `wiki/concepts/llm-wiki-pattern.md` — core methodology
- `wiki/concepts/three-layer-architecture.md` — architecture
- `wiki/concepts/ingest.md` — operation
- `wiki/concepts/query.md` — operation
- `wiki/concepts/lint.md` — operation
- `wiki/concepts/write-back.md` — compounding mechanism
- `wiki/concepts/memex.md` — historical concept
- `wiki/patterns/karpathy-wiki-setup.md` — setup pattern

Pages updated (1):
- `wiki/index.md` — added all 12 new pages
