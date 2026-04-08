---
title: ExpressRoute Peering and Circuits
created: 2026-04-07
updated: 2026-04-07
sources:
  - expressroute/expressroute-circuit-peerings.md
  - expressroute/expressroute-introduction.md
tags:
  - networking-concept
  - expressroute
  - hybrid-connectivity
---

# ExpressRoute Peering and Circuits

An ExpressRoute **circuit** is the logical connection between on-premises and Microsoft through a connectivity provider. A circuit has two redundant connections (primary/secondary) for HA. Each circuit supports two **peering** types. (source: expressroute-circuit-peerings.md)

## Peering Types

| Peering | Purpose | What you reach | Address space |
|---------|---------|----------------|---------------|
| **Azure Private** | Connect to VNets | VMs, internal LBs, private endpoints | Private IPs (10.x, 172.x, 192.168.x) |
| **Microsoft** | Connect to M365, Azure PaaS | M365, Dynamics, Azure PaaS public endpoints | Public IPs (Microsoft-owned) |

(source: expressroute-circuit-peerings.md)

## Circuit SKUs

| SKU | Scope | Use case |
|-----|-------|----------|
| **Local** | Same metro as peering location only | Cost-optimized, no egress charges |
| **Standard** | Same geopolitical region | Most common |
| **Premium** | All regions globally | Cross-geo connectivity |

(source: expressroute-introduction.md)

## ExpressRoute Direct

Direct fiber connection to Microsoft peering locations. 10 Gbps or 100 Gbps port pairs. Supports MACsec encryption on the physical ports. (source: expressroute-introduction.md)

## ExpressRoute Global Reach

Connect on-premises sites to each other through the Microsoft backbone (site A ↔ Microsoft ↔ site B), without sending traffic over the public internet. (source: expressroute-introduction.md)

## Links

- [[entities/azure-expressroute]]
- [[entities/azure-vpn-gateway]] — S2S VPN as backup/complement
- [[comparisons/vpn-gateway-vs-expressroute]]
