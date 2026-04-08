---
title: "Source: Azure DNS Documentation (73 articles)"
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/*.md
tags:
  - source-summary
  - azure-dns
  - ms-learn
---

# Source: Azure DNS Documentation

73 articles from `MicrosoftDocs/azure-docs/articles/dns/`, covering Azure Public DNS, Azure Private DNS, and Azure DNS Private Resolver.

## Articles by Type

### Overviews (4)
- dns-overview.md — Top-level Azure DNS overview
- public-dns-overview.md — Azure Public DNS features, security, DNSSEC, alias records
- private-dns-overview.md — Azure Private DNS benefits, capabilities, limitations
- dns-private-resolver-overview.md — Private Resolver architecture, endpoints, rulesets, restrictions

### Concepts (12)
- dns-zones-records.md — Zones, record types (A/AAAA/CNAME/MX/PTR/SRV/TXT/CAA/DS/TLSA), TTL, wildcards, etags
- dns-alias.md — Alias records: dynamic Azure resource references, dangling DNS prevention, zone apex
- dns-reverse-dns-overview.md — Reverse DNS, ARPA zones, PTR records
- private-dns-scenarios.md — Single VNet, cross-VNet, split-horizon
- private-dns-privatednszone.md — Private zone overview
- private-dns-autoregistration.md — VM autoregistration in private zones
- private-dns-virtual-network-links.md — VNet links with/without autoregistration
- private-dns-resiliency.md — Global resource, region independence
- private-resolver-endpoints-rulesets.md — Inbound/outbound endpoints, forwarding rulesets, rule processing
- dns-private-resolver-reliability.md — Resolver HA and zone redundancy
- dnssec.md — DNSSEC overview: signing, validation, chain of trust, key rollover
- dns-security-policy.md — DNS security policy, threat intelligence, domain lists, traffic rules

### How-To (22)
- Quickstarts for Public DNS (portal, CLI, PS, Bicep, ARM, Terraform)
- Quickstarts for Private DNS (portal, CLI, PS, Terraform)
- Quickstarts for Private Resolver (portal, PS, Bicep, ARM, Terraform)
- Zone/record management (CLI, portal, PS)
- Import/export zone files
- DNSSEC sign/unsign
- DNS security policy configuration
- Reverse DNS hosting and Azure service configuration
- Private resolver hybrid resolution setup
- Private DNS Resource Graph queries
- Private DNS fallback to internet

### Tutorials (7)
- Host domain in Azure DNS
- Alias records (public IP, zone record, Traffic Manager apex)
- DNS failover with private resolvers
- Custom DNS records for web apps
- Child DNS zones

### Troubleshooting (1)
- dns-troubleshoot.md — Zone creation, record creation, resolution failures

### Other (1)
- Monitor Azure DNS (metrics reference)

## Wiki Pages Created from These Sources

- [[entities/azure-dns]] — top-level service entity (3 sub-services)
- [[entities/azure-public-dns]] — public DNS hosting
- [[entities/azure-private-dns]] — private DNS zones, autoregistration, VNet links
- [[entities/azure-dns-private-resolver]] — hybrid resolution, endpoints, rulesets
- [[concepts/dns-zones-and-records]] — record types, TTL, wildcards, etags
- [[concepts/dns-alias-records]] — dynamic resource references, zone apex
- [[concepts/dnssec]] — zone signing, chain of trust, Azure support
- [[concepts/dns-security-policy]] — query filtering, threat intelligence
- [[concepts/reverse-dns]] — PTR records, ARPA zones
- [[patterns/dns-hybrid-resolution]] — on-prem↔Azure resolution patterns
