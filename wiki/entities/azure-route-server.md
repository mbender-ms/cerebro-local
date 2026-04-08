---
title: Azure Route Server
created: 2026-04-07
updated: 2026-04-07
sources:
  - route-server/*.md
tags:
  - networking
  - bgp
  - routing
  - nva
---

# Azure Route Server

Fully managed service that simplifies dynamic routing between network virtual appliances (NVAs) and Azure virtual networks using BGP. Eliminates manual route table configuration.

## How It Works

1. **BGP peering** — Route Server establishes BGP sessions with NVAs in the VNet
2. **Route learning** — NVAs advertise routes (e.g., on-premises prefixes from SD-WAN)
3. **Route propagation** — Route Server programs learned routes into Azure SDN
4. **Traffic direction** — VMs automatically use programmed routes
5. **Bidirectional** — Route Server advertises VNet prefixes back to NVAs

Acts as a BGP route reflector within the virtual network.

## Key Capabilities

- **Dynamic route exchange** with any BGP-capable NVA
- **No manual UDR management** — routes auto-programmed
- **Multiple NVA support** — active-active or active-passive
- **Built-in HA** — managed redundancy
- **Works with existing VNets** — no infrastructure changes needed

## Common Use Cases

| Scenario | Description |
|----------|-------------|
| **Hub-and-spoke** | Centralized routing in hub VNet, automatic spoke connectivity |
| **Dual-homed networks** | Spoke connected to multiple hubs for redundancy/failover |
| **Hybrid connectivity** | SD-WAN + ExpressRoute + VPN with intelligent path selection |
| **Network security** | Route traffic through firewall/IDS NVAs for inspection |
| **ExpressRoute + VPN transit** | Enable branch-to-branch via BGP |

## Dual-Homed Architecture

Spoke VNet connects to multiple hub VNets simultaneously. Each hub has NVAs/gateways. Route Server in spoke facilitates dynamic route exchange with all hubs.

Benefits: automatic failover, load distribution, flexible connectivity types, multi-region support.

## Integration with Gateways

- **ExpressRoute + VPN coexistence** — Route Server enables transit routing between them
- **Branch-to-branch** — Enable via `BranchToBranchTraffic` setting
- Route Server learns routes from both gateway types and NVAs, programs all into SDN

## Service Limits

| Resource | Limit |
|----------|-------|
| BGP peers | 8 per Route Server |
| Routes per BGP peer | 10,000 |
| Route Servers per VNet | 1 |
| VNets per Route Server | 1 |

## Links

- [[entities/azure-virtual-network]] — VNet where Route Server deploys
- [[entities/azure-expressroute]] — learns routes from ER gateway
- [[entities/azure-vpn-gateway]] — learns routes from VPN gateway
- [[concepts/user-defined-routes]] — Route Server eliminates need for manual UDRs
- [[concepts/virtual-wan-routing]] — Virtual WAN has built-in routing; Route Server is for custom hub-spoke
- [[comparisons/virtual-wan-vs-hub-spoke]] — when to use managed routing vs Route Server
