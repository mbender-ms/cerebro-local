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

## [2026-04-07] fix | Sync script: git trees API for all recursive repos

Replaced per-directory contents API fetcher with git trees API.
1 API call per repo returns entire file tree with SHAs.

Before: 45 service areas showing false changes (false "deleted" from flattening).
After: 9 service areas with real upstream changes, 0 false deletes.

All 68 service areas across 8 repos now have accurate SHA-based sync.

## [2026-04-07] query | Search validation — 15 cross-repo test queries

Ran 15 queries across the full knowledge base to validate search quality.
Results filed back as: wiki/sources/search-validation-2026-04-07.md

Key findings:
- 15/15 queries found cross-repo results (multiple source repos per query)
- 93% average top result score
- All 8 source repos represented in results
- Support articles surface for troubleshooting, Architecture Center for design,
  WAF/CAF for best practices, wiki for comparisons
- BM25 keyword search works for exact CLI command lookups

## [2026-04-07] maintain | Updated all docs to reflect current state

Updated README.md, AGENTS.md, docs/syncing.md, docs/new-machine-setup.md,
docs/workflow.md with current stats and sync architecture:

- 398 wiki pages, 15,711 raw articles, 194 service areas, 93,229 vectors
- 8 public sync repos (all MicrosoftDocs/*)
- 68 service areas across repos with --learn/--compute/--aks/--mgmt/--frameworks/--support flags
- Git trees API (1 call per repo) for SHA-based sync
- Added two-system note (Cerebro MCP vs cerebro-local)
- Saved setup reference + two-system comparison to Cerebro MCP cloud

## [2026-04-07] deep | Full deep dive — all 194 service areas now have entity coverage

Went deep on all ~70 service areas that were entity-only or source-only.
Worked category by category:

Category 1 - Networking (4): ip-services, route-server, cdn, web-application-firewall
  → Deep entity pages + BGP/routing concepts + CDN vs Front Door comparison

Category 2 - Containers (2): container-registry, kubernetes-fleet
  → Full entity pages with SKU tables, features, integration points

Category 3 - Identity (1): active-directory-b2c
  → User flows vs custom policies, CIAM architecture

Category 4 - Compute & HPC (9): databox-online, cloud-services-extended-support,
  azure-linux, cyclecloud, high-performance-computing, azure-compute-fleet,
  automanage, resiliency, azure-resource-manager
  → HPC comparison page, IaC concept page

Category 5 - Remaining entities (24): all remaining entity-only and source-only areas
  → iot-hub-device-update, azure-government, api-center, healthcare-apis,
    databox-gateway, external-attack-surface-management, firmware-analysis,
    application-network, storage-discovery, durable-task, azure-fluid-relay,
    azure-impact-reporting, site-reliability-engineering, + 11 more

Category 6 - Support troubleshooting (20): all support-* areas
  → Common issues tables, category breakdowns, links to parent services

Category 7 - Major services (16): defender-for-iot, iot-central, spring-apps,
  storage, governance, security, devtest + 9 support areas

New concept pages (6): bgp-dynamic-routing, routing-preference, infrastructure-as-code,
  container-networking, edge-computing, bcdr-backup-disaster-recovery

New comparison pages (4): hpc-compute-options, registry-artifact-services,
  cdn-vs-front-door, sovereign-compliance-options

Final counts: 183 entities, 53 concepts, 27 comparisons, 5 patterns, 179 sources = 447 wiki pages
All 194 raw article service areas now have entity page coverage.

## [2026-04-07] maintain | Updated docs — current stats (450 pages) + Windows instructions

README.md: Updated to 450 wiki pages, 183 entities, 53 concepts, 27 comparisons,
93,344 vectors. Added winget install commands for Windows. Added Windows note
pointing to detailed setup docs.

docs/new-machine-setup.md: Added full Windows instructions — WSL (recommended)
and native PowerShell options. Covers: WSL install, Node.js/qmd setup, cloning
into WSL, Obsidian with WSL vault path, GPU acceleration (CUDA/WSL), Git Bash
for sync scripts, native PowerShell alternative.

docs/workflow.md: Added Windows recovery section with PowerShell commands.

## [2026-04-07] feat | Web search UI — search.html + search-server.js

Created a browser-based search interface for the knowledge base.
- `search.html` — single-file dark-themed UI with search box, collection/mode selectors, expandable results with file viewer
- `scripts/search-server.js` — zero-dependency Node.js HTTP server bridging browser to qmd CLI

Usage: `node scripts/search-server.js` → open http://localhost:3333

Features: hybrid + keyword search, collection filtering (wiki/raw/all), color-coded result types (entity/concept/comparison/pattern/raw), score badges, inline file viewer, responsive design.

## [2026-04-07] maintain | Documented web search UI in README, workflow, setup docs

Added search-server.js and search.html references to:
- README.md: architecture tree, "Search in the Browser" section, scripts reference
- docs/workflow.md: daily use section
- docs/new-machine-setup.md: verify section

## [2026-04-08] sync | Full sync — processed 454 modified, 1 added, 390 deleted

Ran ./scripts/sync-all.sh across all 8 repos. 25 service areas had changes.

Changes by category:
- MS Learn (azure-docs): expressroute, firewall, network-watcher, private-link (~1 each),
  vpn-gateway (+1 new IPv6 S2S article, ~3 modified)
- Compute: virtual-machines (~96 modified), service-fabric (~2), azure-impact-reporting (~2)
- AKS: aks (~6), kubernetes-fleet (~1)
- Management: azure-arc (~72 modified)
- Frameworks: well-architected (~65), cloud-adoption-framework (~145), architecture-center (~54)
- Support: support-azure-kubernetes (~1), support-azure-storage (~2), support-partner-solutions (~1)

Major upstream cleanup — 390 support articles deleted:
- support-virtual-machines: -292 (entire area emptied)
- support-virtual-desktop: -23 (emptied)
- support-site-recovery: -20 (emptied)
- support-virtual-network: -17 (emptied)
- support-synapse-analytics: -14 (emptied)
- support-vpn-gateway: -12 (emptied)
- support-virtual-machine-scale-sets: -10 (emptied)
- support-service-fabric: -2 (emptied)

8 support entity pages updated with upstream removal notes.
qmd re-indexed: 82 documents re-embedded (526 chunks).

## [2026-04-08] feat | Downloaded 2,076 include files from 8 repos

Scanned 15,322 articles — found 12,467 include references across 5,545 files,
pointing to 2,914 unique include files.

Downloaded includes from:
- azure-docs/includes/ (root): 995 files + 15 from subdirs
- azure-compute-docs per-article includes: 431 files
- azure-aks-docs per-article includes: 36 files  
- azure-management-docs per-article includes: 59 files
- azure-docs per-service includes (67 services): 984 files

Total: 2,076 include files (10 MB) stored in raw/includes/
Coverage: 63.6% of referenced includes (remaining are in ~/reusable-content/ or nested subdirs)
Indexed via raw collection — searchable with qmd query/search.

These includes contain: service limits, prerequisites, shared code snippets,
deprecation notices, feature flags, and reusable content blocks that were
previously invisible to search.

## [2026-04-08] feat | Added reusable-content includes from local fork

Copied 1,764 include files from ~/github/reusable-content (local fork).
Primary source: ce-skilling/azure/includes/ (1,738 files) — shared content
referenced across all MS Learn repos.

Also copied: azure-cli, azure-powershell, cloud-shell, github-actions,
privacy-includes, devops-pipelines snippets.

Total includes now: 3,840 files (19 MB)
Coverage: 74.1% of 2,831 unique referenced includes (was 48% before)
Remaining 733 missing: deeply nested per-service includes in azure-docs

qmd re-embedded: 1,761 new docs, 2,798 chunks.

Sync strategy: reusable-content is a private repo — sync via local git pull
from ~/github/reusable-content, not GitHub API.

## [2026-04-08] maintain | Updated ingest-tracker.md to current state

Ingest tracker refreshed with accurate counts:
- 450 wiki pages (183 entities, 53 concepts, 27 comparisons, 5 patterns, 179 sources)
- 15,322 raw articles, 3,840 include files, ~96K qmd vectors
- 8 public sync repos + 1 local (reusable-content)
- Include files section with source breakdown and coverage stats
- Support article upstream removal notes (8 areas emptied April 2026)
- Deep ingest status for all categories

## [2026-04-08] maintain | Windows setup docs — qmd wrapper fix, path quirks, troubleshooting

Discovered and documented Windows-specific qmd issues from live testing on
Windows 11 (Node.js v24.14.0, qmd 2.1.0):

1. npm generates broken .ps1 wrapper (tries /bin/sh instead of node.exe)
   → Fix: PowerShell function in $PROFILE pointing to dist/cli/qmd.js
2. Git Bash mangles Windows paths (C:\Users → /c/Users → C:\c\Users)
   → Fix: Never run qmd from Git Bash, use PowerShell only
3. context add fails with "Collection not found: wiki"
   → On Windows, collections use full paths as names; must run qmd update first
4. Context descriptions are optional — search works without them

Updated: docs/new-machine-setup.md (full native Windows section rewritten),
docs/workflow.md (Windows recovery section), README.md (Windows note).
Saved findings to Cerebro MCP cloud.
