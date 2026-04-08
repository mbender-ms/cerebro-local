---
title: Azure Firewall vs NSG
created: 2026-04-07
updated: 2026-04-07
sources:
  - firewall/overview.md
  - virtual-network/network-security-groups-overview.md
tags:
  - comparison
  - firewall
  - nsg
  - security
---

# Azure Firewall vs NSG

Both filter network traffic but at different layers and scopes. They are complementary, not substitutes.

## Comparison

| Dimension | Azure Firewall | NSG |
|-----------|---------------|-----|
| **Layer** | L3-L7 (network + application) | L3-L4 (network) |
| **Scope** | Centralized (subnet/VNet level, often in hub) | Distributed (per-subnet or per-NIC) |
| **FQDN filtering** | ✅ (by domain name) | ❌ (IP/port only) |
| **TLS inspection** | ✅ (Premium) | ❌ |
| **Threat intelligence** | ✅ (Microsoft feed) | ❌ |
| **URL filtering** | ✅ | ❌ |
| **IDPS** | ✅ (Premium) | ❌ |
| **NAT (DNAT/SNAT)** | ✅ | ❌ |
| **Logging** | Rich (diagnostics, Sentinel) | Flow logs (via Network Watcher) |
| **Stateful** | ✅ | ✅ |
| **Cost** | Paid (per hour + per GB) | Free |
| **Management** | Firewall Manager policies | NSG rules (per resource) |

## When to Use Each

- **NSG**: Always. Apply to every subnet/NIC as baseline defense-in-depth.
- **Firewall**: When you need centralized inspection, FQDN/URL control, threat intelligence, NAT, or TLS inspection. Typically in a hub VNet.

**Best practice**: Use both. NSGs at the subnet level for micro-segmentation + Azure Firewall in the hub for centralized north-south and east-west inspection.

## Links

- [[entities/azure-firewall]]
- [[concepts/network-security-groups]]
- [[comparisons/firewall-sku-comparison]]
