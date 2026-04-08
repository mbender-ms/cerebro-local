---
title: "Azure Governance"
created: 2026-04-07
updated: 2026-04-07
sources:
  - governance/*.md
tags:
  - governance
  - policy
  - management
  - compliance
---

# Azure Governance

Framework of Azure services for enforcing organizational standards, managing compliance, and controlling costs across Azure environments.

## Governance Services

| Service | Purpose |
|---------|---------|
| **Azure Policy** | Enforce rules on resource properties (deny, audit, modify, deploy-if-not-exists) |
| **Management Groups** | Organize subscriptions hierarchically; apply policies at scale |
| **Azure Blueprints** | Package policies, RBAC, templates for repeatable environment setup (retiring → deployment stacks) |
| **Cost Management** | Budget alerts, cost analysis, advisor recommendations |
| **Resource Locks** | Prevent accidental deletion or modification |
| **Tags** | Metadata for cost allocation, automation, and organization |
| **Privileged Identity Management** | Just-in-time role activation |

## Azure Policy Built-In Categories

Regulatory compliance initiatives: CIS, NIST 800-53, ISO 27001, PCI DSS, HIPAA, FedRAMP, Azure Security Benchmark.

## Links

- [[concepts/caf-governance]] — CAF governance methodology
- [[entities/cloud-adoption-framework]] — governance in CAF
- [[concepts/waf-security]] — security governance
- [[entities/azure-resource-manager]] — ARM as governance enforcement layer
