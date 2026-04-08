---
title: Azure Backup and Disaster Recovery
created: 2026-04-07
updated: 2026-04-07
sources:
  - backup/*.md
  - site-recovery/*.md
tags:
  - networking-concept
  - backup
  - disaster-recovery
---

# Azure Backup and Disaster Recovery

Two complementary services for data protection and business continuity.

## Azure Backup

Managed backup service. Back up and restore data in the Microsoft cloud. Replaces on-premises backup solutions. (source: backup/backup-overview.md)

**What you can back up:**
- Azure VMs (full VM or individual disks)
- Azure Files shares
- SQL Server / SAP HANA in Azure VMs
- Azure Blobs, Azure Disks, Azure Database for PostgreSQL
- On-premises (files, folders, system state via MARS agent)
- AKS clusters

**Key concepts:**
- **Recovery Services vault** — storage entity for backup data
- **Backup policy** — schedule + retention rules
- **Recovery point** — point-in-time snapshot for restore
- **Instant restore** — restore from local snapshots (fast)
- **GRS/LRS** — geo-redundant or locally redundant vault storage

**Ransomware protection:** Soft delete, immutable vaults, MUA (multi-user authorization), private endpoints.

## Azure Site Recovery

DR service — replicate VMs and workloads to a secondary region. Automated failover/failback. Also used for migration. See [[entities/site-recovery]].

## Comparison

| Feature | Azure Backup | Azure Site Recovery |
|---------|-------------|-------------------|
| **Purpose** | Data protection (backup/restore) | Business continuity (replication/failover) |
| **RPO** | Hours (scheduled backups) | Minutes (continuous replication) |
| **RTO** | Minutes to hours (restore) | Minutes (automated failover) |
| **Scope** | VMs, databases, files, blobs | VMs, physical servers |

## Links

- [[entities/backup]]
- [[entities/site-recovery]]
- [[comparisons/migration-services]]
