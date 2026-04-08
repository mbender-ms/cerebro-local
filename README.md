# Cerebro — Personal Knowledge Base

A Karpathy-style LLM wiki for Azure documentation and domain-specific knowledge.
The LLM builds and maintains a persistent, interlinked wiki from curated source
documents. You read and browse in Obsidian; the LLM writes and maintains.

**Repo**: `github.com/asudbring/cerebro-local` (private)

## Quick Start (New Machine)

```bash
# 1. Clone the repo
git clone git@github.com:asudbring/cerebro-local.git ~/github/cerebro-local
cd ~/github/cerebro-local

# 2. Install qmd (local search engine)
npm install -g @tobilu/qmd

# 3. Set up qmd collections and index
qmd collection add wiki ./wiki
qmd collection add raw ./raw
qmd context add qmd://wiki/ "LLM-generated wiki: entities, concepts, comparisons, patterns, sources"
qmd context add qmd://raw/ "Immutable source documents from Microsoft Learn and other sources"
qmd update
qmd embed    # ~30 minutes on first run (downloads models + embeds 10K+ docs)

# 4. Open in Obsidian
# Open Obsidian → Open folder as vault → select ~/github/cerebro-local

# 5. Verify it works
qmd query "how does NAT Gateway SNAT work" -c wiki
qmd query "configure private endpoint DNS" -c raw
```

### Prerequisites

| Tool | Install | Purpose |
|------|---------|---------|
| **Git** | Pre-installed on macOS/Linux | Clone and version the repo |
| **Node.js** (18+) | `brew install node` | Required for qmd |
| **qmd** | `npm install -g @tobilu/qmd` | Local hybrid search (BM25 + vector + LLM reranking) |
| **Obsidian** | [obsidian.md](https://obsidian.md) | Browse wiki with graph view, backlinks, search |
| **LLM Agent** | Pi, Claude Code, OpenCode, Copilot | Read AGENTS.md for instructions; writes wiki pages |

Optional:
| Tool | Install | Purpose |
|------|---------|---------|
| **ripgrep** | `brew install ripgrep` | Fast grep across raw articles (`rg "term" raw/`) |
| **GitHub CLI** | `brew install gh` | Push/pull repo; used by sync scripts |

---

## Architecture

```
cerebro-local/
├── raw/                          # Layer 1: Immutable source material (141 MB)
│   └── articles/                 # 10,752 articles across 146 Azure service areas
│       ├── nat-gateway/          #   Organized by service area
│       ├── virtual-network/
│       ├── storage/
│       ├── azure-functions/
│       └── ...                   #   (146 directories total)
│
├── wiki/                         # Layer 2: LLM-generated compiled knowledge
│   ├── index.md                  #   Content catalog (maintained but use qmd for queries)
│   ├── log.md                    #   Chronological operations log
│   ├── ingest-tracker.md         #   Ingest status per service area
│   ├── entities/                 #   125 service pages (one per Azure service)
│   ├── concepts/                 #   26 concept pages (NSGs, SNAT, UDRs, DNS, etc.)
│   ├── comparisons/              #   18 comparison pages (decision matrices)
│   ├── patterns/                 #   5 deployment pattern pages
│   └── sources/                  #   131 source summary pages
│
├── scripts/                      # Helper scripts
│   ├── chunk-article.js          #   MS Learn article chunker (H2 splits, tab separation)
│   ├── sync-raw.sh               #   Sync one service area from GitHub
│   └── sync-all.sh               #   Sync all 21 networking service areas from GitHub
│
├── AGENTS.md                     # Layer 3: Schema — LLM behavior instructions
├── README.md                     # This file
├── .gitignore
└── .obsidian/                    # Obsidian vault config
    ├── app.json                  #   Attachment path → raw/assets/
    └── appearance.json
```

### Three-Layer Design (Karpathy Method)

| Layer | Directory | Owner | Mutability |
|-------|-----------|-------|------------|
| **Raw sources** | `raw/` | Human | Immutable — never modify |
| **Wiki** | `wiki/` | LLM | LLM creates, updates, deletes freely |
| **Schema** | `AGENTS.md` | Human + LLM | Co-evolved over time |

---

## What's in the Knowledge Base

### Current Stats

| Metric | Count |
|--------|-------|
| Wiki pages | 308 |
| Raw articles | 10,752 |
| Service areas | 146 |
| qmd vectors | 64,495 chunks |
| Disk size | ~150 MB |

### Wiki Page Types

| Type | Count | Description |
|------|-------|-------------|
| **Entities** (`wiki/entities/`) | 125 | One per Azure service — features, SKUs, limits, links |
| **Concepts** (`wiki/concepts/`) | 26 | Cross-service technical concepts (NSGs, SNAT, UDRs, DNS, peering, etc.) |
| **Comparisons** (`wiki/comparisons/`) | 18 | Decision matrices with side-by-side tables |
| **Patterns** (`wiki/patterns/`) | 5 | Deployment architectures (hub-spoke, hybrid DNS, etc.) |
| **Sources** (`wiki/sources/`) | 131 | Per-service-area source summaries |
| **System** | 3 | index.md, log.md, ingest-tracker.md |

### Deep Coverage Areas

These service areas have multiple wiki pages (entity + concepts + comparisons + patterns):

- **Azure Virtual Network** — NSGs, UDRs, peering, service endpoints, encryption
- **Azure NAT Gateway** — SNAT, availability zones, SKU comparison, hub-spoke patterns, LB integration, troubleshooting
- **Azure DNS** — Public DNS, Private DNS, Private Resolver, zones/records, DNSSEC, alias records, security policy, hybrid resolution
- **Azure Networking (cross-service)** — Load balancing options, Firewall SKUs, Firewall vs NSG, App Gateway vs Front Door, VPN vs ExpressRoute, Virtual WAN vs hub-spoke, Private endpoints vs service endpoints

### Comparison Pages

| Page | Decision |
|------|----------|
| `load-balancing-options` | L4/L7 × global/regional matrix |
| `vpn-gateway-vs-expressroute` | Private vs internet connectivity |
| `firewall-sku-comparison` | Basic / Standard / Premium |
| `firewall-vs-nsg` | Centralized vs distributed security |
| `app-gateway-vs-front-door` | Regional vs global L7 |
| `virtual-wan-vs-hub-spoke` | Managed vs self-managed |
| `private-endpoints-vs-service-endpoints` | Scope, security, cost |
| `nat-gateway-standard-vs-standardv2` | SKU features, migration |
| `compute-options` | App Service vs Functions vs Container Apps |
| `messaging-options` | Service Bus vs Event Hubs vs Event Grid |
| `storage-options` | Blob tiers, Files, NetApp, Data Lake |
| `iot-services` | IoT Hub vs Central vs Edge |
| `security-services` | Full network security stack + SIEM |
| `migration-services` | Migrate vs Site Recovery vs DataBox |
| `hybrid-edge-options` | VMware, Arc, bare metal, edge |
| `integration-api-services` | APIM vs Logic Apps vs Functions |
| `data-analytics-services` | Data Factory vs Synapse vs Stream Analytics |
| `developer-services` | Dev Box vs Deployment Environments |

---

## How to Use

### Search the Knowledge Base

```bash
cd ~/github/cerebro-local

# Hybrid search (recommended) — auto-expands query + BM25 + vector + LLM reranking
qmd query "your question here"

# Search wiki pages only (compiled, concise, cross-linked)
qmd query "SNAT port exhaustion" -c wiki

# Search raw articles only (full detail, code blocks, procedures)
qmd query "create NAT gateway CLI" -c raw

# Fast keyword search (no LLM, instant)
qmd search "ExpressRoute Global Reach"

# Get a specific file
qmd get wiki/entities/azure-nat-gateway.md
```

### Browse in Obsidian

1. Open Obsidian → Open folder as vault → `~/github/cerebro-local`
2. Use **Graph View** to see the wiki structure and connections
3. Use **Backlinks** to see what links to the current page
4. Use **Quick Switcher** (Cmd+O) to jump to any page
5. Install **Dataview** plugin for dynamic queries over frontmatter

Recommended Obsidian settings:
- Files and links → Attachment folder path: `raw/assets/`
- Install plugins: Dataview, Web Clipper (browser extension)

### Ask Your LLM Agent

Any LLM agent (Pi, Claude Code, Copilot) that reads `AGENTS.md` knows:
- To use `qmd query` for retrieval (NOT read index.md)
- The wiki structure and page types
- How to ingest new sources
- How to file good answers back into the wiki

Example prompts:
- "What are the options for connecting on-premises to Azure?"
- "Compare Event Hubs and Service Bus for IoT telemetry"
- "How do I troubleshoot NAT Gateway SNAT exhaustion?"
- "Ingest the container-apps articles"

---

## Operations

### Ingest New Sources

```bash
# 1. Add source to raw/
cp article.md raw/articles/<service-area>/

# 2. For MS Learn articles, preview the chunk structure
node scripts/chunk-article.js raw/articles/<service>/article.md --summary

# 3. Tell your LLM agent to ingest
#    "Ingest raw/articles/<service>/article.md"
#    The LLM reads AGENTS.md for the full workflow:
#    - Creates/updates wiki pages (entities, concepts, comparisons)
#    - Updates index.md and log.md
#    - Cites sources inline

# 4. Update search index
qmd update && qmd embed

# 5. Commit
git add -A && git commit -m "ingest: <description>"
git push
```

### Sync from GitHub (Keep Articles Fresh)

```bash
# Check one service area for upstream changes
./scripts/sync-raw.sh nat-gateway

# Check all 21 networking service areas
./scripts/sync-all.sh

# Preview without downloading
./scripts/sync-raw.sh nat-gateway --dry-run

# After sync finds changes, a report is written to pending-changes.md
# Tell your LLM: "Process pending-changes.md"
```

The sync script compares local files against the GitHub repo using git blob SHA
matching — byte-level exact, no false positives. Only changed/new files are
downloaded.

### Lint the Wiki

Tell your LLM: "Lint the wiki" or "Health check the knowledge base"

It checks for:
- Orphan pages (no inbound links)
- Broken `[[wiki-links]]`
- Unresolved `[!CONFLICT]` callouts
- Stale pages (sources changed but wiki not updated)
- Missing cross-references
- Index gaps

### Add a New Service Area

```bash
# 1. Copy articles from your local azure-docs clone
mkdir -p raw/articles/<new-service>
cp ~/github/azure-docs-pr/articles/<new-service>/*.md raw/articles/<new-service>/

# 2. Or download from GitHub
./scripts/sync-raw.sh <new-service>

# 3. Update qmd
qmd update && qmd embed

# 4. Tell the LLM to ingest
#    "Ingest the <new-service> articles"

# 5. Commit and push
git add -A && git commit -m "ingest: <new-service>"
git push
```

---

## Scripts Reference

### `scripts/chunk-article.js`

Splits MS Learn articles at H2 boundaries with tab/zone-pivot separation.
Propagates YAML frontmatter metadata to every chunk.

```bash
# Preview chunk structure
node scripts/chunk-article.js raw/articles/nat-gateway/nat-overview.md --summary

# Write chunks to directory
node scripts/chunk-article.js raw/articles/nat-gateway/quickstart.md --output-dir /tmp/chunks

# Dry run (shows first 8 lines of each chunk)
node scripts/chunk-article.js raw/articles/nat-gateway/article.md --dry-run
```

**Chunking rules:**
- H2 = primary split boundary
- Tab groups (`### [Portal](#tab/portal)`) → one chunk per tab
- Zone pivots (`::: zone pivot="x"`) → one chunk per pivot
- Skips boilerplate (Next steps, Clean up, Related content)
- Frontmatter (`ms.service`, `ms.topic`, `ms.date`) propagated to every chunk

### `scripts/sync-raw.sh`

Syncs one service area from GitHub. Compares git blob SHAs to detect changes.

```bash
./scripts/sync-raw.sh <service-area>           # sync
./scripts/sync-raw.sh <service-area> --dry-run  # preview only
```

Special path mappings:
- `ip-services` → `articles/virtual-network/ip-services` in the repo

### `scripts/sync-all.sh`

Batch sync for all 21 Azure networking service areas.

```bash
./scripts/sync-all.sh              # sync all
./scripts/sync-all.sh --dry-run    # preview all
```

---

## qmd Reference

qmd is the local search engine. Runs entirely on-device — no API calls, no cloud.

### Models (auto-downloaded to `~/.cache/qmd/models/`)

| Model | Size | Purpose |
|-------|------|---------|
| embeddinggemma-300M | 329 MB | Vector embeddings |
| qmd-query-expansion-1.7B | 1.3 GB | Query expansion |
| Qwen3-Reranker-0.6B | 639 MB | Result reranking |

### Collections

| Name | Path | Contents |
|------|------|----------|
| `wiki` | `./wiki` | 308 compiled wiki pages |
| `raw` | `./raw` | 10,752 raw MS Learn articles |

### Commands

```bash
# Hybrid search (best quality — expansion + BM25 + vector + reranking)
qmd query "your question"
qmd query "question" -c wiki     # wiki only
qmd query "question" -c raw      # raw only

# Keyword search (fast, no LLM)
qmd search "exact terms"

# Vector search only
qmd vsearch "semantic query"

# View a file
qmd get wiki/entities/azure-nat-gateway.md

# List files in a collection
qmd ls wiki
qmd ls raw

# Re-index after changes
qmd update

# Re-embed after index update
qmd embed

# Check health
qmd status

# Start MCP server (for LLM agent integration)
qmd mcp
```

### First-Time Setup on New Machine

```bash
npm install -g @tobilu/qmd
cd ~/github/cerebro-local
qmd collection add wiki ./wiki
qmd collection add raw ./raw
qmd context add qmd://wiki/ "LLM-generated wiki pages"
qmd context add qmd://raw/ "Immutable MS Learn source articles"
qmd update      # indexes all files
qmd embed       # generates vectors (~30 min first time, downloads 3 models)
```

---

## Git Workflow

```bash
# After any wiki changes
git add -A
git commit -m "ingest: <description>"
git push

# Commit message conventions
#   ingest: <source-title>
#   deep: expand <service-area> with concept/comparison pages
#   lint: fix orphans and broken links
#   query: add comparison page for X vs Y
#   raw: add <service-area> articles
#   feat: <new script or feature>
#   fix: <correction>
```

---

## External Config Files

The following files in other repos tell LLM agents where the knowledge base
lives and how to use it:

| File | Location | What it does |
|------|----------|-------------|
| `AGENTS.md` | `~/.pi/agent/AGENTS.md` | Pi global config — Cerebro CLI + Wiki instructions |
| `copilot-instructions.md` | `kindle-ebooks/.github/` | Root Copilot instructions |
| Profile configs (×6) | `kindle-ebooks/.github/profiles/*/` | Per-profile CLAUDE.md and copilot-instructions.md |

All configs direct agents to use `qmd query` for retrieval (not index.md).

---

## Obsidian Setup

1. Download [Obsidian](https://obsidian.md)
2. Open folder as vault → `~/github/cerebro-local`
3. Settings → Files and links → Attachment folder path → `raw/assets/`
4. Install community plugins:
   - **Dataview** — query YAML frontmatter across pages
   - **Web Clipper** (browser extension) — save web articles as markdown to `raw/articles/`
5. Optional plugins:
   - **Marp** — slide decks from markdown
   - **Graph Analysis** — extended graph metrics

### Useful Obsidian Views

- **Graph View** — see the wiki structure; hubs, orphans, clusters
- **Backlinks** — see what links to the current page
- **Local Graph** — see connections for the current page only
- **Search** — full-text search across all pages
- **Quick Switcher** (Cmd+O) — jump to any page by name

---

## Troubleshooting

### qmd not finding results
```bash
qmd status    # check if collections are indexed
qmd update    # re-index
qmd embed     # re-embed vectors
```

### qmd embed is slow
First run downloads 3 models (~2.3 GB total) and embeds all documents.
Subsequent runs only embed new/changed files. On Apple Silicon with Metal GPU,
~10K documents takes ~25 minutes.

### Wiki pages out of date
```bash
./scripts/sync-raw.sh <service-area>   # check for upstream changes
# If changes found: "Process pending-changes.md"
```

### Git repo too large
The raw articles are ~141 MB. Git compresses to ~40 MB in the pack file.
This is intentional — the repo is self-contained and portable.

### Obsidian is slow with 10K+ files
Exclude `raw/` from Obsidian's indexing:
Settings → Files and links → Excluded files → add `raw/`
This keeps Obsidian's graph and search focused on the 308 wiki pages.
