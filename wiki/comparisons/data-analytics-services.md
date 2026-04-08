---
title: Azure Data and Analytics Services
created: 2026-04-07
updated: 2026-04-07
sources:
  - data-factory/*.md
  - synapse-analytics/*.md
  - stream-analytics/*.md
  - hdinsight/*.md
  - event-hubs/*.md
tags:
  - comparison
  - analytics
---

# Azure Data and Analytics Services

## Decision Matrix

| Service | Pattern | Best for |
|---------|---------|----------|
| [[entities/data-factory]] | ETL/ELT orchestration | Data movement, transformation pipelines, 90+ connectors |
| [[entities/synapse-analytics]] | Unified analytics workspace | SQL pools + Spark + Data Explorer + Pipelines in one workspace |
| [[entities/stream-analytics]] | Real-time stream processing | SQL-like queries over streaming data (Event Hubs, IoT Hub) |
| [[entities/hdinsight]] | Managed open-source clusters | Hadoop, Spark, Kafka, HBase, Interactive Query |
| [[entities/event-hubs]] | Event ingestion | High-throughput event/telemetry ingestion (Kafka compatible) |

## Batch vs Stream Processing

| Dimension | Data Factory / Synapse | Stream Analytics |
|-----------|----------------------|-----------------|
| **Processing** | Batch (scheduled) | Real-time (continuous) |
| **Latency** | Minutes to hours | Seconds |
| **Query language** | Data flows / SQL / Spark | SQL (streaming extensions) |
| **Input** | Files, databases, APIs | Event Hubs, IoT Hub, Blob |
| **Best for** | ETL pipelines, data warehousing | Live dashboards, alerting, IoT processing |
