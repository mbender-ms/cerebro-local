---
title: VNet Peering
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-network/virtual-network-peering-overview.md
tags:
  - networking-concept
  - connectivity
  - virtual-network
---

# VNet Peering

Connects two Azure virtual networks so resources in either VNet can communicate directly. Traffic routes through the Microsoft backbone — not through a gateway, the public internet, or encryption overhead. (source: virtual-network-peering-overview.md)

## Types

| Type | Scope |
|------|-------|
| **Virtual network peering** | VNets in the same Azure region |
| **Global virtual network peering** | VNets in different Azure regions |

Both have the same backbone-speed latency as intra-VNet traffic (same region). (source: virtual-network-peering-overview.md)

## Key Behaviors

- **Non-transitive** — if A peers with B, and B peers with C, A cannot reach C unless A also peers with C (or uses gateway transit) (source: virtual-network-peering-overview.md)
- **NSGs still apply** — you can filter traffic between peered VNets using NSGs (source: virtual-network-peering-overview.md)
- **Address space resizing** — you can add/remove address ranges on a peered VNet without downtime; requires peer sync after (source: virtual-network-peering-overview.md)
- **No classic VNet support** for address space resizing (source: virtual-network-peering-overview.md)

## Gateway Transit

Enable **"Use remote virtual network's gateway"** on the spoke peering to share the hub's VPN/ExpressRoute gateway. This makes peering transitive for on-premises routes. (source: virtual-network-peering-overview.md)

## Service Chaining

Combine peering with UDRs to create service chains: spoke → hub NVA → destination. UDRs on the spoke subnet point to the NVA's private IP in the hub. (source: virtual-network-peering-overview.md)

## Constraints

- Address spaces of peered VNets **cannot overlap**
- Max 500 peerings per VNet
- Cannot peer VNets created through different deployment models in some scenarios

(source: virtual-network-peering-overview.md)

## Links

- [[entities/azure-virtual-network]]
- [[concepts/user-defined-routes]] — for service chaining through peered hubs
- [[patterns/nat-gateway-hub-spoke]] — peering used in hub-spoke topologies
