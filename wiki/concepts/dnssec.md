---
title: DNSSEC
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/dnssec.md
  - dns/dnssec-how-to.md
  - dns/dnssec-unsign.md
tags:
  - networking-concept
  - dns
  - security
---

# DNSSEC

DNS Security Extensions — a suite of extensions that add cryptographic validation to DNS responses. Prevents DNS spoofing attacks by enabling resolvers to verify response authenticity and data integrity. (source: dnssec.md)

## How It Works

- Zone owner **signs** the zone with cryptographic keys
- Each DNS response includes digital signatures (RRSIG records)
- Resolving nameservers verify signatures using a **chain of trust** from the root DNS zone
- If verification fails, the response is rejected as potentially spoofed

(source: dnssec.md)

## Key Record Types

| Record | Purpose |
|--------|---------|
| **DNSKEY** | Public key used to verify signatures |
| **RRSIG** | Digital signature over a record set |
| **DS** | Delegation signer — links parent zone to child zone's key |
| **NSEC/NSEC3** | Authenticated denial of existence (proves a name doesn't exist) |

(source: dnssec.md)

## Azure DNS Support

- Supported for **public DNS zones only** (source: public-dns-overview.md)
- Sign a zone: creates DNSKEY and DS records, signs all record sets (source: dnssec-how-to.md)
- Unsign a zone: removes all DNSSEC records (source: dnssec-unsign.md)
- Key rollover managed by Azure (source: dnssec.md)
- Zone signing algorithm: ECDSAP256SHA256 (source: dnssec.md)

## Core RFCs

RFC 4033 (intro), RFC 4034 (records), RFC 4035 (protocol), RFC 9824 (compact denial) (source: dnssec.md)

## Links

- [[entities/azure-public-dns]]
- [[concepts/dns-zones-and-records]]
- [[concepts/dns-security-policy]]
