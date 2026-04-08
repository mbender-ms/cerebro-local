---
title: Azure Firewall Manager
created: 2026-04-07
updated: 2026-04-07
sources:
  - firewall-manager/overview.md
  - firewall-manager/policy-overview.md
tags:
  - azure-service
  - networking
  - security
  - management
---

# Azure Firewall Manager

Central security policy and route management for cloud-based security perimeters. Manages [[entities/azure-firewall]] policies across multiple firewalls, hub VNets, and secured virtual hubs (vWAN). (source: overview.md)

## Two Architecture Types

| Type | Description |
|------|-------------|
| **Secured virtual hub** | Azure Virtual WAN hub with Firewall Manager security policies |
| **Hub virtual network** | Standard Azure VNet with centralized firewall and security policies |

(source: overview.md)

## Firewall Policy

Hierarchical resource that contains NAT, network, application, and TLS inspection rule collections. Can be associated with multiple Azure Firewall instances. Supports inheritance — child policies inherit from parent and add local overrides. (source: policy-overview.md)

## Key Features

- Central policy management across subscriptions and regions
- Third-party SECaaS integration (security partners)
- Policy hierarchy with inheritance
- Centralized route management

## Links

- [[entities/azure-firewall]] — the firewalls it manages
- [[entities/azure-virtual-wan]] — secured virtual hub integration
- [[sources/firewall-manager-docs]]
- [[comparisons/firewall-sku-comparison]]
- [[concepts/virtual-wan-routing]]
