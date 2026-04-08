---
title: Azure Public DNS
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/public-dns-overview.md
  - dns/dns-zones-records.md
  - dns/dnssec.md
  - dns/dns-protect-zones-recordsets.md
tags:
  - azure-service
  - dns
  - public
---

# Azure Public DNS

Hosting service for public DNS domains using Azure's global anycast network of name servers. Manage DNS records with Azure credentials, APIs, and billing. (source: public-dns-overview.md)

**Note**: You cannot buy domain names through Azure DNS — use App Service Domains or a third-party registrar, then host the zone in Azure DNS. (source: public-dns-overview.md)

## Key Features

- **Anycast networking** — every query answered by closest DNS server for fast performance and high availability (source: public-dns-overview.md)
- **ARM integration** — RBAC, activity logs, resource locking (source: public-dns-overview.md)
- **[[concepts/dns-alias-records]]** — alias record sets that dynamically track Azure resource IPs (source: public-dns-overview.md)
- **[[concepts/dnssec]]** — zone signing for origin authenticity and data integrity (source: public-dns-overview.md)
- **Zone apex support** — alias records enable A/AAAA at zone apex pointing to Traffic Manager, CDN, Front Door (no CNAME limitation) (source: dns-alias.md)

## Record Types

A, AAAA, CNAME, MX, NS, PTR, SOA, SRV, TXT, CAA, DS, TLSA. Wildcard records supported (except NS and SOA). (source: dns-zones-records.md)

## Protection

- **Resource locks** — prevent accidental zone/record deletion (source: dns-protect-zones-recordsets.md)
- **RBAC** — granular permissions per zone (source: public-dns-overview.md)
- **Etags** — concurrent modification protection (source: dns-zones-records.md)

## Links

- [[entities/azure-dns]] — parent service
- [[concepts/dns-zones-and-records]]
- [[concepts/dnssec]]
- [[concepts/dns-alias-records]]
- [[concepts/reverse-dns]]
