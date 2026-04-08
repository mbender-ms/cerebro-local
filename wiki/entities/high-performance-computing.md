---
title: Azure High-Performance Computing (HPC)
created: 2026-04-07
updated: 2026-04-07
sources:
  - high-performance-computing/*.md
tags:
  - hpc
  - compute
  - migration
  - batch
---

# Azure High-Performance Computing (HPC)

Azure HPC provides infrastructure and services for running compute-intensive workloads: scientific simulations, financial modeling, rendering, genomics, and AI training.

## HPC Services Stack

| Service | Role |
|---------|------|
| **Azure CycleCloud** | Cluster orchestration with Slurm/PBS/Grid Engine |
| **Azure Batch** | Managed job scheduling and compute pool management |
| **Azure HPC Cache** | High-speed caching layer for NFS/Blob storage |
| **Azure Managed Lustre (AMLFS)** | High-performance parallel file system |
| **Azure NetApp Files** | Enterprise NFS/SMB for HPC workloads |
| **InfiniBand VMs** | HB/HC/ND-series with RDMA networking |

## VM Families for HPC

| Series | Optimized For | InfiniBand |
|--------|--------------|------------|
| **HB-series** | Memory bandwidth (HPC) | ✅ HDR |
| **HC-series** | Dense compute (HPC) | ✅ EDR |
| **HX-series** | Large memory HPC | ✅ HDR |
| **ND-series** | GPU AI/ML training | ✅ HDR |
| **NC-series** | GPU compute/inference | Some models |

## Migration from On-Premises

Lift-and-shift approach: replicate on-prem scheduler config → CycleCloud templates → auto-scaling in Azure. Key personas: HPC admin, app developer, end user.

## Links

- [[entities/azure-virtual-machines]] — HPC VM families
- [[comparisons/compute-options]] — HPC vs other compute
- [[entities/azure-batch]] — managed job scheduling alternative to CycleCloud
