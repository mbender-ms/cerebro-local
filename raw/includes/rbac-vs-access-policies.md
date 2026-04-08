---
author: msmbaldwin
ms.service: azure-key-vault
ms.topic: include
ms.date: 07/23/2025
ms.author: msmbaldwin
---

[Azure role-based access control (RBAC)](/azure/role-based-access-control/overview) is Microsoft's recommended approach for controlling access to Key Vault. It provides superior security through better separation of duties and more granular control compared to the legacy access policies. If your Key Vault was created with RBAC authorization disabled, you'll need to either use the legacy access policy method or create a new Key Vault with RBAC authorization enabled. For more information, see [Azure RBAC vs. access policies](/azure/key-vault/general/rbac-access-policy).
