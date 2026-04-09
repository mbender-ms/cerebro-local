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
| **Git** | Pre-installed on macOS/Linux; `winget install Git.Git` on Windows | Clone and version the repo |
| **Node.js** (18+) | `brew install node` / `winget install OpenJS.NodeJS.LTS` | Required for qmd |
| **qmd** | `npm install -g @tobilu/qmd` | Local hybrid search (BM25 + vector + LLM reranking) |
| **Obsidian** | [obsidian.md](https://obsidian.md) | Browse wiki with graph view, backlinks, search |
| **LLM Agent** | Pi, Claude Code, OpenCode, Copilot | Read AGENTS.md for instructions; writes wiki pages |

Optional:
| Tool | Install | Purpose |
|------|---------|---------|
| **ripgrep** | `brew install ripgrep` / `winget install BurntSushi.ripgrep.MSVC` | Fast grep across raw articles (`rg "term" raw/`) |
| **GitHub CLI** | `brew install gh` / `winget install GitHub.cli` | Push/pull repo; used by sync scripts |

> **Windows**: WSL recommended for full compatibility (sync scripts are bash).
> Native Windows works but requires a PowerShell function for qmd (npm wrapper is broken).
> See [docs/new-machine-setup.md](docs/new-machine-setup.md) for detailed Windows
> instructions (WSL and native options, qmd fix, path quirks).

---

## Architecture

```
cerebro-local/
├── raw/                          # Layer 1: Immutable source material (203 MB)
│   └── articles/                 # 15,711 articles across 194 service areas
│       ├── nat-gateway/          #   Organized by service area
│       ├── virtual-network/
│       ├── architecture-center/
│       ├── well-architected/
│       └── ...                   #   (194 directories total)
│
├── wiki/                         # Layer 2: LLM-generated compiled knowledge
│   ├── index.md                  #   Content catalog (maintained but use qmd for queries)
│   ├── log.md                    #   Chronological operations log
│   ├── ingest-tracker.md         #   Ingest status per service area
│   ├── entities/                 #   183 service pages (one per Azure service)
│   ├── concepts/                 #   53 concept pages (NSGs, SNAT, UDRs, DNS, WAF, CAF, BGP, IaC, BCDR, etc.)
│   ├── comparisons/              #   27 comparison pages (decision matrices)
│   ├── patterns/                 #   5 deployment pattern pages
│   └── sources/                  #   179 source summary and validation pages
│
├── scripts/                      # Helper scripts
│   ├── chunk-article.js          #   MS Learn article chunker (H2 splits, tab separation)
│   ├── sync-raw.sh               #   Sync one service area from GitHub (git trees API)
│   ├── sync-all.sh               #   Sync all 68 service areas across 8 repos
│   ├── search-server.js          #   Browser search UI server (qmd backend, GPU recommended)
│   └── search-server-lite.js     #   Browser search UI server (MiniSearch, CPU-only, no qmd)
│
├── search.html                    # Web search UI (open via search-server.js)
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
| Wiki pages | 450 |
| Raw articles | 15,711 |
| Service areas | 194 |
| qmd vectors | 93,344 |
| Disk size | ~260 MB |
| Sync repos | 8 (all public MicrosoftDocs/*) |

### Wiki Page Types

| Type | Count | Description |
|------|-------|-------------|
| **Entities** (`wiki/entities/`) | 183 | One per Azure service — features, SKUs, limits, links |
| **Concepts** (`wiki/concepts/`) | 53 | Cross-service technical concepts (NSGs, SNAT, UDRs, DNS, WAF pillars, CAF, architecture patterns, BGP, IaC, BCDR, troubleshooting) |
| **Comparisons** (`wiki/comparisons/`) | 27 | Decision matrices with side-by-side tables |
| **Patterns** (`wiki/patterns/`) | 5 | Deployment architectures (hub-spoke, hybrid DNS, etc.) |
| **Sources** (`wiki/sources/`) | 179 | Per-service-area source summaries + validation reports |
| **System** | 3 | index.md, log.md, ingest-tracker.md |

### Deep Coverage Areas

These service areas have multiple wiki pages (entity + concepts + comparisons + patterns):

- **Azure Virtual Network** — NSGs, UDRs, peering, service endpoints, encryption
- **Azure NAT Gateway** — SNAT, availability zones, SKU comparison, hub-spoke patterns, LB integration, troubleshooting
- **Azure DNS** — Public DNS, Private DNS, Private Resolver, zones/records, DNSSEC, alias records, security policy, hybrid resolution
- **Azure Networking (cross-service)** — Load balancing options, Firewall SKUs, Firewall vs NSG, App Gateway vs Front Door, VPN vs ExpressRoute, Virtual WAN vs hub-spoke, Private endpoints vs service endpoints
- **Azure Well-Architected Framework** — All 5 pillars (reliability, security, cost, operational excellence, performance)
- **Cloud Adoption Framework** — Landing zones, governance
- **Azure Architecture Center** — 20+ cloud design patterns, reference architectures
- **Support/Troubleshooting** — VMs, AKS, networking, storage, Azure Monitor (29 support areas)

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

### Search in the Browser

Two search servers available — same web UI, different backends:

| Server | Engine | Requires | Best for |
|--------|--------|----------|----------|
| `search-server.js` | qmd (hybrid BM25 + vector + reranking) | qmd + GPU | macOS, Linux, Windows with GPU |
| `search-server-lite.js` | MiniSearch (BM25 + fuzzy) | Node.js only | Windows CPU-only laptops/VMs |

```bash
# Option A: Full search (requires qmd installed + embedded)
node scripts/search-server.js

# Option B: Lite search (CPU-only, no qmd needed)
npm install minisearch    # one-time
node scripts/search-server-lite.js
```

Both serve **http://localhost:3333** with the same UI. Features:
- Natural language search with collection filtering (Wiki / Raw / All)
- Color-coded result cards by type (entity, concept, comparison, pattern, raw)
- Rendered markdown file viewer (tables, code blocks, headers) or raw source view
- Lite server indexes 19K files in ~12 seconds, no GPU needed

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

# Check all 68 service areas across 8 repos
./scripts/sync-all.sh

# Preview without downloading
./scripts/sync-all.sh --dry-run

# Sync specific repo groups
./scripts/sync-all.sh --learn       # 21 MS Learn networking areas
./scripts/sync-all.sh --compute      # 5 compute areas
./scripts/sync-all.sh --aks          # 3 AKS areas
./scripts/sync-all.sh --mgmt         # 7 management areas
./scripts/sync-all.sh --frameworks   # WAF, CAF, Architecture Center
./scripts/sync-all.sh --support      # 29 support areas

# After sync finds changes, a report is written to pending-changes.md
# Tell your LLM: "Process pending-changes.md"
```

The sync uses the **git trees API** (1 API call per repo) to compare git blob
SHAs — byte-level exact match, no false positives.

#### Sync Source Repos (8 public)

| Repo | Flag | Areas |
|------|------|-------|
| `MicrosoftDocs/azure-docs` | `--learn` | 21 networking service areas |
| `MicrosoftDocs/azure-compute-docs` | `--compute` | VMs, VMSS, containers, service fabric |
| `MicrosoftDocs/azure-aks-docs` | `--aks` | AKS, application-network, kubernetes-fleet |
| `MicrosoftDocs/azure-management-docs` | `--mgmt` | Arc, container-registry, copilot, lighthouse, quotas |
| `MicrosoftDocs/well-architected` | `--frameworks` | WAF 5 pillars |
| `MicrosoftDocs/cloud-adoption-framework` | `--frameworks` | CAF landing zones, governance |
| `MicrosoftDocs/architecture-center` | `--frameworks` | Design patterns, reference architectures |
| `MicrosoftDocs/SupportArticles-docs` | `--support` | 29 troubleshooting areas |

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

Syncs one service area from GitHub. Uses git trees API (1 call per repo) for
recursive repos, contents API for flat repos. Compares git blob SHAs.

```bash
./scripts/sync-raw.sh <service-area>           # sync
./scripts/sync-raw.sh <service-area> --dry-run  # preview only
```

Service-to-repo routing:
- `support-*` → `MicrosoftDocs/SupportArticles-docs`
- `aks`, `application-network`, `kubernetes-fleet` → `MicrosoftDocs/azure-aks-docs`
- `virtual-machines`, `virtual-machine-scale-sets`, etc. → `MicrosoftDocs/azure-compute-docs`
- `azure-arc`, `container-registry`, etc. → `MicrosoftDocs/azure-management-docs`
- `well-architected`, `cloud-adoption-framework`, `architecture-center` → respective repos
- Everything else → `MicrosoftDocs/azure-docs`

### `scripts/sync-all.sh`

Batch sync for all 68 service areas across 8 repos.

```bash
./scripts/sync-all.sh              # sync all
./scripts/sync-all.sh --dry-run    # preview all
./scripts/sync-all.sh --learn      # only MS Learn networking (21 areas)
./scripts/sync-all.sh --support    # only support articles (29 areas)
```

### `scripts/search-server.js`

Full search server — uses qmd for hybrid BM25 + vector + LLM reranking.
Requires qmd installed with `qmd embed` completed. GPU recommended.

```bash
node scripts/search-server.js              # start on default port 3333
node scripts/search-server.js --port 8080  # custom port
```

Serves `search.html` at the root and provides APIs:
- `POST /api/search` — runs `qmd query` or `qmd search`, returns parsed JSON
- `GET /api/file?path=...` — returns file content for the viewer
- `GET /api/status` — returns `qmd status`

### `scripts/search-server-lite.js`

Lightweight search server — uses MiniSearch (pure JavaScript). No qmd, no GPU,
no models. Works on any machine with Node.js including CPU-only Windows laptops.

```bash
npm install minisearch                          # one-time dependency
node scripts/search-server-lite.js              # start on default port 3333
node scripts/search-server-lite.js --port 8080  # custom port
```

Indexes all 19K+ markdown files at startup (~12 seconds). Same API as the full
server — `search.html` works with either backend. Provides BM25 ranking with
fuzzy matching and prefix search.

---

## qmd Reference

qmd is the local search engine. Runs entirely on-device — no API calls, no cloud.
Index size: ~754 MB at `~/.cache/qmd/index.sqlite`.

### Models (auto-downloaded to `~/.cache/qmd/models/`)

| Model | Size | Purpose |
|-------|------|---------|
| embeddinggemma-300M | 329 MB | Vector embeddings |
| qmd-query-expansion-1.7B | 1.3 GB | Query expansion |
| Qwen3-Reranker-0.6B | 639 MB | Result reranking |

### Collections

| Name | Path | Contents |
|------|------|----------|
| `wiki` | `./wiki` | 450 compiled wiki pages |
| `raw` | `./raw` | 15,711 raw articles from 8 repos |

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
qmd context add qmd://wiki/ "LLM-generated wiki: entities, concepts, comparisons, patterns, sources"
qmd context add qmd://raw/ "Immutable source documents from Microsoft Learn and other sources"
qmd update      # indexes all files (~16K documents)
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

> **Note**: There are two Cerebro systems:
> - **Cerebro MCP** (cloud) — personal notes, tasks, ideas via `cerebro` CLI → Supabase + pgvector
> - **Cerebro-local** (this repo) — Azure docs knowledge base via `qmd` → local git + vectors
>
> Both are configured in `~/.pi/agent/AGENTS.md`.

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
The raw articles are ~203 MB. Git compresses to ~55 MB in the pack file.
This is intentional — the repo is self-contained and portable.

### Obsidian is slow with 15K+ files
Exclude `raw/` from Obsidian's indexing:
Settings → Files and links → Excluded files → add `raw/`
This keeps Obsidian's graph and search focused on the ~450 wiki pages.
