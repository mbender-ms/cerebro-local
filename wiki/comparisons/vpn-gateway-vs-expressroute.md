---
title: VPN Gateway vs ExpressRoute
created: 2026-04-07
updated: 2026-04-07
sources:
  - vpn-gateway/vpn-gateway-about-vpngateways.md
  - vpn-gateway/design.md
  - expressroute/expressroute-introduction.md
tags:
  - comparison
  - hybrid-connectivity
  - vpn
  - expressroute
---

# VPN Gateway vs ExpressRoute

Two primary methods for connecting on-premises to Azure. Can be used together (coexistence).

## Comparison

| Dimension | VPN Gateway | ExpressRoute |
|-----------|-------------|-------------|
| **Connection type** | Encrypted tunnel over public internet | Private connection via provider |
| **Bandwidth** | Up to 10 Gbps (VpnGw5) | 50 Mbps – 100 Gbps (Direct) |
| **Latency** | Variable (internet-dependent) | Consistent, low latency |
| **Reliability** | Internet-dependent | Built-in redundancy, 99.95% SLA |
| **Encryption** | IPsec/IKE (always encrypted) | Not encrypted by default (MACsec on Direct, VPN overlay optional) |
| **Setup time** | Minutes | Weeks (provider provisioning) |
| **Cost** | Lower (gateway + egress) | Higher (circuit + provider + gateway) |
| **M365 access** | No | Yes (Microsoft peering) |
| **Zone redundancy** | AZ-suffixed SKUs | Supported |
| **Active-active** | Yes (two tunnels) | Yes (two connections, primary/secondary) |

## When to Use Each

### Choose VPN Gateway when:
- Budget-constrained; lower bandwidth is acceptable
- Quick setup needed (no provider provisioning)
- Internet-based encryption is acceptable
- Connecting a few sites or remote users (P2S)

### Choose ExpressRoute when:
- Need consistent, predictable latency
- High bandwidth requirements (>1 Gbps)
- Regulatory requirement for private (non-internet) connectivity
- Need M365 connectivity over private connection
- Mission-critical workloads requiring SLA

### Use both (coexistence) when:
- ExpressRoute is primary; S2S VPN is failover/backup
- Different traffic classes use different paths

(source: design.md, expressroute-introduction.md)

## Links

- [[entities/azure-vpn-gateway]]
- [[entities/azure-expressroute]]
- [[concepts/expressroute-peering]]
- [[entities/azure-virtual-wan]] — managed hub with both
