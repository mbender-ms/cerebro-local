---
title: Operations Log
created: 2026-04-07
updated: 2026-04-07
---

# Operations Log

> Append-only chronological record of wiki operations.
> Each entry: `## [YYYY-MM-DD] operation | Title`
> Parse with: `grep "^## \[" wiki/log.md | tail -10`

## [2026-04-07] init | Knowledge base initialized

Created directory structure, schema (AGENTS.md), index, log.
Set up qmd collections (wiki + raw), Obsidian vault config.

## [2026-04-07] ingest | LLM Wiki by Andrej Karpathy

Source: `raw/articles/karpasky.md` (GitHub Gist, April 2026)
12 wiki pages created (methodology, entities, concepts, pattern).

## [2026-04-07] feat | MS Learn article chunking strategy

Created `scripts/chunk-article.js`. Updated AGENTS.md with chunking rules.

## [2026-04-07] ingest | Azure NAT Gateway documentation (27 articles)

Source: `MicrosoftDocs/azure-docs/articles/nat-gateway/`
9 deep pages: entity, SNAT, default-outbound, AZ zones, troubleshooting,
SKU comparison, hub-spoke patterns, LB patterns, source summary.

## [2026-04-07] ingest | Azure DNS documentation (73 articles)

Source: `MicrosoftDocs/azure-docs/articles/dns/`
11 deep pages: 4 entities (DNS, Public, Private, Resolver), 5 concepts,
1 pattern, 1 source summary.

## [2026-04-07] ingest | Azure Virtual Network documentation (76 articles)

Source: `MicrosoftDocs/azure-docs/articles/virtual-network/`
7 deep pages: entity, NSGs, UDRs, peering, service endpoints,
PE vs SE comparison, source summary.

## [2026-04-07] raw | Download all Azure networking docs (1,331 articles)

Downloaded all 21 networking service areas from MicrosoftDocs/azure-docs.

## [2026-04-07] ingest | Remaining 18 networking service areas (1,155 articles)

Batch ingest: 36 pages (18 entities + 18 source summaries).

## [2026-04-07] deep | Expand all networking with concept/comparison/pattern pages

13 additional deep pages: ExpressRoute peering, LB components,
Private Link DNS, vWAN routing, flow logs, security admin rules,
VPN vs ER, load balancing options, firewall SKU, firewall vs NSG,
App GW vs Front Door, vWAN vs hub-spoke, VPN connections pattern.

## [2026-04-07] raw | Add 125 Azure service areas from azure-docs-pr (7,340 articles)

Copied from local clone. Total: 8,671 articles, 114MB.

## [2026-04-07] deep | Complete all 146 MS Learn service areas

Entity + source pages for all 125 non-networking services.
10 cross-cutting comparison pages: compute, messaging, storage, IoT,
security, migration, hybrid/edge, integration/API, data/analytics, developer.
Added 2,180 articles from nested subdirectories.

## [2026-04-07] ingest | Microsoft Support articles (902 articles, 29 service areas)

Source: `SupportArticles-docs-pr/support/azure/`
5 deep troubleshooting pages: VMs (292), AKS (189), Monitor (73),
storage (29), networking (53). 29 source summary pages.

## [2026-04-07] feat | Sync scripts updated for both repos

sync-raw.sh supports MicrosoftDocs/azure-docs + MicrosoftDocs/SupportArticles-docs.
sync-all.sh with --learn and --support flags.

## [2026-04-07] docs | Comprehensive documentation

README.md rewritten. docs/: new-machine-setup, workflow, chunking-strategy,
syncing, wiki-conventions.

## [2026-04-07] maintain | Updated ingest tracker and operations log

Brought log.md and ingest-tracker.md up to date.

## [2026-04-07] fix | Query workflow uses qmd instead of index.md

Index too large (100+ lines). All configs updated to use qmd for retrieval.

## [2026-04-07] ingest | Azure Compute docs (1,788 articles, 5 service areas)

Source: `azure-compute-docs-pr/articles/`
Syncs from: `MicrosoftDocs/azure-compute-docs`
7 deep pages: VMs (sizes, disks, availability), VMSS (orchestration),
ACI, Service Fabric, managed-disks concept, vm-availability concept,
container-compute-options comparison.
Sync scripts updated for 3 repos.

## [2026-04-07] ingest | Azure AKS docs (620 articles, 3 service areas)

Source: `azure-aks-docs-pr/articles/`
Syncs from: `MicrosoftDocs/azure-aks-docs`
5 deep pages: AKS (features, networking, security, storage),
Fleet Manager, Application Network, aks-networking concept.
Sync scripts updated for 4 repos.

## [2026-04-07] deep | Deep analysis for remaining 58 service areas

7 new concept/comparison pages: RBAC, backup & DR, caching options,
operations management, operator/edge services, data services,
real-time services.

## [2026-04-07] deep | 100% entity coverage — all 129 entities cross-linked

Updated all 129 entity pages with bidirectional links to concept/comparison
pages. Every entity now links to at least one deep analysis page.

Final state: 368 wiki pages, 14,009 raw articles, 184 service areas,
81,198 qmd vectors. 4 sync repos configured.

## [2026-04-07] ingest | Azure Management docs (737 articles, 7 service areas)

Source: `azure-management-docs-pr/articles/`
Syncs from: `MicrosoftDocs/azure-management-docs` (public)

Service areas: azure-arc (459), container-registry (133), copilot (40),
lighthouse (32), azure-portal (30), azure-linux (28), quotas (15).

Deep wiki pages created (8):
- entities/azure-arc — Arc resource types, connected machine agent, capabilities
- entities/azure-container-registry — tiers, geo-replication, tasks, AKS integration
- entities/azure-copilot — AI assistant capabilities and workflow
- entities/azure-lighthouse — cross-tenant management
- entities/azure-linux — AKS node OS, security hardening
- entities/azure-portal-quotas — portal + quota management
- comparisons/hybrid-management — Arc vs traditional Azure management

7 source summary pages. Sync scripts updated for 5 repos.
Index rebuilt with all 379 pages.

Totals: 379 wiki pages, 14,695 raw articles, 191 service areas.

## [2026-04-07] ingest | Azure Well-Architected Framework (224 articles)

Source: `well-architected-pr/well-architected/`

7 deep wiki pages created:
- entities/azure-well-architected-framework — 5 pillars, service guides, workload guidance
- concepts/waf-reliability — resilience, availability, recovery principles + Azure mapping
- concepts/waf-security — zero trust, defense in depth, data protection + Azure mapping
- concepts/waf-cost-optimization — right-sizing, reservations, spot, tagging
- concepts/waf-operational-excellence — DevOps, IaC, CI/CD, observability, safe deployment
- concepts/waf-performance-efficiency — testing, caching, CDN, async, auto-scaling

Index rebuilt: 386 pages. Source summary created.

Totals: 386 wiki pages, 14,869 raw articles, 192 service areas.

## [2026-04-07] ingest | Cloud Adoption Framework (473 articles)

Source: `cloud-adoption-framework-pr/docs/`
9 methodology phases, 202 landing zone articles, scenario guidance (VMware, SAP, AKS, data, AI, Oracle, HPC).

Deep wiki pages (5):
- entities/cloud-adoption-framework — 9 phases, landing zones, scenarios, anti-patterns
- concepts/caf-landing-zones — 8 design areas, network topology options, subscription vending, accelerators
- concepts/caf-governance — 5 governance disciplines, Azure Policy, governance MVP
- comparisons/caf-vs-waf — scope/audience/output comparison, when to use which

Totals: 393 wiki pages, 15,229 raw articles, 193 service areas.
