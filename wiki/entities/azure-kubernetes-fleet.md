---
title: Azure Kubernetes Fleet Manager
created: 2026-04-07
updated: 2026-04-07
sources:
  - kubernetes-fleet/*.md
tags:
  - kubernetes
  - multi-cluster
  - fleet
  - aks
---

# Azure Kubernetes Fleet Manager

At-scale management of multiple Kubernetes clusters. Provides automated safe multi-cluster updates, intelligent resource placement, and centralized monitoring.

## Key Capabilities

| Feature | Description |
|---------|-------------|
| **Update orchestration** | Safely apply Kubernetes version and node image upgrades across clusters |
| **Resource placement** | Intelligently deploy workloads across member clusters based on labels/properties |
| **Managed namespaces** | Enforce resource quotas, network policies, RBAC at namespace level across clusters |
| **Auto-upgrade profiles** | Automatically trigger upgrades when new versions are published |
| **DNS load balancing** | Load balance incoming traffic across service endpoints on multiple clusters (preview) |
| **Automated deployments** | Stage resources from Git repos to Fleet hub cluster (preview) |

## Member Cluster Types

- **AKS clusters** — across regions and subscriptions
- **Arc-enabled Kubernetes** — across clouds and on-premises (preview)

## Update Orchestration

Safe multi-cluster updates with:
- **Update runs** — define which clusters update and in what order
- **Update strategies** — reusable strategies attached to update runs
- **Update groups and stages** — control timing and ordering
- **Manual/automated approvals** — fine-grained control over when updates apply (preview)
- **Auto-upgrade profiles** — triggered by new Kubernetes/node image versions

## Resource Placement

Fleet hub cluster acts as control plane for multi-cluster workload deployment:
- **Cluster-scoped placement** — deploy resources to member clusters based on cluster labels
- **Namespace-scoped placement** — more granular resource propagation
- Scheduling based on: resource availability, cluster labels, affinity/anti-affinity

## Architecture

```
Fleet Manager (Hub)
├── Member Cluster A (AKS, East US)
├── Member Cluster B (AKS, West Europe)
├── Member Cluster C (Arc, on-premises)
└── Member Cluster D (AKS, Southeast Asia)
```

Hub cluster enables: centralized policy, resource propagation, update coordination.

## Links

- [[entities/azure-aks]] — primary member cluster type
- [[entities/azure-arc]] — Arc-enabled K8s as fleet members
- [[concepts/aks-networking]] — networking within member clusters
- [[comparisons/container-compute-options]] — when to use AKS Fleet vs other container platforms
