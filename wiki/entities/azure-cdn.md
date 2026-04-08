---
title: Azure CDN
created: 2026-04-07
updated: 2026-04-07
sources:
  - cdn/*.md
tags:
  - networking
  - cdn
  - content-delivery
  - caching
---

# Azure CDN

Content delivery network that caches content at edge POPs worldwide to minimize latency and offload origin servers.

> **Retirement notice**: Azure CDN Standard from Microsoft (classic) retires September 30, 2027. Azure CDN from Edgio retired January 15, 2025. Migrate to [[entities/azure-front-door]] Standard or Premium.

## How It Works

1. User requests asset via CDN URL (`<endpoint>.azureedge.net` or custom domain)
2. DNS routes to nearest POP (geographically closest)
3. If not cached, POP fetches from origin (Azure Storage, Web App, any public web server)
4. Origin returns file to POP edge server
5. Edge server caches file and returns to user
6. Subsequent requests served from cache until TTL expires (default: 7 days)

## Key Features

- **Global edge network** — POPs worldwide
- **Caching rules** — custom TTL, query string caching, device-based caching
- **Dynamic site acceleration** — optimize non-cacheable content via route optimization
- **HTTPS** — custom domain SSL/TLS
- **Geo-filtering** — restrict content by country/region
- **Compression** — automatic gzip/brotli
- **DDoS protection** — built-in L3/L4 protection
- **Analytics and diagnostics** — real-time stats, Azure Monitor integration

## Migration Path

| Old Product | Status | Migrate To |
|-------------|--------|------------|
| Azure CDN from Edgio | **Retired** Jan 2025 | Azure Front Door Standard/Premium |
| Azure CDN Standard from Microsoft (classic) | **Retiring** Sept 2027 | Azure Front Door Standard/Premium |
| Azure CDN from Akamai | **Retired** | Azure Front Door Standard/Premium |

Azure Front Door is the consolidated successor — combines CDN + L7 load balancing + WAF.

## Caching Behavior

| Setting | Description |
|---------|-------------|
| **Honor origin** | Respect Cache-Control/Expires headers from origin |
| **Override** | Use CDN-defined TTL regardless of origin headers |
| **Bypass cache** | Never cache — always fetch from origin |
| **Query string caching** | Ignore, cache every unique URL, or cache specified parameters |

## Origin Types

- Azure Blob Storage
- Azure Web Apps / App Service
- Azure Cloud Services
- Any publicly accessible web server (custom origin)
- Azure Media Services

## Links

- [[entities/azure-front-door]] — CDN successor with L7 load balancing and WAF
- [[comparisons/app-gateway-vs-front-door]] — regional vs global L7
- [[comparisons/load-balancing-options]] — where CDN/Front Door fits
- [[entities/azure-waf]] — WAF policies on CDN/Front Door
