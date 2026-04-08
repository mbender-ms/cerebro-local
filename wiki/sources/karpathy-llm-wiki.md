---
title: "Source: LLM Wiki by Andrej Karpathy"
created: 2026-04-07
updated: 2026-04-07
sources:
  - karpasky.md
tags:
  - karpathy
  - llm-wiki
  - knowledge-management
  - methodology
---

# Source: LLM Wiki by Andrej Karpathy

> GitHub Gist published April 4, 2026. 5,000+ stars, 2,200+ forks in 3 days.
> URL: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

## Key Takeaways

- **RAG is the wrong paradigm for personal knowledge work.** RAG re-derives knowledge from scratch on every query — no accumulation. The LLM wiki pattern replaces this with persistent, compiled knowledge. (source: karpasky.md)
- **The wiki is a persistent, compounding artifact.** Cross-references are pre-built. Contradictions are pre-flagged. Synthesis reflects everything ingested so far. (source: karpasky.md)
- **The LLM writes; the human curates.** You never (or rarely) write the wiki yourself. The LLM does summarizing, cross-referencing, filing, and bookkeeping. You source material, explore, and ask questions. (source: karpasky.md)
- **Three-layer architecture**: raw sources (immutable) → wiki (LLM-owned) → schema (co-evolved). See [[concepts/three-layer-architecture]]. (source: karpasky.md)
- **Four core operations**: [[concepts/ingest]], [[concepts/query]], [[concepts/lint]], and index maintenance. (source: karpasky.md)
- **Write-back is the single most important feature.** Good answers filed back into the wiki compound value. Community practitioners confirm this is more important than Karpathy's gist emphasizes. (source: karpasky.md)
- **Links are first-class data.** Wiki links form a navigable graph. Tags and links should be treated as graph nodes, not just metadata. The LLM can traverse from a search hit into the "thought neighborhood" around it. (source: karpasky.md)
- **Index files work at ~100 articles.** At 4,000+ notes, you need: overfetch 3×, deduplicate near-identical content, re-rank for diversity (MMR). Naive semantic search returns "10 versions of your loudest thought." (source: karpasky.md)
- **Recommended tooling**: [[entities/obsidian]] for viewing, [[entities/qmd]] for search, git for versioning. The schema file (CLAUDE.md / AGENTS.md) is the key configuration. (source: karpasky.md)
- **Intellectual ancestor**: Vannevar Bush's [[concepts/memex]] (1945) — private, curated knowledge store with associative trails. Bush couldn't solve who does the maintenance. The LLM handles that. (source: karpasky.md)

## What's New / Notable

- This gist codifies a pattern that multiple practitioners had independently converged on. It is intentionally abstract — describes the idea, not a specific implementation.
- Karpathy describes his workflow: LLM agent on one side, Obsidian on the other. "Obsidian is the IDE; the LLM is the programmer; the wiki is the codebase."
- The gist is designed to be copy-pasted into your own LLM agent's schema file.

## Use Cases Listed

| Domain | Description |
|--------|-------------|
| Personal | Goals, health, psychology, journal entries, podcast notes |
| Research | Deep topic study over weeks/months with evolving thesis |
| Reading a book | Character pages, themes, plot threads — like building a personal Tolkien Gateway |
| Business/team | Internal wiki fed by Slack, meetings, project docs, customer calls |
| Other | Competitive analysis, due diligence, trip planning, course notes, hobby deep-dives |

## Community Insights (from gist comments)

- **bitsofchris**: Running at 4,000+ notes for 2+ years. Index files break at scale. Links are "the whole thing." Write-back is the key to compounding. Built openaugi MCP server.
- **emailhuynhhuy**: Built deterministic retrieval system for n8n workflows — wiki as navigation layer, NAS as execution layer. Proposes decision-based learning loops over simple knowledge accumulation.
- **sakhmedbayev**: Raised one-vault-vs-many question. Splitting defeats cross-domain connections; unifying enables serendipitous insights at domain seams.
- **visakadev**: Distinguishes search (MemPalace finds things) from wiki (connects things). Complementary layers.
- **asong56**: Warns that AI hallucinations can become permanently embedded as facts — maintenance burden for checking and cleaning notes.
- **javi2375**: Argues this should run on small local models, not cloud LLMs. A fine-tuned 4B model can handle file manipulation.

## Wiki Pages Updated During Ingest

- [[entities/andrej-karpathy]] (created)
- [[entities/obsidian]] (created)
- [[entities/qmd]] (created)
- [[concepts/three-layer-architecture]] (created)
- [[concepts/llm-wiki-pattern]] (created)
- [[concepts/ingest]] (created)
- [[concepts/query]] (created)
- [[concepts/lint]] (created)
- [[concepts/write-back]] (created)
- [[concepts/memex]] (created)
- [[patterns/karpathy-wiki-setup]] (created)
