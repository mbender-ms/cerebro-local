---
title: Azure CDN
created: 2026-04-07
updated: 2026-04-07
sources:
  - cdn/cdn-overview.md
tags:
  - azure-service
  - networking
  - content-delivery
  - caching
---

# Azure CDN

Content delivery network that caches static content at edge locations worldwide to reduce latency and offload origin servers. Supports dynamic site acceleration, HTTPS, custom domains, geo-filtering, and rules engine. (source: cdn-overview.md)

## Providers

Azure CDN is available through multiple providers: Microsoft (classic), Edgio (Standard/Premium), and Azure Front Door (recommended for new deployments). (source: cdn-overview.md)

> **Note**: Azure CDN from Microsoft (classic) and Edgio are being retired. Microsoft recommends [[entities/azure-front-door]] for new CDN workloads, which includes CDN capabilities plus global load balancing, WAF, and more.

## Key Features

- Global edge POP network for caching
- Custom domain HTTPS with managed certificates
- Rules engine for URL rewrite, header manipulation, caching
- Compression, geo-filtering, token authentication
- Real-time analytics and diagnostics

## Links

- [[entities/azure-front-door]] — recommended replacement for new deployments
- [[sources/cdn-docs]]
- [[entities/azure-front-door]]
- [[comparisons/load-balancing-options]]
