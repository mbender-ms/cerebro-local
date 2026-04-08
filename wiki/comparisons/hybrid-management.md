---
title: Azure Hybrid Management
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-arc/*.md
  - lighthouse/*.md
  - copilot/*.md
  - azure-portal/*.md
tags:
  - comparison
  - hybrid
  - management
---

# Azure Hybrid Management

Services for managing resources across Azure, on-premises, multicloud, and edge.

## Decision Matrix

| Service | Scope | Best for |
|---------|-------|----------|
| [[entities/azure-arc]] | Hybrid/multicloud (servers, K8s, data, VMware) | Extend Azure management to any infrastructure |
| [[entities/azure-lighthouse]] | Multi-tenant Azure | Service providers managing customer tenants |
| [[entities/azure-copilot]] | All Azure resources | AI-assisted management, troubleshooting, optimization |
| [[entities/azure-portal-quotas]] | All Azure resources | Web console, quota management |
| [[entities/azure-virtual-network-manager]] | Multi-VNet governance | Centralized network policies across VNets |

## Arc vs Traditional Azure Management

| Dimension | Azure-native resources | Arc-enabled resources |
|-----------|----------------------|---------------------|
| **Location** | Azure datacenters | Anywhere (on-prem, AWS, GCP, edge) |
| **Management plane** | Azure Resource Manager | Azure Resource Manager (via Arc agent) |
| **Policy** | Azure Policy | Azure Policy (via Arc) |
| **Monitoring** | Azure Monitor | Azure Monitor (via Arc extensions) |
| **Security** | Defender for Cloud | Defender for Cloud (via Arc) |
| **Agent required** | No | Yes (Connected Machine agent / Arc K8s agent) |

## Links

- [[comparisons/hybrid-edge-options]] — infrastructure options
- [[concepts/azure-rbac]] — access control across hybrid
- [[concepts/azure-operations-management]] — operational tools
