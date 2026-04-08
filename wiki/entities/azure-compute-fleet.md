---
title: Azure Compute Fleet
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-compute-fleet/*.md
tags:
  - compute
  - spot
  - vms
  - cost-optimization
---

# Azure Compute Fleet

Deploy up to 10,000 VMs with a single API call, automatically selecting the best combination of VM types, pricing models, and regions for cost and capacity.

## Key Capabilities

- **Single API deployment** — launch thousands of VMs across multiple SKUs
- **Mixed pricing** — blend Spot, Reserved Instances, Savings Plans, and pay-as-you-go
- **Automatic replacement** — replace evicted Spot VMs automatically
- **Multi-region** — distribute workloads across regions (preview)
- **Attribute-based selection** — specify requirements (vCPU, memory, storage) instead of specific SKUs

## Allocation Strategies

| Strategy | Optimizes For |
|----------|--------------|
| **Lowest price** | Cost — selects cheapest available SKUs |
| **Capacity optimized** | Availability — selects SKUs with most capacity |
| **Price-capacity optimized** | Balance of cost and availability |

## Use Cases

- Batch processing / rendering
- CI/CD pipeline runners
- Financial risk analysis (Monte Carlo)
- Big data / log processing
- Stateless web services at scale

## Pricing

No extra charge for Compute Fleet itself — you pay only for the VMs launched per hour.

## Links

- [[entities/azure-virtual-machines]] — underlying VM types
- [[entities/azure-vmss]] — alternative for auto-scaling (persistent)
- [[entities/azure-batch]] — managed batch processing alternative
- [[comparisons/compute-options]] — fleet vs other compute models
