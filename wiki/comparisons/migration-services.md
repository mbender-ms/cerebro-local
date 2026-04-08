---
title: Azure Migration Services
created: 2026-04-07
updated: 2026-04-07
sources:
  - migrate/*.md
  - migration/*.md
  - site-recovery/*.md
  - resource-mover/*.md
  - storage-mover/*.md
tags:
  - comparison
  - migration
---

# Azure Migration Services

## Decision Matrix

| Service | Purpose | Scope |
|---------|---------|-------|
| [[entities/migrate]] | Discover, assess, and migrate servers, databases, web apps, VDI | End-to-end migration hub |
| [[entities/site-recovery]] | Disaster recovery (replication + failover) for VMs; also used for migration | VM replication to Azure |
| [[entities/resource-mover]] | Move Azure resources between regions | Cross-region resource moves |
| [[entities/storage-mover]] | Migrate file data from on-premises NAS to Azure Storage | File/NAS migration |
| [[entities/databox]] | Physical device for large-scale offline data transfer | Petabyte-scale data moves |
| [[entities/import-export]] | Ship HDDs to Azure datacenter for bulk import/export | Disk-based transfer |

## Migration vs Disaster Recovery

| Dimension | Azure Migrate | Site Recovery |
|-----------|--------------|---------------|
| **Primary purpose** | One-time migration | Ongoing DR + optional migration |
| **Assessment** | ✅ (discovery, readiness, sizing) | ❌ |
| **Database migration** | ✅ (via DMS) | ❌ |
| **Web app migration** | ✅ | ❌ |
| **VM replication** | Uses Site Recovery under the hood | Core capability |
| **Failover/failback** | Migration cutover | Continuous DR with test failover |
