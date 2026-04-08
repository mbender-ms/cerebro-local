---
title: Azure Load Balancing Options
created: 2026-04-07
updated: 2026-04-07
sources:
  - load-balancer/load-balancer-overview.md
  - application-gateway/overview.md
  - frontdoor/front-door-overview.md
  - traffic-manager/traffic-manager-overview.md
tags:
  - comparison
  - load-balancing
---

# Azure Load Balancing Options

Azure offers four primary load balancing services. Choose based on traffic type (HTTP vs non-HTTP) and scope (global vs regional).

## Decision Matrix

| | **Global** | **Regional** |
|---|---|---|
| **HTTP(S) — Layer 7** | [[entities/azure-front-door]] | [[entities/azure-application-gateway]] |
| **Non-HTTP — Layer 4** | [[entities/azure-traffic-manager]] (DNS) | [[entities/azure-load-balancer]] |

## Comparison

| Feature | Front Door | App Gateway | Traffic Manager | Load Balancer |
|---------|-----------|-------------|----------------|---------------|
| **Layer** | 7 | 7 | DNS | 4 |
| **Scope** | Global | Regional | Global | Regional |
| **Protocols** | HTTP/S | HTTP/S, TCP/TLS | Any (DNS) | TCP, UDP |
| **Traffic inline** | Yes (proxy) | Yes (proxy) | No (DNS only) | Yes |
| **WAF** | ✅ | ✅ | ❌ | ❌ |
| **SSL offload** | ✅ | ✅ | ❌ | ❌ |
| **URL routing** | ✅ | ✅ | ❌ | ❌ |
| **Caching/CDN** | ✅ | ❌ | ❌ | ❌ |
| **Session affinity** | ✅ | ✅ | ❌ | ✅ (tuple hash) |
| **Health probes** | HTTP/S | HTTP/S/TCP | HTTP/S/TCP | HTTP/S/TCP |
| **Zone redundant** | Yes (global) | ✅ (v2) | Yes (DNS) | ✅ (Standard) |
| **Private backend** | ✅ (Premium, Private Link) | ✅ | ❌ | ✅ |

## Common Combinations

- **Front Door + App Gateway**: Global edge → regional L7 (WAF at both layers)
- **Front Door + Load Balancer**: Global edge → regional L4 backends
- **Traffic Manager + App Gateway**: DNS failover → regional L7
- **Traffic Manager + Load Balancer**: DNS failover → regional L4
- **App Gateway + Load Balancer**: L7 routing → L4 backend distribution

## Links

- [[entities/azure-front-door]]
- [[entities/azure-application-gateway]]
- [[entities/azure-traffic-manager]]
- [[entities/azure-load-balancer]]
