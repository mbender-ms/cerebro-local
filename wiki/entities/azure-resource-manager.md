---
title: Azure Resource Manager (ARM)
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-resource-manager/*.md
tags:
  - management
  - arm
  - bicep
  - templates
  - infrastructure-as-code
---

# Azure Resource Manager (ARM)

The deployment and management service for Azure. Provides a consistent management layer for creating, updating, and deleting Azure resources via Azure portal, CLI, PowerShell, SDKs, and REST APIs.

## Key Concepts

| Concept | Description |
|---------|-------------|
| **Resource** | A manageable item (VM, VNet, storage account, etc.) |
| **Resource group** | Container that holds related resources |
| **Subscription** | Billing and access boundary |
| **Management group** | Container for organizing subscriptions |
| **Resource provider** | Service that supplies resources (e.g., Microsoft.Compute) |

## ARM Templates (JSON)

Declarative Infrastructure-as-Code. Define resources, dependencies, parameters, outputs in JSON format.

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "resources": [{ "type": "Microsoft.Network/virtualNetworks", ... }]
}
```

## Bicep

Domain-specific language that compiles to ARM JSON. Simpler syntax, modules, and better tooling.

```bicep
resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: 'myVNet'
  location: resourceGroup().location
  properties: { addressSpace: { addressPrefixes: ['10.0.0.0/16'] } }
}
```

## Deployment Scopes

| Scope | Deploy To |
|-------|----------|
| **Resource group** | Resources within a single RG |
| **Subscription** | Resource groups + subscription-level resources |
| **Management group** | Policies across subscriptions |
| **Tenant** | Management groups, subscriptions |

## Key Features

- **Idempotent deployments** — same template produces same result
- **Dependency management** — automatic resource ordering
- **What-if** — preview changes before deploying
- **Deployment stacks** — manage lifecycle of grouped resources
- **Template specs** — version and share templates as Azure resources
- **Deployment scripts** — run custom scripts during deployment
- **Export template** — generate template from existing resources

## Links

- [[entities/cloud-adoption-framework]] — ARM in CAF landing zones
- [[concepts/caf-governance]] — governance via ARM policies
- [[entities/azure-well-architected-framework]] — ARM best practices across pillars
