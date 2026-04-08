---
title: Azure Cloud Services (Extended Support)
created: 2026-04-07
updated: 2026-04-07
sources:
  - cloud-services-extended-support/*.md
tags:
  - compute
  - legacy
  - paas
  - migration
---

# Azure Cloud Services (Extended Support)

ARM-based deployment model for Cloud Services, replacing Cloud Services (classic). Provides feature parity with classic while adding ARM benefits (RBAC, tags, templates, deployment slots).

## Migration from Classic

Cloud Services (classic) is deprecated. Migration to extended support provides:
- ARM-based resource management
- Regional resiliency (availability zones)
- Same web/worker role model
- Minimal code changes required

## Key Differences from Classic

| Feature | Classic | Extended Support |
|---------|---------|-----------------|
| Resource Manager | ❌ | ✅ |
| RBAC | ❌ | ✅ |
| Tags | ❌ | ✅ |
| ARM templates | ❌ | ✅ |
| Availability zones | ❌ | ✅ |
| VNet injection | Limited | ✅ |

## Recommendation

For new workloads, use [[entities/azure-container-instances]], [[entities/azure-aks]], or App Service instead. Extended support is for migrating existing classic cloud services.

## Links

- [[comparisons/compute-options]] — modern compute alternatives
- [[comparisons/container-compute-options]] — container-based alternatives
