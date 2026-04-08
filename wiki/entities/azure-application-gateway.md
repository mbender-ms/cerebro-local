---
title: Azure Application Gateway
created: 2026-04-07
updated: 2026-04-07
sources:
  - application-gateway/overview.md
  - application-gateway/configuration-overview.md
  - application-gateway/application-gateway-probe-overview.md
tags:
  - azure-service
  - networking
  - load-balancing
  - web
  - layer-7
---

# Azure Application Gateway

A web traffic (Layer 7) load balancer that makes routing decisions based on HTTP request attributes like URL paths and host headers. Unlike traditional L4 load balancers that route by IP/port only. (source: overview.md)

## Key Features

- **URL-based routing** — route `/images/*` to one backend pool, `/api/*` to another (source: overview.md)
- **Multi-site hosting** — host multiple websites behind a single gateway using host headers (source: overview.md)
- **SSL/TLS termination** — offload SSL at the gateway; end-to-end TLS also supported (source: overview.md)
- **Web Application Firewall (WAF)** — integrated [[entities/azure-waf]] protection against OWASP top 10 (source: overview.md)
- **Autoscaling** — automatically scale based on traffic load (v2 SKU) (source: overview.md)
- **Zone redundancy** — span multiple availability zones (v2 SKU) (source: overview.md)
- **Session affinity** — cookie-based session stickiness (source: overview.md)
- **Health probes** — custom and default probes for backend health monitoring (source: application-gateway-probe-overview.md)
- **Redirect** — HTTP-to-HTTPS, external URL, path-based redirects (source: overview.md)
- **TCP/TLS proxy** — L4 proxy for non-HTTP workloads (source: overview.md)
- **Ingress Controller for AKS** — use App Gateway as Kubernetes ingress (source: overview.md)

## SKUs

| Feature | v1 (Standard/WAF) | v2 (Standard_v2/WAF_v2) |
|---------|----|----|
| Autoscaling | ❌ | ✅ |
| Zone redundancy | ❌ | ✅ |
| Static VIP | ❌ | ✅ |
| AKS Ingress Controller | ❌ | ✅ |
| Private Link | ❌ | ✅ |

## Links

- [[entities/azure-waf]] — WAF integration
- [[entities/azure-front-door]] — global L7 load balancing (compare)
- [[entities/azure-load-balancer]] — L4 load balancing
- [[sources/application-gateway-docs]]
- [[comparisons/app-gateway-vs-front-door]]
- [[comparisons/load-balancing-options]]
