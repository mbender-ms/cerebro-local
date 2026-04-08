---
title: Azure Load Balancer
created: 2026-04-07
updated: 2026-04-07
sources:
  - load-balancer/load-balancer-overview.md
  - load-balancer/cross-region-overview.md
  - load-balancer/gateway-overview.md
tags:
  - azure-service
  - networking
  - load-balancing
  - layer-4
---

# Azure Load Balancer

Layer 4 (TCP/UDP) load balancer. Distributes inbound flows from frontend to backend pool instances based on configured rules and health probes. (source: load-balancer-overview.md)

## Types

| Type | Use case |
|------|----------|
| **Public LB** | Load balance internet traffic to VMs; provides outbound connectivity for VMs (SNAT) |
| **Internal LB** | Load balance private traffic within VNets; on-premises access via VPN/ExpressRoute |
| **Gateway LB** | Chain NVAs (firewalls, analytics) transparently into traffic path |
| **Cross-region LB** | Global L4 load balancing across Azure regions; ultra-low latency failover |

(source: load-balancer-overview.md, cross-region-overview.md, gateway-overview.md)

## SKUs

| Feature | Basic | Standard | Gateway |
|---------|-------|----------|---------|
| Backend pool size | 300 | 5,000 | — |
| Health probes | TCP, HTTP | TCP, HTTP, HTTPS | TCP, HTTP, HTTPS |
| Availability zones | ❌ | ✅ (zone-redundant/zonal) | ✅ |
| HA ports | ❌ | ✅ | ✅ |
| Outbound rules (SNAT) | ❌ | ✅ | — |
| SLA | None | 99.99% | 99.99% |

> **Basic LB is being retired.** Upgrade to Standard. (source: load-balancer-overview.md)

## Key Features

- **Health probes** — TCP, HTTP, HTTPS; configurable interval and threshold (source: load-balancer-overview.md)
- **HA ports** — load balance all ports simultaneously (for NVA scenarios) (source: load-balancer-overview.md)
- **Admin state** — drain/undrain individual backend instances without removing them (source: load-balancer-overview.md)
- **Multiple frontends** — multiple public IPs on one LB (source: load-balancer-overview.md)
- **Outbound rules** — configure SNAT for backend pool (but [[entities/azure-nat-gateway]] is preferred) (source: load-balancer-overview.md)

## Links

- [[entities/azure-application-gateway]] — L7 load balancing (compare)
- [[entities/azure-nat-gateway]] — preferred for outbound SNAT
- [[patterns/nat-gateway-with-load-balancer]] — integration patterns
- [[sources/load-balancer-docs]]
- [[comparisons/load-balancing-options]]
- [[concepts/load-balancer-components]]
- [[concepts/troubleshooting-aks]]
- [[concepts/vm-availability]]
