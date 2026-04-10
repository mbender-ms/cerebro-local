#!/usr/bin/env bash
#
# sync-all.sh — Sync all service areas from public GitHub repos
#
# Checks 8 public repos:
#   - MicrosoftDocs/azure-docs (MS Learn) — 21 networking service areas
#   - MicrosoftDocs/azure-compute-docs (Compute) — 5 service areas
#   - MicrosoftDocs/azure-aks-docs (AKS) — 3 service areas
#   - MicrosoftDocs/azure-management-docs (Management) — 7 service areas
#   - MicrosoftDocs/well-architected (WAF) — 1 service area
#   - MicrosoftDocs/cloud-adoption-framework (CAF) — 1 service area
#   - MicrosoftDocs/architecture-center (Architecture Center) — 1 service area
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
#   ./scripts/sync-all.sh --frameworks  # WAF + CAF only
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

# --- Frameworks (MicrosoftDocs/well-architected + cloud-adoption-framework + architecture-center) ---
FRAMEWORK_SERVICES=(
  well-architected
  cloud-adoption-framework
  architecture-center
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
SYNC_FRAMEWORKS=true
SYNC_SUPPORT=true

for arg in "$@"; do
  case "$arg" in
    --dry-run) EXTRA_ARGS="--dry-run" ;;
    --learn) SYNC_COMPUTE=false; SYNC_AKS=false; SYNC_MGMT=false; SYNC_FRAMEWORKS=false; SYNC_SUPPORT=false ;;
    --compute) SYNC_LEARN=false; SYNC_AKS=false; SYNC_MGMT=false; SYNC_FRAMEWORKS=false; SYNC_SUPPORT=false ;;
    --aks) SYNC_LEARN=false; SYNC_COMPUTE=false; SYNC_MGMT=false; SYNC_FRAMEWORKS=false; SYNC_SUPPORT=false ;;
    --mgmt) SYNC_LEARN=false; SYNC_COMPUTE=false; SYNC_AKS=false; SYNC_FRAMEWORKS=false; SYNC_SUPPORT=false ;;
    --frameworks) SYNC_LEARN=false; SYNC_COMPUTE=false; SYNC_AKS=false; SYNC_MGMT=false; SYNC_SUPPORT=false ;;
    --support) SYNC_LEARN=false; SYNC_COMPUTE=false; SYNC_AKS=false; SYNC_MGMT=false; SYNC_FRAMEWORKS=false ;;
  esac
done

CHANGED_SERVICES=()

# --- Tree cache helper ---
# Pre-fetch repo tree once, reuse for all services in that repo.
# Drops API calls from 68 to 28 (21 flat + 7 cached trees).
TREE_CACHE_DIR=$(mktemp -d)
trap "rm -rf $TREE_CACHE_DIR" EXIT

fetch_tree() {
  local repo="$1"
  local cache_file="$TREE_CACHE_DIR/$(echo $repo | tr '/' '_').json"
  if [ ! -f "$cache_file" ]; then
    curl -s "https://api.github.com/repos/$repo/git/trees/main?recursive=1" > "$cache_file"
  fi
  echo "$cache_file"
}

sync_service() {
  local svc="$1"
  local tree_cache="${2:-}"
  local result
  
  if [ -n "$tree_cache" ]; then
    result=$(TREE_CACHE="$tree_cache" "$SYNC" "$svc" $EXTRA_ARGS 2>&1) || true
  else
    result=$("$SYNC" "$svc" $EXTRA_ARGS 2>&1) || true
  fi

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
}

# --- Sync MS Learn articles (flat dirs, 1 API call each) ---
if [ "$SYNC_LEARN" = true ]; then
  echo "=== Syncing ${#LEARN_SERVICES[@]} MS Learn service areas (MicrosoftDocs/azure-docs) ==="
  echo ""
  for svc in "${LEARN_SERVICES[@]}"; do
    sync_service "$svc"
  done
  echo ""
fi

# --- Sync Compute articles (1 tree API call, cached) ---
if [ "$SYNC_COMPUTE" = true ]; then
  echo "=== Syncing ${#COMPUTE_SERVICES[@]} Compute service areas (MicrosoftDocs/azure-compute-docs) ==="
  echo ""
  CACHE=$(fetch_tree "MicrosoftDocs/azure-compute-docs")
  for svc in "${COMPUTE_SERVICES[@]}"; do
    sync_service "$svc" "$CACHE"
  done
  echo ""
fi

# --- Sync AKS articles (1 tree API call, cached) ---
if [ "$SYNC_AKS" = true ]; then
  echo "=== Syncing ${#AKS_SERVICES[@]} AKS service areas (MicrosoftDocs/azure-aks-docs) ==="
  echo ""
  CACHE=$(fetch_tree "MicrosoftDocs/azure-aks-docs")
  for svc in "${AKS_SERVICES[@]}"; do
    sync_service "$svc" "$CACHE"
  done
  echo ""
fi

# --- Sync Management articles (1 tree API call, cached) ---
if [ "$SYNC_MGMT" = true ]; then
  echo "=== Syncing ${#MGMT_SERVICES[@]} Management service areas (MicrosoftDocs/azure-management-docs) ==="
  echo ""
  CACHE=$(fetch_tree "MicrosoftDocs/azure-management-docs")
  for svc in "${MGMT_SERVICES[@]}"; do
    sync_service "$svc" "$CACHE"
  done
  echo ""
fi

# --- Sync Framework articles (1 tree API call each, 3 repos) ---
if [ "$SYNC_FRAMEWORKS" = true ]; then
  echo "=== Syncing ${#FRAMEWORK_SERVICES[@]} Framework sources (WAF + CAF + Architecture Center) ==="
  echo ""
  for svc in "${FRAMEWORK_SERVICES[@]}"; do
    # Each framework is a separate repo, but only 1 service each so no caching needed
    sync_service "$svc"
  done
  echo ""
fi

# --- Sync Support articles (1 tree API call, cached for all 29 services) ---
if [ "$SYNC_SUPPORT" = true ]; then
  echo "=== Syncing ${#SUPPORT_SERVICES[@]} Support service areas (MicrosoftDocs/SupportArticles-docs) ==="
  echo ""
  CACHE=$(fetch_tree "MicrosoftDocs/SupportArticles-docs")
  for svc in "${SUPPORT_SERVICES[@]}"; do
    sync_service "$svc" "$CACHE"
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
