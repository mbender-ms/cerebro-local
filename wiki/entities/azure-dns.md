---
title: Azure DNS
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/dns-overview.md
  - dns/public-dns-overview.md
  - dns/private-dns-overview.md
  - dns/dns-private-resolver-overview.md
  - dns/dns-zones-records.md
  - dns/dns-alias.md
  - dns/dnssec.md
  - dns/dns-security-policy.md
tags:
  - azure-service
  - networking
  - dns
  - name-resolution
---

# Azure DNS

Azure DNS is a hosting service for DNS domains using Microsoft Azure infrastructure. It consists of three distinct services that address different DNS scenarios. (source: dns-overview.md)

## Three Services

| Service | Purpose | Scope |
|---------|---------|-------|
| [[entities/azure-public-dns]] | Host public DNS zones and manage records | Internet-facing name resolution |
| [[entities/azure-private-dns]] | Private DNS zones for virtual networks | Internal name resolution, no internet exposure |
| [[entities/azure-dns-private-resolver]] | Conditional forwarding between Azure and on-premises | Hybrid DNS resolution |

## Key Capabilities Across All Services

- **Azure Resource Manager integration** — RBAC, activity logs, resource locking (source: public-dns-overview.md)
- **Managed via** Azure portal, PowerShell, CLI, REST API, Terraform, Bicep (source: public-dns-overview.md)
- **Record types supported** — A, AAAA, CNAME, MX, PTR, SOA, SRV, TXT, NS, CAA, DS, TLSA (source: dns-zones-records.md)
- **[[concepts/dns-alias-records]]** — Dynamic references to Azure resources (PIPs, Traffic Manager, CDN, Front Door) (source: dns-alias.md)
- **[[concepts/dnssec]]** — Zone signing for data integrity and anti-spoofing (public DNS only) (source: dnssec.md)
- **[[concepts/dns-security-policy]]** — Filter and log DNS queries at VNet level, threat intelligence feed (source: dns-security-policy.md)

## DNS Resolution Flow (Azure-Provided)

1. VM issues DNS query
2. If custom DNS servers configured → forward to those IPs
3. If Azure-provided DNS → check Private DNS zones linked to the VNet
4. If DNS Private Resolver rulesets linked → evaluate forwarding rules
5. If no match → Azure public DNS resolution

(source: dns-private-resolver-overview.md)

## Pricing

- **Public DNS**: Based on number of hosted zones + query volume
- **Private DNS**: Based on number of zones + query volume
- **Private Resolver**: Based on endpoint hours + query volume

## Links

- [[entities/azure-public-dns]]
- [[entities/azure-private-dns]]
- [[entities/azure-dns-private-resolver]]
- [[concepts/dns-alias-records]]
- [[concepts/dnssec]]
- [[concepts/dns-security-policy]]
- [[concepts/dns-zones-and-records]]
- [[concepts/reverse-dns]]
- [[patterns/dns-hybrid-resolution]]
- [[sources/dns-docs]]
