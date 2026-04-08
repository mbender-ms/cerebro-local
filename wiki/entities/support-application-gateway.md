---
title: "Troubleshooting: Azure Application Gateway"
created: 2026-04-07
updated: 2026-04-07
sources:
  - support-application-gateway/*.md
tags:
  - support
  - troubleshooting
  - application-gateway
---

# Troubleshooting: Azure Application Gateway

Troubleshooting articles for Azure Application Gateway. Common issues: 502 Bad Gateway errors, backend health probe failures, SSL/TLS certificate issues, WAF false positives, URL routing misconfigurations, and WebSocket connectivity.

## Common Issues

| Issue | Likely Cause |
|-------|-------------|
| 502 Bad Gateway | Backend pool unhealthy, NSG blocking probe, timeout |
| Health probe failures | Wrong path/port, backend not responding, NSG rules |
| SSL errors | Certificate mismatch, expired cert, missing intermediate |
| WAF blocking legitimate traffic | Overly strict rules, custom rule needed |
| Slow performance | Undersized SKU, too many backend instances unhealthy |

## Links

- [[entities/azure-application-gateway]] — service overview
- [[entities/azure-waf]] — WAF troubleshooting
- [[comparisons/app-gateway-vs-front-door]] — when to use which
