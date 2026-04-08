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

Created directory structure, schema, index, and log. Ready for first ingest.

## [2026-04-07] ingest | LLM Wiki by Andrej Karpathy

Source: `raw/articles/karpasky.md` (GitHub Gist, April 2026)

Pages created (11):
- `wiki/sources/karpathy-llm-wiki.md` — source summary
- `wiki/entities/andrej-karpathy.md` — person
- `wiki/entities/obsidian.md` — tool
- `wiki/entities/qmd.md` — tool
- `wiki/concepts/llm-wiki-pattern.md` — core methodology
- `wiki/concepts/three-layer-architecture.md` — architecture
- `wiki/concepts/ingest.md` — operation
- `wiki/concepts/query.md` — operation
- `wiki/concepts/lint.md` — operation
- `wiki/concepts/write-back.md` — compounding mechanism
- `wiki/concepts/memex.md` — historical concept
- `wiki/patterns/karpathy-wiki-setup.md` — setup pattern

Pages updated (1):
- `wiki/index.md` — added all 12 new pages

## [2026-04-07] ingest | Azure NAT Gateway Documentation (27 articles)

Source: `raw/articles/nat-gateway/*.md` (27 MS Learn articles, ~60K words)

Downloaded from: https://github.com/MicrosoftDocs/azure-docs/tree/main/articles/nat-gateway

Article types: 2 overviews, 5 concepts, 7 how-to, 3 quickstarts, 5 tutorials, 3 troubleshooting.
Chunked via `scripts/chunk-article.js` → 308 chunks analyzed.

Pages created (8):
- `wiki/entities/azure-nat-gateway.md` — main service entity (SKUs, limits, config, monitoring)
- `wiki/concepts/snat.md` — SNAT mechanics, dynamic port allocation, port reuse
- `wiki/concepts/default-outbound-access.md` — legacy outbound, deprecation, migration
- `wiki/concepts/availability-zones-nat.md` — Standard (zonal) vs StandardV2 (zone-redundant)
- `wiki/concepts/troubleshooting-nat-gateway.md` — compiled troubleshooting guide
- `wiki/comparisons/nat-gateway-standard-vs-standardv2.md` — full SKU comparison
- `wiki/patterns/nat-gateway-hub-spoke.md` — hub-spoke with Firewall, NVA, or per-spoke
- `wiki/patterns/nat-gateway-with-load-balancer.md` — internal LB, public LB, priority rules
- `wiki/sources/nat-gateway-docs.md` — source summary covering all 27 articles

Pages updated (1):
- `wiki/index.md` — added all 9 new pages

## [2026-04-07] ingest | Azure DNS Documentation (73 articles)

Source: `raw/articles/dns/*.md` (73 MS Learn articles)

Downloaded from: https://github.com/MicrosoftDocs/azure-docs/tree/main/articles/dns

Article types: 4 overviews, 12 concepts, 22 how-to, 7 tutorials, 1 troubleshooting, 1 reference.

Pages created (11):
- `wiki/entities/azure-dns.md` — top-level service (3 sub-services)
- `wiki/entities/azure-public-dns.md` — public DNS hosting
- `wiki/entities/azure-private-dns.md` — private zones, autoregistration, VNet links
- `wiki/entities/azure-dns-private-resolver.md` — hybrid resolution, endpoints, rulesets
- `wiki/concepts/dns-zones-and-records.md` — record types, TTL, wildcards, etags
- `wiki/concepts/dns-alias-records.md` — dynamic resource references, zone apex
- `wiki/concepts/dnssec.md` — zone signing, chain of trust
- `wiki/concepts/dns-security-policy.md` — query filtering, threat intelligence
- `wiki/concepts/reverse-dns.md` — PTR records, ARPA zones
- `wiki/patterns/dns-hybrid-resolution.md` — on-prem↔Azure resolution patterns
- `wiki/sources/dns-docs.md` — source summary for all 73 articles

Pages updated (1):
- `wiki/index.md` — added all 11 new pages

## [2026-04-07] ingest | Azure Virtual Network Documentation (76 articles)

Source: `raw/articles/virtual-network/*.md` (76 MS Learn articles)

Downloaded from: https://github.com/MicrosoftDocs/azure-docs/tree/main/articles/virtual-network

Article types: 3 overviews, 16 concepts, 25 how-to, 4 tutorials, 4 troubleshooting.

Pages created (7):
- `wiki/entities/azure-virtual-network.md` — foundational VNet entity
- `wiki/concepts/network-security-groups.md` — NSGs, rules, ASGs, service tags
- `wiki/concepts/user-defined-routes.md` — UDRs, next hop types, route selection
- `wiki/concepts/vnet-peering.md` — peering types, gateway transit, service chaining
- `wiki/concepts/service-endpoints.md` — VNet-to-PaaS direct backbone path
- `wiki/comparisons/private-endpoints-vs-service-endpoints.md` — full comparison
- `wiki/sources/virtual-network-docs.md` — source summary for all 76 articles

Pages updated (1):
- `wiki/index.md`

## [2026-04-07] ingest | Remaining 18 Azure Networking service areas (1,155 articles)

Batch ingest of all remaining service areas from `raw/articles/`.

Service areas: application-gateway (126), bastion (41), cdn (49), expressroute (92),
firewall (85), firewall-manager (27), frontdoor (78), ip-services (52),
load-balancer (94), network-watcher (64), networking (17), private-link (48),
route-server (21), traffic-manager (44), virtual-network-manager (52),
virtual-wan (133), vpn-gateway (122), web-application-firewall (9).

Pages created (36):
- 18 entity pages in `wiki/entities/`
- 18 source summary pages in `wiki/sources/`

All 21 service areas now ingested. Total wiki: 59 pages.
All cross-linked with existing nat-gateway, dns, and virtual-network pages.
