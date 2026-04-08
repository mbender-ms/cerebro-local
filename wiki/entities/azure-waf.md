---
title: Azure Web Application Firewall
created: 2026-04-07
updated: 2026-04-07
sources:
  - web-application-firewall/*.md
tags:
  - networking
  - security
  - waf
  - owasp
---

# Azure Web Application Firewall (WAF)

Centralized protection for web applications against common exploits and vulnerabilities. Deploys on Application Gateway, Front Door, or CDN.

## Deployment Platforms

| Platform | Scope | Best For |
|----------|-------|----------|
| **Application Gateway** | Regional | Apps in a single region |
| **Azure Front Door** | Global | Multi-region apps, global edge protection |
| **Azure CDN** | Global (limited) | Basic WAF on CDN profiles (migrating to Front Door) |

## Rule Sets

- **OWASP Core Rule Set (CRS)** — protects against OWASP Top 10 (SQL injection, XSS, etc.)
  - CRS 3.2, 3.1, 3.0, 2.2.9 supported
- **Bot Manager Rule Set** — good bot allowlisting, bad bot blocking
- **Custom rules** — geo-match, IP allowlist/blocklist, rate limiting, header matching

## Modes

| Mode | Behavior |
|------|----------|
| **Detection** | Logs all rule matches but allows traffic through |
| **Prevention** | Blocks requests that match rules, logs actions |

## Key Features

- **JavaScript challenge** — client-side challenge to distinguish bots from humans
- **Geo-match custom rules** — allow/deny by country with flexible matching
- **Rate limiting** — protect against DDoS at L7
- **Sentinel integration** — stream WAF logs to Microsoft Sentinel for SIEM analysis
- **Copilot integration** — natural language WAF policy analysis
- **New threat detection** — Microsoft Threat Intelligence–powered rules for emerging threats
- **Per-site/per-URI policies** — granular policy assignment on Application Gateway

## Ruleset Support Policy

Microsoft provides:
- Active maintenance of current CRS versions
- At least 12-month notice before retiring a CRS version
- Continuous updates for bot rules and threat intel rules

## Links

- [[entities/azure-application-gateway]] — regional WAF deployment
- [[entities/azure-front-door]] — global WAF deployment
- [[entities/azure-cdn]] — CDN WAF (migrating to Front Door)
- [[entities/azure-firewall]] — network-level firewall (L3/L4); WAF is L7
- [[comparisons/firewall-vs-nsg]] — WAF complements both; different layers
- [[comparisons/security-services]] — full security stack comparison
