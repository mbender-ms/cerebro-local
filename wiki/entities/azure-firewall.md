---
title: Azure Firewall
created: 2026-04-07
updated: 2026-04-07
sources:
  - firewall/overview.md
  - firewall/choose-firewall-sku.md
tags:
  - azure-service
  - networking
  - security
  - firewall
---

# Azure Firewall

Cloud-native, intelligent network firewall security service. Fully stateful firewall-as-a-service with built-in HA and unlimited cloud scalability. Inspects both east-west (within Azure) and north-south (to/from internet) traffic. (source: overview.md)

## SKUs

| Feature | Basic | Standard | Premium |
|---------|-------|----------|---------|
| Target | SMB/small workloads | Enterprise | High-security/regulated |
| Threat intelligence | Alert only | Alert & deny | Alert & deny |
| FQDN filtering | ✅ | ✅ | ✅ |
| Network/application rules | ✅ | ✅ | ✅ |
| TLS inspection | ❌ | ❌ | ✅ |
| IDPS | ❌ | ❌ | ✅ (signature-based) |
| URL filtering | ❌ | ✅ | ✅ (with categories) |
| Web categories | ❌ | ✅ | ✅ |
| DNS proxy | ❌ | ✅ | ✅ |
| Explicit proxy | ❌ | ❌ | ✅ |

(source: overview.md, choose-firewall-sku.md)

## Key Capabilities

- **DNAT/SNAT** — destination and source NAT for inbound/outbound traffic
- **Threat intelligence** — Microsoft-feed of known malicious IPs/FQDNs
- **FQDN filtering** — filter by fully qualified domain name in network and application rules
- **FQDN tags** — predefined groups (e.g., WindowsUpdate, AzureBackup)
- **DNS proxy** — custom DNS and FQDN resolution in network rules
- **Managed via [[entities/azure-firewall-manager]]** — central policy management

## Integration with NAT Gateway

Attach [[entities/azure-nat-gateway]] to the AzureFirewallSubnet for deterministic outbound IPs and SNAT port scaling beyond Firewall's built-in limit. NAT Gateway takes priority for outbound SNAT. (source: overview.md)

## Links

- [[entities/azure-firewall-manager]] — central policy and route management
- [[entities/azure-waf]] — L7 web application protection (complementary)
- [[patterns/nat-gateway-hub-spoke]] — Firewall + NAT Gateway patterns
- [[sources/firewall-docs]]
- [[comparisons/firewall-sku-comparison]]
- [[comparisons/firewall-vs-nsg]]
- [[comparisons/security-services]]
