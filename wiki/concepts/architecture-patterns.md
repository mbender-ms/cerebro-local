---
title: Cloud Architecture Design Patterns
created: 2026-04-07
updated: 2026-04-07
sources:
  - architecture-center/*.md
tags:
  - networking-concept
  - architecture
  - patterns
  - design
---

# Cloud Architecture Design Patterns

Key design patterns from the Azure Architecture Center for building reliable, scalable, and secure cloud applications.

## Reliability Patterns

| Pattern | What it does |
|---------|-------------|
| **Bulkhead** | Isolate resources into pools so failure in one doesn't cascade |
| **Circuit Breaker** | Stop calling a failing dependency; allow recovery time |
| **Retry** | Handle transient failures by retrying with backoff |
| **Health Endpoint Monitoring** | Expose health check endpoints for load balancers and orchestrators |
| **Queue-Based Load Leveling** | Buffer requests with a queue to smooth traffic spikes |
| **Throttling** | Limit resource consumption to prevent overload |

## Scalability Patterns

| Pattern | What it does |
|---------|-------------|
| **CQRS** | Separate read/write stores for independent scaling |
| **Event Sourcing** | Append-only event log as source of truth |
| **Competing Consumers** | Multiple consumers process queue messages in parallel |
| **Sharding** | Partition data horizontally across stores |
| **Compute Resource Consolidation** | Combine multiple tasks into fewer compute instances |

## Integration Patterns

| Pattern | What it does |
|---------|-------------|
| **Ambassador** | Sidecar proxy for cross-cutting concerns (auth, retry, monitoring) |
| **Backends for Frontends** | Per-client-type API gateways |
| **Choreography** | Services coordinate via events (no central orchestrator) |
| **Saga** | Distributed transactions via compensating actions |
| **Asynchronous Request-Reply** | Decouple long-running operations from the request |
| **Gateway Aggregation** | Aggregate multiple backend calls into one client response |

## Migration Patterns

| Pattern | What it does |
|---------|-------------|
| **Strangler Fig** | Gradually replace legacy components while keeping the system running |
| **Anti-Corruption Layer** | Isolate new system from legacy with a translation layer |

## AI Patterns

| Pattern | What it does |
|---------|-------------|
| **RAG (Retrieval-Augmented Generation)** | Ground LLM responses with retrieved data |
| **AI Agent Orchestration** | Coordinate multiple AI agents for complex tasks |
| **Responsible AI** | Guardrails for safety, fairness, transparency |

## Links

- [[entities/azure-architecture-center]] — full pattern library
- [[concepts/waf-reliability]] — reliability principles these patterns implement
- [[concepts/waf-performance-efficiency]] — performance patterns
- [[comparisons/messaging-options]] — queue/event patterns use these services
