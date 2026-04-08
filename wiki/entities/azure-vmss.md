---
title: Azure Virtual Machine Scale Sets (VMSS)
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-machine-scale-sets/*.md
tags:
  - azure-service
  - compute
  - auto-scaling
---

# Azure Virtual Machine Scale Sets (VMSS)

Create and manage a group of load-balanced VM instances that auto-scale based on demand or schedule. No cost for the scale set itself — pay only for VM instances. (source: virtual-machine-scale-sets/overview.md — 97 articles)

## Orchestration Modes

| Mode | Description | Recommended |
|------|-------------|-------------|
| **Flexible** | Unified experience across Azure VMs; mix VM types, Spot + on-demand; fault domain isolation up to 1,000 VMs | ✅ Yes (default) |
| **Uniform** | Identical VM instances from a single model; optimized for large stateless workloads (1,000+ instances) | Legacy |

(source: virtual-machine-scale-sets-orchestration-modes.md)

## Key Features

- **Autoscaling** — scale out/in based on metrics (CPU, memory, custom) or schedule
- **Zone-spanning** — distribute instances across availability zones
- **Automatic OS upgrades** — rolling OS image updates with health monitoring
- **Automatic zone balancing** — rebalance VMs across zones when capacity shifts (preview)
- **Application health monitoring** — health extension or LB probe for instance health
- **Rolling upgrades** — update instances in batches with configurable pace and pause

## Flexible vs Uniform vs Availability Sets

| Feature | Flexible VMSS | Uniform VMSS | Availability Set |
|---------|--------------|-------------|------------------|
| Max instances | 1,000 | 1,000 (100 with max FDs) | 200 |
| Mixed VM sizes | ✅ | ❌ | ✅ |
| Spot VMs | ✅ | ✅ | ❌ |
| Zone-spanning | ✅ | ✅ | ❌ |
| Auto-scale | ✅ | ✅ | ❌ |
| Fault domain control | ✅ (assign during creation) | Auto-assigned | ✅ |

## Links

- [[entities/azure-virtual-machines]] — individual VMs
- [[concepts/vm-availability]] — availability options
- [[entities/azure-load-balancer]] — load balance VMSS instances
- [[sources/virtual-machine-scale-sets-docs]]
- [[concepts/managed-disks]]
