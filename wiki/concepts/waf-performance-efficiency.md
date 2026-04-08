---
title: "WAF: Performance Efficiency Pillar"
created: 2026-04-07
updated: 2026-04-07
sources:
  - well-architected/*.md
tags:
  - networking-concept
  - waf
  - performance
  - architecture
---

# WAF: Performance Efficiency Pillar

Ensure workloads accomplish their purpose within acceptable timeframes. (source: well-architected/performance-efficiency)

## Design Principles

1. **Negotiate realistic performance targets** — define latency, throughput, IOPS requirements
2. **Design to meet capacity requirements** — plan for peak, provision for normal
3. **Achieve and sustain performance** — test, baseline, monitor continuously
4. **Improve efficiency through optimization** — reduce waste, tune code and queries

## Key Practices

- **Performance testing** — load testing, stress testing, baseline establishment
- **Capacity planning** — forecast demand; validate with load tests
- **Caching** — reduce latency and backend load ([[comparisons/caching-options]])
- **CDN** — serve static content from edge ([[entities/azure-front-door]])
- **Async patterns** — decouple with queues ([[comparisons/messaging-options]])
- **Auto-scaling** — scale horizontally to handle spikes
- **Data partitioning** — distribute data across shards/partitions
- **Connection pooling** — reuse connections to reduce overhead

## Azure Mapping

| Practice | Azure service |
|----------|--------------|
| Scaling | [[entities/azure-vmss]], [[entities/container-apps]], KEDA |
| Caching | [[comparisons/caching-options]] |
| CDN/edge | [[entities/azure-front-door]] |
| Load balancing | [[comparisons/load-balancing-options]] |
| Monitoring | Azure Monitor, [[entities/azure-network-watcher]] |

## Links

- [[entities/azure-well-architected-framework]]
- [[concepts/waf-cost-optimization]]
