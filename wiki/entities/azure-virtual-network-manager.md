---
title: Azure Virtual Network Manager
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-network-manager/overview.md
tags:
  - azure-service
  - networking
  - management
  - governance
---

# Azure Virtual Network Manager

Centralized management service for grouping, configuring, deploying, and managing VNets globally across subscriptions and tenants. Single pane of glass for network administration at scale. (source: overview.md)

## How It Works

1. **Define scope** — management group, subscription, or VNet level
2. **Create network groups** — logical groups of VNets (static or dynamic membership via Azure Policy)
3. **Define configurations** — connectivity (mesh, hub-spoke), security admin rules, routing (UDRs)
4. **Deploy** — apply configurations to network groups; changes propagate to all member VNets

(source: overview.md)

## Key Capabilities

| Feature | Description |
|---------|-------------|
| **Connectivity configs** | Hub-and-spoke or mesh topologies applied at scale |
| **Security admin rules** | Centralized NSG-like rules that take precedence over local NSGs; can't be overridden by VNet owners |
| **UDR management** | Centralized route tables applied to network groups (up to 1,000 routes vs 400 standard) |
| **IPAM** | IP address management — plan, allocate, track address space usage |
| **Network groups** | Dynamic membership via Azure Policy or static assignment |
| **Cross-tenant** | Manage VNets across Microsoft Entra tenants |
| **Verifier** | Verify reachability between resources before/after changes |

(source: overview.md)

## Use Cases

- Enforce security baselines across hundreds of VNets
- Deploy hub-spoke topologies at scale
- Manage IP address allocation across the organization
- Apply consistent routing policies globally

## Links

- [[entities/azure-virtual-network]] — the VNets it manages
- [[concepts/network-security-groups]] — security admin rules complement NSGs
- [[concepts/user-defined-routes]] — centralized UDR management
- [[sources/virtual-network-manager-docs]]
