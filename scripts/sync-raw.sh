#!/usr/bin/env bash
#
# sync-raw.sh — Sync raw articles from GitHub repos and report changes
#
# Compares local files against upstream GitHub repos using git blob SHAs.
# Downloads new/modified files, detects deletions, and produces a
# change report for the LLM to re-ingest affected articles.
#
# Supports three source repos:
#   - MicrosoftDocs/azure-docs (MS Learn articles)
#   - MicrosoftDocs/azure-compute-docs (Compute articles: VMs, VMSS, ACI, Service Fabric)
#   - MicrosoftDocs/azure-aks-docs (AKS, Fleet, Application Network)
#   - MicrosoftDocs/azure-management-docs (Arc, ACR, Copilot, Lighthouse, Portal, Linux, Quotas)
#   - MicrosoftDocs/well-architected (Well-Architected Framework)
#   - MicrosoftDocs/cloud-adoption-framework (Cloud Adoption Framework)
#   - MicrosoftDocs/SupportArticles-docs (Support articles)
#
# Usage:
#   ./scripts/sync-raw.sh <service-area>              # e.g., nat-gateway
#   ./scripts/sync-raw.sh support-<service>            # e.g., support-virtual-machines
#   ./scripts/sync-raw.sh <service-area> --dry-run     # preview only
#   ./scripts/sync-raw.sh <service-area> --all         # sync all, not just .md
#
# Requires: curl, python3, git
# Optional: gh (GitHub CLI) — if authenticated, uses 5,000 req/hr instead of 60
#
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="$BASE_DIR/raw/articles"
REPORT_FILE="$BASE_DIR/pending-changes.md"

# --- GitHub auth ---
# gh auth token gives 5,000 req/hr BUT MicrosoftDocs org requires SAML SSO
# which blocks personal tokens. So we use auth only if GITHUB_TOKEN env var is
# explicitly set (e.g., with a token that has SAML authorized), otherwise unauthenticated.
GH_AUTH_HEADER=""
if [ -n "${GITHUB_TOKEN:-}" ]; then
  GH_AUTH_HEADER="Authorization: token $GITHUB_TOKEN"
elif [ -n "${GH_TOKEN:-}" ]; then
  GH_AUTH_HEADER="Authorization: token $GH_TOKEN"
fi

curl_gh() {
  if [ -n "$GH_AUTH_HEADER" ]; then
    curl -s -H "$GH_AUTH_HEADER" "$@"
  else
    curl -s "$@"
  fi
}

# --- Args ---
SERVICE="${1:?Usage: sync-raw.sh <service-area> [--dry-run] [--all]}"
DRY_RUN=false
ALL_FILES=false
for arg in "${@:2}"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    --all) ALL_FILES=true ;;
    *) echo "Unknown arg: $arg"; exit 1 ;;
  esac
done

# --- Determine repo and path based on service name ---
if [[ "$SERVICE" == support-* ]]; then
  # Support articles: MicrosoftDocs/SupportArticles-docs (public repo)
  REPO="MicrosoftDocs/SupportArticles-docs"
  BRANCH="main"
  # Strip "support-" prefix to get the upstream directory name
  UPSTREAM_SVC="${SERVICE#support-}"
  REMOTE_PATH="support/azure/$UPSTREAM_SVC"
  LOCAL_DIR="$RAW_DIR/$SERVICE"
  # Support articles have nested subdirs — we need recursive fetch
  RECURSIVE=true
elif [[ "$SERVICE" == virtual-machines || "$SERVICE" == virtual-machine-scale-sets || "$SERVICE" == container-instances || "$SERVICE" == service-fabric || "$SERVICE" == azure-impact-reporting ]]; then
  # Compute docs: MicrosoftDocs/azure-compute-docs
  REPO="MicrosoftDocs/azure-compute-docs"
  BRANCH="main"
  REMOTE_PATH="articles/$SERVICE"
  LOCAL_DIR="$RAW_DIR/$SERVICE"
  RECURSIVE=true
elif [[ "$SERVICE" == aks || "$SERVICE" == application-network || "$SERVICE" == kubernetes-fleet ]]; then
  # AKS docs: MicrosoftDocs/azure-aks-docs
  REPO="MicrosoftDocs/azure-aks-docs"
  BRANCH="main"
  REMOTE_PATH="articles/$SERVICE"
  LOCAL_DIR="$RAW_DIR/$SERVICE"
  RECURSIVE=true
elif [[ "$SERVICE" == azure-arc || "$SERVICE" == azure-linux || "$SERVICE" == azure-portal || "$SERVICE" == container-registry || "$SERVICE" == copilot || "$SERVICE" == lighthouse || "$SERVICE" == quotas ]]; then
  # Management docs: MicrosoftDocs/azure-management-docs
  REPO="MicrosoftDocs/azure-management-docs"
  BRANCH="main"
  REMOTE_PATH="articles/$SERVICE"
  LOCAL_DIR="$RAW_DIR/$SERVICE"
  RECURSIVE=true
elif [[ "$SERVICE" == well-architected ]]; then
  # Well-Architected Framework: MicrosoftDocs/well-architected
  REPO="MicrosoftDocs/well-architected"
  BRANCH="main"
  REMOTE_PATH="well-architected"
  LOCAL_DIR="$RAW_DIR/$SERVICE"
  RECURSIVE=true
elif [[ "$SERVICE" == cloud-adoption-framework ]]; then
  # Cloud Adoption Framework: MicrosoftDocs/cloud-adoption-framework
  REPO="MicrosoftDocs/cloud-adoption-framework"
  BRANCH="main"
  REMOTE_PATH="docs"
  LOCAL_DIR="$RAW_DIR/$SERVICE"
  RECURSIVE=true
elif [[ "$SERVICE" == architecture-center ]]; then
  # Architecture Center: MicrosoftDocs/architecture-center
  REPO="MicrosoftDocs/architecture-center"
  BRANCH="main"
  REMOTE_PATH="docs"
  LOCAL_DIR="$RAW_DIR/$SERVICE"
  RECURSIVE=true
else
  # MS Learn articles: MicrosoftDocs/azure-docs
  REPO="MicrosoftDocs/azure-docs"
  BRANCH="main"
  RECURSIVE=false
  
  # Handle special path mappings
  case "$SERVICE" in
    ip-services)
      REMOTE_PATH="articles/virtual-network/ip-services"
      ;;
    *)
      REMOTE_PATH="articles/$SERVICE"
      ;;
  esac
  LOCAL_DIR="$RAW_DIR/$SERVICE"
fi

echo "Syncing: $REPO/$REMOTE_PATH → $LOCAL_DIR"
echo "Dry run: $DRY_RUN"
echo ""

# --- Fetch remote file list ---
echo "Fetching remote file list..."

if [ "$RECURSIVE" = true ]; then
  # Use git trees API — returns ENTIRE repo tree in 1 API call with SHAs
  # 1 call per repo instead of 1 call per subdirectory
  REMOTE_FILES=$(python3 -c "
import urllib.request, json, sys

repo = '$REPO'
branch = '$BRANCH'
remote_path = '$REMOTE_PATH'
all_files = '$ALL_FILES' == 'true'
auth_header = '$GH_AUTH_HEADER'

try:
    url = f'https://api.github.com/repos/{repo}/git/trees/{branch}?recursive=1'
    req = urllib.request.Request(url)
    if auth_header:
        key, val = auth_header.split(': ', 1)
        req.add_header(key, val)
    with urllib.request.urlopen(req) as resp:
        data = json.loads(resp.read())

    if data.get('truncated', False):
        print(f'WARNING: tree truncated for {repo}', file=sys.stderr)

    prefix = remote_path.rstrip('/') + '/'

    for entry in data.get('tree', []):
        if entry['type'] != 'blob':
            continue
        path = entry['path']
        if not path.startswith(prefix):
            continue
        name = path.split('/')[-1]
        if not all_files and not name.endswith('.md'):
            continue
        sha = entry['sha']
        size = entry.get('size', 0)
        download_url = f'https://raw.githubusercontent.com/{repo}/{branch}/{path}'
        print(f'{sha}\t{size}\t{name}\t{download_url}')

except Exception as e:
    print(f'ERROR: {e}', file=sys.stderr)
" 2>&1)
else
  # Standard single-level directory (MS Learn articles)

  REMOTE_JSON=$(curl_gh "https://api.github.com/repos/$REPO/contents/$REMOTE_PATH?ref=$BRANCH")

  # Check for API errors
  if echo "$REMOTE_JSON" | python3 -c "import sys,json; d=json.load(sys.stdin); sys.exit(0 if isinstance(d,list) else 1)" 2>/dev/null; then
    : # OK
  else
    echo "ERROR: GitHub API returned unexpected response:"
    echo "$REMOTE_JSON" | head -5
    exit 1
  fi

  REMOTE_FILES=$(echo "$REMOTE_JSON" | python3 -c "
import sys, json
files = json.load(sys.stdin)
for f in files:
    if f['type'] != 'file':
        continue
    name = f['name']
    if '$ALL_FILES' != 'true' and not name.endswith('.md'):
        continue
    print(f'{f[\"sha\"]}\t{f[\"size\"]}\t{name}\t{f[\"download_url\"]}')
")
fi

REMOTE_COUNT=$(echo "$REMOTE_FILES" | grep -c . || true)
echo "Remote: $REMOTE_COUNT files"

# --- Ensure local directory exists ---
mkdir -p "$LOCAL_DIR"

# --- Compare ---
ADDED=()
MODIFIED=()
UNCHANGED=()
DELETED=()

# Check each remote file against local
while IFS=$'\t' read -r remote_sha remote_size name download_url; do
  [ -z "$name" ] && continue
  local_file="$LOCAL_DIR/$name"
  
  if [ ! -f "$local_file" ]; then
    ADDED+=("$name")
    if [ "$DRY_RUN" = false ]; then
      echo "  + $name (new)"
      curl -sL "$download_url" -o "$local_file"
    else
      echo "  + $name (new) [dry-run]"
    fi
  else
    local_sha=$(git hash-object "$local_file")
    if [ "$local_sha" != "$remote_sha" ]; then
      MODIFIED+=("$name")
      if [ "$DRY_RUN" = false ]; then
        echo "  ~ $name (modified)"
        curl -sL "$download_url" -o "$local_file"
      else
        echo "  ~ $name (modified) [dry-run]"
      fi
    else
      UNCHANGED+=("$name")
    fi
  fi
done <<< "$REMOTE_FILES"

# Check for deleted files (local files not in remote)
REMOTE_NAMES=$(echo "$REMOTE_FILES" | awk -F'\t' '{print $3}')
if [ -d "$LOCAL_DIR" ]; then
  for local_file in "$LOCAL_DIR"/*.md; do
    [ -f "$local_file" ] || continue
    name=$(basename "$local_file")
    if ! echo "$REMOTE_NAMES" | grep -qx "$name"; then
      DELETED+=("$name")
      echo "  - $name (deleted from remote)"
    fi
  done
fi

# --- Summary ---
echo ""
echo "=== Sync Summary: $SERVICE ==="
echo "  Source:    $REPO"
echo "  Added:     ${#ADDED[@]}"
echo "  Modified:  ${#MODIFIED[@]}"
echo "  Unchanged: ${#UNCHANGED[@]}"
echo "  Deleted:   ${#DELETED[@]}"

TOTAL_CHANGES=$(( ${#ADDED[@]} + ${#MODIFIED[@]} + ${#DELETED[@]} ))

if [ "$TOTAL_CHANGES" -eq 0 ]; then
  echo ""
  echo "✓ Everything up to date. No changes needed."
  exit 0
fi

# --- Generate change report (append if exists) ---
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

REPORT="
## $SERVICE ($TIMESTAMP)

> Source: \`$REPO/$REMOTE_PATH\`

| Status | Count |
|--------|-------|
| Added | ${#ADDED[@]} |
| Modified | ${#MODIFIED[@]} |
| Deleted | ${#DELETED[@]} |
| Unchanged | ${#UNCHANGED[@]} |
"

if [ ${#ADDED[@]} -gt 0 ]; then
  REPORT+="
### Added
"
  for f in "${ADDED[@]}"; do
    REPORT+="- \`raw/articles/$SERVICE/$f\`
"
  done
fi

if [ ${#MODIFIED[@]} -gt 0 ]; then
  REPORT+="
### Modified
"
  for f in "${MODIFIED[@]}"; do
    REPORT+="- \`raw/articles/$SERVICE/$f\`
"
  done
fi

if [ ${#DELETED[@]} -gt 0 ]; then
  REPORT+="
### Deleted
"
  for f in "${DELETED[@]}"; do
    REPORT+="- \`raw/articles/$SERVICE/$f\`
"
  done
fi

# Append to report file (multiple syncs accumulate)
if [ "$DRY_RUN" = false ]; then
  if [ ! -f "$REPORT_FILE" ]; then
    cat > "$REPORT_FILE" << 'HEADER'
---
title: Pending Changes Report
---

# Pending Changes

> Tell the LLM: "Process pending-changes.md"
>
> For each added article: run full ingest workflow.
> For each modified article: diff against wiki, update affected pages.
> For each deleted article: find wiki pages citing it, update or remove claims.
> Then: `qmd update && qmd embed`
HEADER
  fi
  echo "$REPORT" >> "$REPORT_FILE"
  echo ""
  echo "Changes appended to: $REPORT_FILE"
else
  echo ""
  echo "--- Change Report (dry-run preview) ---"
  echo "$REPORT"
fi
