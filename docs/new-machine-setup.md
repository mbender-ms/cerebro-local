# Setting Up on a New Machine

Step-by-step guide for getting the full knowledge base running on a fresh machine.

## 1. Clone the Repository

```bash
git clone git@github.com:asudbring/cerebro-local.git ~/github/cerebro-local
cd ~/github/cerebro-local
```

The repo contains everything: wiki pages, raw articles (203 MB), scripts, schema,
and Obsidian config. No external dependencies to download.

## 2. Install Prerequisites

### macOS (Homebrew)

```bash
# Node.js (required for qmd)
brew install node

# qmd (local search engine)
npm install -g @tobilu/qmd

# Optional but recommended
brew install ripgrep     # fast search across raw articles
brew install gh          # GitHub CLI for sync scripts
```

### Linux

```bash
# Node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# qmd
npm install -g @tobilu/qmd

# Optional
sudo apt-get install -y ripgrep
```

### Windows

Two options: **WSL (recommended)** or **native Windows**.

#### Option A: WSL (Recommended)

WSL gives you a full Linux environment. qmd, sync scripts, and all tools work
natively. Obsidian runs on Windows and opens the WSL path as a vault.

```powershell
# 1. Install WSL if not already installed (PowerShell as Admin)
wsl --install -d Ubuntu

# 2. Inside WSL (Ubuntu), install Node.js and qmd
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs git ripgrep
npm install -g @tobilu/qmd

# 3. Clone the repo inside WSL
mkdir -p ~/github
git clone git@github.com:asudbring/cerebro-local.git ~/github/cerebro-local
cd ~/github/cerebro-local

# 4. Initialize qmd (same as Linux/macOS)
qmd collection add wiki ./wiki
qmd collection add raw ./raw
qmd context add qmd://wiki/ "LLM-generated wiki: entities, concepts, comparisons, patterns, sources"
qmd context add qmd://raw/ "Immutable source documents from Microsoft Learn and other sources"
qmd update
qmd embed
```

**Obsidian on Windows with WSL vault:**
1. Install Obsidian on Windows (not WSL)
2. Open folder as vault → navigate to `\\wsl$\Ubuntu\home\<user>\github\cerebro-local`
3. Or map a network drive: `net use Z: \\wsl$\Ubuntu\home\<user>\github`

**GPU acceleration in WSL:**
- NVIDIA: Install [CUDA WSL drivers](https://developer.nvidia.com/cuda/wsl) — qmd uses CUDA automatically
- AMD: Not currently supported in WSL; qmd falls back to CPU
- Check: `qmd status` → look for "GPU: cuda"

#### Option B: Native Windows (PowerShell)

qmd runs natively on Windows. Sync scripts require Git Bash or adaptation.

```powershell
# 1. Install Node.js (winget)
winget install OpenJS.NodeJS.LTS

# 2. Install qmd
npm install -g @tobilu/qmd

# 3. Install optional tools
winget install BurntSushi.ripgrep.MSVC
winget install Git.Git

# 4. Clone the repo
cd $HOME\github
git clone git@github.com:asudbring/cerebro-local.git
cd cerebro-local

# 5. Initialize qmd
qmd collection add wiki .\wiki
qmd collection add raw .\raw
qmd context add qmd://wiki/ "LLM-generated wiki: entities, concepts, comparisons, patterns, sources"
qmd context add qmd://raw/ "Immutable source documents from Microsoft Learn and other sources"
qmd update
qmd embed
```

**Sync scripts on native Windows:**
- Sync scripts (`sync-raw.sh`, `sync-all.sh`) are bash scripts
- Run them via **Git Bash** (installed with Git for Windows):
  ```bash
  # In Git Bash
  cd ~/github/cerebro-local
  ./scripts/sync-all.sh --dry-run
  ```
- Or install WSL just for sync, keep everything else native

**GPU acceleration on Windows:**
- NVIDIA: CUDA auto-detected by qmd
- Check: `qmd status` → look for "GPU: cuda"
- CPU fallback works but embedding is slower (~60 min for 16K docs vs ~30 min on GPU)

## 3. Initialize qmd

qmd stores its index in `~/.cache/qmd/`. On a new machine, you need to create
collections, index files, and generate vector embeddings.

```bash
cd ~/github/cerebro-local

# Create collections
qmd collection add wiki ./wiki
qmd collection add raw ./raw

# Add context descriptions (improves search quality)
qmd context add qmd://wiki/ "LLM-generated wiki: entities, concepts, comparisons, patterns, sources"
qmd context add qmd://raw/ "Immutable source documents from Microsoft Learn and other sources"

# Index all files (fast — reads file metadata)
qmd update

# Generate vector embeddings (slow first time — downloads 3 models, ~2.3 GB)
qmd embed
```

**First-run timing:**
- Model downloads: ~2 minutes (3 models, 2.3 GB total)
- Embedding 16K documents: ~30 minutes on Apple Silicon, longer on CPU-only

Subsequent `qmd embed` runs only process new/changed files — typically seconds.

### qmd Models (auto-downloaded to `~/.cache/qmd/models/`)

| Model | Size | Purpose |
|-------|------|---------|
| embeddinggemma-300M-Q8_0 | 329 MB | Vector embeddings for semantic search |
| qmd-query-expansion-1.7B-q4_k_m | 1.3 GB | Expands queries for better recall |
| Qwen3-Reranker-0.6B-Q8_0 | 639 MB | Reranks results for precision |

All models run locally on GPU (Metal on macOS, CUDA on Linux) or CPU.

## 4. Set Up Obsidian

1. Download and install [Obsidian](https://obsidian.md)
2. Open Obsidian → "Open folder as vault" → select `~/github/cerebro-local`
3. Settings → Files and links → Attachment folder path: `raw/assets/`
4. Settings → Files and links → Excluded files: add `raw/` (optional — speeds up Obsidian indexing)
5. Install community plugins:
   - **Dataview** — query YAML frontmatter across pages
6. Install browser extension:
   - **Obsidian Web Clipper** — save web articles as markdown to `raw/articles/`

## 5. Configure Your LLM Agent

The `AGENTS.md` file in the repo root contains all instructions for LLM agents.
It tells them:
- Wiki structure and page types
- How to search (qmd, not index.md)
- How to ingest new sources
- How to file answers back into the wiki
- Conventions (frontmatter, citations, conflict callouts)

### Pi

Pi reads `~/.pi/agent/AGENTS.md` globally. The Cerebro Wiki section is already
configured there. No additional setup needed — Pi knows about the wiki on any
machine where the global AGENTS.md is present.

### Claude Code

Claude reads `.claude/CLAUDE.md` or the repo's `AGENTS.md` file. When working
in the cerebro-local directory, Claude automatically picks up the schema.

### GitHub Copilot

Copilot reads `.github/copilot-instructions.md`. The kindle-ebooks repo's
Copilot config already includes Cerebro Wiki instructions for all profiles.

## 6. Verify Everything Works

```bash
cd ~/github/cerebro-local

# Search wiki
qmd query "how does SNAT work with NAT Gateway" -c wiki
# Should return: wiki/concepts/snat.md at top

# Search raw
qmd query "create NAT gateway with Azure CLI" -c raw
# Should return: raw/articles/nat-gateway/quickstart-create-nat-gateway.md

# Cross-collection search
qmd query "what load balancer should I use for global HTTP traffic"
# Should return: wiki/comparisons/load-balancing-options.md

# Check status
qmd status
# Should show: ~16,108 files indexed, ~93,344 vectors
```

## 7. Optional: Set Up Sync

If you want to keep raw articles fresh with upstream changes:

```bash
# One-time check
./scripts/sync-raw.sh nat-gateway

# Or set up a cron job
crontab -e
# Add: 0 */4 * * * cd ~/github/cerebro-local && ./scripts/sync-all.sh >> sync-log.txt 2>&1
```

## Troubleshooting

### "qmd: command not found"
```bash
npm install -g @tobilu/qmd
```

### qmd shows 0 files indexed
```bash
qmd collection add wiki ./wiki
qmd collection add raw ./raw
qmd update
```

### qmd embed fails or hangs
- Ensure you have 4+ GB free disk space (for models)
- On macOS: Metal GPU should be auto-detected
- On Linux without GPU: embedding is slower but works on CPU
- Check: `qmd status` → look for "GPU: metal" or "GPU: cuda"

### Obsidian is very slow
Add `raw/` to excluded files in Obsidian settings. This prevents Obsidian
from indexing 15,711 raw articles — it only needs the ~450 wiki pages.

### Git push is slow
The repo is ~260 MB. First push/clone takes a minute. Subsequent pushes only
send deltas and are fast.
