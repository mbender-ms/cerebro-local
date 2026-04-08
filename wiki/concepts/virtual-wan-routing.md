---
title: Virtual WAN Routing
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-wan/about-virtual-hub-routing.md
  - virtual-wan/virtual-wan-about.md
tags:
  - networking-concept
  - virtual-wan
  - routing
---

# Virtual WAN Routing

Virtual WAN hubs contain a Microsoft-managed router that handles all routing between branches, VNets, and users. The hub router enables transit connectivity automatically for Standard SKU. (source: about-virtual-hub-routing.md)

## Key Concepts

| Concept | Description |
|---------|-------------|
| **Hub route table** | Routing table within the virtual hub; contains routes from all connections |
| **Connection** | VPN/ER/VNet attachment to the hub; each has an associated route table |
| **Association** | Which route table a connection uses for route lookup |
| **Propagation** | Connections propagate their routes to one or more route tables |
| **Labels** | Group route tables for bulk propagation (e.g., "default" label) |
| **Static routes** | Manually configured routes on a connection (override learned routes) |

(source: about-virtual-hub-routing.md)

## Routing Intent and Policies

Simplified routing that replaces manual route table configuration:
- **Internet traffic policy** — route all internet-bound traffic through a security solution (Firewall/NVA)
- **Private traffic policy** — route all private (VNet/branch) traffic through a security solution

When enabled, the hub automatically creates the required routes. Replaces complex custom route table setups for secured hub scenarios. (source: about-virtual-hub-routing.md)

## Route-Maps

BGP attribute manipulation on the hub router:
- AS-path prepend (influence route preference)
- Community tagging (classify routes)
- Route summarization (aggregate prefixes)
- Drop routes (filter specific prefixes)

(source: virtual-wan-about.md)

## Links

- [[entities/azure-virtual-wan]]
- [[concepts/user-defined-routes]] — standalone VNet routing (compare)
- [[entities/azure-firewall-manager]] — secured hub policies
