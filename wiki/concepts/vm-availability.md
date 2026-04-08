---
title: VM Availability Options
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-machines/availability.md
  - virtual-machines/availability-set-overview.md
  - virtual-machine-scale-sets/virtual-machine-scale-sets-orchestration-modes.md
tags:
  - networking-concept
  - compute
  - availability
  - reliability
---

# VM Availability Options

Strategies for keeping VMs running during infrastructure failures. Choose based on the failure scope you need to protect against. (source: availability.md)

## Comparison

| Option | Protects against | SLA | Auto-scale | Max instances |
|--------|-----------------|-----|------------|---------------|
| **Availability Zones** | Datacenter failure | 99.99% | Manual (or VMSS) | N/A |
| **VMSS (Flexible)** | Zone + rack failure | 99.95-99.99% | ✅ | 1,000 |
| **VMSS (Uniform)** | Zone + rack failure | 99.95-99.99% | ✅ | 1,000 |
| **Availability Sets** | Rack failure | 99.95% | ❌ | 200 |
| **Site Recovery** | Region failure | RPO-dependent | ❌ | N/A |
| **Single VM (Premium SSD)** | — | 99.9% | ❌ | 1 |

(source: availability.md)

## Availability Zones

Physically separate datacenters within a region. Each zone has independent power, cooling, and networking. Deploy VMs across 3 zones for datacenter-level resilience. (source: availability.md)

**Key rule**: Zone-redundant LB + VMs in multiple zones = 99.99% SLA.

## Availability Sets

Logical grouping within a single datacenter. Azure distributes VMs across:
- **Fault domains** (FDs) — separate power/network racks (max 3)
- **Update domains** (UDs) — groups rebooted together during maintenance (max 20)

No cost for the availability set itself. (source: availability-set-overview.md)

## Scale Sets (VMSS)

Recommended for new deployments. Flexible orchestration combines the best of availability sets + auto-scaling + zone-spanning. See [[entities/azure-vmss]].

## Decision Guide

1. **Need auto-scale?** → VMSS (Flexible)
2. **Zone-redundant, no auto-scale?** → VMs in Availability Zones + LB
3. **Legacy, single-datacenter HA?** → Availability Set
4. **DR across regions?** → Azure Site Recovery

## Links

- [[entities/azure-virtual-machines]]
- [[entities/azure-vmss]]
- [[entities/azure-load-balancer]] — distribute traffic across available VMs
- [[entities/azure-site-recovery]] — cross-region DR
