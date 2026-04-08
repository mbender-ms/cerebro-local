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
│   │   ├── nat-gateway/    # MS Learn articles organized by service area
│   │   ├── virtual-network/
│   │   ├── load-balancer/
│   │   └── ...             # Other service areas or standalone articles
│   └── assets/             # Images referenced by sources
├── wiki/                   # Layer 2: LLM-generated and maintained
│   ├── index.md            # Content catalog — read FIRST on every query
│   ├── log.md              # Chronological append-only operations log
│   ├── entities/           # Entity pages (services, tools, people, orgs)
│   ├── concepts/           # Concept pages (protocols, patterns, principles)
│   ├── comparisons/        # Cross-document analysis and side-by-side pages
│   ├── patterns/           # Recurring solutions, deployment patterns, workflows
│   └── sources/            # Per-source summary pages
├── scripts/                # Helper scripts (chunker, sync, maintenance)
│   └── chunk-article.js    # MS Learn article chunker
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

## MS Learn Article Chunking Strategy

Azure documentation articles from Microsoft Learn have a specific structure that
requires pre-processing before wiki ingest. A chunking script at
`scripts/chunk-article.js` handles this automatically.

### Why chunk before ingest

MS Learn articles are often 300-600 lines with multiple H2 sections, tabbed
deployment methods (Portal/PowerShell/CLI), and zone-pivot variants. Ingesting
an entire article as one unit produces wiki pages that are too broad for precise
retrieval. Chunking at the H2 boundary with tab/pivot separation produces
focused chunks that map cleanly to wiki concepts and are individually retrievable
by qmd.

### Article anatomy

```
---
title: Create an Azure NAT Gateway          ← YAML frontmatter (propagated to every chunk)
ms.service: azure-nat-gateway
ms.topic: quickstart
ms.date: 04/30/2025
---
# Quickstart: Create a NAT gateway           ← H1 (article title, becomes header-path root)

Intro paragraph...                           ← Overview chunk

## Prerequisites                             ← H2 = primary chunk boundary
### [Portal](#tab/portal)                    ← Tab group: 3 chunks (portal, powershell, cli)
### [PowerShell](#tab/powershell)
### [CLI](#tab/cli)
---                                          ← Tab group terminator

## Create the NAT gateway                    ← H2 with tabs → 3 more chunks
### [Portal](#tab/portal)
...
---

::: zone pivot="azure-portal"               ← Zone pivot (alternative to tabs)
[!INCLUDE [file](path)]                      ← Include reference
::: zone-end

## Next steps                                ← Skipped (boilerplate)
```

### Chunking rules

| Rule | Description |
|------|-------------|
| **Primary split: H2** | Every `## Section` becomes its own chunk |
| **Tab separation** | If an H2 section contains `### [Label](#tab/id)` groups, emit one chunk per tab with the tab label appended to the title |
| **Zone pivot separation** | If the article uses `::: zone pivot="x"` blocks, emit one chunk per pivot |
| **Frontmatter propagation** | Every chunk inherits `ms.service`, `ms.topic`, `ms.date`, `title` from the article frontmatter |
| **Header path** | Every chunk records its position: `H1 > H2` (e.g., "Quickstart: Create a NAT gateway > Create the NAT gateway") |
| **Deployment method tag** | Tab chunks get a `deployment-method` field (`portal`, `powershell`, `cli`) for filtering |
| **Intro chunk** | Content between H1 and first H2 becomes an `-overview` chunk |
| **Skip boilerplate** | Sections titled "Next steps", "Clean up resources", "Related content", "See also" are dropped |
| **Include references** | `[!INCLUDE [...](path)]` lines are preserved as-is (context may be incomplete) |

### Using the chunker

```bash
# Preview what chunks an article produces
node scripts/chunk-article.js raw/articles/nat-overview.md --summary

# Write chunks to a temp directory for review
node scripts/chunk-article.js raw/articles/quickstart-nat.md --output-dir /tmp/chunks

# Dry run — shows first 8 lines of each chunk
node scripts/chunk-article.js raw/articles/article.md --dry-run
```

### Chunk output format

Each chunk is a standalone markdown file with enriched frontmatter:

```yaml
---
title: "Create the NAT gateway (CLI)"        # Section heading + tab label
chunk-of: "Create an Azure NAT Gateway"       # Parent article title
ms.service: "azure-nat-gateway"               # Propagated from article
ms.topic: "quickstart"                        # Propagated from article
article-date: "04/30/2025"                    # Propagated from article
header-path: "Quickstart: Create a NAT gateway > Create the NAT gateway"
tags:
  - azure-nat-gateway
  - quickstart
  - cli
deployment-method: "cli"                      # Only on tab chunks
---
```

### Ingest workflow for MS Learn articles

1. Place the raw article in `raw/articles/<service>/` (preserve the original filename).
2. Run the chunker: `node scripts/chunk-article.js raw/articles/<service>/article.md --summary`
3. Review the chunk summary — confirm sections and tab splits look right.
4. The LLM then processes **chunks**, not the raw article, for wiki page creation:
   - Each chunk informs entity, concept, comparison, and pattern pages.
   - The source summary page (`wiki/sources/`) references the original article, not individual chunks.
   - Chunks are **working artifacts** — they feed the wiki but are NOT stored in `wiki/` themselves.
5. After ingest, run `qmd update && qmd embed` to refresh the search index.

### Batch ingest for a service area

```bash
# 1. Copy articles for a service into raw/
mkdir -p raw/articles/nat-gateway
cp ~/github/azure-docs-pr/articles/nat-gateway/*.md raw/articles/nat-gateway/

# 2. Preview all chunks
for f in raw/articles/nat-gateway/*.md; do
  echo "=== $(basename $f) ==="
  node scripts/chunk-article.js "$f" --summary
  echo ""
done

# 3. Tell the LLM to ingest the service area
#    "Ingest all articles in raw/articles/nat-gateway/"
```

## Core Operations

### 1. Ingest

Triggered when: a new source is added to `raw/` and the human says to process it.

Workflow:
1. Read the source document fully.
2. **For MS Learn articles**: Run `node scripts/chunk-article.js <file> --summary`
   to understand the article structure and chunk boundaries. Use chunks to guide
   which wiki pages to create or update. Process one H2 section at a time.
3. **For other sources**: Read the full document.
4. Discuss key takeaways with the human (unless batch mode is requested).
5. Identify key facts, configurations, limitations, gotchas, and novel information.
6. Write or update a source summary page in `wiki/sources/`.
7. Update ALL affected entity, concept, comparison, and pattern pages in the wiki.
   A single source may touch 10-15 pages. Be thorough.
8. If a referenced entity or concept doesn't have a page yet, create one.
9. Update `wiki/index.md` with any new pages (link + one-line summary).
10. Append an entry to `wiki/log.md` in the format:
   `## [YYYY-MM-DD] ingest | Source Title`
11. Commit message suggestion: `ingest: <source-title>`

### 2. Query

Triggered when: the human asks a question about the knowledge base.

> **IMPORTANT**: Do NOT read `wiki/index.md` to find pages. The index is too large
> to read into context. Always use `qmd` for retrieval.

Workflow:
1. **Search wiki first**: `cd ~/github/cerebro-local && qmd query "<question>" -c wiki`
2. Read the top-scoring wiki pages returned by qmd.
3. **If wiki results are thin, search raw**: `qmd query "<question>" -c raw`
4. For exact keyword/name lookups, use: `qmd search "<exact terms>"` (BM25 only, fast)
5. Synthesize an answer with citations to wiki pages and sources.
6. **Important**: If the answer is a valuable synthesis (comparison, analysis,
   new connection), offer to file it back into the wiki as a new page.
   Good answers should compound, not disappear into chat history.

qmd search tips:
- `-c wiki` = compiled wiki pages only (concise, cross-linked)
- `-c raw` = full original MS Learn articles (every detail, every code block)
- No `-c` flag = search across both collections
- `qmd search` = BM25 keyword only (fast, no LLM cost)
- `qmd query` = hybrid BM25 + vector + LLM reranking (best quality)

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
- Operations: `ingest`, `query`, `lint`, `update`, `create`, `delete`, `deep`, `raw`, `feat`, `maintain`
- **ALWAYS append to log.md after any wiki operation.** This is not optional.

**wiki/ingest-tracker.md** — Ingest status dashboard:
- Update after every ingest or batch operation.
- Tracks: service area, article count, entity page status, deep pages, date.
- Update the Summary section totals after changes.
- **ALWAYS update ingest-tracker.md after adding new service areas or wiki pages.**

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

## Syncing Raw Sources from GitHub

MS Learn articles are updated frequently. The sync script compares local files
against the upstream GitHub repo using git blob SHAs (exact byte-level match)
and produces a change report.

### Usage

```bash
# Check a service area for changes and download updates
./scripts/sync-raw.sh nat-gateway

# Preview changes without downloading
./scripts/sync-raw.sh nat-gateway --dry-run

# Sync a new service area (downloads everything as "added")
./scripts/sync-raw.sh virtual-network

# Sync multiple areas
for svc in nat-gateway virtual-network load-balancer dns private-link traffic-manager; do
  ./scripts/sync-raw.sh $svc
done
```

### What the script does

1. Fetches the file list + SHAs from `MicrosoftDocs/azure-docs` via GitHub API
2. Compares each remote SHA against `git hash-object` of the local file
3. Downloads new and modified files into `raw/articles/<service>/`
4. Detects files deleted from the remote repo
5. Writes `pending-changes.md` with a structured change report

### After syncing

Tell the LLM: **"Process pending-changes.md"**

The LLM should:
1. Read `pending-changes.md`
2. For **added** articles: run full ingest (chunk → create wiki pages)
3. For **modified** articles: diff against existing wiki, update affected pages
4. For **deleted** articles: find wiki pages citing them, update or remove claims
5. Update `wiki/index.md` and `wiki/log.md`
6. Run `qmd update && qmd embed`
7. Delete `pending-changes.md` when done

### Automation (optional)

Add to crontab for periodic sync:
```bash
# Check for changes every 4 hours
0 */4 * * * cd ~/github/cerebro-local && ./scripts/sync-raw.sh nat-gateway >> sync-log.txt 2>&1
```

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
