---
title: HPC Compute Options on Azure
created: 2026-04-07
updated: 2026-04-07
sources:
  - high-performance-computing/*.md
  - batch/*.md
  - cyclecloud/*.md
tags:
  - hpc
  - compute
  - comparison
---

# HPC Compute Options on Azure

Choosing the right approach for high-performance computing workloads.

## Service Comparison

| Feature | Azure Batch | Azure CycleCloud | Azure Compute Fleet |
|---------|------------|-----------------|-------------------|
| **Type** | Managed job scheduler | Cluster orchestrator | VM fleet launcher |
| **Scheduler** | Built-in (Batch) | Slurm, PBS, Grid Engine, HTCondor | None (bring your own) |
| **Max VMs** | 300 per pool (quota) | Thousands | 10,000 per fleet |
| **Auto-scaling** | Built-in pool scaling | Queue-based auto-scale | Maintain target capacity |
| **Spot VMs** | ✅ | ✅ | ✅ (primary use case) |
| **InfiniBand** | ✅ (HB/HC/ND VMs) | ✅ | ✅ |
| **Managed** | Fully managed | Self-managed (CycleCloud VM) | API-driven |
| **Best for** | Embarrassingly parallel, rendering | Traditional HPC (Slurm) | Burst, stateless, cost-optimized |

## When to Use Each

| Scenario | Best Choice |
|----------|-------------|
| Traditional Slurm/PBS HPC cluster | **CycleCloud** |
| Batch rendering, media transcoding | **Azure Batch** |
| Monte Carlo, risk modeling (stateless) | **Compute Fleet** |
| Tightly coupled MPI with InfiniBand | **CycleCloud** with HB/HC VMs |
| CI/CD pipeline runners at scale | **Compute Fleet** |
| Genomics/bioinformatics pipelines | **Azure Batch** or **CycleCloud** |

## VM Families for HPC

| Series | Cores | Optimized For | InfiniBand |
|--------|-------|--------------|------------|
| HBv4 | 176 | Memory bandwidth HPC | ✅ NDR |
| HBv3 | 120 | General HPC | ✅ HDR |
| HCv1 | 44 | Dense compute | ✅ EDR |
| HXv3 | 176 | Large memory HPC | ✅ HDR |
| NDv5 (H100) | 96 + 8 GPU | AI training | ✅ NDR |
| NCv4 (A100) | 96 + 4 GPU | AI/ML compute | ✅ HDR |

## Links

- [[entities/azure-batch]] — managed job scheduling
- [[entities/cyclecloud]] — Slurm/PBS cluster management
- [[entities/azure-compute-fleet]] — VM fleet deployment
- [[entities/high-performance-computing]] — HPC overview
- [[comparisons/compute-options]] — general compute comparison
