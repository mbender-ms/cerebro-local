---
title: Azure IP Services
created: 2026-04-07
updated: 2026-04-07
sources:
  - ip-services/ip-services-overview.md
  - ip-services/ipv6-overview.md
  - ip-services/routing-preference-overview.md
tags:
  - azure-service
  - networking
  - ip-addressing
---

# Azure IP Services

Collection of IP address services for Azure virtual networks. Covers public IPs, private IPs, prefixes, and routing preferences. (source: ip-services-overview.md)

## Components

| Component | Description |
|-----------|-------------|
| **Public IP addresses** | Internet-routable IPs assigned to Azure resources. Standard SKU (zone-redundant, static) and Basic SKU (dynamic, no zones). |
| **Public IP prefixes** | Contiguous range of public IPs for predictable outbound IP addresses. Assigned in blocks (/28 = 16 IPs, etc.). |
| **Private IP addresses** | VNet-internal IPs (10.x, 172.16.x, 192.168.x). Static or dynamic allocation via DHCP. |
| **Routing preference** | Choose traffic path: Microsoft global network (default, lower latency) or ISP transit network (lower cost). |
| **Routing preference unmetered** | Free data transfer for ExpressRoute-connected PaaS via Microsoft network. |

(source: ip-services-overview.md)

## IPv6 Support

Azure VNets support dual-stack (IPv4 + IPv6). IPv6 support across VMs, LB (Standard), NSGs, UDRs, VNet peering, and NAT Gateway (StandardV2). (source: ipv6-overview.md)

## Links

- [[entities/azure-virtual-network]] — IPs used within VNets
- [[entities/azure-nat-gateway]] — uses public IPs/prefixes for outbound SNAT
- [[sources/ip-services-docs]]
