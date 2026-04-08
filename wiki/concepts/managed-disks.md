---
title: Azure Managed Disks
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-machines/managed-disks-overview.md
  - virtual-machines/disks-types.md
tags:
  - networking-concept
  - storage
  - compute
  - virtual-machines
---

# Azure Managed Disks

Block-level storage volumes managed by Azure for use with VMs. 99.999% availability with 3 replicas. Eliminates the need to manage storage accounts for VM disks. (source: managed-disks-overview.md)

## Disk Type Comparison

| Type | Max IOPS | Max throughput | Max size | Latency | Best for |
|------|---------|---------------|----------|---------|----------|
| **Ultra Disk** | 400,000 | 10,000 MB/s | 65,536 GiB | Sub-ms | Top-tier databases (SAP HANA, SQL), transaction-heavy |
| **Premium SSD v2** | 80,000 | 1,200 MB/s | 65,536 GiB | Sub-ms | Production DBs needing fine-tuned IOPS/throughput |
| **Premium SSD** | 20,000 | 900 MB/s | 32,767 GiB | Single-digit ms | Production VMs, enterprise applications |
| **Standard SSD** | 6,000 | 750 MB/s | 32,767 GiB | Single-digit ms | Web servers, lightly used enterprise, dev/test |
| **Standard HDD** | 2,000 | 500 MB/s | 32,767 GiB | Variable | Backup, non-critical, infrequent access |

(source: disks-types.md)

## Key Differences: Premium SSD vs Premium SSD v2

| Feature | Premium SSD | Premium SSD v2 |
|---------|------------|----------------|
| IOPS/throughput config | Tied to disk size (fixed tiers) | Independently configurable |
| Max IOPS | 20,000 | 80,000 |
| Bursting | ✅ (credit-based + on-demand) | ❌ (no bursting, but higher baseline) |
| Availability zones | ✅ (LRS + ZRS) | ✅ (LRS only currently) |
| Snapshots | ✅ | ✅ |
| Price model | Per-tier (P4, P6, P10...) | Pay for provisioned capacity + IOPS + throughput |

(source: disks-types.md)

## Redundancy Options

- **LRS** (Locally Redundant) — 3 replicas in single datacenter; 11 9's durability
- **ZRS** (Zone Redundant) — replicas across 3 zones; 12 9's durability; supported for Premium SSD and Standard SSD

## Key Features

- **Encryption** — SSE with platform-managed or customer-managed keys; Azure Disk Encryption (BitLocker/DM-Crypt)
- **Shared disks** — attach one disk to multiple VMs (clustered apps like SQL FCI, SAP ASCS)
- **Disk bursting** — exceed baseline IOPS/throughput temporarily (credit-based or on-demand)
- **Snapshots** — point-in-time copy for backup/cloning
- **Ephemeral OS disks** — local VM disk for OS; no storage cost, fast reimage, no persistence

## Links

- [[entities/azure-virtual-machines]]
- [[entities/azure-vmss]]
- [[comparisons/storage-options]]
