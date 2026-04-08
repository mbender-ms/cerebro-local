---
title: Azure Messaging and Eventing Options
created: 2026-04-07
updated: 2026-04-07
sources:
  - event-grid/*.md
  - event-hubs/*.md
  - service-bus-messaging/*.md
  - notification-hubs/*.md
  - azure-relay/*.md
  - azure-signalr/*.md
tags:
  - comparison
  - integration
  - messaging
---

# Azure Messaging and Eventing Options

## Decision Matrix

| Service | Pattern | Best for | Throughput | Protocol |
|---------|---------|----------|-----------|----------|
| [[entities/service-bus-messaging]] | Message queue + pub/sub | Enterprise messaging, ordered delivery, transactions | Moderate | AMQP, HTTP |
| [[entities/event-hubs]] | Event streaming | Telemetry ingestion, big data pipelines | Millions/sec | AMQP, Kafka, HTTP |
| [[entities/event-grid]] | Event routing | Reactive event-driven architectures, Azure events | Massive (serverless) | HTTP (CloudEvents) |
| [[entities/notification-hubs]] | Push notifications | Mobile push at scale | Millions/sec | Platform-native |
| [[entities/azure-relay]] | Hybrid relay | Expose on-premises to cloud without firewall changes | Moderate | WCF, HTTP |
| [[entities/azure-signalr]] | Real-time messaging | WebSocket, Server-Sent Events, live dashboards | High | WebSocket, HTTP |

## Service Bus vs Event Hubs vs Event Grid

| Dimension | Service Bus | Event Hubs | Event Grid |
|-----------|-------------|------------|------------|
| **Pattern** | Queue / Topic-subscription | Stream (append-only log) | Pub/sub routing |
| **Delivery** | At-least-once, FIFO, transactions | At-least-once, partitioned | At-least-once, retry + dead-letter |
| **Retention** | Until consumed (or TTL) | Time-based (1–90 days) | 24 hours (retry) |
| **Consumer model** | Competing consumers | Consumer groups (independent readers) | Push to subscribers (webhooks, Functions, etc.) |
| **Ordering** | ✅ (sessions) | ✅ (per-partition) | ❌ (best-effort) |
| **Kafka compatible** | ❌ | ✅ | ❌ |
| **Use case** | Business workflows, command processing | Telemetry, IoT, log aggregation | Azure resource events, custom reactive |
