# Cerebro — Personal Knowledge Base

A Karpathy-style LLM wiki for domain-specific knowledge. The LLM builds and
maintains a persistent, interlinked wiki from curated source documents. You
read and browse; the LLM writes and maintains.

## Architecture

| Layer | Directory | Owner | Purpose |
|-------|-----------|-------|---------|
| Raw sources | `raw/` | Human | Immutable source documents |
| Wiki | `wiki/` | LLM | Compiled, interlinked knowledge |
| Schema | `AGENTS.md` | Human + LLM | Structure, conventions, workflows |

## Quick Start

```bash
# 1. Add a source document
cp ~/Downloads/some-article.md raw/articles/

# 2. Tell your LLM agent to ingest it
#    "Ingest raw/articles/some-article.md"

# 3. Browse in Obsidian
#    Open this folder as an Obsidian vault

# 4. Search with qmd
qmd query "your question here"
```

## Operations

| Operation | Trigger | What happens |
|-----------|---------|-------------|
| **Ingest** | New source in `raw/` | LLM reads source, updates wiki pages, index, log |
| **Query** | Ask a question | LLM searches wiki, synthesizes answer, optionally files it back |
| **Lint** | Periodic health check | LLM finds orphans, broken links, conflicts, stale pages |

## Tools

- **LLM Agent**: Pi / Claude Code / OpenCode — reads `AGENTS.md` for instructions
- **Obsidian**: Local viewer with graph view, backlinks, Dataview
- **qmd**: Local hybrid search (BM25 + vector + LLM reranking)
- **Git**: Version history and safety net

## Obsidian Setup

1. Open this folder as a vault in Obsidian
2. Settings → Files and links → Attachment folder path → `raw/assets/`
3. Install plugins: **Dataview**, **Web Clipper** (browser extension)
4. Optional plugins: **Marp** (slide decks), **Graph Analysis**

See `AGENTS.md` for the full schema.
