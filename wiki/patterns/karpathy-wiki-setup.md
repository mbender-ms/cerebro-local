---
title: Karpathy Wiki Setup Pattern
created: 2026-04-07
updated: 2026-04-07
sources:
  - karpasky.md
tags:
  - pattern
  - setup
  - knowledge-management
---

# Karpathy Wiki Setup Pattern

A practical setup pattern for implementing the [[concepts/llm-wiki-pattern]]. Based on Karpathy's gist and community refinements. (source: karpasky.md)

## Problem Statement

You want to build a persistent, compounding knowledge base for a domain. RAG systems re-derive knowledge on every query. You need something that accumulates and stays organized.

## Solution Architecture

```
my-knowledge-base/
├── raw/                    # Immutable source material
│   ├── articles/           # Web clips, PDFs, papers
│   └── assets/             # Images referenced by sources
├── wiki/                   # LLM-generated and maintained
│   ├── index.md            # Content catalog
│   ├── log.md              # Chronological operations log
│   ├── entities/           # Entity pages
│   ├── concepts/           # Concept pages
│   ├── comparisons/        # Cross-document analysis
│   ├── patterns/           # Deployment patterns
│   └── sources/            # Per-source summaries
└── AGENTS.md               # Schema file
```

## Toolchain

| Tool | Role |
|------|------|
| LLM Agent (Pi, Claude Code, Codex) | Reads raw, writes wiki, follows schema |
| [[entities/obsidian]] | Viewing/browsing interface — graph view, backlinks, search |
| [[entities/qmd]] | Local hybrid search when wiki outgrows index.md |
| Git | Version history, safety net for bad LLM edits |

## Setup Steps

1. Create directory structure (`raw/`, `wiki/`, schema file)
2. Write the schema — define page types, conventions, workflows
3. Open as Obsidian vault — configure attachment path, install plugins
4. Set up git — commit after every session
5. Set up qmd — `qmd collection add wiki ./wiki && qmd update && qmd embed`
6. **Ingest first 5 articles manually** — stay involved, refine schema
7. Let the wiki structure emerge — after 10-15 articles, patterns become clear
8. Increase batch size once schema stabilizes
9. Add search tooling when index becomes unwieldy

## Pros

- **Zero infrastructure** — no databases, servers, embeddings pipelines, or APIs
- **Human-readable** — everything is plain markdown files on disk
- **Version-controlled** — git gives full history and revert capability
- **Portable** — works without the LLM; the wiki is still useful standalone
- **Compounding** — gets more valuable with every source ingested and question asked

## Cons

- **Token cost** — ingesting 10 articles might consume 200,000-500,000 tokens
- **Supervision cost** — first 20-30 ingests require active involvement
- **Hallucination risk** — LLM-generated facts can embed errors if not verified
- **Scale ceiling** — index.md approach breaks at ~hundreds of pages; needs search tooling

## When to Use

- You're going deep on a domain over weeks or months
- You want synthesized, cross-referenced knowledge, not just search results
- You're willing to invest in curation and schema refinement upfront
- Your domain is bounded enough for ~100-200 compiled articles (depth, not breadth)

## When NOT to Use

- You need to search a massive corpus (10,000+ articles) — use search tooling for breadth
- You want fully automated, unsupervised knowledge extraction — the pattern needs human curation
- Your sources change so rapidly that compiled pages would be constantly stale

## Links

- [[concepts/llm-wiki-pattern]]
- [[concepts/three-layer-architecture]]
- [[concepts/ingest]]
- [[sources/karpathy-llm-wiki]]
