---
ms.topic: include
ms.technology: devops-cicd
ms.manager: mijacobs
ms.author: jukullam
author: juliakm
ms.date: 02/07/2025
---

# [OpenID Connect](#tab/openid)

To use [Azure Login action](https://github.com/marketplace/actions/azure-login) with OIDC, you need to configure a federated identity credential on a Microsoft Entra application or a user-assigned managed identity.

**Option 1: Microsoft Entra application**

* Create a Microsoft Entra application with a service principal by [Azure portal](/entra/identity-platform/howto-create-service-principal-portal#register-an-application-with-microsoft-entra-id-and-create-a-service-principal), [Azure CLI](/cli/azure/azure-cli-sp-tutorial-1#create-a-service-principal), or [Azure PowerShell](/powershell/azure/create-azure-service-principal-azureps#create-a-service-principal).
*  Copy the values for **Client ID**, **Subscription ID**, and **Directory (tenant) ID** to use later in your GitHub Actions workflow.
* Assign an appropriate role to your service principal by [Azure portal](/entra/identity-platform/howto-create-service-principal-portal#assign-a-role-to-the-application), [Azure CLI](/cli/azure/azure-cli-sp-tutorial-5#create-or-remove-a-role-assignment), or [Azure PowerShell](/powershell/azure/create-azure-service-principal-azureps#manage-service-principal-roles).
* [Configure a federated identity credential on a Microsoft Entra application](/entra/workload-id/workload-identity-federation-create-trust) to trust tokens issued by GitHub Actions to your GitHub repository. 

**Option 2: User-assigned managed identity**

* [Create a user-assigned managed identity](/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities#create-a-user-assigned-managed-identity).
*  Copy the values for **Client ID**, **Subscription ID**, and **Directory (tenant) ID** to use later in your GitHub Actions workflow.
* [Assign an appropriate role to your user-assigned managed identity](/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities#manage-access-to-user-assigned-managed-identities).
* [Configure a federated identity credential on a user-assigned managed identity](/entra/workload-id/workload-identity-federation-create-trust-user-assigned-managed-identity) to trust tokens issued by GitHub Actions to your GitHub repository.

# [Service principal](#tab/userlevel)

* Create a Microsoft Entra application with a service principal by [Azure portal](/entra/identity-platform/howto-create-service-principal-portal#register-an-application-with-microsoft-entra-id-and-create-a-service-principal), [Azure CLI](/cli/azure/azure-cli-sp-tutorial-1#create-a-service-principal), or [Azure PowerShell](/powershell/azure/create-azure-service-principal-azureps#create-a-service-principal).
* Create a client secret for your service principal by [Azure portal](/entra/identity-platform/howto-create-service-principal-portal#option-3-create-a-new-client-secret), [Azure CLI](/cli/azure/azure-cli-sp-tutorial-2?branch=main#create-a-service-principal-containing-a-password), or [Azure PowerShell](/powershell/azure/create-azure-service-principal-azureps?#password-based-authentication).
* Copy the values for **Client ID**, **Client Secret**, **Subscription ID**, and **Directory (tenant) ID** to use later in your GitHub Actions workflow.
* Assign an appropriate role to your service principal by [Azure portal](/entra/identity-platform/howto-create-service-principal-portal#assign-a-role-to-the-application), [Azure CLI](/cli/azure/azure-cli-sp-tutorial-5#create-or-remove-a-role-assignment), or [Azure PowerShell](/powershell/azure/create-azure-service-principal-azureps#manage-service-principal-roles).
---