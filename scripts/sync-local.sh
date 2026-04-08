#!/usr/bin/env bash
#
# sync-local.sh — Sync raw articles from local git clones (for private/internal repos)
#
# For repos that can't be accessed via the public GitHub API (e.g., -pr repos),
# this script does a git pull on the local clone and copies changed .md files.
#
# Usage:
#   ./scripts/sync-local.sh                # sync all local sources
#   ./scripts/sync-local.sh --dry-run      # preview only
#
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="$BASE_DIR/raw/articles"
DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

echo "=== Syncing from local git clones ==="
echo ""

# Define local sources: local_repo_path:source_subdir:raw_dest_name
SOURCES=(
  "$HOME/github/cloud-adoption-framework-pr/docs:.:cloud-adoption-framework"
  "$HOME/github/azure-docs-pr/articles:.:SKIP"
)

# Add any other local-only repos here as needed
# Format: "repo_path:subdir_within_repo:raw_articles_dirname"

TOTAL_CHANGED=0

for source in "${SOURCES[@]}"; do
  IFS=: read -r repo_path subdir dest_name <<< "$source"
  
  # Skip placeholder entries
  [[ "$dest_name" == "SKIP" ]] && continue
  
  # Check if repo exists
  if [ ! -d "$repo_path" ]; then
    echo "  ⚠ $dest_name — repo not found at $repo_path"
    continue
  fi
  
  # Git pull
  echo "  Pulling $dest_name..."
  cd "$repo_path"
  BEFORE=$(git rev-parse HEAD)
  
  if [ "$DRY_RUN" = false ]; then
    git pull --ff-only 2>/dev/null || git pull --rebase 2>/dev/null || echo "    (pull failed, using current state)"
  fi
  
  AFTER=$(git rev-parse HEAD)
  
  if [ "$BEFORE" = "$AFTER" ] && [ "$DRY_RUN" = false ]; then
    echo "    ✓ Up to date (no new commits)"
  else
    # Find changed .md files
    if [ "$BEFORE" != "$AFTER" ]; then
      changed=$(git diff --name-only "$BEFORE" "$AFTER" -- "$subdir" | grep '\.md$' | wc -l | tr -d ' ')
      echo "    $changed files changed since last pull"
      TOTAL_CHANGED=$((TOTAL_CHANGED + changed))
    fi
    
    # Re-copy all .md files (flatten)
    if [ "$DRY_RUN" = false ]; then
      src_dir="$repo_path"
      [ "$subdir" != "." ] && src_dir="$repo_path/$subdir"
      dst="$RAW_DIR/$dest_name"
      mkdir -p "$dst"
      count=$(find "$src_dir" -name "*.md" -type f -exec cp {} "$dst/" \; -print 2>/dev/null | wc -l | tr -d ' ')
      echo "    Copied $count files to raw/articles/$dest_name/"
    fi
  fi
  
  cd "$BASE_DIR"
done

echo ""
if [ "$TOTAL_CHANGED" -gt 0 ]; then
  echo "⚡ $TOTAL_CHANGED files changed. Run: qmd update && qmd embed"
else
  echo "✓ All local sources up to date."
fi
