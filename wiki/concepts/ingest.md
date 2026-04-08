---
title: Ingest
created: 2026-04-07
updated: 2026-04-07
sources:
  - karpasky.md
tags:
  - operation
  - workflow
---

# Ingest

One of the four core operations in the [[concepts/llm-wiki-pattern]]. Triggered when a new source is added to `raw/` and the LLM is told to process it.

## Workflow

1. Read the source document fully.
2. Discuss key takeaways with the human (unless batch mode is requested).
3. Identify key facts, configurations, limitations, gotchas, and novel information.
4. Write or update a source summary page in `wiki/sources/`.
5. Update ALL affected entity, concept, comparison, and pattern pages. A single source might touch 10-15 wiki pages. (source: karpasky.md)
6. If a referenced entity or concept doesn't have a page yet, create one.
7. Update `wiki/index.md` with any new pages.
8. Append to `wiki/log.md`.

## Best Practices

- **Ingest one at a time early on** — stay involved, guide emphasis, catch mistakes. Increase batch size once the schema stabilizes. (source: karpasky.md)
- **Let the wiki structure emerge** — after 10-15 articles, you'll see what page types the wiki actually needs. (source: karpasky.md)
- **Start with foundational articles first** — overview pages, concept pages, core how-to guides. Don't batch-dump everything. (source: karpasky.md)
- **Handle incremental updates via sync** — when source files change, re-ingest specific files and update affected wiki pages. (source: karpasky.md)

## Links

- [[concepts/llm-wiki-pattern]]
- [[concepts/query]]
- [[concepts/lint]]
- [[concepts/write-back]]
