---
title: Azure ExpressRoute
created: 2026-04-07
updated: 2026-04-07
sources:
  - expressroute/expressroute-introduction.md
  - expressroute/expressroute-erdirect-about.md
tags:
  - azure-service
  - networking
  - hybrid-connectivity
  - private-connection
---

# Azure ExpressRoute

Private connectivity from on-premises to Microsoft cloud (Azure, M365) via a connectivity provider. Does NOT traverse the public internet. Offers more reliability, faster speeds, consistent latencies, and higher security than internet connections. (source: expressroute-introduction.md)

## Key Benefits

- Private connection — no public internet traversal
- Higher reliability — built-in redundancy with active-active connections
- Faster speeds — 50 Mbps to 100 Gbps (ExpressRoute Direct)
- Consistent latencies — predictable performance
- Connectivity to Azure, Microsoft 365, Dynamics 365

(source: expressroute-introduction.md)

## Connectivity Models

| Model | Description |
|-------|-------------|
| **CloudExchange colocation** | L2/L3 connection at a colocation facility |
| **Point-to-point Ethernet** | Dedicated Ethernet link to Azure |
| **Any-to-any (IPVPN)** | Azure as another branch on your WAN |
| **ExpressRoute Direct** | Direct fiber to Microsoft peering locations (100 Gbps) |

(source: expressroute-introduction.md)

## Key Features

- **Private peering** — connect to VNets (private IPs)
- **Microsoft peering** — connect to M365, Dynamics, Azure PaaS (public IPs)
- **Global Reach** — connect on-premises sites to each other through Microsoft backbone
- **ExpressRoute Premium** — global connectivity across all regions
- **ExpressRoute Local** — cost-optimized for same-metro peering locations
- **Bandwidth options** — 50 Mbps to 10 Gbps (standard), up to 100 Gbps (Direct)

(source: expressroute-introduction.md)

## Links

- [[entities/azure-vpn-gateway]] — alternative for internet-based encrypted connectivity
- [[entities/azure-virtual-wan]] — hub-level ExpressRoute integration
- [[sources/expressroute-docs]]
- [[comparisons/hybrid-edge-options]]
- [[comparisons/virtual-wan-vs-hub-spoke]]
- [[comparisons/vpn-gateway-vs-expressroute]]
- [[concepts/expressroute-peering]]
