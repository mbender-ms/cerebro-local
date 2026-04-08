---
title: Registry and Artifact Services
created: 2026-04-07
updated: 2026-04-07
sources:
  - container-registry/*.md
  - api-center/*.md
tags:
  - containers
  - registry
  - comparison
---

# Registry and Artifact Services

Azure services for storing, managing, and distributing software artifacts.

## Service Comparison

| Feature | Container Registry (ACR) | API Center | Artifact Signing |
|---------|------------------------|------------|-----------------|
| **Stores** | Container images, Helm charts, OCI artifacts | API definitions (REST, GraphQL, gRPC) | Code/container signing metadata |
| **Purpose** | Build and deploy containers | API governance and discovery | Supply chain security |
| **Auth** | Entra ID, token, admin | Entra ID, RBAC | Entra ID, Notation |
| **Geo-replication** | ✅ (Premium) | ❌ | N/A |
| **Private access** | Private endpoints (Premium) | Private endpoints | N/A |
| **Integration** | AKS, ACI, App Service, Functions | APIM, developer portals | GitHub Actions, Azure Pipelines |

## ACR SKU Selection

| Need | SKU |
|------|-----|
| Dev/test, personal projects | Basic ($5/mo) |
| Team/production | Standard |
| Enterprise (geo-rep, private endpoints, content trust) | Premium |

## Links

- [[entities/azure-container-registry]] — ACR details
- [[entities/api-center]] — API governance
- [[entities/azure-aks]] — primary ACR consumer
- [[comparisons/container-compute-options]] — where images deploy
