---
title: Azure VPN Gateway
created: 2026-04-07
updated: 2026-04-07
sources:
  - vpn-gateway/vpn-gateway-about-vpngateways.md
  - vpn-gateway/design.md
  - vpn-gateway/point-to-site-about.md
tags:
  - azure-service
  - networking
  - hybrid-connectivity
  - vpn
  - encryption
---

# Azure VPN Gateway

Sends encrypted traffic between Azure VNets and on-premises locations over the public internet. Also encrypts traffic between Azure VNets over the Microsoft backbone. Uses IPsec/IKE tunnels. (source: vpn-gateway-about-vpngateways.md)

## Connection Types

| Type | Description |
|------|-------------|
| **Site-to-site (S2S)** | IPsec/IKE tunnel between on-premises VPN device and Azure. Always-on. |
| **Point-to-site (P2S)** | Individual client computer to Azure. OpenVPN, IKEv2, or SSTP. |
| **VNet-to-VNet** | IPsec tunnel between two Azure VNets (even cross-region). |

(source: design.md)

## P2S Authentication Methods

- Azure certificate authentication
- Microsoft Entra ID (OpenVPN only)
- RADIUS server

(source: point-to-site-about.md)

## Gateway SKUs

Generation 1: Basic, VpnGw1-3 (up to 1.25 Gbps)
Generation 2: VpnGw2-5 (up to 10 Gbps), VpnGw2AZ-5AZ (zone-redundant)

Active-active mode supported for HA — two gateway instances, two tunnels. (source: vpn-gateway-about-vpngateways.md)

## Key Features

- **BGP support** — dynamic routing with on-premises (source: vpn-gateway-about-vpngateways.md)
- **NAT** — translate overlapping address spaces between sites (source: vpn-gateway-about-vpngateways.md)
- **Custom IPsec/IKE policies** — configure encryption, DH groups, PFS (source: vpn-gateway-about-vpngateways.md)
- **Zone-redundant** — AZ-suffixed SKUs span availability zones (source: vpn-gateway-about-vpngateways.md)
- **Coexistence with ExpressRoute** — S2S VPN as backup for ExpressRoute (source: design.md)

## Links

- [[entities/azure-expressroute]] — private alternative (no public internet)
- [[entities/azure-virtual-wan]] — managed hub-level VPN
- [[entities/azure-virtual-network]] — gateway deployed in GatewaySubnet
- [[sources/vpn-gateway-docs]]
