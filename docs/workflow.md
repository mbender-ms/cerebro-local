# Workflow Reference

Quick reference for common tasks.

## Daily Use

### Search for something
```bash
cd ~/github/cerebro-local
qmd query "your question" -c wiki    # compiled wiki (concise)
qmd query "your question" -c raw     # full articles (detailed)
qmd query "your question"            # both collections
```

### Browse in Obsidian
Open Obsidian → the vault is `~/github/cerebro-local`.
- Graph View: see wiki structure
- Cmd+O: quick switcher to jump to pages
- Backlinks panel: see what links to current page

### Ask your LLM
Just ask naturally. The LLM reads AGENTS.md and uses qmd:
- "What's the difference between VPN Gateway and ExpressRoute?"
- "How do I troubleshoot SNAT exhaustion?"
- "What load balancer should I use for global HTTP?"

---

## Adding Knowledge

### Ingest a web article
1. Use Obsidian Web Clipper to save as markdown to `raw/articles/`
2. Tell LLM: "Ingest `raw/articles/article-name.md`"
3. `qmd update && qmd embed`
4. `git add -A && git commit -m "ingest: article-name" && git push`

### Ingest a service area
```bash
# Sync from upstream GitHub repo (preferred — auto-routes to correct repo)
./scripts/sync-raw.sh <service>
qmd update && qmd embed

# Or copy from local clone
mkdir -p raw/articles/<service>
cp ~/github/azure-docs-pr/articles/<service>/*.md raw/articles/<service>/
qmd update && qmd embed

# Tell LLM: "Ingest the <service> articles"
git add -A && git commit -m "ingest: <service>" && git push
```

### File a good answer back into the wiki
When the LLM produces a valuable comparison or analysis:
- Tell it: "Save that as a wiki page"
- It creates the page in the appropriate directory
- Updates index.md and log.md

---

## Maintenance

### Check for upstream article changes
```bash
./scripts/sync-raw.sh nat-gateway              # one service
./scripts/sync-all.sh                          # all 68 service areas across 8 repos
./scripts/sync-all.sh --learn                  # only 21 MS Learn networking areas
./scripts/sync-all.sh --support                # only 29 support areas
# If changes found → "Process pending-changes.md"
```

### Update search index
```bash
qmd update && qmd embed
```

### Health check the wiki
Tell your LLM: "Lint the wiki"

### Commit and push
```bash
git add -A && git commit -m "description" && git push
```

---

## Recovering on a New Machine

### macOS / Linux / WSL

```bash
git clone git@github.com:asudbring/cerebro-local.git ~/github/cerebro-local
npm install -g @tobilu/qmd
cd ~/github/cerebro-local
qmd collection add wiki ./wiki
qmd collection add raw ./raw
qmd context add qmd://wiki/ "LLM-generated wiki: entities, concepts, comparisons, patterns, sources"
qmd context add qmd://raw/ "Immutable source documents from Microsoft Learn and other sources"
qmd update && qmd embed
# Open in Obsidian, done.
```

### Windows (Native PowerShell)

```powershell
winget install OpenJS.NodeJS.LTS
npm install -g @tobilu/qmd
cd $HOME\github
git clone git@github.com:asudbring/cerebro-local.git
cd cerebro-local
qmd collection add wiki .\wiki
qmd collection add raw .\raw
qmd context add qmd://wiki/ "LLM-generated wiki: entities, concepts, comparisons, patterns, sources"
qmd context add qmd://raw/ "Immutable source documents from Microsoft Learn and other sources"
qmd update
qmd embed
# Run sync scripts via Git Bash: bash ./scripts/sync-all.sh --dry-run
```

See [docs/new-machine-setup.md](new-machine-setup.md) for detailed instructions
(WSL vs native, GPU setup, Obsidian with WSL vault).
