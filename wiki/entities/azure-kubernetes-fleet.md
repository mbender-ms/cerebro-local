---
title: Azure Kubernetes Fleet Manager
created: 2026-04-07
updated: 2026-04-07
sources:
  - kubernetes-fleet/*.md
tags:
  - azure-service
  - kubernetes
  - multi-cluster
  - management
---

# Azure Kubernetes Fleet Manager

At-scale management of multiple Kubernetes clusters. Provides automated safe multi-cluster updates, intelligent resource placement, and centralized monitoring. (source: kubernetes-fleet/overview.md — 58 articles)

## Key Capabilities

- **Multi-cluster updates** — orchestrated, staged upgrades across member clusters with configurable failure tolerance
- **Resource placement** — intelligent scheduling of Kubernetes resources across clusters based on cost, availability, or custom policies
- **Fleet-managed namespaces** — enforce resource quotas, network policies, and RBAC across clusters
- **Member cluster types** — join AKS clusters (cross-region, cross-subscription) + Arc-enabled Kubernetes clusters (preview)
- **Centralized monitoring** — aggregated health and update status across all member clusters

## Architecture

Fleet Manager acts as a hub. Member clusters register with the fleet. The fleet hub can:
1. Push update runs (Kubernetes version + node image upgrades) to members in stages
2. Place workloads across members based on scheduling policies
3. Propagate configurations (namespaces, policies) to all members

## Links

- [[entities/azure-aks]] — the clusters it manages
- [[concepts/troubleshooting-aks]] — AKS troubleshooting (includes fleet issues)
- [[sources/kubernetes-fleet-docs]]
