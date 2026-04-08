---
title: Virtual WAN vs Hub-Spoke with VPN/ER Gateways
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-wan/virtual-wan-about.md
  - virtual-wan/migrate-from-hub-spoke-topology.md
  - vpn-gateway/design.md
tags:
  - comparison
  - virtual-wan
  - hub-spoke
  - architecture
---

# Virtual WAN vs Hub-Spoke with VPN/ER Gateways

Two approaches to hub-and-spoke networking in Azure: Microsoft-managed (Virtual WAN) vs self-managed (traditional hub VNet with gateways).

## Comparison

| Dimension | Virtual WAN | Traditional Hub-Spoke |
|-----------|------------|----------------------|
| **Hub management** | Microsoft-managed | You build and manage |
| **Transit routing** | Automatic (any-to-any) | Manual UDRs needed |
| **Scale** | Global, multi-hub | Per-hub, manual peering |
| **VPN + ER in one hub** | ✅ Built-in | ✅ (separate gateways) |
| **Firewall in hub** | ✅ (Secured hub) | ✅ (manual deployment) |
| **NVA in hub** | ✅ (select partners) | ✅ (any NVA) |
| **Routing control** | Route tables, intent, route-maps | Full UDR control |
| **SD-WAN integration** | ✅ (partner automation) | Manual |
| **P2S VPN** | ✅ (Standard tier) | ✅ |
| **Multi-hub mesh** | ✅ (automatic) | Manual peering + UDRs |
| **Custom routing** | Limited (route-maps) | Full flexibility |
| **Cost** | Hub hour + data + gateways | Gateway + infrastructure |

## When to Use Each

### Choose Virtual WAN when:
- Large-scale branch connectivity (100+ sites)
- Need automatic any-to-any transit between branches, VNets, users
- Want Microsoft to manage hub routing and HA
- SD-WAN partner integration needed
- Multiple hubs across regions

### Choose Traditional Hub-Spoke when:
- Need full routing control (complex UDR scenarios)
- Custom NVA requirements not supported in vWAN
- Simpler topology (few sites, one region)
- Cost-sensitive (no hub hour charge)
- Need features not yet in vWAN (some edge cases)

## Links

- [[entities/azure-virtual-wan]]
- [[entities/azure-vpn-gateway]]
- [[entities/azure-expressroute]]
- [[patterns/nat-gateway-hub-spoke]]
