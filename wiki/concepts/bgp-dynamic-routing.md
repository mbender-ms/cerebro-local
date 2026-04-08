---
title: BGP and Dynamic Routing in Azure
created: 2026-04-07
updated: 2026-04-07
sources:
  - route-server/*.md
  - vpn-gateway/vpn-gateway-bgp-overview.md
  - expressroute/*.md
tags:
  - networking
  - bgp
  - routing
  - nva
---

# BGP and Dynamic Routing in Azure

Border Gateway Protocol (BGP) is the standard for dynamic route exchange in Azure hybrid networking. Multiple Azure services use BGP for automated route management.

## BGP-Capable Azure Services

| Service | BGP Role | ASN |
|---------|----------|-----|
| **Azure Route Server** | Route reflector — exchanges routes between NVAs and Azure SDN | 65515 |
| **VPN Gateway** | Peers with on-prem VPN devices for dynamic route exchange | 65515 (configurable) |
| **ExpressRoute Gateway** | Learns routes from ExpressRoute circuits via MSEE routers | 65515 |
| **Virtual WAN Hub** | Built-in BGP routing for all connected VNets and branches | 65515 |

## Route Server vs Manual UDRs

| Aspect | Route Server (BGP) | Manual UDRs |
|--------|-------------------|-------------|
| Route updates | Automatic via BGP | Manual route table edits |
| Failover | Automatic (BGP convergence) | Manual or scripted |
| Scale | Handles thousands of routes | Each route table: 400 routes max |
| NVA support | Native — peer directly | Must point UDRs at NVA IP |
| Complexity | BGP configuration required | Simple but labor-intensive |

## Key BGP Concepts in Azure

- **ASN 65515** — reserved for Azure gateway services; cannot be used by NVAs
- **Route propagation** — VNet gateway routes auto-propagated to route tables (can be disabled)
- **AS path prepending** — NVAs can influence path selection by prepending ASN
- **Multi-hop** — Route Server supports eBGP multi-hop for peering across subnets
- **Route limits** — 10,000 routes per BGP peer on Route Server; 4,000 per ExpressRoute circuit

## Common Patterns

### NVA with Route Server (Hub-Spoke)
Hub VNet has Route Server + NVA. NVA advertises default route (0.0.0.0/0) to Route Server. Route Server programs all spoke VNets to route internet traffic through NVA.

### ExpressRoute + VPN Transit
Route Server enables transit between ExpressRoute and VPN gateways. Branch offices (VPN) can reach on-premises (ExpressRoute) through Azure hub.

### Dual-Homed Spoke
Spoke VNet peers with two hub VNets. Route Server in spoke learns routes from both hubs. Automatic failover if one hub goes down.

## Links

- [[entities/azure-route-server]] — primary BGP route reflector service
- [[entities/azure-vpn-gateway]] — BGP peering with on-premises
- [[entities/azure-expressroute]] — BGP route exchange via MSEE
- [[concepts/user-defined-routes]] — static alternative to BGP
- [[concepts/virtual-wan-routing]] — Virtual WAN's built-in BGP routing
