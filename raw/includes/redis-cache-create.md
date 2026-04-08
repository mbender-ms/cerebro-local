---
title: "include file"
description: "include file"
services: redis-cache
author: flang-msft
ms.service: cache
ms.topic: "include"
ms.date: 06/11/2025
ms.author: franlanglois
ms.custom: "include file"
---

1. In the [Azure portal](https://portal.azure.com), search for and select **Azure Cache for Redis**.
1. On the **Azure Cache for Redis** page, select **Create** > **Azure Cache for Redis**.

1. On the **Basics** tab of the **New Redis Cache** page, configure the following settings:

   - **Subscription**: Select the subscription to use.
   - **Resource group**: Select a resource group, or select **Create new** and enter a new resource group name. Putting all your app resources in the same resource group lets you easily manage or delete them together.
   - **Name**: Enter a cache name that's unique in the region. The name must:
     - Be a string of 1 to 63 characters.
     - Contain only numbers, letters, and hyphens.
     - Start and end with a number or letter.
     - Not contain consecutive hyphens.
   - **Region**: Select an [Azure region](https://azure.microsoft.com/regions/) near other services that use your cache.
   - **Cache SKU**: Select a [SKU](https://azure.microsoft.com/pricing/details/cache/) to determine the available sizes, performance, and features for your cache.
   - **Cache size**: Select a cache size. For more information, see [Azure Cache for Redis overview](/azure/azure-cache-for-redis/cache-overview).

   :::image type="content" source="../../../media/azure-cache-for-redis/select-cache.png" alt-text="Screenshot that shows the Basics tab of the New Redis Cache page.":::

1. Select the **Networking** tab, or select **Next: Networking**.
1. On the **Networking** tab, select a connectivity method to use for the cache. **Private Endpoint** is recommended for security. If you select **Private Endpoint**, select **Add private endpoint** and create the private endpoint.
1. Select the **Advanced** tab, or select **Next: Advanced**.
1. On the **Advanced** pane, configure the following options:
   - Select **Microsoft Entra Authentication** or **Access Keys Authentication**. **Microsoft Entra Authentication** is enabled by default.
   - Choose whether to **Enable** the non-TLS port.
   - For a Premium cache, you can configure or disable **Availability zones**. You can't disable availability zones after the cache is created. For a Standard cache, availability zones are allocated automatically. Availability zones aren't available for Basic SKU.
   - For a Premium cache, configure the settings for **Replica count**, **Clustering** and **Shard count**, **System-assigned managed identity**, and **Data persistence**.

   The following image shows the **Advanced** tab for the Standard SKU.

   :::image type="content" source="../../../media/azure-cache-for-redis/cache-redis-version.png" alt-text="Screenshot showing the Advanced pane for a Standard SKU cache.":::

   > [!IMPORTANT]
   > Use Microsoft Entra ID with managed identities to authorize requests against your cache if possible. Authorization using Microsoft Entra ID and managed identity provides better security and is easier to use than shared access key authorization. For more information about using managed identities with your cache, see [Use Microsoft Entra ID for cache authentication](/azure/azure-cache-for-redis/cache-azure-active-directory-for-authentication).

1. Optionally, select the **Tags** tab or select **Next: Tags**, and enter tag names and values to categorize your cache resources.

1. Select **Review + create**, and once validation passes, select **Create**.

The new cache deployment takes several minutes. You can monitor deployment progress on the portal Azure Cache for Redis page. When the cache **Status** displays **Running**, the cache is ready to use.
