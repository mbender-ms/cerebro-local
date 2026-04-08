---
ms.topic: include
ms.technology: devops-cicd
ms.manager: mijacobs
ms.author: jukullam
author: juliakm
ms.date: 02/13/2024
---

OpenID Connect is an authentication method that uses short-lived tokens. Setting up [OpenID Connect with GitHub Actions](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect) is more complex process that offers hardened security. 

1. If you do not have an existing application, register a [new Microsoft Entra ID application and service principal that can access resources](/azure/active-directory/develop/howto-create-service-principal-portal). 

    ```azurecli-interactive
    az ad app create --display-name myApp
    ```

    This command will output JSON with an `appId` that is your `client-id`. The `id` is `APPLICATION-OBJECT-ID` and it will be used for creating federated credentials with Graph API calls. Save the value to use as the `AZURE_CLIENT_ID` GitHub secret later.

1. Create a service principal. Replace the `$appID` with the appId from your JSON output. 

    This command generates JSON output with a service principal `id`. The service principal `id` is used as the value of the `--assignee-object-id` argument in the `az role assignment create` command in the next step. 

    Copy the `appOwnerOrganizationId` from the JSON output to use as a GitHub secret for `AZURE_TENANT_ID` later.

    ```azurecli-interactive
     az ad sp create --id $appId
    ```

1. Create a new role assignment for your service principal.  By default, the role assignment will be tied to your default subscription. Replace `$subscriptionId` with your subscription ID, `$resourceGroupName` with your resource group name, and `$servicePrincipalId` with the newly created service principal id.

    ```azurecli-interactive
    az role assignment create --role contributor --subscription $subscriptionId --assignee-object-id  $servicePrincipalId --assignee-principal-type ServicePrincipal --scope /subscriptions/$subscriptionId/resourceGroups/$resourceGroupName
    ```

1. Run the following command to [create a new federated identity credential](/azure/active-directory/workload-identities/workload-identity-federation-create-trust?pivots=identity-wif-apps-methods-azcli) for your Microsoft Entra ID application.

    * Replace `APPLICATION-OBJECT-ID` with the **objectId (generated while creating app)** for your Microsoft Entra ID application.
    * Set a value for `CREDENTIAL-NAME` to reference later.
    * Set the `subject`. The value of this is defined by GitHub depending on your workflow:
      * Jobs in your GitHub Actions environment: `repo:< Organization/Repository >:environment:< Name >`
      * For Jobs not tied to an environment, include the ref path for branch/tag based on the ref path used for triggering the workflow: `repo:< Organization/Repository >:ref:< ref path>`.  For example, `repo:n-username/ node_express:ref:refs/heads/my-branch` or `repo:n-username/ node_express:ref:refs/tags/my-tag`.
      * For workflows triggered by a pull request event: `repo:< Organization/Repository >:pull_request`.

    ```azurecli
    az ad app federated-credential create --id <APPLICATION-OBJECT-ID> --parameters credential.json
    ("credential.json" contains the following content)
    {
        "name": "<CREDENTIAL-NAME>",
        "issuer": "https://token.actions.githubusercontent.com",
        "subject": "repo:octo-org/octo-repo:environment:Production",
        "description": "Testing",
        "audiences": [
            "api://AzureADTokenExchange"
        ]
    }
    ```

To learn how to create an active directory application, service principal, and federated credentials in Azure portal, see [Connect GitHub and Azure](/azure/developer/github/connect-from-azure#use-the-azure-login-action-with-openid-connect).
