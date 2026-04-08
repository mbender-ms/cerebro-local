---
title: include file
description: include file
services: container-registry
ms.service: azure-container-registry
ms.topic: include
author: rayoef
ms.author: rayoflores
ms.date: 02/10/2026
ms.custom: include file
---

| Resource | Basic | Standard | Premium |
|---|---|---|---|
| Included storage<sup>1</sup> (GiB) | 10 | 100 | 500 |
| Storage limit (TiB) | 40 | 40 | 100 |
| Maximum image layer size (GiB) | 200 | 200 | 200 |
| Maximum manifest size (MiB) | 4 | 4 | 4 |
| Webhooks | 2 | 10 | 500 |
| Private link with private endpoints | N/A | N/A | [Supported][plink] |
| &bull; Private endpoints | N/A | N/A | 200 |
| Public IP network rules | N/A | N/A | 200 |
| Service endpoint VNet access | N/A | N/A | [Preview][vnet] |
| &bull; Virtual network rules | N/A | N/A | 100 |
| Repository-scoped permissions with Microsoft Entra role assignments | [Supported][abac] | [Supported][abac] | [Supported][abac] |
| Repository-scoped permissions with non-Microsoft Entra tokens and scope maps | [Supported][token] | [Supported][token] | [Supported][token] |
| &bull; Non-Microsoft Entra tokens | 100 | 500 | 50,000 |
| &bull; Non-Microsoft Entra token scope maps | 100 | 500 | 50,000 |
| &bull; Actions per non-Microsoft Entra token scope map | 500 | 500 | 500 |
| &bull; Repositories per non-Microsoft Entra token scope map<sup>2</sup> | 500 | 500 | 500 |
| Anonymous pull access | N/A | [Supported][anonymous-pull-access] | [Supported][anonymous-pull-access] |
| Geo-replication | N/A | N/A | [Supported][geo-replication] |
| Dedicated data endpoints | N/A | N/A | [Supported][dde] |
| Availability zones | [Supported][zones] | [Supported][zones] | [Supported][zones] |
| Content trust | N/A | N/A | [Supported][content-trust] |
| Customer-managed keys | N/A | N/A | [Supported][cmk] |
| Connected registries | N/A | N/A | [Supported][connreg] |
| Artifact streaming | N/A | N/A | [Supported][artstream] |
| Artifact cache rules | N/A | [Supported][artc] | [Supported][artc] |
| IP access rule configuration | N/A | N/A | [Supported][rules] |
| Retention policy for untagged manifests | N/A | N/A | [Supported][retention] |
| Artifact transfer | N/A | N/A | [Supported][arttrans] |
| Export policy | N/A | N/A | [Supported][export] |
| Dedicated agent pools for Tasks | N/A | N/A | [Supported][tasks] |

<sup>1</sup> Storage included in the daily rate for each tier. Additional storage may be used, up to the registry storage limit, at an additional daily rate per GiB. For rate information, see [Azure Container Registry pricing][pricing]. If you need storage beyond the registry storage limit, please contact Azure Support.

<sup>2</sup> Individual *actions* of `content/delete`, `content/read`, `content/write`, `metadata/read`, `metadata/write` correspond to the limit of repositories per non-Microsoft Entra token scope map.

<!-- LINKS - External -->
[pricing]: https://azure.microsoft.com/pricing/details/container-registry/

<!-- LINKS - Internal -->
[geo-replication]: /azure/container-registry/container-registry-geo-replication
[content-trust]: /azure/container-registry/container-registry-content-trust
[vnet]: /azure/container-registry/container-registry-vnet
[plink]: /azure/container-registry/container-registry-private-link
[cmk]: /azure/container-registry/tutorial-enable-customer-managed-keys
[abac]: /azure/container-registry/container-registry-rbac-abac-repository-permissions
[token]: /azure/container-registry/container-registry-repository-scoped-permissions
[zones]: /azure/container-registry/zone-redundancy
[anonymous-pull-access]: /azure/container-registry/anonymous-pull-access
[connreg]: /azure/container-registry/intro-connected-registry
[artc]: /azure/container-registry/artifact-cache-overview
[rules]: /azure/container-registry/container-registry-access-selected-networks
[artstream]: /azure/container-registry/container-registry-artifact-streaming
[dde]: /azure/container-registry/container-registry-dedicated-data-endpoints
[retention]: /azure/container-registry/container-registry-retention-policy
[arttrans]: /azure/container-registry/container-registry-transfer-prerequisites
[export]: /azure/container-registry/data-loss-prevention
[tasks]: /azure/container-registry/tasks-agent-pools
