---
title: DNS Alias Records
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/dns-alias.md
tags:
  - networking-concept
  - dns
  - alias
---

# DNS Alias Records

Alias records are qualifications on a DNS record set that dynamically reference Azure resources instead of static IP values. If the underlying resource IP changes, the alias record updates automatically during resolution — preventing dangling DNS records. (source: dns-alias.md)

## Supported Record Types

A, AAAA, CNAME (source: dns-alias.md)

## Alias Targets

| Target | Use case |
|--------|----------|
| **Public IP address** (Standard SKU) | Track VM or LB IP changes automatically |
| **Traffic Manager profile** | Zone apex routing (A/AAAA — bypasses CNAME limitation) |
| **Azure CDN endpoint** | Static website hosting at zone apex |
| **Azure Front Door endpoint** | Custom domain for Front Door |
| **Another record set in same zone** | Indirect aliasing |

(source: dns-alias.md)

## Key Benefit: Preventing Dangling DNS

Traditional DNS records become "dangling" when the target resource is deleted but the record isn't updated. Alias records are lifecycle-coupled — when the Azure resource is deleted, the alias becomes an empty record set rather than pointing to a stale IP. (source: dns-alias.md)

Limit: 50 alias record sets per resource. (source: dns-alias.md)

## Zone Apex Support

DNS protocol prevents CNAME at zone apex (`contoso.com`). Alias A/AAAA records solve this by pointing the apex directly to Traffic Manager, CDN, or Front Door. (source: dns-alias.md)

## Links

- [[entities/azure-public-dns]]
- [[concepts/dns-zones-and-records]]
- [[entities/azure-dns]]
