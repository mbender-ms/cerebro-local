---
title: "WAF: Operational Excellence Pillar"
created: 2026-04-07
updated: 2026-04-07
sources:
  - well-architected/*.md
tags:
  - networking-concept
  - waf
  - operations
  - architecture
---

# WAF: Operational Excellence Pillar

Support responsible development and operations throughout the workload lifecycle. (source: well-architected/operational-excellence)

## Design Principles

1. **Embrace DevOps culture** — shared responsibility, collaboration, continuous improvement
2. **Establish development standards** — coding standards, branching strategy, CI/CD
3. **Evolve operations with observability** — monitor, measure, learn, adjust
4. **Deploy with confidence** — safe deployment practices, canary/blue-green, rollback
5. **Automate for efficiency** — reduce toil, eliminate manual repetitive tasks

## Key Practices

- **Infrastructure as Code** — Bicep, Terraform, ARM templates
- **CI/CD pipelines** — GitHub Actions, Azure DevOps
- **Monitoring** — Azure Monitor, Log Analytics, Application Insights
- **Alerting** — actionable alerts, runbooks for incident response
- **Safe deployment** — progressive exposure, feature flags, health checks
- **Chaos engineering** — fault injection to validate resilience

## Azure Mapping

| Practice | Azure service |
|----------|--------------|
| IaC | Bicep, Terraform, ARM |
| Monitoring | Azure Monitor, [[entities/azure-network-watcher]] |
| Automation | [[concepts/azure-operations-management]] |
| Deployment | Azure DevOps, GitHub Actions |
| AI-assisted ops | [[entities/azure-copilot]], [[entities/sre-agent]] |

## Links

- [[entities/azure-well-architected-framework]]
- [[concepts/waf-reliability]]
