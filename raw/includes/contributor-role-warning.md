---
author: msmbaldwin
ms.service: azure-key-vault
ms.topic: include
ms.date: 07/23/2025
ms.author: msmbaldwin

# Used by articles that discuss RBAC and the access permission model

---

> [!WARNING]
> For improved security, use the **Role-Based Access Control (RBAC) permission model** instead of access policies when managing Azure Key Vault. RBAC restricts permission management to only the 'Owner' and 'User Access Administrator' roles, ensuring a clear separation between security and administrative tasks. For more information, see [What is Azure RBAC?](/azure/role-based-access-control/overview) and the [Key Vault RBAC Guide](/azure/key-vault/general/rbac-guide).
> 
> With the Access Policy permission model, users with the `Contributor`, `Key Vault Contributor`, or any role that includes `Microsoft.KeyVault/vaults/write` permissions can grant themselves data plane access by configuring a Key Vault access policy. This can result in unauthorized access and management of your key vaults, keys, secrets, and certificates. To reduce this risk, limit Contributor role access to key vaults when using the Access Policy model.
