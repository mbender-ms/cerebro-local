---
title: "Azure Storage"
created: 2026-04-07
updated: 2026-04-07
sources:
  - storage/*.md
tags:
  - storage
  - blob
  - files
  - queue
  - table
---

# Azure Storage

Massively scalable, durable cloud storage. Four data services under one storage account.

## Storage Services

| Service | Type | Protocol | Use Case |
|---------|------|----------|----------|
| **Blob Storage** | Object store | REST, SDKs | Unstructured data (images, documents, backups, data lake) |
| **Azure Files** | Managed file shares | SMB 3.x, NFS 4.1 | Lift-and-shift file servers, shared config |
| **Queue Storage** | Message queue | REST, SDKs | Async message processing between services |
| **Table Storage** | NoSQL key-value | REST, OData | Semi-structured data (logs, telemetry) |

## Blob Access Tiers

| Tier | Access Pattern | Storage Cost | Access Cost |
|------|---------------|-------------|-------------|
| **Hot** | Frequent | Higher | Lower |
| **Cool** | Infrequent (30+ days) | Lower | Higher |
| **Cold** | Rare (90+ days) | Lower still | Higher still |
| **Archive** | Long-term (180+ days) | Lowest | Highest (rehydration required) |

## Redundancy Options

| Option | Copies | Scope | Durability |
|--------|--------|-------|------------|
| LRS | 3 | Single datacenter | 11 nines |
| ZRS | 3 | 3 availability zones | 12 nines |
| GRS | 6 | Primary + paired region | 16 nines |
| GZRS | 6 | 3 zones + paired region | 16 nines |

## Key Features

- **Data Lake Storage Gen2** — hierarchical namespace on Blob for big data analytics
- **Lifecycle management** — automatic tier transitions based on age/access
- **Immutable storage** — WORM (write once, read many) for compliance
- **Soft delete** — recover accidentally deleted blobs
- **Private endpoints** — access over private IP
- **Customer-managed keys** — bring your own encryption key
- **Object replication** — async replication between storage accounts
- **Static website hosting** — host static sites directly from Blob

## Links

- [[comparisons/storage-options]] — full storage comparison
- [[entities/azure-private-link]] — private access to storage
- [[concepts/waf-cost-optimization]] — storage tiering for cost
