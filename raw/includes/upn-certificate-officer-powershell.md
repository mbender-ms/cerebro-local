---
author: msmbaldwin
ms.service: azure-key-vault
ms.topic: include
ms.date: 03/30/2026

ms.author: msmbaldwin

# Used by articles that show how to assign a Key Vault access policy

---

To gain permissions to your key vault through [Role-Based Access Control (RBAC)](/azure/key-vault/general/rbac-guide), assign a role to your "User Principal Name" (UPN) using the Azure PowerShell cmdlet [New-AzRoleAssignment](/powershell/module/az.resources/new-azroleassignment).

```azurepowershell
New-AzRoleAssignment -SignInName "<upn>" -RoleDefinitionName "Key Vault Certificates Officer" -Scope "/subscriptions/<subscription-id>/resourceGroups/myResourceGroup/providers/Microsoft.KeyVault/vaults/<vault-name>"
```

Replace `<upn>`, `<subscription-id>`, and `<vault-name>` with your actual values. If you used a different resource group name, replace "myResourceGroup" as well. Your UPN will typically be in the format of an email address (e.g., username@domain.com).
