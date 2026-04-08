# Syncing Raw Sources from GitHub

## How It Works

The sync scripts compare local files against the upstream GitHub repository
using **git blob SHA matching**. The SHA computed by `git hash-object <file>`
is identical to the SHA stored in the GitHub API response — byte-level exact
match with zero false positives. No file content needs to be downloaded just
to check for changes.

## Scripts

### `sync-raw.sh` — Sync One Service Area

```bash
./scripts/sync-raw.sh <service-area>              # sync
./scripts/sync-raw.sh <service-area> --dry-run     # preview only
./scripts/sync-raw.sh <service-area> --all         # include non-.md files
```

**What it does:**

1. Fetches file list + SHAs via GitHub git trees API (1 call per repo)
2. Compares each remote SHA against local file's `git hash-object`
3. Downloads new and modified files
4. Detects files deleted from remote
5. Writes `pending-changes.md` with a structured change report

**Special path mappings:**
- `ip-services` → `articles/virtual-network/ip-services` in the repo

**GitHub API rate limits:**
- Unauthenticated: 60 requests/hour (~10 calls for all 8 repos via trees API)
- Authenticated (`gh`): 5,000 requests/hour

### `sync-all.sh` — Sync All Service Areas

```bash
./scripts/sync-all.sh              # sync all 68 service areas
./scripts/sync-all.sh --dry-run    # preview all
./scripts/sync-all.sh --learn      # 21 MS Learn networking areas
./scripts/sync-all.sh --compute    # 5 compute areas
./scripts/sync-all.sh --aks        # 3 AKS areas
./scripts/sync-all.sh --mgmt       # 7 management areas
./scripts/sync-all.sh --frameworks # WAF, CAF, Architecture Center
./scripts/sync-all.sh --support    # 29 support areas
```

Runs `sync-raw.sh` for each of the 68 service areas across 8 public repos.
Uses git trees API — 1 API call per repo returns the entire file tree with SHAs.

### Sync Source Repos (8 public)

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

## After Syncing

When changes are found, `pending-changes.md` is created:

```markdown
## Modified (re-ingest and update wiki)
- `raw/articles/nat-gateway/nat-overview.md`

## Added (new articles to ingest)
- `raw/articles/nat-gateway/new-feature.md`

## Deleted (review wiki citations)
- `raw/articles/nat-gateway/removed-article.md`
```

**Tell your LLM: "Process pending-changes.md"**

The LLM should:
1. Read `pending-changes.md`
2. For **added** articles: run full ingest (create wiki pages)
3. For **modified** articles: diff against existing wiki, update affected pages
4. For **deleted** articles: find wiki pages citing them, update or remove claims
5. Update `wiki/index.md` and `wiki/log.md`
6. Run `qmd update && qmd embed`
7. Delete `pending-changes.md` when done

## Automation (Optional)

Add to crontab for periodic sync:

```bash
# Check for changes every 4 hours
0 */4 * * * cd ~/github/cerebro-local && ./scripts/sync-raw.sh nat-gateway >> sync-log.txt 2>&1
```

Or sync all networking services:

```bash
0 */4 * * * cd ~/github/cerebro-local && ./scripts/sync-all.sh >> sync-log.txt 2>&1
```

## Adding New Service Areas

The sync script supports any service area across all 8 repos. Service-to-repo
routing is automatic based on the service name:

```bash
# Sync any service from azure-docs
./scripts/sync-raw.sh <service>

# Support articles use support- prefix
./scripts/sync-raw.sh support-<service>

# Compute/AKS/management services are auto-routed
./scripts/sync-raw.sh virtual-machines    # → azure-compute-docs
./scripts/sync-raw.sh aks                 # → azure-aks-docs
./scripts/sync-raw.sh container-registry  # → azure-management-docs
```

To add a new service to `sync-all.sh`, add it to the appropriate array in the script.
