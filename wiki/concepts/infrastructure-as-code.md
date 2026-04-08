---
title: Infrastructure as Code on Azure
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-resource-manager/*.md
tags:
  - management
  - iac
  - bicep
  - arm
  - terraform
---

# Infrastructure as Code on Azure

Declarative definition and automated deployment of Azure resources. Three primary tools on Azure, each with different tradeoffs.

## Tool Comparison

| Feature | ARM Templates (JSON) | Bicep | Terraform |
|---------|---------------------|-------|-----------|
| Language | JSON | Domain-specific | HCL |
| Provider | Microsoft native | Microsoft native (compiles to ARM) | HashiCorp (third-party) |
| State management | Azure (implicit) | Azure (implicit) | Local file or remote backend |
| Multi-cloud | Azure only | Azure only | AWS, GCP, Azure, 1000+ providers |
| Modules | Linked/nested templates | First-class modules | First-class modules |
| What-if | ✅ | ✅ | `terraform plan` |
| Deployment scopes | RG, subscription, management group, tenant | Same | Provider-dependent |
| Learning curve | High (verbose JSON) | Low (clean syntax) | Medium |
| Azure portal integration | Export template, deploy | Deploy via CLI | No portal integration |
| Deployment stacks | ✅ | ✅ | N/A (uses state file) |

## Best Practices

1. **Use Bicep over ARM JSON** — same engine, cleaner syntax, better tooling
2. **Modularize** — reusable modules for common patterns (VNet, NSG, Key Vault)
3. **Parameter files** — separate config per environment (dev, staging, prod)
4. **What-if before deploy** — always preview changes
5. **Source control** — store templates in git, review via PR
6. **CI/CD integration** — deploy via GitHub Actions or Azure Pipelines

## Deployment Scopes

```
Tenant
└── Management Group
    └── Subscription
        └── Resource Group
            └── Resources
```

Each scope supports different resource types. Most deployments target resource group scope.

## Links

- [[entities/azure-resource-manager]] — ARM deployment service
- [[entities/cloud-adoption-framework]] — IaC in landing zone accelerators
- [[concepts/caf-governance]] — policy-as-code with ARM/Bicep
- [[concepts/waf-operational-excellence]] — IaC as operational best practice
