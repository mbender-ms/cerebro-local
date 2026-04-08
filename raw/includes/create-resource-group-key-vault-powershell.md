---
author: msmbaldwin
ms.service: azure-key-vault
ms.topic: include
ms.date: 07/23/2025
ms.author: msmbaldwin 
ms.custom: devx-track-azurepowershell, devx-track-azurecli 
ms.devlang: azurecli

# Used by articles that use a precreated key vault

---

This quickstart uses a precreated Azure key vault. You can create a key vault by following the steps in these quickstarts:

- [Azure CLI quickstart](/azure/key-vault/general/quick-create-cli)
- [Azure PowerShell quickstart](/azure/key-vault/general/quick-create-powershell)
- [Azure portal quickstart](/azure/key-vault/general/quick-create-portal)

Alternatively, you can run these Azure PowerShell commands.

> [!Important]
> Each key vault must have a unique name. Replace `<vault-name>` with the name of your key vault in the following examples.

```azurepowershell
New-AzResourceGroup -Name "myResourceGroup" -Location "EastUS"

New-AzKeyVault -Name "<vault-name>" -ResourceGroupName "myResourceGroup" -Location "EastUS" -EnableRbacAuthorization $true
```

