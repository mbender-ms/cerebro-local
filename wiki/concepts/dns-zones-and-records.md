---
title: DNS Zones and Records
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/dns-zones-records.md
  - dns/private-dns-privatednszone.md
tags:
  - networking-concept
  - dns
---

# DNS Zones and Records

Foundational concepts for Azure DNS — how zones and records are structured. (source: dns-zones-records.md)

## DNS Zones

A DNS zone hosts the DNS records for a domain. A zone name must be unique within a resource group, and the zone must not already exist in the resource group. Zones can share a name across different resource groups or subscriptions. (source: dns-zones-records.md)

**Public zone** → globally resolvable via internet
**Private zone** → resolvable only from linked virtual networks

## Record Types

| Type | Purpose | Notes |
|------|---------|-------|
| **A** | Maps name → IPv4 address | Most common |
| **AAAA** | Maps name → IPv6 address | |
| **CNAME** | Canonical name alias | Cannot coexist with other record types at same name; cannot be at zone apex |
| **MX** | Mail exchange | |
| **NS** | Name server delegation | Auto-created at zone apex |
| **PTR** | Reverse DNS lookup | Maps IP → name (in ARPA zones) |
| **SOA** | Start of authority | One per zone, auto-managed |
| **SRV** | Service location | `_service._protocol.name` |
| **TXT** | Text data | SPF records, verification strings |
| **CAA** | Certificate authority authorization | Controls which CAs can issue certs |
| **DS** | Delegation signer | Used with [[concepts/dnssec]] |
| **TLSA** | TLS authentication | Certificate pinning via DNS |

(source: dns-zones-records.md)

## Key Behaviors

- **TTL** — Time-to-live controls caching duration (applies to entire record set) (source: dns-zones-records.md)
- **Wildcard records** — `*.contoso.com` matches any name; supported for all types except NS and SOA (source: dns-zones-records.md)
- **Etags** — concurrency protection; prevents simultaneous overwrites (source: dns-zones-records.md)
- **Tags and metadata** — Azure tags for billing/grouping; metadata for per-record-set annotations (source: dns-zones-records.md)

## Links

- [[entities/azure-dns]]
- [[entities/azure-public-dns]]
- [[entities/azure-private-dns]]
- [[concepts/dns-alias-records]]
- [[concepts/reverse-dns]]
