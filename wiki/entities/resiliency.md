---
title: Azure Resiliency (Business Continuity Center)
created: 2026-04-07
updated: 2026-04-07
sources:
  - resiliency/*.md
tags:
  - bcdr
  - backup
  - disaster-recovery
  - resiliency
---

# Azure Resiliency (Business Continuity Center)

Unified BCDR (Business Continuity and Disaster Recovery) management platform in Azure. Single pane of glass for managing backup, disaster recovery, zone resiliency, and cyber recovery across environments.

## Three Pillars

| Pillar | Description |
|--------|-------------|
| **Infrastructure Resiliency** | Protect from infrastructure outages with zone redundancy and HA |
| **Data Resiliency** | Backup and DR to meet RPO/RTO requirements |
| **Cyber Recovery** | Secure backups + at-scale recovery during ransomware/cyberattacks |

## Key Capabilities

- **Protection estate management** — view all protected/unprotected resources across subscriptions
- **Gap analysis** — identify resources without backup or replication
- **Policy management** — centralized protection policies across vaults
- **Action center** — at-scale operations (configure, monitor, remediate)
- **Security features** — immutability, soft delete, MUA, private endpoints, CMK
- **Multi-environment** — Azure, hybrid (Arc), edge, cross-region

## Replaces

Azure Business Continuity Center (ABCC), now expanded to include zone resiliency and high availability alongside traditional BCDR.

## Links

- [[concepts/waf-reliability]] — reliability pillar guidance
- [[comparisons/migration-services]] — Site Recovery for DR
- [[entities/azure-virtual-machines]] — primary protected workload type
