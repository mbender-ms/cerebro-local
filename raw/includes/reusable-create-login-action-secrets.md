---
ms.topic: include
ms.technology: devops-cicd
ms.manager: mijacobs
ms.author: jukullam
author: juliakm
ms.date: 02/13/2024
---

You need to provide your application's **Client ID**, **Tenant ID** and **Subscription ID** to the login action. These values can either be provided directly in the workflow or can be stored in GitHub secrets and referenced in your workflow. Saving the values as GitHub secrets is the more secure option.

1. Open your GitHub repository and go to **Settings**.

    :::image type="content" source="../media/github-secrets-nav-item.png" alt-text="Select Settings in the navigation":::

1. Select **Security > Secrets and variables > Actions**.

    :::image type="content" source="../media/github-select-actions.png" alt-text="Choose to add a secret":::

1. Create secrets for `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, and `AZURE_SUBSCRIPTION_ID`. Use these values from your Microsoft Entra application for your GitHub secrets:

    |GitHub secret  | Microsoft Entra application  |
    |---------|---------|
    |AZURE_CLIENT_ID     |      Application (client) ID   |
    |AZURE_TENANT_ID     |     Directory (tenant) ID    |
    |AZURE_SUBSCRIPTION_ID     |     Subscription ID    |

1. Save each secret by selecting **Add secret**.