---
ms.topic: include
ms.date: 03/26/2025
author: mikefrobbins
ms.author: mirobb
ms.manager: jasongroce
ms.custom: devx-track-azurecli
ms.note: This include file is used by over 460 articles. Check with ms.author before making updates.
---

- Use the Bash environment in [Azure Cloud Shell](/azure/cloud-shell/overview). For more information, see [Get started with Azure Cloud Shell](/azure/cloud-shell/quickstart).

   [:::image type="icon" source="media/hdi-launch-cloud-shell.png" alt-text="Launch Azure Cloud Shell" :::](https://shell.azure.com)

- If you prefer to run CLI reference commands locally, [install](/cli/azure/install-azure-cli) the Azure CLI. If you're running on Windows or macOS, consider running Azure CLI in a Docker container. For more information, see [How to run the Azure CLI in a Docker container](/cli/azure/run-azure-cli-docker).

  - If you're using a local installation, sign in to the Azure CLI by using the [az login](/cli/azure/reference-index#az-login) command. To finish the authentication process, follow the steps displayed in your terminal. For other sign-in options, see [Authenticate to Azure using Azure CLI](/cli/azure/authenticate-azure-cli).

  - When you're prompted, install the Azure CLI extension on first use. For more information about extensions, see [Use and manage extensions with the Azure CLI](/cli/azure/azure-cli-extensions-overview).

  - Run [az version](/cli/azure/reference-index?#az-version) to find the version and dependent libraries that are installed. To upgrade to the latest version, run [az upgrade](/cli/azure/reference-index?#az-upgrade).
