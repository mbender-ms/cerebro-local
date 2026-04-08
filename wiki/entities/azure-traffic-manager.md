---
title: Azure Traffic Manager
created: 2026-04-07
updated: 2026-04-07
sources:
  - traffic-manager/traffic-manager-overview.md
  - traffic-manager/traffic-manager-routing-methods.md
tags:
  - azure-service
  - networking
  - dns-load-balancing
  - global
---

# Azure Traffic Manager

DNS-based global traffic load balancer. Distributes traffic to public-facing endpoints across Azure regions. Operates at the DNS layer (returns the best endpoint IP in DNS response). (source: traffic-manager-overview.md)

## Routing Methods

| Method | Description |
|--------|-------------|
| **Priority** | Active/standby failover; all traffic to primary until it fails |
| **Weighted** | Distribute traffic by weight (percentage) across endpoints |
| **Performance** | Route to lowest-latency endpoint based on user's DNS location |
| **Geographic** | Route based on geographic origin of DNS query |
| **Multivalue** | Return multiple healthy endpoints; client picks one |
| **Subnet** | Map specific client IP ranges to specific endpoints |

(source: traffic-manager-routing-methods.md)

## Key Features

- **Endpoint types** — Azure (App Service, PIP, etc.), external (IP/FQDN), nested (another TM profile)
- **Health monitoring** — configurable probes (HTTP, HTTPS, TCP) with failover
- **Nested profiles** — combine routing methods (e.g., performance at global level, weighted at regional level)
- **Real User Measurements (RUM)** — measure actual client latency to improve performance routing
- **Traffic View** — analytics on where users are and their latency

(source: traffic-manager-overview.md)

## Important Notes

- DNS-based only — does NOT proxy traffic, only returns endpoint IPs
- Clients connect directly to the endpoint after DNS resolution
- [[concepts/dns-alias-records]] enable zone apex to point to TM profiles

## Links

- [[entities/azure-front-door]] — L7 alternative with inline traffic + WAF + caching
- [[entities/azure-load-balancer]] — L4 regional load balancing
- [[concepts/dns-alias-records]] — zone apex support via alias records
- [[sources/traffic-manager-docs]]
