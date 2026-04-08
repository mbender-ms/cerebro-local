---
title: Ingest Tracker
created: 2026-04-07
updated: 2026-04-08
---

# Ingest Tracker

> Status of raw source ingestion into wiki pages.
> All service areas are ingested. 100% of entity pages have deep cross-links.

## Summary

| Metric | Count |
|--------|-------|
| **Total service areas** | 194 |
| **All ingested** | ✅ Yes |
| **Deep coverage (entity→concept/comparison links)** | 100% |
| **Total raw articles** | 15,322 |
| **Total include files** | 3,840 |
| **Total wiki pages** | 450 |
| — Entities | 183 |
| — Concepts | 53 |
| — Comparisons | 27 |
| — Patterns | 5 |
| — Sources | 179 |
| — System | 3 (index, log, tracker) |
| **qmd vectors** | ~96,000 chunks |

## Sync Sources (8 public repos + 1 local)

| Repo | Script | Flag | Service areas |
|------|--------|------|---------------|
| `MicrosoftDocs/azure-docs` | `sync-raw.sh <service>` | `--learn` | 21 networking + 125 other |
| `MicrosoftDocs/azure-compute-docs` | `sync-raw.sh <service>` | `--compute` | virtual-machines, vmss, aci, service-fabric, impact-reporting |
| `MicrosoftDocs/azure-aks-docs` | `sync-raw.sh <service>` | `--aks` | aks, application-network, kubernetes-fleet |
| `MicrosoftDocs/azure-management-docs` | `sync-raw.sh <service>` | `--mgmt` | azure-arc, acr, copilot, lighthouse, portal, linux, quotas |
| `MicrosoftDocs/well-architected` | `sync-raw.sh well-architected` | `--frameworks` | well-architected |
| `MicrosoftDocs/cloud-adoption-framework` | `sync-raw.sh cloud-adoption-framework` | `--frameworks` | cloud-adoption-framework |
| `MicrosoftDocs/architecture-center` | `sync-raw.sh architecture-center` | `--frameworks` | architecture-center |
| `MicrosoftDocs/SupportArticles-docs` | `sync-raw.sh support-<service>` | `--support` | 29 support areas |
| `reusable-content` (local fork) | manual `git pull` + copy | N/A | include files only |

Public repos sync via GitHub API (git trees API, 1 call per repo). `reusable-content` is a private repo — sync via local git pull from `~/github/reusable-content`.

## Include Files (raw/includes/)

| Source | Files |
|--------|-------|
| azure-docs `/includes/` (root + subdirs) | 1,010 |
| azure-compute-docs per-article includes | 431 |
| azure-aks-docs per-article includes | 36 |
| azure-management-docs per-article includes | 59 |
| azure-docs per-service includes (67 services) | 540 |
| reusable-content (local fork) | 1,764 |
| **Total** | **3,840** |

Coverage: 74.1% of 2,831 unique include references in our articles.
Contains: service limits, prerequisites, shared code snippets, deprecation notices, VM series specs, Azure Monitor metrics/logs definitions.

## Deep Ingest Status

### MS Learn — Azure Networking (21 service areas)

All 21 have entity + concept/comparison/pattern pages. Full deep coverage:
application-gateway, bastion, cdn, dns, expressroute, firewall, firewall-manager, frontdoor, ip-services, load-balancer, nat-gateway, network-watcher, networking, private-link, route-server, traffic-manager, virtual-network, virtual-network-manager, virtual-wan, vpn-gateway, web-application-firewall.

### Azure Compute Docs (5 service areas)

virtual-machines, service-fabric, vmss, container-instances, impact-reporting.
Deep: managed-disks, vm-availability, container-compute-options comparisons.

### Azure AKS Docs (3 service areas)

aks, kubernetes-fleet, application-network.
Deep: aks-networking, container-networking concepts.

### Azure Management Docs (7 service areas)

azure-arc, container-registry, copilot, lighthouse, azure-portal, azure-linux, quotas.
Deep: hybrid-management comparison, edge-computing concept.

### Frameworks

| Framework | Articles | Deep Pages |
|-----------|----------|------------|
| Well-Architected | 174 | 5 pillar concepts + caf-vs-waf comparison |
| Cloud Adoption | 360 | caf-landing-zones, caf-governance concepts |
| Architecture Center | 482 | architecture-patterns concept (20+ patterns) |

### Support Articles (29 service areas)

> **Note**: As of April 2026, Microsoft removed support articles for 8 areas upstream (VMs -292, AVD -23, Site Recovery -20, VNet -17, Synapse -14, VPN -12, VMSS -10, Service Fabric -2). Entity pages updated with removal notes.

Remaining active: support-azure-kubernetes (188), support-azure-monitor (73), support-cloud-services (37), support-azure-storage (29), support-app-service (27), + 14 smaller areas.

### All Other Services (125+ service areas)

All have entity pages with real content (not stubs). Created during the full deep dive on 2026-04-07:
- 49 new entity pages across networking, compute, containers, identity, management
- 20 support troubleshooting entity pages
- 16 major service pages (storage, security, governance, IoT, spring-apps, etc.)
- 6 new concept pages (BGP, routing preference, IaC, container networking, edge computing, BCDR)
- 4 new comparison pages (HPC options, registry services, CDN vs Front Door, sovereign/compliance)

### Other Sources

| Source | Wiki Pages |
|--------|------------|
| Karpathy LLM Wiki gist | 12 methodology pages |
| Search validation (2026-04-07) | 1 validation report |
