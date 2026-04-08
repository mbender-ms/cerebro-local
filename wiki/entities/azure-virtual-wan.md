---
title: Azure Virtual WAN
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-wan/virtual-wan-about.md
tags:
  - azure-service
  - networking
  - wan
  - hybrid-connectivity
  - hub-spoke
---

# Azure Virtual WAN

Networking service that unifies site-to-site VPN, point-to-site VPN, ExpressRoute, VNet connectivity, and security into a single operational interface. Microsoft-managed hub-and-spoke architecture. (source: virtual-wan-about.md)

## Architecture

Virtual WAN provides hub-and-spoke topology with **Microsoft-managed virtual hubs**. You connect branches (VPN/ER), users (P2S), and VNets to hubs. Hubs provide transit connectivity between all attached resources. (source: virtual-wan-about.md)

## Connectivity Types

| Type | Description |
|------|-------------|
| **Site-to-site VPN** | IPsec/IKEv2; partner device automation available |
| **Point-to-site VPN** | IPsec/IKEv2 or OpenVPN; user VPN for remote workers |
| **ExpressRoute** | Private connectivity from on-premises |
| **Hub-to-VNet** | Connect VNets to hubs |
| **VNet-to-VNet transit** | Any-to-any connectivity through hub router |
| **ExpressRoute encryption** | VPN over ExpressRoute for encrypted private transit |

(source: virtual-wan-about.md)

## Types

| Feature | Basic | Standard |
|---------|-------|----------|
| Site-to-site VPN | ✅ | ✅ |
| Point-to-site VPN | ❌ | ✅ |
| ExpressRoute | ❌ | ✅ |
| VNet-to-VNet transit | ❌ | ✅ |
| Multi-hub transit | ❌ | ✅ |
| Azure Firewall in hub | ❌ | ✅ |
| NVA in hub | ❌ | ✅ |

## Key Features

- **Routing** — hub router handles all routing automatically; custom route tables for segmentation
- **Route-maps** — manipulate BGP attributes (AS-path prepend, community tags, route summarization)
- **Secured virtual hub** — integrate Azure Firewall or third-party NVA directly in the hub
- **SD-WAN integration** — partner automation for branch device provisioning
- **User groups** — assign different P2S address pools based on user identity

(source: virtual-wan-about.md)

## Links

- [[entities/azure-vpn-gateway]] — standalone VPN (compare)
- [[entities/azure-expressroute]] — private connectivity into hubs
- [[entities/azure-firewall-manager]] — secured hub management
- [[sources/virtual-wan-docs]]
