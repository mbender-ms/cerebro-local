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
Installed qmd globally via npm.

## [2026-04-07] ingest | LLM Wiki by Andrej Karpathy

Source: `raw/articles/karpasky.md` (GitHub Gist, April 2026)

12 wiki pages created: andrej-karpathy, obsidian, qmd (entities);
llm-wiki-pattern, three-layer-architecture, ingest, query, lint,
write-back, memex (concepts); karpathy-wiki-setup (pattern);
karpathy-llm-wiki (source).

## [2026-04-07] feat | MS Learn article chunking strategy

Created `scripts/chunk-article.js` — splits MS Learn articles at H2
boundaries, separates tab groups (Portal/PS/CLI), handles zone pivots,
propagates YAML frontmatter. Updated AGENTS.md with chunking rules.

## [2026-04-07] ingest | Azure NAT Gateway documentation (27 articles)

Source: `MicrosoftDocs/azure-docs/articles/nat-gateway/`
27 articles (~60K words). Deep ingest.

9 pages: azure-nat-gateway (entity); snat, default-outbound-access,
availability-zones-nat, troubleshooting-nat-gateway (concepts);
nat-gateway-standard-vs-standardv2 (comparison); nat-gateway-hub-spoke,
nat-gateway-with-load-balancer (patterns); nat-gateway-docs (source).

## [2026-04-07] ingest | Azure DNS documentation (73 articles)

Source: `MicrosoftDocs/azure-docs/articles/dns/`
73 articles. Deep ingest.

11 pages: azure-dns, azure-public-dns, azure-private-dns,
azure-dns-private-resolver (entities); dns-zones-and-records,
dns-alias-records, dnssec, dns-security-policy, reverse-dns (concepts);
dns-hybrid-resolution (pattern); dns-docs (source).

## [2026-04-07] ingest | Azure Virtual Network documentation (76 articles)

Source: `MicrosoftDocs/azure-docs/articles/virtual-network/`
76 articles. Deep ingest.

7 pages: azure-virtual-network (entity); network-security-groups,
user-defined-routes, vnet-peering, service-endpoints (concepts);
private-endpoints-vs-service-endpoints (comparison);
virtual-network-docs (source).

## [2026-04-07] raw | Download all Azure networking docs (1,331 articles)

Downloaded all 21 networking service areas from MicrosoftDocs/azure-docs
via GitHub API. 1,331 articles, 16MB.

## [2026-04-07] ingest | Remaining 18 networking service areas (1,155 articles)

Batch ingest: application-gateway, bastion, cdn, expressroute, firewall,
firewall-manager, frontdoor, ip-services, load-balancer, network-watcher,
networking, private-link, route-server, traffic-manager, virtual-network-manager,
virtual-wan, vpn-gateway, web-application-firewall.

36 pages created (18 entities + 18 source summaries).

## [2026-04-07] deep | Expand all networking with concept/comparison/pattern pages

13 additional pages: expressroute-peering, load-balancer-components,
private-link-dns, virtual-wan-routing, flow-logs, security-admin-rules
(concepts); vpn-vs-expressroute, load-balancing-options, firewall-sku,
firewall-vs-nsg, app-gw-vs-front-door, vwan-vs-hub-spoke (comparisons);
vpn-gateway-connections (pattern).

## [2026-04-07] raw | Add 125 Azure service areas from local azure-docs-pr (7,340 articles)

Copied from ~/github/azure-docs-pr/articles/ to raw/articles/.
125 non-networking service areas. Total: 8,671 articles, 114MB.
qmd: 44,703 embedded chunks.

## [2026-04-07] deep | Complete all 146 MS Learn service areas

Created entity + source summary pages for all 125 non-networking services.
Created 10 cross-cutting comparison pages: compute-options, messaging-options,
storage-options, iot-services, security-services, migration-services,
hybrid-edge-options, integration-api-services, data-analytics-services,
developer-services.

Added 2,180 articles from nested service directories (storage, ARM,
defender-for-iot, governance, spring-apps, etc.).

Total: 308 wiki pages, 10,752 raw articles.

## [2026-04-07] ingest | Microsoft Support articles (902 articles, 29 service areas)

Source: `SupportArticles-docs-pr/support/azure/` (copied from local clone)
902 troubleshooting articles (Symptom/Cause/Solution format).

5 deep troubleshooting wiki pages: troubleshooting-virtual-machines (292 articles),
troubleshooting-aks (189), troubleshooting-azure-monitor (73),
troubleshooting-storage (29), troubleshooting-networking-support (53 across
5 networking areas).

29 source summary pages for all support service areas.

## [2026-04-07] feat | Sync scripts updated for both repos

sync-raw.sh updated to support both MicrosoftDocs/azure-docs (MS Learn)
and MicrosoftDocs/SupportArticles-docs (Support articles).
`support-` prefix routes to the SupportArticles repo with recursive fetch.
sync-all.sh updated with --learn and --support flags.

## [2026-04-07] docs | Comprehensive documentation

README.md rewritten. Created docs/: new-machine-setup.md,
workflow.md, chunking-strategy.md, syncing.md, wiki-conventions.md.

## [2026-04-07] maintain | Updated ingest tracker and operations log

Brought ingest-tracker.md and log.md up to date with all operations
performed during initial build-out.

Final state: 342 wiki pages, 11,652 raw articles, 176 service areas,
68,464 qmd vectors.

## [2026-04-07] ingest | Azure Compute docs (1,788 articles, 5 service areas)

Source: `azure-compute-docs-pr/articles/` (copied from local clone)
Syncs from: `MicrosoftDocs/azure-compute-docs` (public)

Service areas: virtual-machines (1,166), service-fabric (422),
virtual-machine-scale-sets (97), container-instances (89),
azure-impact-reporting (14).

Deep wiki pages created (7):
- entities/azure-virtual-machines — size families, disk types, availability options
- entities/azure-vmss — orchestration modes (Flexible vs Uniform), features
- entities/azure-container-instances — features, when to use vs AKS/Container Apps
- entities/azure-service-fabric — stateful services, programming models
- concepts/managed-disks — disk type comparison (Ultra/PremiumV2/Premium/Standard)
- concepts/vm-availability — zones, VMSS, availability sets, decision guide
- comparisons/container-compute-options — AKS vs Container Apps vs ACI vs Service Fabric

5 source summary pages created.

Sync scripts updated: sync-raw.sh routes VM/VMSS/ACI/ServiceFabric/ImpactReporting
to MicrosoftDocs/azure-compute-docs. sync-all.sh has --compute flag.

Totals: 352 wiki pages, 13,389 raw articles, 181 service areas.
