---
title: CAF vs WAF
created: 2026-04-07
updated: 2026-04-07
sources:
  - cloud-adoption-framework/*.md
  - well-architected/*.md
tags:
  - comparison
  - caf
  - waf
  - architecture
---

# Cloud Adoption Framework (CAF) vs Well-Architected Framework (WAF)

Complementary frameworks operating at different scopes.

## Comparison

| Dimension | CAF | WAF |
|-----------|-----|-----|
| **Scope** | Organization-wide cloud adoption | Individual workload design |
| **Focus** | Journey from strategy to operations | Quality of a specific workload |
| **Audience** | Cloud architects, platform teams, CIOs | Workload architects, dev teams |
| **Covers** | Strategy, planning, landing zones, migration, governance, management | Reliability, security, cost, operations, performance |
| **Key output** | Azure landing zone, governance framework | Architecture review, improvement backlog |
| **Assessment** | Cloud adoption readiness assessment | WAF assessment review |
| **Networking** | Landing zone network topology (hub-spoke / vWAN) | Service-specific network best practices |
| **Security** | Security governance across the estate | Security controls for a specific workload |

## How They Work Together

1. **CAF** establishes the platform — landing zones, governance, identity, networking baseline
2. **WAF** optimizes each workload deployed on that platform — reliability, security, performance, cost
3. CAF's "Ready" phase sets up the environment; WAF's pillars guide what you put in it
4. CAF governance enforces organizational standards; WAF design ensures workload quality

## When to Use Which

| Question | Use |
|----------|-----|
| "How do I set up Azure for my organization?" | CAF |
| "How do I design this specific application?" | WAF |
| "What network topology should my landing zone use?" | CAF |
| "Should I use Premium SSD or Ultra Disk for this database?" | WAF |
| "How do I govern costs across 50 subscriptions?" | CAF |
| "How do I optimize costs for this one workload?" | WAF |

## Links

- [[entities/cloud-adoption-framework]]
- [[entities/azure-well-architected-framework]]
- [[concepts/caf-landing-zones]]
- [[concepts/waf-reliability]]
