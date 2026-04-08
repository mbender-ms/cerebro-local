---
title: LLM Wiki Pattern
created: 2026-04-07
updated: 2026-04-07
sources:
  - karpasky.md
tags:
  - methodology
  - knowledge-management
  - core-concept
---

# LLM Wiki Pattern

A pattern for building personal knowledge bases using LLMs, proposed by [[entities/andrej-karpathy]] in April 2026. The core argument: RAG is the wrong paradigm for personal and professional knowledge work because it re-derives knowledge from scratch on every question. The alternative is a persistent, LLM-maintained wiki that compiles knowledge once and keeps it current.

## Core Principle

Instead of retrieving from raw documents at query time, the LLM **incrementally builds and maintains a persistent wiki** — a structured, interlinked collection of markdown files. When you add a new source, the LLM reads it, extracts key information, and integrates it into the existing wiki. The knowledge compounds over time. (source: karpasky.md)

**"The wiki is a persistent, compounding artifact."** Cross-references are already there. Contradictions have already been flagged. Synthesis already reflects everything ingested. (source: karpasky.md)

## Architecture

Uses the [[concepts/three-layer-architecture]]:
1. **Raw sources** — immutable source documents
2. **Wiki** — LLM-generated and maintained markdown pages
3. **Schema** — configuration file defining structure, conventions, workflows

## Operations

| Operation | Description | See also |
|-----------|-------------|----------|
| [[concepts/ingest]] | Process a new source into the wiki | Updates 10-15 pages per source |
| [[concepts/query]] | Ask questions against the wiki | Good answers filed back via [[concepts/write-back]] |
| [[concepts/lint]] | Health-check for contradictions, orphans, staleness | Periodic maintenance |
| Index maintenance | Keep index.md and log.md current | Updated on every operation |

## Key Insights

- **The LLM does the bookkeeping.** Humans abandon wikis because maintenance burden grows faster than value. LLMs don't get bored and can touch 15 files in one pass. (source: karpasky.md)
- **The schema is your theory of the domain.** Building the schema well is itself a form of thinking — it's the writer's theory of how their domain should be structured, expressed as instructions to an AI. (source: karpasky.md)
- **Links are first-class data.** They form a graph. The LLM can traverse from a search hit into the thought neighborhood around it. (source: karpasky.md)
- **Git is your safety net.** The wiki is just markdown files. Commit after every session; revert bad edits. (source: karpasky.md)

## Anti-Patterns

- Trying to compile an entire massive corpus (10,000+ articles) into one wiki — doesn't scale. Use the wiki for depth (core domains), search for breadth. (source: karpasky.md)
- Letting good query answers disappear into chat history instead of filing them back. See [[concepts/write-back]]. (source: karpasky.md)
- AI hallucinations can become permanently embedded as facts if not checked. Maintenance burden for verification is real. (source: karpasky.md, comment by asong56)

## Links

- [[entities/andrej-karpathy]] — author
- [[concepts/three-layer-architecture]]
- [[concepts/memex]] — intellectual ancestor
- [[patterns/karpathy-wiki-setup]] — practical setup pattern
- [[sources/karpathy-llm-wiki]]
