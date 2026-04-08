---
title: Reverse DNS
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/dns-reverse-dns-overview.md
  - dns/dns-reverse-dns-hosting.md
  - dns/dns-reverse-dns-for-azure-services.md
tags:
  - networking-concept
  - dns
  - reverse-lookup
---

# Reverse DNS

Maps IP addresses back to domain names (the opposite of forward DNS). Uses PTR records in special ARPA zones. (source: dns-reverse-dns-overview.md)

## How It Works

- Forward: `www.contoso.com` → `203.0.113.100` (A record in `contoso.com` zone)
- Reverse: `203.0.113.100` → `www.contoso.com` (PTR record in `113.0.203.in-addr.arpa` zone)
- IP octets are reversed in the ARPA zone name (source: dns-reverse-dns-overview.md)

| IP Range | ARPA Zone |
|----------|-----------|
| 203.0.0.0/8 | `203.in-addr.arpa` |
| 198.51.0.0/16 | `51.198.in-addr.arpa` |
| 192.0.2.0/24 | `2.0.192.in-addr.arpa` |

## Common Uses

- **Email spam prevention** — receiving mail servers verify sender's reverse DNS (source: dns-reverse-dns-overview.md)
- **Security auditing** — identify hosts by IP (source: dns-reverse-dns-overview.md)

## Azure Support

- **Azure Public DNS** — host reverse lookup zones (ARPA zones) for IP ranges you control (source: dns-reverse-dns-hosting.md)
- **Azure services** — configure reverse DNS for Azure public IPs (source: dns-reverse-dns-for-azure-services.md)
- **Azure Private DNS** — reverse lookup zones for private IP ranges (source: dns-reverse-dns-hosting-private.md)

## Links

- [[entities/azure-dns]]
- [[entities/azure-public-dns]]
- [[concepts/dns-zones-and-records]]
