---
title: VPN Gateway Connection Patterns
created: 2026-04-07
updated: 2026-04-07
sources:
  - vpn-gateway/design.md
  - vpn-gateway/vpn-gateway-about-vpngateways.md
  - vpn-gateway/vpn-gateway-highlyavailable.md
tags:
  - pattern
  - vpn-gateway
  - hybrid-connectivity
---

# VPN Gateway Connection Patterns

Common deployment patterns for [[entities/azure-vpn-gateway]]. (source: design.md)

## Pattern 1: Site-to-Site (S2S)

IPsec/IKE tunnel between on-premises VPN device and Azure VPN Gateway. Always-on. Supports multiple connections from one gateway (multi-site). Requires on-premises VPN device with public IP. (source: design.md)

## Pattern 2: Point-to-Site (P2S)

Individual client → Azure VNet. No VPN device needed. Protocols: OpenVPN (recommended), IKEv2, SSTP. Auth: certificates, Entra ID, RADIUS. Useful for remote workers. (source: design.md)

## Pattern 3: VNet-to-VNet

IPsec tunnel between two Azure VNets (even cross-region). Alternative to VNet peering when encryption is required. (source: design.md)

## Pattern 4: ExpressRoute + S2S Coexistence

ExpressRoute for primary private connectivity; S2S VPN as failover. Both terminate on the same VNet (separate GatewaySubnets not needed — one gateway each). (source: design.md)

## Pattern 5: Active-Active HA

Two gateway instances, each with its own public IP. Two tunnels to on-premises. If one instance fails, the other continues. Higher aggregate throughput than active-standby. (source: design.md)

## Links

- [[entities/azure-vpn-gateway]]
- [[comparisons/vpn-gateway-vs-expressroute]]
- [[entities/azure-virtual-wan]] — managed hub-level VPN alternative
