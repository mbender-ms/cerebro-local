---
title: Troubleshooting Azure Storage
created: 2026-04-07
updated: 2026-04-07
sources:
  - support-azure-storage/*.md
tags:
  - troubleshooting
  - storage
  - support
---

# Troubleshooting Azure Storage

Compiled from 29 Microsoft Support articles covering Blob, Files, connectivity, and performance issues.

## Connectivity

| Problem | Fix |
|---------|-----|
| "AuthorizationFailure" accessing storage | Check RBAC roles, SAS token validity, storage account firewall rules |
| Access denied from VNet | Add VNet/subnet to storage firewall allow list; or use private endpoint |
| Firewall blocking access | Verify client IP is in allowed list; check service endpoints vs private endpoints |
| NFS mount failures | Verify premium file share, NFS protocol enabled, network line-of-sight |

## Azure Files

| Problem | Fix |
|---------|-----|
| SMB mount fails from on-premises | Check port 445 open (ISPs often block); use VPN or Azure File Sync |
| Permission denied on mounted share | AD DS authentication misconfigured; check share-level and NTFS permissions |
| Azure Files performance slow | Check tier (Transaction Optimized vs Premium), IOPS limits, metadata-heavy ops |
| File Sync not syncing | Check sync agent version, server endpoint health, cloud tiering policy |

## Blob Storage

| Problem | Fix |
|---------|-----|
| Soft-deleted blobs consuming space | Soft delete retention policy still active; reduce retention or disable |
| Replication lag | Check replication type (LRS/GRS); GRS replication is asynchronous |
| Lifecycle management not running | Policy evaluation runs once per day; check rule filters and conditions |

## Performance

| Problem | Fix |
|---------|-----|
| Throttling (429/503 errors) | Exceeding IOPS or throughput limits; scale up account type or distribute load |
| High latency | Check storage account region vs client region; use premium tier for latency-sensitive |
| Egress charges unexpected | Review redundancy type (RA-GRS reads from secondary = egress); check CDN caching |

(source: support-azure-storage/*.md — 29 articles)

## Links

- [[comparisons/storage-options]] — choosing the right storage tier
- [[entities/azure-private-link]] — private endpoint for storage
- [[concepts/service-endpoints]] — VNet service endpoint for storage
