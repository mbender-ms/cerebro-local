---
title: Azure Compute Options
created: 2026-04-07
updated: 2026-04-07
sources:
  - app-service/*.md
  - azure-functions/*.md
  - container-apps/*.md
  - batch/*.md
  - spring-apps/*.md
  - static-web-apps/*.md
tags:
  - comparison
  - compute
---

# Azure Compute Options

Choosing the right compute service for your workload.

## Decision Matrix

| Service | Model | Best for | Scaling | Language/Runtime |
|---------|-------|----------|---------|-----------------|
| [[entities/app-service]] | PaaS (web apps) | Web apps, APIs, mobile backends | Auto/manual | .NET, Java, Node, Python, PHP, Ruby |
| [[entities/azure-functions]] | Serverless (event-driven) | Event processing, microservices, scheduled tasks | Auto (to zero) | .NET, Java, Node, Python, PowerShell |
| [[entities/container-apps]] | Serverless containers | Microservices, APIs, background jobs | Auto (to zero), KEDA | Any container |
| [[entities/batch]] | Managed batch compute | HPC, parallel workloads, rendering | Auto pool scaling | Any (VM-based) |
| [[entities/spring-apps]] | Managed Spring | Java Spring Boot apps | Auto | Java Spring |
| [[entities/static-web-apps]] | Static + serverless API | SPAs, static sites, JAMstack | Auto | JS frameworks + Functions API |
| [[entities/cloud-shell]] | Browser-based shell | Ad-hoc management, scripting | N/A | Bash, PowerShell |

## Key Comparisons

### App Service vs Container Apps vs Functions

| Dimension | App Service | Container Apps | Functions |
|-----------|-------------|---------------|-----------|
| Pricing | Always-on (plan-based) | Per-use or dedicated | Per-execution or plan |
| Scale to zero | ❌ | ✅ | ✅ (Consumption/Flex) |
| Container support | ✅ (custom containers) | ✅ (native) | ✅ (custom handler) |
| Dapr integration | ❌ | ✅ | ❌ |
| Networking | VNet integration | VNet integration | VNet integration (Flex/Premium) |
| Custom domains + SSL | ✅ | ✅ | ✅ |
