---
title: CDN vs Front Door
created: 2026-04-07
updated: 2026-04-07
sources:
  - cdn/*.md
  - frontdoor/*.md
tags:
  - networking
  - cdn
  - front-door
  - comparison
---

# CDN vs Front Door

Azure CDN (classic) is being consolidated into Azure Front Door. Understanding the migration path and feature differences.

## Comparison

| Feature | Azure CDN (classic) | Azure Front Door Standard | Azure Front Door Premium |
|---------|-------------------|--------------------------|------------------------|
| **Status** | Retiring Sept 2027 | Current | Current |
| **Content caching** | ✅ | ✅ | ✅ |
| **L7 load balancing** | Basic | ✅ (global) | ✅ (global) |
| **WAF** | Basic CRS | ✅ Standard WAF | ✅ Managed + custom rules |
| **Private Link origins** | ❌ | ❌ | ✅ |
| **Bot protection** | ❌ | ❌ | ✅ |
| **Custom rules** | Limited | ✅ | ✅ |
| **Real-time analytics** | Basic | ✅ | ✅ (enhanced) |
| **DDoS protection** | L3/L4 | L3/L4 + L7 | L3/L4 + L7 |
| **Protocol** | HTTP/HTTPS | HTTP/HTTPS, WebSocket | HTTP/HTTPS, WebSocket |
| **Custom domains** | ✅ | ✅ | ✅ |
| **Compression** | ✅ | ✅ | ✅ |
| **Geo-filtering** | ✅ | ✅ | ✅ |
| **Rules engine** | Limited | ✅ | ✅ |
| **Price** | Lower | Medium | Higher |

## Migration Path

All Azure CDN flavors → **Azure Front Door Standard/Premium**

| From | Timeline | Action |
|------|----------|--------|
| Azure CDN from Edgio | Retired Jan 2025 | Must have migrated |
| Azure CDN from Akamai | Retired | Must have migrated |
| Azure CDN Standard (classic) | Retiring Sept 2027 | Migrate to Front Door |

## When to Choose

| Need | Service |
|------|---------|
| Pure CDN (static content caching) | Front Door Standard |
| CDN + WAF + advanced routing | Front Door Premium |
| Private backend origins | Front Door Premium (Private Link) |
| Cost-sensitive static sites | Front Door Standard |
| Existing CDN classic profiles | Migrate to Front Door before Sept 2027 |

## Links

- [[entities/azure-cdn]] — CDN details and retirement timeline
- [[entities/azure-front-door]] — Front Door capabilities
- [[comparisons/app-gateway-vs-front-door]] — regional vs global L7
- [[comparisons/load-balancing-options]] — full load balancing comparison
