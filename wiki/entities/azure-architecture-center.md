---
title: Azure Architecture Center
created: 2026-04-07
updated: 2026-04-07
sources:
  - architecture-center/*.md
tags:
  - azure-service
  - architecture
  - patterns
  - reference-architectures
---

# Azure Architecture Center

Microsoft's library of architecture guidance, design patterns, reference architectures, and best practices for building solutions on Azure. (source: architecture-center/*.md — 526 articles)

## Content Categories

| Category | Articles | Description |
|----------|----------|-------------|
| **Guide** | 115 | Architecture design guidance across domains |
| **Example scenarios** | 77 | End-to-end solution architectures for specific use cases |
| **Design patterns** | 45 | Cloud design patterns (Gang of Four style for cloud) |
| **Reference architectures** | 36 | Proven, production-ready architecture blueprints |
| **AI/ML** | 38 | AI agent orchestration, ML pipelines, RAG, multitenancy |
| **Web apps** | 29 | Web application architecture patterns |
| **Data guide** | 23 | Data architecture, pipelines, storage selection |
| **AWS professional** | 21 | Azure equivalents for AWS services |
| **Solution ideas** | 22 | Quick-start architecture concepts |
| **Networking** | 17 | Network architecture patterns |
| **Databases** | 16 | Database architecture guidance |
| **Containers** | 15 | Container/Kubernetes architecture |
| **Microservices** | 13 | Microservice design and decomposition |
| **Best practices** | 13 | Cross-cutting best practices |
| **Hybrid** | 12 | Hybrid/multicloud architectures |
| **Anti-patterns** | 11 | Common mistakes and how to avoid them |

## Key Design Patterns

| Pattern | Problem it solves |
|---------|------------------|
| **Ambassador** | Offload cross-cutting concerns (auth, logging) to a sidecar |
| **Backends for Frontends** | Separate backends per client type (mobile, web, API) |
| **Bulkhead** | Isolate resources to prevent cascading failures |
| **CQRS** | Separate read and write models for complex domains |
| **Event Sourcing** | Store state changes as a sequence of events |
| **Choreography** | Decentralized coordination via events (no orchestrator) |
| **Competing Consumers** | Multiple consumers process messages from a queue |
| **Retry / Circuit Breaker** | Handle transient failures gracefully |
| **Strangler Fig** | Incrementally migrate legacy systems |
| **Saga** | Manage distributed transactions across microservices |

## Relationship to Other Frameworks

| Framework | Scope | Architecture Center role |
|-----------|-------|------------------------|
| [[entities/azure-well-architected-framework]] | Workload quality | Architecture Center implements WAF principles in concrete patterns |
| [[entities/cloud-adoption-framework]] | Organization cloud adoption | Architecture Center provides the technical blueprints |

## Links

- [[entities/azure-well-architected-framework]] — design quality framework
- [[entities/cloud-adoption-framework]] — adoption methodology
- [[concepts/architecture-patterns]] — key cloud design patterns
- [[sources/architecture-center-docs]]
