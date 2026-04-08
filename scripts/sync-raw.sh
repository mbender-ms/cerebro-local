#!/usr/bin/env bash
#
# sync-raw.sh — Sync raw MS Learn articles from GitHub and report changes
#
# Compares local files against the GitHub repo using git blob SHAs.
# Downloads new/modified files, detects deletions, and produces a
# change report for the LLM to re-ingest affected articles.
#
# Usage:
#   ./scripts/sync-raw.sh <service-area>              # e.g., nat-gateway
#   ./scripts/sync-raw.sh <service-area> --dry-run     # preview only
#   ./scripts/sync-raw.sh <service-area> --all         # sync all, not just .md
#
# Requires: curl, python3, git
#
set -euo pipefail

REPO="MicrosoftDocs/azure-docs"
BRANCH="main"
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="$BASE_DIR/raw/articles"
REPORT_FILE="$BASE_DIR/pending-changes.md"

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

REMOTE_PATH="articles/$SERVICE"
LOCAL_DIR="$RAW_DIR/$SERVICE"

echo "Syncing: $REPO/$REMOTE_PATH → $LOCAL_DIR"
echo "Dry run: $DRY_RUN"
echo ""

# --- Get remote file list with SHAs ---
echo "Fetching remote file list..."
REMOTE_JSON=$(curl -s "https://api.github.com/repos/$REPO/contents/$REMOTE_PATH?ref=$BRANCH")

# Check for API errors
if echo "$REMOTE_JSON" | python3 -c "import sys,json; d=json.load(sys.stdin); sys.exit(0 if isinstance(d,list) else 1)" 2>/dev/null; then
  : # OK, it's an array
else
  echo "ERROR: GitHub API returned unexpected response:"
  echo "$REMOTE_JSON" | head -5
  exit 1
fi

# Parse remote files
REMOTE_FILES=$(echo "$REMOTE_JSON" | python3 -c "
import sys, json
files = json.load(sys.stdin)
for f in files:
    if f['type'] != 'file':
        continue
    name = f['name']
    # Filter to .md only unless --all
    if '$ALL_FILES' != 'true' and not name.endswith('.md'):
        continue
    print(f'{f[\"sha\"]}\t{f[\"size\"]}\t{name}\t{f[\"download_url\"]}')
")

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
  local_file="$LOCAL_DIR/$name"
  
  if [ ! -f "$local_file" ]; then
    ADDED+=("$name")
    if [ "$DRY_RUN" = false ]; then
      echo "  + $name (new)"
      curl -s "$download_url" -o "$local_file"
    else
      echo "  + $name (new) [dry-run]"
    fi
  else
    local_sha=$(git hash-object "$local_file")
    if [ "$local_sha" != "$remote_sha" ]; then
      MODIFIED+=("$name")
      if [ "$DRY_RUN" = false ]; then
        echo "  ~ $name (modified)"
        curl -s "$download_url" -o "$local_file"
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
echo "  Added:     ${#ADDED[@]}"
echo "  Modified:  ${#MODIFIED[@]}"
echo "  Unchanged: ${#UNCHANGED[@]}"
echo "  Deleted:   ${#DELETED[@]}"

TOTAL_CHANGES=$(( ${#ADDED[@]} + ${#MODIFIED[@]} + ${#DELETED[@]} ))

if [ "$TOTAL_CHANGES" -eq 0 ]; then
  echo ""
  echo "✓ Everything up to date. No changes needed."
  # Remove stale report if exists
  [ -f "$REPORT_FILE" ] && rm "$REPORT_FILE"
  exit 0
fi

# --- Generate change report ---
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

REPORT="---
title: Pending Changes Report
service: $SERVICE
generated: $TIMESTAMP
added: ${#ADDED[@]}
modified: ${#MODIFIED[@]}
deleted: ${#DELETED[@]}
---

# Pending Changes: $SERVICE

> Generated: $TIMESTAMP
> Sync from: \`$REPO/$REMOTE_PATH\`

## Summary

| Status | Count | Action needed |
|--------|-------|---------------|
| Added | ${#ADDED[@]} | Ingest new articles into wiki |
| Modified | ${#MODIFIED[@]} | Re-ingest and update affected wiki pages |
| Deleted | ${#DELETED[@]} | Review wiki pages that cite deleted sources |
| Unchanged | ${#UNCHANGED[@]} | No action |
"

if [ ${#ADDED[@]} -gt 0 ]; then
  REPORT+="
## Added (new articles to ingest)
"
  for f in "${ADDED[@]}"; do
    REPORT+="- \`raw/articles/$SERVICE/$f\`
"
  done
fi

if [ ${#MODIFIED[@]} -gt 0 ]; then
  REPORT+="
## Modified (re-ingest and update wiki)
"
  for f in "${MODIFIED[@]}"; do
    REPORT+="- \`raw/articles/$SERVICE/$f\`
"
  done
fi

if [ ${#DELETED[@]} -gt 0 ]; then
  REPORT+="
## Deleted (review wiki citations)

These files were removed from the upstream repo. Check wiki pages that cite them.

"
  for f in "${DELETED[@]}"; do
    REPORT+="- \`raw/articles/$SERVICE/$f\`
"
  done
fi

REPORT+="
## Ingest Instructions

\`\`\`
# For the LLM: re-ingest changed articles
# 1. Read this report
# 2. For each added article: run full ingest workflow
# 3. For each modified article: diff against wiki, update affected pages
# 4. For each deleted article: find wiki pages citing it, update or remove claims
# 5. Update wiki/index.md and wiki/log.md
# 6. Run: cd ~/github/cerebro-local && qmd update && qmd embed
\`\`\`
"

if [ "$DRY_RUN" = false ]; then
  echo "$REPORT" > "$REPORT_FILE"
  echo ""
  echo "Change report written to: $REPORT_FILE"
  echo "Tell your LLM: \"Process pending-changes.md\""
else
  echo ""
  echo "--- Change Report (dry-run preview) ---"
  echo "$REPORT"
fi
