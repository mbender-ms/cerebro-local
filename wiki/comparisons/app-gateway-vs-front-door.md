---
title: Application Gateway vs Front Door
created: 2026-04-07
updated: 2026-04-07
sources:
  - application-gateway/overview.md
  - frontdoor/front-door-overview.md
tags:
  - comparison
  - load-balancing
  - layer-7
---

# Application Gateway vs Front Door

Both are L7 load balancers with WAF support. Key difference: scope (regional vs global).

## Comparison

| Dimension | Application Gateway | Front Door |
|-----------|-------------------|------------|
| **Scope** | Regional (single Azure region) | Global (118+ edge POPs) |
| **Deployment** | In your VNet | Microsoft-managed edge |
| **CDN/Caching** | ❌ | ✅ |
| **SSL offload** | ✅ | ✅ |
| **URL routing** | ✅ | ✅ |
| **WAF** | ✅ (App Gateway WAF) | ✅ (Front Door WAF) |
| **Multi-site hosting** | ✅ | ✅ |
| **Session affinity** | ✅ (cookie) | ✅ (cookie) |
| **WebSocket** | ✅ | ✅ |
| **HTTP/2** | ✅ | ✅ |
| **Private backends** | ✅ (VNet-native) | ✅ (Premium, Private Link) |
| **TCP/TLS proxy** | ✅ | ❌ (HTTP only) |
| **AKS Ingress** | ✅ (AGIC) | ❌ |
| **Autoscale** | ✅ (v2) | ✅ (auto) |
| **Zone redundancy** | ✅ (v2) | ✅ (global) |

## When to Use Each

- **Application Gateway**: Regional web apps; backends are in one region; need VNet-native integration; need TCP/TLS proxy; AKS ingress controller
- **Front Door**: Multi-region apps; need global load balancing; need CDN/caching; need edge WAF; latency-sensitive global users
- **Both together**: Front Door at the global edge → Application Gateway in each region for local L7 processing

## Links

- [[entities/azure-application-gateway]]
- [[entities/azure-front-door]]
- [[entities/azure-waf]]
- [[comparisons/load-balancing-options]]
