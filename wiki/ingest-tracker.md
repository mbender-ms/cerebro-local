---
title: Ingest Tracker
created: 2026-04-07
updated: 2026-04-07
---

# Ingest Tracker

> Status of raw source ingestion into wiki pages.
> All service areas are ingested. 100% of entity pages have deep cross-links.

## Summary

| Metric | Count |
|--------|-------|
| **Total service areas** | 191 (146 MS Learn + 5 Compute + 3 AKS + 7 Management + 29 Support + 1 other) |
| **All ingested** | ✅ Yes |
| **Deep coverage (entity→concept/comparison links)** | 129/129 (100%) |
| **Total raw articles** | 14,695 |
| **Total wiki pages** | 379 |
| — Entities | 138 |
| — Concepts | 39 |
| — Comparisons | 22 |
| — Patterns | 5 |
| — Sources | 175 |
| — System | 3 (index, log, tracker) |
| **qmd vectors** | ~82,000 chunks |

## Sync Sources (4 repos)

| Repo | Script | Flag | Service areas |
|------|--------|------|---------------|
| `MicrosoftDocs/azure-docs` | `sync-raw.sh <service>` | `--learn` | 21 networking + 125 other |
| `MicrosoftDocs/azure-compute-docs` | `sync-raw.sh <service>` | `--compute` | virtual-machines, vmss, aci, service-fabric, impact-reporting |
| `MicrosoftDocs/azure-aks-docs` | `sync-raw.sh <service>` | `--aks` | aks, application-network, kubernetes-fleet |
| `MicrosoftDocs/azure-management-docs` | `sync-raw.sh <service>` | `--mgmt` | azure-arc, acr, copilot, lighthouse, portal, linux, quotas |
| `MicrosoftDocs/SupportArticles-docs` | `sync-raw.sh support-<service>` | `--support` | 29 support areas |

## MS Learn — Azure Networking (Deep Ingest)

| Service Area | Articles | Deep Pages |
|-------------|----------|------------|
| application-gateway | 126 | entity + comparisons (app-gw-vs-front-door, load-balancing-options) |
| bastion | 41 | entity + troubleshooting-virtual-machines |
| cdn | 49 | entity + load-balancing-options |
| dns | 73 | 4 entities + 5 concepts + 1 pattern |
| expressroute | 92 | entity + peering concept + vpn-vs-er comparison |
| firewall | 85 | entity + 2 comparisons (SKU, vs-NSG) |
| firewall-manager | 27 | entity + firewall-sku, vwan-routing |
| frontdoor | 78 | entity + 2 comparisons (app-gw-vs-fd, LB options) |
| ip-services | 52 | entity + snat |
| load-balancer | 94 | entity + components concept + LB options comparison |
| nat-gateway | 27 | entity + 4 concepts + 1 comparison + 2 patterns |
| network-watcher | 64 | entity + flow-logs concept |
| networking | 17 | entity + NSGs |
| private-link | 48 | entity + DNS concept + PE-vs-SE comparison |
| route-server | 21 | entity |
| traffic-manager | 44 | entity + LB options comparison |
| virtual-network | 76 | entity + 4 concepts + PE-vs-SE comparison |
| virtual-network-manager | 52 | entity + security-admin-rules concept |
| virtual-wan | 133 | entity + routing concept + vWAN-vs-hub-spoke comparison |
| vpn-gateway | 122 | entity + vpn-vs-er comparison + connections pattern |
| web-application-firewall | 9 | entity + app-gw-vs-fd, firewall-SKU, security-services |

## Azure Compute Docs (Deep Ingest)

| Service Area | Articles | Deep Pages |
|-------------|----------|------------|
| virtual-machines | 1,166 | entity + managed-disks + vm-availability + container-compute |
| virtual-machine-scale-sets | 97 | entity + vm-availability + managed-disks |
| container-instances | 89 | entity + container-compute-options |
| service-fabric | 422 | entity + container-compute-options |
| azure-impact-reporting | 14 | entity |

## Azure AKS Docs (Deep Ingest)

| Service Area | Articles | Deep Pages |
|-------------|----------|------------|
| aks | 551 | entity + aks-networking concept + container-compute |
| application-network | 11 | entity |
| kubernetes-fleet | 58 | entity + troubleshooting-aks |

## MS Learn — Other Azure Services (125 service areas)

All 125 have entity pages + source summaries + cross-links to relevant concept/comparison pages.

Top services by article count: azure-resource-manager (472), active-directory-b2c (283), backup (373), spring-apps (230), governance (221), databox-online (210), defender-for-iot (189), azure-app-configuration (161), azure-maps (148), azure-web-pubsub (120).

Cross-cutting deep pages covering these services:
- comparisons: compute-options, messaging-options, storage-options, iot-services, security-services, migration-services, hybrid-edge-options, integration-api-services, data-analytics-services, developer-services, caching-options, operator-edge-services
- concepts: azure-rbac, backup-and-dr, azure-operations-management, azure-data-services, azure-realtime-services

## Microsoft Support Articles (29 service areas)

| Service Area | Articles | Deep Page |
|-------------|----------|-----------|
| support-virtual-machines | 292 | ✅ troubleshooting-virtual-machines |
| support-azure-kubernetes | 188 | ✅ troubleshooting-aks |
| support-azure-monitor | 73 | ✅ troubleshooting-azure-monitor |
| support-azure-storage | 29 | ✅ troubleshooting-storage |
| support-virtual-network | 17 | ✅ troubleshooting-networking-support |
| support-vpn-gateway | 12 | ✅ troubleshooting-networking-support |
| support-application-gateway | 14 | ✅ troubleshooting-networking-support |
| support-expressroute | 6 | ✅ troubleshooting-networking-support |
| support-front-door | 4 | ✅ troubleshooting-networking-support |
| 20 other support areas | 267 | source summaries |


## Azure Management Docs (Deep Ingest)

Source: `MicrosoftDocs/azure-management-docs` — synced via `sync-raw.sh <service>` / `--mgmt`.

| Service Area | Articles | Deep Pages |
|-------------|----------|------------|
| azure-arc | 459 | entity + hybrid-management comparison |
| container-registry | 133 | entity + container-compute, security-services |
| copilot | 40 | entity + operations-management |
| lighthouse | 32 | entity + hybrid-management |
| azure-portal | 30 | entity (portal-quotas) |
| azure-linux | 28 | entity + container-compute |
| quotas | 15 | entity (portal-quotas) |

## Other Sources

| Source | Wiki Pages |
|--------|------------|
| Karpathy LLM Wiki gist | 12 methodology pages |
