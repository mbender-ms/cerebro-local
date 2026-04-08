---
ms.topic: include
ms.technology: devops-cicd
ms.manager: mijacobs
ms.author: jukullam
author: juliakm
ms.date: 10/25/2022
---

Use a [personal access token](/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate) (PAT) to connect your GitHub account to Azure DevOps. You can generate a PAT from within Azure DevOps and then store it as a GitHub secret. Within your GitHub workflow, reference the secret so that your GitHub action can authenticate with your Azure DevOps project. 

1. Open your GitHub repository and go to **Settings**.

1. Select **Security > Secrets and variables > Actions**.

    :::image type="content" source="../media/github-select-actions.png" alt-text="Choose to add a secret":::

3. Paste in your PAT and give it the name `AZURE_DEVOPS_TOKEN`.

4. Select **Add secret**.
