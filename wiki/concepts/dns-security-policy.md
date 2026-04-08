---
title: DNS Security Policy
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/dns-security-policy.md
  - dns/dns-security-policy-how-to.md
tags:
  - networking-concept
  - dns
  - security
---

# DNS Security Policy

Filter, log, and control DNS queries at the virtual network level. Applies to both public and private DNS traffic within a VNet. (source: dns-security-policy.md)

## Capabilities

- **Allow, alert, or block** DNS queries based on domain lists (source: dns-security-policy.md)
- **DNS logging** — send logs to storage account, Log Analytics, or Event Hubs (source: dns-security-policy.md)
- **Threat Intelligence feed** — Microsoft-managed list of known malicious domains (MSRC-sourced), automatically updated (source: dns-security-policy.md)

## Components

| Component | Description |
|-----------|-------------|
| **DNS traffic rules** | Priority-ordered rules that allow, block, or alert based on domain lists |
| **Virtual network links** | Associates policy with a VNet |
| **DNS domain lists** | Region-scoped lists of domains to match against |
| **Threat Intelligence feed** | Managed domain list from Microsoft Security Response Center |

(source: dns-security-policy.md)

## Use Cases

- Block resolution of known malicious domains (source: dns-security-policy.md)
- Log all DNS traffic for compliance/forensics (source: dns-security-policy.md)
- Detect DNS-based attacks early (almost all attacks begin with a DNS query) (source: dns-security-policy.md)

## Links

- [[entities/azure-dns]]
- [[concepts/dnssec]]
- [[entities/azure-dns-private-resolver]]
