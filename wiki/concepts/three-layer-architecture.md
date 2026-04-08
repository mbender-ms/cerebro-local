---
title: Three-Layer Architecture
created: 2026-04-07
updated: 2026-04-07
sources:
  - karpasky.md
tags:
  - architecture
  - core-concept
---

# Three-Layer Architecture

The foundational structure of the [[concepts/llm-wiki-pattern]]. Three distinct layers with clear ownership boundaries.

## Layers

### Layer 1: Raw Sources (`raw/`)

- **Owner**: Human
- **Mutability**: Immutable — the LLM reads from them but NEVER modifies them
- **Contents**: Articles, papers, markdown files, PDFs, images, data files
- **Purpose**: Source of truth. Everything in the wiki traces back to raw sources.

### Layer 2: The Wiki (`wiki/`)

- **Owner**: LLM
- **Mutability**: LLM creates, updates, and deletes pages freely
- **Contents**: Summaries, entity pages, concept pages, comparisons, patterns, an index, a log
- **Purpose**: Compiled, interlinked knowledge. The human reads; the LLM writes.

### Layer 3: The Schema (AGENTS.md / CLAUDE.md)

- **Owner**: Human + LLM (co-evolved)
- **Mutability**: Updated deliberately as the wiki matures
- **Contents**: Directory structure, page types, conventions, workflows, lint checks
- **Purpose**: Makes the LLM a disciplined wiki maintainer rather than a generic chatbot. This is what makes the pattern work. (source: karpasky.md)

## Key Principle

> The schema is the most important file in the system. It defines the LLM's behavior as a wiki maintainer. (source: karpasky.md)

Karpathy notes that you and the LLM co-evolve the schema over time. Building the schema well is itself a form of thinking — it's your theory of how the domain should be structured, expressed as instructions to an AI.

## Links

- [[concepts/llm-wiki-pattern]]
- [[patterns/karpathy-wiki-setup]]
