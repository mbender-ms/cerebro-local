---
title: Azure Service Fabric
created: 2026-04-07
updated: 2026-04-07
sources:
  - service-fabric/*.md
tags:
  - azure-service
  - compute
  - microservices
  - containers
---

# Azure Service Fabric

Distributed systems platform for packaging, deploying, and managing scalable microservices and containers. Supports stateful and stateless services. Runs on Azure, on-premises, other clouds. (source: service-fabric-overview.md — 422 articles)

## Key Differentiators

- **Stateful services** — built-in reliable collections (dictionaries, queues) with automatic replication; no external database needed for state
- **Container orchestration** — deploy containers at high density (hundreds/thousands per machine)
- **Any OS, any cloud** — Windows/Linux; Azure, on-premises, AWS, your dev machine
- **Application lifecycle management** — full CI/CD integration; rolling upgrades with health monitoring

(source: service-fabric-overview.md)

## Programming Models

| Model | Description |
|-------|-------------|
| **Reliable Services** | Stateless or stateful services with Service Fabric APIs |
| **Reliable Actors** | Virtual actor pattern for concurrent, independent units of state |
| **Containers** | Deploy Docker containers (Windows or Linux) |
| **Guest executables** | Run any executable as a service (no SDK required) |

## Powers Microsoft Services

Azure SQL Database, Cosmos DB, Cortana, Power BI, Intune, Event Hubs, IoT Hub, Dynamics 365, Skype for Business, and many core Azure services run on Service Fabric. (source: service-fabric-overview.md)

## Links

- [[comparisons/compute-options]]
- [[entities/azure-container-instances]] — simpler container hosting
- [[sources/service-fabric-docs]]
