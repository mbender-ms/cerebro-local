---
title: Azure CycleCloud
created: 2026-04-07
updated: 2026-04-07
sources:
  - cyclecloud/*.md
tags:
  - hpc
  - compute
  - slurm
  - scheduling
---

# Azure CycleCloud

Orchestrates and manages HPC (High-Performance Computing) clusters in Azure. Automates cluster creation, scaling, and management for workload schedulers like Slurm, PBS Pro, Grid Engine, and HT Condor.

## Key Features

- **Auto-scaling** — dynamically add/remove nodes based on job queue
- **Multiple schedulers** — Slurm, PBS Pro, Grid Engine, HTCondor, LSF
- **Cost management** — Spot VMs, auto-shutdown idle nodes, budget alerts
- **CycleCloud Workspace for Slurm** — turnkey Slurm cluster deployment
- **Cluster templates** — reusable infrastructure-as-code definitions
- **Integration** — Azure Blob, NFS, Lustre (AMLFS), ANF for storage

## Architecture

CycleCloud server (VM) → manages → HPC cluster nodes (scheduler head + compute nodes). Nodes auto-scale based on pending jobs.

## Common Workloads

- Financial risk modeling (Monte Carlo)
- Weather/climate simulation
- Computational fluid dynamics
- Genomics/bioinformatics
- AI/ML training at scale
- Rendering (animation, VFX)

## Links

- [[entities/azure-virtual-machines]] — compute nodes are VMs
- [[entities/azure-vmss]] — scale sets for node pools
- [[comparisons/compute-options]] — HPC vs other compute models
