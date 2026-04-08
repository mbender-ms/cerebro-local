---
title: Azure Arc
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-arc/*.md
tags:
  - azure-service
  - hybrid
  - multicloud
  - management
---

# Azure Arc

Extends Azure management and services to any infrastructure — on-premises, multicloud, and edge. Project resources from anywhere into Azure Resource Manager for unified management, governance, and security. (source: azure-arc/*.md — 459 articles)

## Arc-Enabled Resource Types

| Resource type | What it does |
|--------------|-------------|
| **Arc-enabled servers** | Manage Windows/Linux physical servers and VMs outside Azure as Azure resources |
| **Arc-enabled Kubernetes** | Attach external K8s clusters to Azure; deploy extensions, GitOps, policies |
| **Arc-enabled data services** | Run Azure SQL MI and PostgreSQL on any infrastructure |
| **Arc-enabled VMware vSphere** | Manage VMware VMs through Azure |
| **Arc-enabled SCVMM** | Manage System Center VMM resources through Azure |
| **Arc resource bridge** | Lightweight VM that connects on-premises infra to Azure (for VMware, SCVMM, etc.) |

## Key Capabilities

- **Azure Policy** — enforce compliance across hybrid resources
- **Azure RBAC** — consistent access control everywhere
- **GitOps (Flux v2 / Argo CD)** — declarative app deployment to Arc-enabled K8s
- **Cluster extensions** — deploy Azure services (Monitor, Defender, APIM) to Arc-enabled K8s
- **Custom locations** — create Azure deployment targets on your own infrastructure
- **Workload orchestration** — cross-platform edge workload deployment and management
- **Azure Monitor / Defender** — unified monitoring and security across hybrid

## Connected Machine Agent

Installed on each server to enable Arc management. Components: Himds (metadata), Extension Manager, Machine Configuration (DSC/policy). Communicates outbound to Azure over HTTPS (port 443). (source: agent-overview.md)

## Links

- [[comparisons/hybrid-edge-options]] — Arc in the hybrid/edge landscape
- [[concepts/azure-rbac]] — RBAC across hybrid resources
- [[entities/azure-aks]] — Arc-enabled K8s clusters
- [[entities/azure-kubernetes-fleet]] — Arc-enabled fleet members
- [[sources/azure-arc-docs]]
