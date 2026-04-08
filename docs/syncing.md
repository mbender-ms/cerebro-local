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

1. Fetches file list + SHAs from `MicrosoftDocs/azure-docs` via GitHub API
2. Compares each remote SHA against local file's `git hash-object`
3. Downloads new and modified files
4. Detects files deleted from remote
5. Writes `pending-changes.md` with a structured change report

**Special path mappings:**
- `ip-services` → `articles/virtual-network/ip-services` in the repo

**GitHub API rate limits:**
- Unauthenticated: 60 requests/hour (1 request per service area)
- Authenticated (`gh`): 5,000 requests/hour

### `sync-all.sh` — Sync All Networking Service Areas

```bash
./scripts/sync-all.sh              # sync all 21
./scripts/sync-all.sh --dry-run    # preview all
```

Runs `sync-raw.sh` for each of the 21 Azure networking service areas.

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

## Adding Non-Networking Service Areas

For the 125 non-networking service areas, articles were copied from a local
`azure-docs-pr` clone rather than downloaded via API. To sync these:

```bash
# Option 1: Re-copy from local clone
cp ~/github/azure-docs-pr/articles/<service>/*.md raw/articles/<service>/

# Option 2: Add the service to sync-raw.sh (uses GitHub API)
./scripts/sync-raw.sh <service>
```

The sync script works for any service area in the `MicrosoftDocs/azure-docs` repo.
