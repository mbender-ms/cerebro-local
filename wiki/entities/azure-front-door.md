---
title: Azure Front Door
created: 2026-04-07
updated: 2026-04-07
sources:
  - frontdoor/front-door-overview.md
tags:
  - azure-service
  - networking
  - cdn
  - load-balancing
  - global
  - layer-7
---

# Azure Front Door

Global L7 load balancer and CDN. Delivers fast, reliable, secure access to web applications using Microsoft's global edge network (118+ edge locations, 100+ metro cities). Combines CDN, load balancing, WAF, and acceleration in one service. (source: front-door-overview.md)

## Key Capabilities

- **Global anycast load balancing** — route users to fastest/healthiest backend
- **CDN caching** — cache static content at edge
- **SSL offload** — terminate TLS at edge with integrated cert management
- **WAF integration** — [[entities/azure-waf]] at the edge for L7 protection
- **URL-based routing** — path-based and multi-site routing
- **Session affinity** — cookie-based stickiness
- **HTTP/2 and IPv6** — native support
- **Split TCP** — reduces connection latency via edge-to-origin optimization
- **Private Link origins** — connect to backends via Private Link

(source: front-door-overview.md)

## Tiers

| Feature | Standard | Premium |
|---------|----------|---------|
| CDN + routing | ✅ | ✅ |
| Custom domains + SSL | ✅ | ✅ |
| WAF | ✅ (custom rules) | ✅ (managed + bot rules) |
| Private Link origins | ❌ | ✅ |
| Advanced analytics | ❌ | ✅ |

## Links

- [[entities/azure-waf]] — WAF at the edge
- [[entities/azure-application-gateway]] — regional L7 LB (compare)
- [[entities/azure-cdn]] — being replaced by Front Door
- [[sources/frontdoor-docs]]
