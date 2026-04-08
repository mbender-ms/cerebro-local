#!/usr/bin/env bash
#
# sync-all.sh — Sync all service areas from public GitHub repos
#
# Checks 5 public repos:
#   - MicrosoftDocs/azure-docs (MS Learn) — 21 networking service areas
#   - MicrosoftDocs/azure-compute-docs (Compute) — 5 service areas
#   - MicrosoftDocs/azure-aks-docs (AKS) — 3 service areas
#   - MicrosoftDocs/azure-management-docs (Management) — 7 service areas
#   - MicrosoftDocs/SupportArticles-docs (Support) — 29 service areas
#
# For private repos (CAF, WAF), use: ./scripts/sync-local.sh
#
# Usage:
#   ./scripts/sync-all.sh              # sync all public repos
#   ./scripts/sync-all.sh --dry-run    # preview only
#   ./scripts/sync-all.sh --learn      # MS Learn only
#   ./scripts/sync-all.sh --compute    # Compute only
#   ./scripts/sync-all.sh --aks        # AKS only
#   ./scripts/sync-all.sh --mgmt       # Management only
#   ./scripts/sync-all.sh --support    # Support only
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

# --- Compute service areas (MicrosoftDocs/azure-compute-docs) ---
COMPUTE_SERVICES=(
  azure-impact-reporting
  container-instances
  service-fabric
  virtual-machine-scale-sets
  virtual-machines
)

# --- AKS service areas (MicrosoftDocs/azure-aks-docs) ---
AKS_SERVICES=(
  aks
  application-network
  kubernetes-fleet
)

# --- Management service areas (MicrosoftDocs/azure-management-docs) ---
MGMT_SERVICES=(
  azure-arc
  azure-linux
  azure-portal
  container-registry
  copilot
  lighthouse
  quotas
)

# --- Support articles (MicrosoftDocs/SupportArticles-docs) ---
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
SYNC_COMPUTE=true
SYNC_AKS=true
SYNC_MGMT=true
SYNC_SUPPORT=true

for arg in "$@"; do
  case "$arg" in
    --dry-run) EXTRA_ARGS="--dry-run" ;;
    --learn) SYNC_COMPUTE=false; SYNC_AKS=false; SYNC_MGMT=false; SYNC_SUPPORT=false ;;
    --compute) SYNC_LEARN=false; SYNC_AKS=false; SYNC_MGMT=false; SYNC_SUPPORT=false ;;
    --aks) SYNC_LEARN=false; SYNC_COMPUTE=false; SYNC_MGMT=false; SYNC_SUPPORT=false ;;
    --mgmt) SYNC_LEARN=false; SYNC_COMPUTE=false; SYNC_AKS=false; SYNC_SUPPORT=false ;;
    --support) SYNC_LEARN=false; SYNC_COMPUTE=false; SYNC_AKS=false; SYNC_MGMT=false ;;
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

# --- Sync Compute articles ---
if [ "$SYNC_COMPUTE" = true ]; then
  echo "=== Syncing ${#COMPUTE_SERVICES[@]} Compute service areas (MicrosoftDocs/azure-compute-docs) ==="
  echo ""

  for svc in "${COMPUTE_SERVICES[@]}"; do
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

# --- Sync AKS articles ---
if [ "$SYNC_AKS" = true ]; then
  echo "=== Syncing ${#AKS_SERVICES[@]} AKS service areas (MicrosoftDocs/azure-aks-docs) ==="
  echo ""

  for svc in "${AKS_SERVICES[@]}"; do
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

# --- Sync Management articles ---
if [ "$SYNC_MGMT" = true ]; then
  echo "=== Syncing ${#MGMT_SERVICES[@]} Management service areas (MicrosoftDocs/azure-management-docs) ==="
  echo ""

  for svc in "${MGMT_SERVICES[@]}"; do
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
