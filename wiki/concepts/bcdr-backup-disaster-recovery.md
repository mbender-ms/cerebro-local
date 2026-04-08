---
title: Azure BCDR — Backup and Disaster Recovery
created: 2026-04-07
updated: 2026-04-07
sources:
  - backup/*.md
  - site-recovery/*.md
  - resiliency/*.md
tags:
  - bcdr
  - backup
  - disaster-recovery
  - reliability
---

# Azure BCDR — Backup and Disaster Recovery

Business Continuity and Disaster Recovery services on Azure for protecting workloads against data loss, outages, and cyberattacks.

## Service Comparison

| Service | Purpose | RPO | RTO |
|---------|---------|-----|-----|
| **Azure Backup** | Data protection — scheduled backups with retention | Minutes to hours | Hours |
| **Azure Site Recovery** | VM replication + automated failover to secondary region | Seconds to minutes | Minutes to hours |
| **Azure Resiliency** | Unified BCDR dashboard — manage both from one pane | N/A (management layer) | N/A |

## Azure Backup

Backs up: VMs, SQL on VMs, SAP HANA, Azure Files, Azure Blobs, Azure Disks, PostgreSQL, Kubernetes.

| Feature | Description |
|---------|-------------|
| **Vault types** | Recovery Services Vault, Backup Vault |
| **Tiers** | Snapshot (instant), Standard (vault), Archive (long-term, cheapest) |
| **Retention** | Daily/weekly/monthly/yearly, up to 99 years (archive) |
| **Security** | Soft delete, immutability, MUA, private endpoints, CMK |
| **Cross-region restore** | Restore to paired region from GRS vault |
| **MARS agent** | Back up on-prem Windows files/folders to Azure |

## Azure Site Recovery

Replicates VMs (Azure-to-Azure, VMware/Hyper-V to Azure) for disaster recovery.

| Feature | Description |
|---------|-------------|
| **Replication** | Continuous, asynchronous block-level replication |
| **Recovery plans** | Orchestrated failover with ordering, scripts, manual steps |
| **Test failover** | Non-disruptive DR drill to isolated network |
| **Auto-protection** | Automatically protect new VMs in replication groups |
| **Failback** | Reverse replication back to primary after failover |

## RPO/RTO Targets

| Strategy | RPO | RTO | Cost |
|----------|-----|-----|------|
| Backup only | Hours | Hours to days | $ |
| Active-passive (Site Recovery) | Seconds | Minutes | $$ |
| Active-active (multi-region deployment) | Near-zero | Seconds | $$$ |

## Links

- [[entities/resiliency]] — unified BCDR management
- [[concepts/waf-reliability]] — reliability pillar guidance
- [[comparisons/migration-services]] — Site Recovery also used for migration
- [[entities/azure-virtual-machines]] — primary BCDR-protected workload
