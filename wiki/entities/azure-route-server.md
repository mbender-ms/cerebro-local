---
title: Azure Route Server
created: 2026-04-07
updated: 2026-04-07
sources:
  - route-server/overview.md
tags:
  - azure-service
  - networking
  - routing
  - bgp
---

# Azure Route Server

Fully managed service that simplifies dynamic routing between NVAs and Azure VNets via BGP. Eliminates manual route table configuration. NVAs peer with Route Server over BGP to automatically exchange routes with the Azure SDN. (source: overview.md)

## Key Capabilities

- **BGP peering** — NVAs establish BGP sessions with Route Server (supports multi-hop)
- **Automatic route propagation** — routes learned from NVAs propagated to all VMs in VNet
- **Multi-NVA support** — multiple NVAs peer with same Route Server for HA
- **Hub-and-spoke integration** — centralize routing in hub VNet
- **ExpressRoute + VPN coexistence** — enable transit between ExpressRoute and VPN connections
- **Dual-homed networks** — spoke VNets connect to multiple hubs for redundancy

(source: overview.md)

## How It Works

1. NVA establishes BGP peer with Route Server (ASN 65515)
2. NVA advertises its routes to Route Server
3. Route Server programs routes into the Azure SDN (effective on all VMs in the VNet)
4. Routes from Azure (VNet, peered VNets, on-premises via gateways) advertised back to NVA

## Key Behavior

Route Server becomes the VNet's gateway for route selection purposes. When Route Server is deployed alongside VPN Gateway and ExpressRoute Gateway, Route Server takes precedence. (source: overview.md)

## Links

- [[concepts/user-defined-routes]] — static alternative to dynamic BGP routing
- [[entities/azure-virtual-network]]
- [[sources/route-server-docs]]
