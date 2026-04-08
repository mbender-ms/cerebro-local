---
title: Query
created: 2026-04-07
updated: 2026-04-07
sources:
  - karpasky.md
tags:
  - operation
  - workflow
---

# Query

One of the four core operations in the [[concepts/llm-wiki-pattern]]. Triggered when you ask a question against the knowledge base.

## Workflow

1. Read `wiki/index.md` first to identify relevant pages.
2. Drill into the relevant wiki pages.
3. If wiki content is insufficient, search `raw/` using [[entities/qmd]] or `rg`.
4. Synthesize an answer with citations to wiki pages and sources.
5. **Critical**: If the answer is a valuable synthesis, file it back into the wiki. See [[concepts/write-back]].

## Output Formats

Answers can take different forms depending on the question (source: karpasky.md):
- A markdown page
- A comparison table
- A slide deck (Marp)
- A chart (matplotlib)
- A canvas

## Key Insight

> Good answers can be filed back into the wiki as new pages. A comparison you asked for, an analysis, a connection you discovered — these are valuable and shouldn't disappear into chat history. (source: karpasky.md)

## Links

- [[concepts/llm-wiki-pattern]]
- [[concepts/ingest]]
- [[concepts/write-back]]
- [[entities/qmd]]
