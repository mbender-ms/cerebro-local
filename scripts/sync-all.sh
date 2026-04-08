#!/usr/bin/env bash
#
# sync-all.sh — Sync all Azure networking service areas from GitHub
#
# Usage:
#   ./scripts/sync-all.sh              # sync all service areas
#   ./scripts/sync-all.sh --dry-run    # preview only
#
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SYNC="$BASE_DIR/scripts/sync-raw.sh"

SERVICES=(
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

EXTRA_ARGS="${*:---}"

echo "=== Syncing ${#SERVICES[@]} Azure Networking service areas ==="
echo ""

CHANGED_SERVICES=()

for svc in "${SERVICES[@]}"; do
  result=$("$SYNC" "$svc" $EXTRA_ARGS 2>&1)
  
  # Check if there were changes
  if echo "$result" | grep -q "Everything up to date"; then
    count=$(echo "$result" | grep "Unchanged:" | awk '{print $2}')
    printf "  ✓ %-30s %s files (up to date)\n" "$svc" "$count"
  else
    added=$(echo "$result" | grep "Added:" | awk '{print $2}')
    modified=$(echo "$result" | grep "Modified:" | awk '{print $2}')
    deleted=$(echo "$result" | grep "Deleted:" | awk '{print $2}')
    printf "  ⚡ %-30s +%s ~%s -%s\n" "$svc" "$added" "$modified" "$deleted"
    CHANGED_SERVICES+=("$svc")
  fi
done

echo ""
if [ ${#CHANGED_SERVICES[@]} -eq 0 ]; then
  echo "✓ All service areas up to date. No wiki updates needed."
else
  echo "⚡ ${#CHANGED_SERVICES[@]} service area(s) have changes: ${CHANGED_SERVICES[*]}"
  echo ""
  echo "Next: Tell the LLM \"Process pending-changes.md\""
fi
