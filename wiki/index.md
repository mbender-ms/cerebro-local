---
title: Index
created: 2026-04-07
updated: 2026-04-07
---

# Knowledge Base Index

> Master catalog of all wiki pages. The LLM reads this first when answering queries.

## Entities

_Azure networking services, tools, people._

- [[entities/azure-application-gateway]] — L7 web traffic load balancer; URL routing, SSL, WAF, autoscaling (126 sources)
- [[entities/azure-bastion]] — Managed RDP/SSH over TLS; no public IP needed on VMs (41 sources)
- [[entities/azure-cdn]] — Content delivery network; being replaced by Front Door (49 sources)
- [[entities/azure-dns]] — DNS hosting: Public DNS, Private DNS, DNS Private Resolver (73 sources)
- [[entities/azure-public-dns]] — Public DNS zone hosting with anycast, DNSSEC, alias records
- [[entities/azure-private-dns]] — Private DNS zones with autoregistration and split-horizon
- [[entities/azure-dns-private-resolver]] — Hybrid DNS between Azure and on-premises
- [[entities/azure-expressroute]] — Private connectivity to Azure via connectivity provider; no public internet (92 sources)
- [[entities/azure-firewall]] — Cloud-native stateful firewall; Basic/Standard/Premium SKUs (85 sources)
- [[entities/azure-firewall-manager]] — Central policy and route management for Azure Firewall (27 sources)
- [[entities/azure-front-door]] — Global L7 load balancer + CDN + WAF at the edge (78 sources)
- [[entities/azure-ip-services]] — Public/private IPs, prefixes, routing preference (52 sources)
- [[entities/azure-load-balancer]] — L4 TCP/UDP load balancer; public, internal, gateway, cross-region (94 sources)
- [[entities/azure-nat-gateway]] — Managed NAT for outbound connectivity; Standard and StandardV2 SKUs (27 sources)
- [[entities/azure-network-watcher]] — Network diagnostics, monitoring, flow logs, packet capture (64 sources)
- [[entities/azure-networking-foundations]] — Cross-service foundational articles (17 sources)
- [[entities/azure-private-link]] — Private endpoints for PaaS; data exfiltration protection (48 sources)
- [[entities/azure-route-server]] — Dynamic BGP routing between NVAs and Azure SDN (21 sources)
- [[entities/azure-traffic-manager]] — DNS-based global traffic load balancer; 6 routing methods (44 sources)
- [[entities/azure-virtual-network]] — Foundational VNet: subnets, NSGs, UDRs, peering, encryption (76 sources)
- [[entities/azure-virtual-network-manager]] — Centralized VNet governance; connectivity, security, IPAM (52 sources)
- [[entities/azure-virtual-wan]] — Managed hub-and-spoke WAN; S2S, P2S, ExpressRoute, transit (133 sources)
- [[entities/azure-vpn-gateway]] — Encrypted tunnels over public internet; S2S, P2S, VNet-to-VNet (122 sources)
- [[entities/azure-waf]] — Web Application Firewall for App Gateway, Front Door, CDN (9 sources)
- [[entities/andrej-karpathy]] — AI researcher, author of the LLM Wiki pattern (1 source)
- [[entities/obsidian]] — Local-first markdown knowledge base app (1 source)
- [[entities/qmd]] — Local hybrid search engine for markdown files (1 source)

## Concepts

_Protocols, patterns, principles, mental models._

- [[concepts/network-security-groups]] — Stateful L3/L4 packet filter: rules, defaults, ASGs, service tags (3 sources)
- [[concepts/user-defined-routes]] — Custom routes; next hop types, route selection, BGP (1 source)
- [[concepts/vnet-peering]] — Connect VNets via backbone; gateway transit, service chaining (1 source)
- [[concepts/service-endpoints]] — Extend VNet identity to PaaS; optimal routing (2 sources)
- [[concepts/snat]] — Source NAT: dynamic port allocation, port reuse timers (3 sources)
- [[concepts/default-outbound-access]] — Legacy implicit outbound; being deprecated (3 sources)
- [[concepts/availability-zones-nat]] — Standard zonal vs StandardV2 zone-redundant (4 sources)
- [[concepts/troubleshooting-nat-gateway]] — Compiled symptom→cause→fix guide (3 sources)
- [[concepts/dns-zones-and-records]] — Record types, TTL, wildcards, etags (1 source)
- [[concepts/dns-alias-records]] — Dynamic Azure resource references, zone apex (1 source)
- [[concepts/dnssec]] — Zone signing for authenticity and data integrity (3 sources)
- [[concepts/dns-security-policy]] — VNet-level DNS filtering and threat intelligence (2 sources)
- [[concepts/reverse-dns]] — PTR records, ARPA zones (3 sources)
- [[concepts/llm-wiki-pattern]] — LLM incrementally builds persistent wiki from raw sources (1 source)
- [[concepts/three-layer-architecture]] — Raw sources → wiki → schema (1 source)
- [[concepts/ingest]] — Process new sources into wiki (1 source)
- [[concepts/query]] — Ask questions, file good answers back (1 source)
- [[concepts/lint]] — Periodic health check (1 source)
- [[concepts/write-back]] — Filing answers back; key to compounding (1 source)
- [[concepts/memex]] — Vannevar Bush's 1945 vision (1 source)

## Comparisons

- [[comparisons/private-endpoints-vs-service-endpoints]] — Scope, security, access, cost, complexity (2 sources)
- [[comparisons/nat-gateway-standard-vs-standardv2]] — Feature table, migration path (3 sources)

## Patterns

- [[patterns/dns-hybrid-resolution]] — On-prem↔Azure DNS via Private Resolver (5 sources)
- [[patterns/nat-gateway-hub-spoke]] — Hub-spoke with Firewall, NVA, per-spoke (3 sources)
- [[patterns/nat-gateway-with-load-balancer]] — Internal/public LB integration, priority rules (3 sources)
- [[patterns/karpathy-wiki-setup]] — Knowledge base setup pattern (1 source)

## Sources

- [[sources/application-gateway-docs]] — 126 articles
- [[sources/bastion-docs]] — 41 articles
- [[sources/cdn-docs]] — 49 articles
- [[sources/dns-docs]] — 73 articles
- [[sources/expressroute-docs]] — 92 articles
- [[sources/firewall-docs]] — 85 articles
- [[sources/firewall-manager-docs]] — 27 articles
- [[sources/frontdoor-docs]] — 78 articles
- [[sources/ip-services-docs]] — 52 articles
- [[sources/karpathy-llm-wiki]] — LLM Wiki gist (1 article)
- [[sources/load-balancer-docs]] — 94 articles
- [[sources/nat-gateway-docs]] — 27 articles
- [[sources/network-watcher-docs]] — 64 articles
- [[sources/networking-docs]] — 17 articles
- [[sources/private-link-docs]] — 48 articles
- [[sources/route-server-docs]] — 21 articles
- [[sources/traffic-manager-docs]] — 44 articles
- [[sources/virtual-network-docs]] — 76 articles
- [[sources/virtual-network-manager-docs]] — 52 articles
- [[sources/virtual-wan-docs]] — 133 articles
- [[sources/vpn-gateway-docs]] — 122 articles
- [[sources/web-application-firewall-docs]] — 9 articles
