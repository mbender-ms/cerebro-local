# AGENTS.md — Cerebro Knowledge Base Schema

## Purpose

Cerebro is a personal knowledge base that compiles domain-specific knowledge from
curated source documents into a persistent, interlinked wiki. The wiki sits between
you (the reader) and the raw sources. Knowledge is compiled once and kept current —
not re-derived on every query.

This follows the Karpathy LLM Wiki pattern: the LLM incrementally builds and
maintains the wiki; the human curates sources, directs analysis, and asks questions.

## Directory Structure

```
cerebro-local/
├── raw/                    # Layer 1: Immutable source material
│   ├── articles/           # Web clips, PDFs, papers, markdown articles
│   └── assets/             # Images referenced by sources
├── wiki/                   # Layer 2: LLM-generated and maintained
│   ├── index.md            # Content catalog — read FIRST on every query
│   ├── log.md              # Chronological append-only operations log
│   ├── entities/           # Entity pages (services, tools, people, orgs)
│   ├── concepts/           # Concept pages (protocols, patterns, principles)
│   ├── comparisons/        # Cross-document analysis and side-by-side pages
│   ├── patterns/           # Recurring solutions, deployment patterns, workflows
│   └── sources/            # Per-source summary pages
├── scripts/                # Helper scripts (sync, maintenance)
├── AGENTS.md               # Layer 3: This schema file
└── .gitignore
```

## Rules

### Immutability of raw/
- **NEVER** modify, rename, or delete anything in `raw/`. It is the source of truth.
- New sources go into `raw/articles/` (markdown, text) or `raw/assets/` (images).

### Wiki ownership
- The LLM **owns** the `wiki/` directory entirely. It creates, updates, and deletes pages.
- The human reads and browses but does not edit wiki pages directly.
- All wiki pages are markdown with YAML frontmatter.

### Cross-referencing
- Use `[[wiki-links]]` (Obsidian-style) for all cross-references between wiki pages.
- Use relative paths: `[[entities/azure-firewall]]` from index, `[[../concepts/nsg]]` between subdirs.
- Links are first-class data — they form a navigable graph. Maintain them aggressively.

## Page Types

### Entity Pages (`wiki/entities/`)
One per service, tool, person, or organization. Contains:
- Current capabilities and key configuration options
- Known limitations and gotchas
- Links to related entities and concepts
- Source citations

### Concept Pages (`wiki/concepts/`)
Networking concepts, protocols, patterns, principles that span entities. Contains:
- Clear definition
- How it works
- Where it applies (which entities use it)
- Common misconceptions
- Source citations

### Comparison Pages (`wiki/comparisons/`)
Side-by-side analysis of two or more related things. Contains:
- Comparison table with key dimensions
- When to use each option
- Gotchas and edge cases
- Source citations

### Pattern Pages (`wiki/patterns/`)
Recurring solutions and deployment patterns. Contains:
- Problem statement
- Solution architecture
- Pros and cons
- When to use / when not to use
- Source citations

### Source Summary Pages (`wiki/sources/`)
One per ingested source document. Contains:
- Source metadata (title, author, date, URL if applicable)
- Key takeaways (bulleted)
- What's new or notable
- What contradicts existing wiki content
- Which wiki pages were updated during ingest

## Conventions

### Frontmatter
Every wiki page MUST have YAML frontmatter:

```yaml
---
title: Page Title
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources:
  - source-filename.md
tags:
  - relevant-tag
---
```

### Citations
Every factual claim should note its source inline: `(source: filename.md)`

### Conflicts
When new information contradicts existing wiki content, flag it explicitly:

```markdown
> [!CONFLICT]
> **Old claim**: X (source: old-source.md)
> **New claim**: Y (source: new-source.md)
> **Status**: Unresolved
```

### Writing style
- Write for a reader who is a technically proficient professional familiar with
  the domain but needs quick, accurate reference material.
- Be precise and concise. Prefer tables and bullet points over prose for reference content.
- Use code blocks for commands, configurations, and API examples.

## Core Operations

### 1. Ingest

Triggered when: a new source is added to `raw/` and the human says to process it.

Workflow:
1. Read the source document fully.
2. Discuss key takeaways with the human (unless batch mode is requested).
3. Identify key facts, configurations, limitations, gotchas, and novel information.
4. Write or update a source summary page in `wiki/sources/`.
5. Update ALL affected entity, concept, comparison, and pattern pages in the wiki.
   A single source may touch 10-15 pages. Be thorough.
6. If a referenced entity or concept doesn't have a page yet, create one.
7. Update `wiki/index.md` with any new pages (link + one-line summary).
8. Append an entry to `wiki/log.md` in the format:
   `## [YYYY-MM-DD] ingest | Source Title`
9. Commit message suggestion: `ingest: <source-title>`

### 2. Query

Triggered when: the human asks a question about the knowledge base.

Workflow:
1. Read `wiki/index.md` first to identify relevant pages.
2. Read the relevant wiki pages.
3. If wiki content is insufficient, search `raw/` using `qmd` or `rg`.
4. Synthesize an answer with citations to wiki pages and sources.
5. **Important**: If the answer is a valuable synthesis (comparison, analysis,
   new connection), offer to file it back into the wiki as a new page.
   Good answers should compound, not disappear into chat history.

### 3. Lint

Triggered when: the human asks for a health check, or periodically.

Check for:
- [ ] Orphan pages: wiki pages with no inbound `[[links]]`
- [ ] Broken links: `[[links]]` that point to non-existent pages
- [ ] Unresolved conflicts: `[!CONFLICT]` callouts without resolution
- [ ] Stale pages: pages not updated in >90 days whose sources have changed
- [ ] Missing pages: concepts/entities referenced in text but lacking their own page
- [ ] Missing cross-references: related pages that should link to each other but don't
- [ ] Index gaps: wiki pages that exist but aren't listed in `wiki/index.md`
- [ ] Data gaps: important topics that could be filled with additional sources

Output a lint report and offer to fix issues.

### 4. Index Maintenance

**wiki/index.md** — Content-oriented catalog:
- Update on every ingest and whenever pages are added/removed.
- Each entry: `- [[path/to/page]] — One-line summary (N sources)`
- Organized by category (entities, concepts, comparisons, patterns, sources).

**wiki/log.md** — Chronological operations log:
- Append-only. Never edit existing entries.
- Each entry: `## [YYYY-MM-DD] operation | Title`
- Operations: `ingest`, `query`, `lint`, `update`, `create`, `delete`

## Search with qmd

This knowledge base uses [qmd](https://github.com/tobi/qmd) for local hybrid
search (BM25 + vector + LLM reranking).

### Setup (already done)
```bash
qmd collection add wiki ./wiki
qmd collection add raw ./raw
qmd update
qmd embed
```

### Usage during queries
```bash
# Hybrid search (recommended — auto-expands query + reranks)
qmd query "your search terms"

# Full-text BM25 only (fast, no LLM)
qmd search "keywords here"

# Vector similarity only
qmd vsearch "semantic query"

# Get a specific file
qmd get wiki/entities/some-entity.md

# Update index after changes
qmd update
qmd embed
```

When the wiki is small (<100 pages), reading `wiki/index.md` is sufficient.
Use qmd when the index becomes unwieldy or when searching raw sources.

## Git Workflow

- Commit after every session or significant operation.
- Use descriptive commit messages:
  - `ingest: <source-title>`
  - `lint: fix orphans and broken links`
  - `query: add comparison page for X vs Y`
  - `maintain: update index and cross-references`
- This repo is private. Never expose raw source material publicly.

## Tips for the Human

- **Obsidian Web Clipper**: Browser extension to save web articles as markdown into `raw/articles/`.
- **Obsidian Graph View**: See the shape of the wiki — hubs, orphans, clusters.
- **Dataview plugin**: Query frontmatter across pages (tags, dates, source counts).
- **Ingest one at a time** early on — stay involved, guide emphasis, catch mistakes.
- **Increase batch size** once the schema stabilizes and the wiki structure emerges.
- **File good answers back** — comparisons, analyses, and connections are wiki pages, not chat artifacts.
