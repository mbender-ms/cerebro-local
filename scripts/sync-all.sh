#!/usr/bin/env bash
#
# sync-all.sh — Sync all service areas from both GitHub repos
#
# Checks:
#   - MicrosoftDocs/azure-docs (MS Learn articles) — 21 networking service areas
#   - MicrosoftDocs/SupportArticles-docs (Support articles) — 29 service areas
#
# Usage:
#   ./scripts/sync-all.sh              # sync everything
#   ./scripts/sync-all.sh --dry-run    # preview only
#   ./scripts/sync-all.sh --learn      # MS Learn articles only
#   ./scripts/sync-all.sh --support    # Support articles only
#
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SYNC="$BASE_DIR/scripts/sync-raw.sh"

# --- MS Learn networking service areas (MicrosoftDocs/azure-docs) ---
LEARN_SERVICES=(
  application-gateway
  bastion
  cdn
  dns
  expressroute
  firewall
  firewall-manager
  frontdoor
  ip-services
  load-balancer
  nat-gateway
  network-watcher
  networking
  private-link
  route-server
  traffic-manager
  virtual-network
  virtual-network-manager
  virtual-wan
  vpn-gateway
  web-application-firewall
)

# --- Support articles (MicrosoftDocs/SupportArticles-docs-pr) ---
SUPPORT_SERVICES=(
  support-api-mgmt
  support-app-service
  support-application-gateway
  support-automation
  support-azure-container-instances
  support-azure-container-registry
  support-azure-functions
  support-azure-kubernetes
  support-azure-monitor
  support-azure-stack-edge
  support-azure-storage
  support-cloud-services
  support-cosmos-db
  support-data-api-builder
  support-expressroute
  support-front-door
  support-general
  support-hpc
  support-kubernetes-fleet
  support-logic-apps
  support-partner-solutions
  support-service-fabric
  support-site-recovery
  support-synapse-analytics
  support-virtual-desktop
  support-virtual-machine-scale-sets
  support-virtual-machines
  support-virtual-network
  support-vpn-gateway
)

# --- Parse args ---
EXTRA_ARGS=""
SYNC_LEARN=true
SYNC_SUPPORT=true

for arg in "$@"; do
  case "$arg" in
    --dry-run) EXTRA_ARGS="--dry-run" ;;
    --learn) SYNC_SUPPORT=false ;;
    --support) SYNC_LEARN=false ;;
  esac
done

CHANGED_SERVICES=()

# --- Sync MS Learn articles ---
if [ "$SYNC_LEARN" = true ]; then
  echo "=== Syncing ${#LEARN_SERVICES[@]} MS Learn service areas (MicrosoftDocs/azure-docs) ==="
  echo ""

  for svc in "${LEARN_SERVICES[@]}"; do
    result=$("$SYNC" "$svc" $EXTRA_ARGS 2>&1) || true

    if echo "$result" | grep -q "Everything up to date"; then
      count=$(echo "$result" | grep "Unchanged:" | awk '{print $2}')
      printf "  ✓ %-35s %s files\n" "$svc" "$count"
    else
      added=$(echo "$result" | grep "Added:" | awk '{print $2}')
      modified=$(echo "$result" | grep "Modified:" | awk '{print $2}')
      deleted=$(echo "$result" | grep "Deleted:" | awk '{print $2}')
      printf "  ⚡ %-35s +%s ~%s -%s\n" "$svc" "$added" "$modified" "$deleted"
      CHANGED_SERVICES+=("$svc")
    fi
  done
  echo ""
fi

# --- Sync Support articles ---
if [ "$SYNC_SUPPORT" = true ]; then
  echo "=== Syncing ${#SUPPORT_SERVICES[@]} Support service areas (MicrosoftDocs/SupportArticles-docs-pr) ==="
  echo ""

  for svc in "${SUPPORT_SERVICES[@]}"; do
    result=$("$SYNC" "$svc" $EXTRA_ARGS 2>&1) || true

    if echo "$result" | grep -q "Everything up to date"; then
      count=$(echo "$result" | grep "Unchanged:" | awk '{print $2}')
      printf "  ✓ %-35s %s files\n" "$svc" "$count"
    else
      added=$(echo "$result" | grep "Added:" | awk '{print $2}')
      modified=$(echo "$result" | grep "Modified:" | awk '{print $2}')
      deleted=$(echo "$result" | grep "Deleted:" | awk '{print $2}')
      printf "  ⚡ %-35s +%s ~%s -%s\n" "$svc" "$added" "$modified" "$deleted"
      CHANGED_SERVICES+=("$svc")
    fi
  done
  echo ""
fi

# --- Summary ---
echo "=== Done ==="
if [ ${#CHANGED_SERVICES[@]} -eq 0 ]; then
  echo "✓ All service areas up to date. No wiki updates needed."
else
  echo "⚡ ${#CHANGED_SERVICES[@]} service area(s) have changes: ${CHANGED_SERVICES[*]}"
  echo ""
  echo "Next: Tell the LLM \"Process pending-changes.md\""
fi
