---
title: Azure Integration and API Services
created: 2026-04-07
updated: 2026-04-07
sources:
  - api-management/*.md
  - logic-apps/*.md
  - event-grid/*.md
  - service-connector/*.md
  - connectors/*.md
tags:
  - comparison
  - integration
---

# Azure Integration and API Services

## Decision Matrix

| Service | Pattern | Best for |
|---------|---------|----------|
| [[entities/api-management]] | API gateway + developer portal | API lifecycle management, throttling, auth, monetization |
| [[entities/logic-apps]] | Low-code workflow orchestration | Business process automation, SaaS integration, B2B |
| [[entities/azure-functions]] | Event-driven code execution | Custom integration logic, triggers, bindings |
| [[entities/event-grid]] | Event routing fabric | Reactive event-driven architecture, Azure events |
| [[entities/data-factory]] | ETL/ELT pipelines | Data movement and transformation at scale |
| [[entities/service-connector]] | Connection helper | Simplify connecting compute to backing services (auth + config) |
| [[entities/connectors]] | Pre-built connectors | 600+ connectors for Logic Apps and Power Platform |

## API Management vs Azure Functions vs App Service

| Dimension | API Management | Functions | App Service |
|-----------|---------------|-----------|-------------|
| **Role** | Gateway/facade | Backend logic | Backend hosting |
| **Rate limiting** | ✅ Built-in | ❌ (custom) | ❌ (custom) |
| **Developer portal** | ✅ | ❌ | ❌ |
| **Policy engine** | ✅ (transform, validate, cache) | ❌ | ❌ |
| **Direct execution** | ❌ (routes to backend) | ✅ | ✅ |

Typical pattern: API Management → Azure Functions or App Service backend.
