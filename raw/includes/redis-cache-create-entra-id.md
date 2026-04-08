---
title: "include file"
description: "include file"
services: redis-cache
author: flang-msft
ms.service: cache
ms.topic: "include"
ms.date: 05/07/2024
ms.author: franlanglois
ms.custom: "include file"
---

1. To create a cache, sign in to the [Azure portal](https://portal.azure.com). On the portal menu, select **Create a resource**.

    :::image type="content" source="../../../media/azure-cache-for-redis/create-resource.png" alt-text="Sceenshot that shows the Create a resource option highlighted on the left navigation pane in the Azure portal.":::

1. On the **Get Started** pane, enter **Azure Cache for Redis** in the search bar. In the search results, find **Azure Cache for Redis**, and then select **Create**.

    :::image type="content" source="../../../media/azure-cache-for-redis/select-cache.png" alt-text="Screenshot that shows Azure Marketplace with Azure Cache for Redis in the search box, and the Create button is highlighted.":::

1. On the **New Redis Cache** pane, on the **Basics** tab, configure the following settings for your cache:

   | Setting      | Action  | Description |
   | ------------ |  ------- | -------------------------------------------------- |
   | **Subscription** | Select your Azure subscription. | The subscription to use to create the new instance of Azure Cache for Redis. |
   | **Resource group** | Select a resource group, or select **Create new** and enter a new resource group name. | A name for the resource group in which to create your cache and other resources. By putting all your app resources in one resource group, you can easily manage or delete them together. |
   | **DNS name** | Enter a unique name. | The cache name must be a string of 1 to 63 characters that contains only numbers, letters, and hyphens. The name must start and end with a number or letter, and it can't contain consecutive hyphens. Your cache instance's *host name* is `\<DNS name>.redis.cache.windows.net`. |
   | **Location** | Select a location. | An [Azure region](https://azure.microsoft.com/regions/) that is near other services that use your cache. |
   | **Cache SKU** | Select a [SKU](https://azure.microsoft.com/pricing/details/cache/). | The SKU determines the size, performance, and feature parameters that are available for the cache. For more information, see [Azure Cache for Redis overview](/azure/azure-cache-for-redis/cache-overview). |
   | **Cache size** | Select a cache size. | For more information, see [Azure Cache for Redis overview](/azure/azure-cache-for-redis/cache-overview). |

1. Select the **Networking** tab or select **Next: Networking**.

1. On the **Networking** tab, select a connectivity method to use for the cache.

1. Select the **Advanced** tab or select **Next: Advanced**.

1. On the **Advanced** tab, select the **Microsoft Entra Authentication** checkbox to enable Microsoft Entra authentication.

    :::image type="content" source="../../../media/azure-cache-for-redis/create-resource-entra.png" alt-text="Screenshot showing the Advanced pane and the available option to select.":::

   > [!IMPORTANT]
   > For optimal security, we recommend that you use Microsoft Entra ID with managed identities to authorize requests against your cache if possible. Authorization by using Microsoft Entra ID and managed identities provides superior security and ease of use over shared access key authorization. For more information about using managed identities with your cache, see [Use Microsoft Entra ID for cache authentication](/azure/azure-cache-for-redis/cache-azure-active-directory-for-authentication).

1. (Optional) Select the **Tags** tab or select **Next: Tags**.

1. (Optional) On the **Tags** tab, enter a tag name and value if you want to categorize your cache resource.

1. Select the **Review + create** button.

   On the **Review + create** tab, Azure automatically validates your configuration.

1. After the green **Validation passed** message appears, select **Create**.

A new cache deployment occurs over several minutes. You can monitor the progress of the deployment on the Azure Cache for Redis Overview pane. When **Status** displays **Running**, the cache is ready to use.
