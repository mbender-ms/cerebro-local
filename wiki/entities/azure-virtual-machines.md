---
title: Azure Virtual Machines
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-machines/*.md
tags:
  - azure-service
  - compute
  - iaas
---

# Azure Virtual Machines

IaaS compute — on-demand, scalable VMs running Windows or Linux. The foundational Azure compute service. (source: virtual-machines/*.md — 1,166 articles)

## VM Size Families

| Family | Optimized for | Example series |
|--------|--------------|----------------|
| **General purpose** | Balanced CPU/memory; dev/test, small-medium databases | B, D, Ds, Dv5, Dpds |
| **Compute optimized** | High CPU-to-memory ratio; batch processing, gaming | F, Fs, Fsv2 |
| **Memory optimized** | High memory-to-CPU; databases, in-memory analytics | E, Es, Ev5, M, Mv2 |
| **Storage optimized** | High disk throughput/IOPS; big data, SQL, NoSQL | L, Ls, Lsv3 |
| **GPU** | ML training/inference, rendering, HPC | NC, ND, NV, NCads, NVads |
| **HPC** | Fastest CPU, optional InfiniBand; simulations, CFD | HB, HBv4, HC, HX |
| **Confidential** | Hardware-based TEE; encrypted-in-use workloads | DC, DCv2, ECads |

## Managed Disks

Block-level storage volumes managed by Azure. 99.999% availability, 3 replicas. (source: managed-disks-overview.md)

| Disk type | IOPS (max) | Throughput (max) | Best for |
|-----------|-----------|-----------------|----------|
| **Ultra Disk** | 400,000 | 10,000 MB/s | Top-tier databases, transaction-heavy |
| **Premium SSD v2** | 80,000 | 1,200 MB/s | Production databases, latency-sensitive |
| **Premium SSD** | 20,000 | 900 MB/s | Production VMs, enterprise apps |
| **Standard SSD** | 6,000 | 750 MB/s | Web servers, dev/test |
| **Standard HDD** | 2,000 | 500 MB/s | Backup, non-critical, infrequent access |

## Availability Options

| Option | Protection level | SLA |
|--------|-----------------|-----|
| **Availability Zones** | Datacenter failure (separate power/network/cooling) | 99.99% |
| **Virtual Machine Scale Sets** | Auto-scale across zones or fault domains | Varies by config |
| **Availability Sets** | Rack-level failure (fault domains + update domains) | 99.95% |
| **Azure Site Recovery** | Region failure (replication to secondary region) | RPO-dependent |

(source: availability.md)

## Key Concepts

- **Accelerated Networking** — SR-IOV hardware offload for lower latency, higher throughput
- **Proximity Placement Groups** — co-locate VMs for lowest latency
- **Spot VMs** — unused capacity at up to 90% discount; evictable
- **Reserved Instances** — 1 or 3-year commitment for cost savings
- **Ephemeral OS Disks** — local disk for OS (no storage cost, fast reimage)
- **Azure Dedicated Host** — physical server dedicated to you; compliance, licensing

## Links

- [[entities/azure-vmss]] — auto-scaling VM groups
- [[concepts/managed-disks]] — disk types and comparison
- [[concepts/vm-availability]] — zones, scale sets, availability sets
- [[concepts/troubleshooting-virtual-machines]] — support article compilation
- [[comparisons/compute-options]] — VMs vs Functions vs Container Apps
- [[sources/virtual-machines-docs]]
