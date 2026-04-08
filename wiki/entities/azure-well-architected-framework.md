---
title: Azure Well-Architected Framework (WAF)
created: 2026-04-07
updated: 2026-04-07
sources:
  - well-architected/*.md
tags:
  - azure-service
  - architecture
  - best-practices
  - framework
---

# Azure Well-Architected Framework (WAF)

A design framework for improving workload quality across five pillars of architectural excellence. Provides recommended practices, risk considerations, and tradeoffs. Centered on Azure but broadly applicable. (source: what-is-well-architected-framework.md — 224 articles)

## Five Pillars

| Pillar | Goal | Key question |
|--------|------|-------------|
| **[[concepts/waf-reliability]]** | Resilient, available, recoverable | Can the workload withstand failures? |
| **[[concepts/waf-security]]** | Secure as needed | Is the workload protected from threats? |
| **[[concepts/waf-cost-optimization]]** | Sufficient ROI | Are you spending wisely? |
| **[[concepts/waf-operational-excellence]]** | Responsible dev/ops | Can you operate the workload effectively? |
| **[[concepts/waf-performance-efficiency]]** | Meet demand within acceptable time | Does the workload perform under load? |

## Service Guides

WAF provides architecture best practices for 30+ Azure services:

| Category | Services |
|----------|----------|
| **Compute** | AKS, App Service, Functions, Container Apps, VMs |
| **Networking** | Front Door, Application Gateway, Load Balancer, Firewall, ExpressRoute, VNet |
| **Data** | Cosmos DB, SQL, PostgreSQL, MySQL, Storage (Blob, Files, Disks) |
| **Integration** | API Management, Event Grid, Event Hubs, Service Bus |
| **Other** | Key Vault, Azure Local, Azure VMware |

## Specialized Workload Guidance

| Workload | Description |
|----------|-------------|
| **Mission-critical** | Workloads where downtime has severe business impact; extreme reliability + DR |
| **AI/ML** | Architecture patterns for AI workloads (model serving, data pipelines, ops) |
| **SaaS** | Multi-tenant, subscription-based application patterns |
| **SAP on Azure** | SAP HANA + S/4HANA architecture guidance |
| **Azure VMware** | VMware workloads on Azure Stack HCI |
| **Azure Virtual Desktop** | Virtual desktop infrastructure patterns |
| **HPC** | High-performance computing workload architecture |
| **Sustainability** | Reduce environmental impact of cloud workloads |

## Assessment Tool

The [WAF Assessment](https://learn.microsoft.com/assessments/) provides a questionnaire-based review of your workload against all five pillars with actionable recommendations.

## Links

- [[concepts/waf-reliability]]
- [[concepts/waf-security]]
- [[concepts/waf-cost-optimization]]
- [[concepts/waf-operational-excellence]]
- [[concepts/waf-performance-efficiency]]
- [[sources/well-architected-docs]]
