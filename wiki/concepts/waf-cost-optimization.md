---
title: "WAF: Cost Optimization Pillar"
created: 2026-04-07
updated: 2026-04-07
sources:
  - well-architected/*.md
tags:
  - networking-concept
  - waf
  - cost
  - architecture
---

# WAF: Cost Optimization Pillar

Deliver sufficient return on investment while managing costs. (source: well-architected/cost-optimization)

## Design Principles

1. **Develop cost-management discipline** — set budgets, alerts, governance
2. **Design with a cost-efficiency mindset** — right-size, use appropriate tiers
3. **Design for usage optimization** — auto-scale, shut down idle resources
4. **Design for rate optimization** — reservations, savings plans, spot VMs
5. **Monitor and optimize over time** — continuous cost review and adjustment

## Key Practices

- **Right-sizing** — match VM SKU/tier to actual workload needs
- **Auto-scaling** — scale out during demand, scale in during quiet periods
- **Reservations** — 1-3 year commitments for predictable workloads (up to 72% savings)
- **Spot VMs** — up to 90% discount for interruptible workloads
- **Tiering** — use cheaper storage/compute tiers for non-critical data
- **Tagging** — tag resources for cost allocation and showback
- **Azure Cost Management** — budgets, alerts, recommendations

## Links

- [[entities/azure-well-architected-framework]]
- [[concepts/waf-performance-efficiency]]
