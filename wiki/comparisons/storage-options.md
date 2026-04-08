---
title: Azure Storage Options
created: 2026-04-07
updated: 2026-04-07
sources:
  - storage/*.md
  - azure-netapp-files/*.md
  - hpc-cache/*.md
tags:
  - comparison
  - storage
---

# Azure Storage Options

## Core Azure Storage Services

| Service | Type | Best for | Access tiers |
|---------|------|----------|-------------|
| **Blob Storage** | Object store | Unstructured data, media, backups, data lake | Hot, Cool, Cold, Archive |
| **Azure Files** | Managed file shares | SMB/NFS shares, lift-and-shift | Hot, Cool, Transaction Optimized |
| **Azure Queue Storage** | Message queue | Simple async messaging between components | N/A |
| **Azure Table Storage** | NoSQL key-value | Semi-structured data, config, logs | N/A |
| **Azure Data Lake Storage Gen2** | Big data analytics | Hadoop-compatible hierarchical namespace on Blob | Hot, Cool, Archive |
| **Azure Managed Disks** | Block storage | VM OS and data disks | Premium SSD, Standard SSD, Standard HDD, Ultra |

## Specialized Storage

| Service | Purpose |
|---------|---------|
| [[entities/azure-netapp-files]] | Enterprise NFS/SMB file storage; sub-millisecond latency; SAP, HPC, databases |
| [[entities/hpc-cache]] | Caching layer for HPC workloads; aggregates NAS and blob sources |
| [[entities/storage-mover]] | Migrate files from on-premises NAS to Azure Storage |
| [[entities/databox]] | Physical devices for large-scale offline data transfer to Azure |

## Blob Access Tiers

| Tier | Access frequency | Min retention | Cost pattern |
|------|-----------------|---------------|-------------|
| **Hot** | Frequent | None | Low access cost, higher storage cost |
| **Cool** | Infrequent (30+ days) | 30 days | Lower storage, higher access |
| **Cold** | Rare (90+ days) | 90 days | Lower storage, higher access |
| **Archive** | Almost never (180+ days) | 180 days | Lowest storage, highest access + rehydration delay |
