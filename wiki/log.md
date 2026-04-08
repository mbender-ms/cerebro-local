---
title: Operations Log
created: 2026-04-07
updated: 2026-04-07
---

# Operations Log

> Append-only chronological record of wiki operations.
> Parse with: `grep "^## \[" wiki/log.md | tail -10`

## [2026-04-07] init | Knowledge base initialized

Created directory structure, schema (AGENTS.md), index, log. Set up qmd, Obsidian.

## [2026-04-07] ingest | LLM Wiki by Andrej Karpathy

12 wiki pages (methodology, entities, concepts, pattern).

## [2026-04-07] feat | MS Learn article chunking strategy

`scripts/chunk-article.js` for H2 splitting, tab/zone-pivot separation.

## [2026-04-07] ingest | Azure NAT Gateway (27 articles)

9 deep pages: entity, SNAT, default-outbound, AZ zones, troubleshooting, SKU comparison, 2 patterns.

## [2026-04-07] ingest | Azure DNS (73 articles)

11 deep pages: 4 entities, 5 concepts, 1 pattern.

## [2026-04-07] ingest | Azure Virtual Network (76 articles)

7 deep pages: entity, NSGs, UDRs, peering, service endpoints, PE vs SE comparison.

## [2026-04-07] raw | Download all Azure networking (1,331 articles, 21 areas)

## [2026-04-07] ingest | Remaining 18 networking areas (1,155 articles)

36 pages (18 entities + 18 source summaries).

## [2026-04-07] deep | Expand networking with 13 concept/comparison/pattern pages

ExpressRoute peering, LB components, Private Link DNS, vWAN routing, flow logs, security admin rules, 6 comparisons, 1 pattern.

## [2026-04-07] raw | 125 Azure service areas from azure-docs-pr (7,340 articles)

## [2026-04-07] deep | Complete all 146 MS Learn service areas

98 entity pages, 10 cross-cutting comparisons. Added 2,180 nested articles.

## [2026-04-07] ingest | Microsoft Support articles (902 articles, 29 areas)

5 deep troubleshooting pages + 29 source summaries.

## [2026-04-07] feat | Sync scripts for azure-docs + SupportArticles repos

## [2026-04-07] docs | Comprehensive documentation (README + docs/)

## [2026-04-07] fix | Query workflow uses qmd instead of index.md

## [2026-04-07] ingest | Azure Compute docs (1,788 articles, 5 areas)

VMs, VMSS, ACI, Service Fabric. 7 deep pages. Sync updated for 3 repos.

## [2026-04-07] ingest | Azure AKS docs (620 articles, 3 areas)

AKS, Fleet, Application Network. 5 deep pages. Sync updated for 4 repos.

## [2026-04-07] deep | Remaining 58 service areas expanded

7 new concept/comparison pages: RBAC, backup & DR, caching, operations management, operator/edge, data services, real-time services.

## [2026-04-07] deep | 100% entity cross-link coverage (129/129)

All entity pages linked to concept/comparison pages.

## [2026-04-07] ingest | Azure Management docs (737 articles, 7 areas)

Arc, ACR, Copilot, Lighthouse, Linux, Portal, Quotas. 8 deep pages. Sync updated for 5 repos.

## [2026-04-07] ingest | Azure Well-Architected Framework (224 articles)

7 deep pages: entity + 5 pillar concepts. Source: well-architected-pr (private).

## [2026-04-07] ingest | Cloud Adoption Framework (473 articles)

5 deep pages: entity, landing zones, governance, CAF vs WAF. Source: cloud-adoption-framework-pr (private).

## [2026-04-07] maintain | Final system file update

Updated log.md (complete), ingest-tracker.md (accurate counts + all sync sources),
sync-local.sh (new script for private repos). Verified all counts match actual state.

Final: 394 wiki pages, 15,229 raw articles, 193 service areas, 88,488 qmd vectors.
7 public sync repos. All sync via GitHub API — no local git pull needed.

## [2026-04-07] ingest | Azure Architecture Center (526 articles)

Source: `architecture-center-pr/docs/`
Syncs from: `MicrosoftDocs/architecture-center` (public)

115 guides, 77 example scenarios, 45 design patterns, 36 reference architectures,
38 AI/ML, 29 web apps, 23 data guides, 21 AWS mappings, and more.

Deep wiki pages (3):
- entities/azure-architecture-center — content categories, key patterns, framework relationships
- concepts/architecture-patterns — reliability, scalability, integration, migration, AI patterns
- sources/architecture-center-docs

Sync scripts updated for 8 public repos. Index rebuilt: 394 pages.

Totals: 397 wiki pages, 15,755 raw articles, 194 service areas.
