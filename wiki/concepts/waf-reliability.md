---
title: "WAF: Reliability Pillar"
created: 2026-04-07
updated: 2026-04-07
sources:
  - well-architected/*.md
tags:
  - networking-concept
  - waf
  - reliability
  - architecture
---

# WAF: Reliability Pillar

Ensure workloads are resilient, available, and recoverable. (source: well-architected/reliability)

## Design Principles

1. **Design for business requirements** — define SLAs, SLOs, SLIs; understand business impact of downtime
2. **Design for resilience** — withstand component and dependency failures gracefully
3. **Design for recovery** — minimize RTO and RPO; automate recovery procedures
4. **Design for operations** — monitor, detect, and respond to reliability issues
5. **Keep it simple** — avoid unnecessary complexity that increases failure risk

## Key Practices

- **Availability zones** — spread across zones for datacenter-level resilience
- **Redundancy** — no single points of failure; multi-region for critical workloads
- **Health modeling** — define what "healthy" means; implement health endpoints
- **Fault analysis** — identify failure modes and test with chaos engineering
- **Self-healing** — auto-restart, auto-scale, circuit breakers
- **Graceful degradation** — reduce functionality rather than fail completely
- **DR testing** — regular failover drills

## Azure Mapping

| Practice | Azure service |
|----------|--------------|
| Zone redundancy | [[concepts/availability-zones-nat]], [[concepts/vm-availability]] |
| Multi-region failover | [[entities/azure-front-door]], [[entities/azure-traffic-manager]] |
| Health probes | [[entities/azure-load-balancer]], [[entities/azure-application-gateway]] |
| Disaster recovery | [[concepts/backup-and-dr]] |
| Monitoring | [[entities/azure-network-watcher]], Azure Monitor |

## Links

- [[entities/azure-well-architected-framework]]
- [[concepts/waf-security]]
- [[concepts/waf-cost-optimization]]
