---
title: Lint
created: 2026-04-07
updated: 2026-04-07
sources:
  - karpasky.md
tags:
  - operation
  - maintenance
---

# Lint

One of the four core operations in the [[concepts/llm-wiki-pattern]]. A periodic health check of the wiki. (source: karpasky.md)

## Checks

- [ ] **Orphan pages** — wiki pages with no inbound `[[links]]`
- [ ] **Broken links** — `[[links]]` that point to non-existent pages
- [ ] **Unresolved conflicts** — `[!CONFLICT]` callouts without resolution
- [ ] **Stale pages** — pages not updated in >90 days whose source docs have changed
- [ ] **Missing pages** — concepts/entities referenced in text but lacking their own page
- [ ] **Missing cross-references** — related pages that should link to each other but don't
- [ ] **Index gaps** — wiki pages that exist but aren't listed in `wiki/index.md`
- [ ] **Data gaps** — important topics that could be filled with additional sources

## When to Run

- Periodically (suggest weekly or after every 10+ ingests)
- When the wiki feels disorganized
- When you suspect stale content
- The LLM is good at suggesting new questions to investigate and new sources to look for (source: karpasky.md)

## Links

- [[concepts/llm-wiki-pattern]]
- [[concepts/ingest]]
- [[concepts/query]]
