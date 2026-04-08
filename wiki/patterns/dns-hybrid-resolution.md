---
title: DNS Hybrid Resolution Patterns
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/dns-private-resolver-overview.md
  - dns/private-resolver-endpoints-rulesets.md
  - dns/private-resolver-architecture.md
  - dns/private-dns-scenarios.md
  - dns/dns-resolver-hybrid-dns.md
tags:
  - pattern
  - dns
  - hybrid
  - private-resolver
---

# DNS Hybrid Resolution Patterns

Patterns for resolving DNS across Azure VNets, Private DNS zones, and on-premises networks using [[entities/azure-dns-private-resolver]]. (source: dns-private-resolver-overview.md)

## Problem Statement

Azure Private DNS zones are only resolvable from linked VNets. On-premises DNS servers can't query them directly. Similarly, Azure VMs using Azure-provided DNS can't forward queries to on-premises DNS. You need a bridge.

## Pattern 1: On-Premises → Azure Private DNS

**Use case**: On-premises servers need to resolve `db.contoso.internal` hosted in Azure Private DNS.

**Architecture**:
1. Deploy DNS Private Resolver with **inbound endpoint** in Azure VNet
2. Link Private DNS zone to the resolver's VNet
3. Configure on-premises DNS conditional forwarder: `contoso.internal` → inbound endpoint IP
4. Requires ExpressRoute or VPN for network path

(source: dns-private-resolver-overview.md, dns-resolver-hybrid-dns.md)

## Pattern 2: Azure → On-Premises DNS

**Use case**: Azure VMs need to resolve `legacy.corp.local` hosted on on-premises DNS.

**Architecture**:
1. Deploy DNS Private Resolver with **outbound endpoint** in Azure VNet
2. Create DNS forwarding ruleset: `corp.local` → on-premises DNS server IP
3. Link ruleset to VNets that need resolution
4. Longest suffix match for rule evaluation

(source: dns-private-resolver-overview.md, private-resolver-endpoints-rulesets.md)

## Pattern 3: Bidirectional (Full Hybrid)

**Architecture**: Combine patterns 1 and 2:
- Inbound endpoint for on-premises → Azure
- Outbound endpoint + ruleset for Azure → on-premises
- Both in the same Private Resolver instance

(source: private-resolver-architecture.md)

## Pattern 4: Cross-VNet Resolution via Ruleset Links

**Use case**: Multiple VNets need to resolve Private DNS zones they aren't directly linked to.

**Architecture**:
- Link DNS forwarding ruleset to spoke VNets
- Rules forward to inbound endpoint in hub VNet where Private DNS zones are linked
- Works without VNet peering for DNS (but peering needed for data path)

(source: private-resolver-endpoints-rulesets.md)

## Design Considerations

- Inbound/outbound endpoints each need a **dedicated subnet** (delegated to `Microsoft.Network/dnsResolvers`) (source: dns-private-resolver-overview.md)
- Up to 1,000 forwarding rules per ruleset (source: private-resolver-endpoints-rulesets.md)
- Inbound endpoint IP can be static (for stable conditional forwarder config) or dynamic (source: private-resolver-endpoints-rulesets.md)
- Built-in HA and zone redundancy — no need for multiple resolver instances per region (source: dns-private-resolver-overview.md)

## Links

- [[entities/azure-dns-private-resolver]]
- [[entities/azure-private-dns]]
- [[entities/azure-dns]]
