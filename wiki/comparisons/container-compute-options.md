---
title: Azure Container Compute Options
created: 2026-04-07
updated: 2026-04-07
sources:
  - container-instances/*.md
  - container-apps/*.md
  - virtual-machines/*.md
  - service-fabric/*.md
tags:
  - comparison
  - compute
  - containers
---

# Azure Container Compute Options

Choosing the right container hosting service.

## Decision Matrix

| Service | Abstraction | Orchestration | Scale to zero | Best for |
|---------|-------------|--------------|---------------|----------|
| **AKS** | Managed Kubernetes | Full K8s API | ❌ (min 1 node) | Complex microservices, K8s-native teams |
| [[entities/container-apps]] | Serverless containers | Dapr + KEDA | ✅ | HTTP APIs, event-driven microservices, background jobs |
| [[entities/azure-container-instances]] | Single container/group | None (or AKS virtual nodes) | ✅ | Simple tasks, burst from AKS, CI/CD agents |
| [[entities/azure-service-fabric]] | Microservices platform | Service Fabric runtime | ❌ | Stateful services, legacy .NET workloads |
| **App Service (containers)** | PaaS web hosting | None | ❌ | Web apps in containers with App Service features |

## AKS vs Container Apps vs ACI

| Dimension | AKS | Container Apps | ACI |
|-----------|-----|---------------|-----|
| **K8s API access** | ✅ Full | ❌ (abstracted) | ❌ |
| **Dapr** | Manual install | ✅ Built-in | ❌ |
| **KEDA scaling** | Manual install | ✅ Built-in | ❌ |
| **Ingress** | You configure (nginx, AGIC) | ✅ Built-in (Envoy) | Public IP only |
| **Service mesh** | Istio, Linkerd (manual) | ❌ | ❌ |
| **VNet integration** | ✅ (node subnet) | ✅ | ✅ (subnet delegation) |
| **GPU** | ✅ | ❌ | ✅ (limited) |
| **Scale to zero** | ❌ | ✅ | ✅ |
| **Min cost** | Node VMs always running | Per-use when scaled to 0 | Per-use |
| **Complexity** | Highest | Medium | Lowest |

## Links

- [[comparisons/compute-options]] — broader compute comparison
- [[concepts/troubleshooting-aks]] — AKS troubleshooting
- [[entities/azure-virtual-machines]] — VM alternative
