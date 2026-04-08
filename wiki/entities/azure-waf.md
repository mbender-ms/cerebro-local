---
title: Azure Web Application Firewall (WAF)
created: 2026-04-07
updated: 2026-04-07
sources:
  - web-application-firewall/overview.md
tags:
  - azure-service
  - networking
  - security
  - web
  - layer-7
---

# Azure Web Application Firewall (WAF)

Centralized protection for web applications from common exploits (SQL injection, XSS, etc.). Deployed in front of web apps, not as a standalone network device. (source: overview.md)

## Supported Services

WAF can be deployed on:
- **[[entities/azure-application-gateway]]** — regional WAF, per-site policies
- **[[entities/azure-front-door]]** — global WAF at the edge, DDoS + bot protection
- **Azure CDN** — CDN-integrated WAF (being consolidated into Front Door)

(source: overview.md)

## Key Capabilities

- **OWASP Core Rule Set (CRS)** — managed ruleset covering top 10 web vulnerabilities
- **Bot protection** — managed bot detection rules (Front Door Premium)
- **Custom rules** — IP allowlists/blocklists, rate limiting, geo-filtering
- **Per-site / per-URI policies** — different WAF policies per backend
- **JavaScript challenge** — client-side verification to block automated attacks
- **Exclusions** — exclude specific request attributes from rule evaluation

## Detection vs Prevention

| Mode | Behavior |
|------|----------|
| **Detection** | Log only — monitor without blocking |
| **Prevention** | Block requests that match rules; log blocked requests |

## Links

- [[entities/azure-application-gateway]] — regional WAF host
- [[entities/azure-front-door]] — global WAF host
- [[entities/azure-firewall]] — L3/L4 firewall (complementary, not substitute)
- [[sources/waf-docs]]
