---
ms.topic: include
ms.technology: devops-cicd
ms.manager: mijacobs
ms.author: jukullam
author: juliakm
ms.date: 02/07/2025
---

 # [OpenID Connect](#tab/openid)

You need to provide your application's **Client ID**, **Directory (tenant) ID**, and **Subscription ID** to the login action. These values can either be provided directly in the workflow or can be stored in GitHub secrets and referenced in your workflow. Saving the values as GitHub secrets is the more secure option.

1. In [GitHub](https://github.com/), go to your repository.
1. Select **Security > Secrets and variables > Actions**.

    :::image type="content" source="../media/github-select-actions.png" alt-text="Screenshot of adding a secret":::

1. Select **New repository secret**.

    > [!NOTE]
    > To enhance workflow security in public repositories, use [environment secrets](https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment#environment-secrets) instead of repository secrets. If the environment requires approval, a job cannot access environment secrets until one of the required reviewers approves it.

1. Create secrets for `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, and `AZURE_SUBSCRIPTION_ID`. Copy these values from your Microsoft Entra application or user-assigned managed identity for your GitHub secrets:

    |GitHub secret  |Microsoft Entra application or user-assigned managed identity  |
    |---------|---------|
    |AZURE_CLIENT_ID    |    Client ID    |
    |AZURE_SUBSCRIPTION_ID     |    Subscription ID     |
    |AZURE_TENANT_ID    |    Directory (tenant) ID  |

    > [!NOTE]
    > For security reasons, we recommend using GitHub Secrets rather than passing values directly to the workflow.

# [Service principal](#tab/userlevel)

1. In [GitHub](https://github.com/), go to your repository.

1. Go to **Settings** in the navigation menu.

1. Select **Security > Secrets and variables > Actions**.

    :::image type="content" source="../media/github-select-actions.png" alt-text="Screenshot of adding a secret":::

1. Select **New repository secret**.

1. Paste the entire JSON output from the Azure CLI command into the secret's value field. Give the secret the name `AZURE_CREDENTIALS`.

1. Select **Add secret**.

---
