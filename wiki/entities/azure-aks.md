---
title: Azure Kubernetes Service (AKS)
created: 2026-04-07
updated: 2026-04-07
sources:
  - aks/*.md
tags:
  - azure-service
  - compute
  - kubernetes
  - containers
---

# Azure Kubernetes Service (AKS)

Managed Kubernetes service. Deploy and manage containerized applications with minimal orchestration expertise. Azure handles control plane management, upgrades, patching, and scaling. (source: what-is-aks.md — 551 articles)

## Key Features

| Category | Features |
|----------|----------|
| **Identity & security** | Entra ID integration, Kubernetes RBAC, Azure Policy guardrails, confidential nodes |
| **Networking** | Multiple CNI options (overlay/flat), network policies, application routing (nginx), service mesh (Istio) |
| **Scaling** | Cluster autoscaler, horizontal pod autoscaler, KEDA (event-driven), virtual nodes (ACI burst) |
| **Storage** | Azure Disks CSI, Azure Files CSI, Azure NetApp Files, Azure Container Storage |
| **Monitoring** | Container Insights, Advanced Container Networking Services, Prometheus/Grafana |
| **Nodes** | Multi-node-pools, mixed OS (Linux + Windows), GPU nodes, spot nodes, ARM64 |
| **Development** | Helm, VS Code extension, Draft, GitHub Actions, Azure DevOps integration |

## Networking Models

| Model | CNI Plugin | How pods get IPs | Best for |
|-------|-----------|-----------------|----------|
| **Overlay** | Azure CNI Overlay | Private CIDR (separate from VNet) | Most workloads; simpler IP management |
| **Flat** | Azure CNI (VNet) | IPs from VNet subnet | Pod IPs visible to external services |
| **Flat (pod subnet)** | Azure CNI + pod subnet | Dedicated subnet for pods | Large clusters needing VNet-routable pod IPs |
| **Kubenet** | kubenet | Private CIDR + UDRs | Simple, small clusters |
| **BYO CNI** | Calico, Cilium, etc. | Plugin-dependent | Custom networking requirements |

(source: concepts-network-cni-overview.md)

## Security Layers

| Layer | Mechanism |
|-------|-----------|
| **Build** | Image scanning, supply chain integrity |
| **Registry** | ACR with private endpoint, content trust |
| **Cluster** | Entra ID auth, Kubernetes RBAC, Azure Policy |
| **Node** | Node OS updates, node image upgrades, AKS-managed patching |
| **Network** | Network policies (Calico/Azure/Cilium), NSGs, private cluster |
| **Application** | Pod identity (workload identity), secrets management (Key Vault CSI) |

(source: concepts-security.md)

## Storage Options

| Driver | Backend | Access mode | Best for |
|--------|---------|-------------|----------|
| Azure Disks CSI | Managed Disks | ReadWriteOnce | Databases, stateful single-pod workloads |
| Azure Files CSI | Azure Files | ReadWriteMany | Shared config, CMS, multi-pod access |
| Azure NetApp Files | NetApp | ReadWriteMany | High-performance, low-latency file shares |
| Azure Container Storage | Multiple backends | ReadWriteOnce/Many | Managed volume orchestration (preview) |

(source: concepts-storage.md)

## Links

- [[concepts/aks-networking]] — networking models, CNI options, egress control
- [[concepts/troubleshooting-aks]] — support article compilation (189 articles)
- [[comparisons/container-compute-options]] — AKS vs Container Apps vs ACI
- [[entities/azure-kubernetes-fleet]] — multi-cluster management
- [[entities/azure-application-network]] — AKS application networking (preview)
- [[sources/aks-docs]]
