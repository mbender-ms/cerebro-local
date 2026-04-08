---
ms.topic: include
ms.technology: devops-cicd
ms.manager: mijacobs
ms.author: jukullam
author: juliakm
ms.date: 10/25/2022
---

1. In [GitHub](https://github.com/), go to your repository.

1. Go to **Settings** in the navigation menu.

1. Select **Security > Secrets and variables > Actions**.

    :::image type="content" source="../media/github-select-actions.png" alt-text="Screenshot of select Actions menu item. ":::

1. Select **New repository secret**.

1. Paste the entire JSON output from the Azure CLI command into the secret's value field. Give the secret the name `AZURE_CREDENTIALS`.

1. Select **Add secret**.
