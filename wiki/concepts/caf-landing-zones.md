---
title: Azure Landing Zones (CAF)
created: 2026-04-07
updated: 2026-04-07
sources:
  - cloud-adoption-framework/*.md
tags:
  - networking-concept
  - caf
  - landing-zones
  - governance
  - architecture
---

# Azure Landing Zones

Pre-configured Azure environment that provides the foundation for workload deployment. Implements enterprise-scale architecture patterns from the Cloud Adoption Framework. (source: cloud-adoption-framework/*.md)

## Design Areas

| Design area | What it covers |
|------------|----------------|
| **Azure billing and Entra tenants** | EA enrollment, subscription organization, tenant design |
| **Identity and access** | Entra ID, RBAC, PIM, conditional access, managed identity |
| **Resource organization** | Management groups, subscriptions, resource groups, naming, tagging |
| **Network topology** | Hub-spoke vs Virtual WAN, DNS, connectivity to on-premises |
| **Security** | Microsoft Defender, Sentinel, DDoS, encryption at rest/transit |
| **Governance** | Azure Policy, cost management, compliance, resource consistency |
| **Management** | Azure Monitor, Log Analytics, update management, backup |
| **Platform automation** | IaC (Bicep/Terraform), CI/CD, GitOps for platform |

## Network Topology Options

| Option | Architecture | Best for |
|--------|-------------|----------|
| **Hub-spoke** | Central hub VNet with shared services; spoke VNets peered to hub | Most enterprises; full control over routing |
| **Virtual WAN** | Microsoft-managed hub with automated routing | Large-scale branch connectivity; SD-WAN integration |

Both options integrate with [[entities/azure-firewall]], [[entities/azure-expressroute]], [[entities/azure-vpn-gateway]], and [[entities/azure-dns-private-resolver]].

## Subscription Vending

Automated creation of new subscriptions with pre-configured policies, networking, and RBAC. Enables self-service for application teams while maintaining governance.

## Accelerators

| Accelerator | Deployment |
|-------------|-----------|
| ALZ Bicep | Modular Bicep modules for landing zone deployment |
| ALZ Terraform | Terraform modules (hashicorp/azurerm) |
| ALZ Portal | Azure portal-based deployment experience |

## Links

- [[entities/cloud-adoption-framework]] — parent framework
- [[concepts/caf-governance]] — governance disciplines
- [[entities/azure-virtual-network]] — VNet for hub-spoke
- [[entities/azure-virtual-wan]] — managed hub option
- [[entities/azure-firewall]] — hub firewall
- [[patterns/nat-gateway-hub-spoke]] — NAT Gateway in hub-spoke
