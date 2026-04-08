---
title: User-Defined Routes (UDRs)
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-network/virtual-networks-udr-overview.md
tags:
  - networking-concept
  - routing
  - virtual-network
---

# User-Defined Routes (UDRs)

Custom static routes that override Azure's default system routes. Created in route tables and associated with subnets. (source: virtual-networks-udr-overview.md)

## How Routing Works in Azure

Azure automatically creates **system routes** for each subnet: VNet address space, internet, and peered VNets. UDRs override these defaults when you need traffic to flow through an NVA, VPN gateway, or other path. (source: virtual-networks-udr-overview.md)

## Next Hop Types

| Next hop | Use case |
|----------|----------|
| **Virtual appliance** | Route through an NVA (firewall, proxy). Specify the NVA's private IP. NVA must have **IP forwarding enabled**. |
| **Virtual network gateway** | Route to a VPN gateway (not ExpressRoute). |
| **Virtual network** | Override default routing within the VNet. |
| **Internet** | Route directly to internet. |
| **None** | Drop (blackhole) the traffic. |

(source: virtual-networks-udr-overview.md)

## Route Selection

When multiple routes match, Azure selects by: (source: virtual-networks-udr-overview.md)
1. **Longest prefix match** — most specific route wins
2. If same prefix: UDR > BGP > system route
3. If same prefix and source: lower-priority system routes lose

## Key Design Rules

- **Deploy NVA in a different subnet** than the resources routing through it — same-subnet NVA + UDR creates routing loops (source: virtual-networks-udr-overview.md)
- Next hop IP must have **direct connectivity** — can't route through ExpressRoute gateway or vWAN (source: virtual-networks-udr-overview.md)
- The 0.0.0.0/0 route overrides Azure's default internet route — commonly used for forced tunneling through NVA/Firewall (source: virtual-networks-udr-overview.md)
- Max 400 routes per table (1,000 with Azure Virtual Network Manager) (source: virtual-networks-udr-overview.md)

## BGP Routes

Exchanged between on-premises and Azure via VPN Gateway or ExpressRoute. BGP routes can be overridden by UDRs. (source: virtual-networks-udr-overview.md)

## Service Tags in UDRs

You can use service tags (e.g., `Storage`, `Sql`) as the address prefix in UDRs. Azure automatically resolves the tag to its current IP prefixes. (source: virtual-networks-udr-overview.md)

## Links

- [[entities/azure-virtual-network]]
- [[concepts/network-security-groups]]
- [[patterns/nat-gateway-hub-spoke]] — UDRs used to route spoke traffic through hub NVA/Firewall
