---
ms.topic: include
ms.date: 08/28/2025
ms.custom: Microsoft.App/sessionpools, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Customer Container Session Pool
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Executing Sessions Count**<br><br>Number of executing session pods in the session pool |`PoolExecutingPodCount` |Count |Total (Sum), Average, Maximum, Minimum |`poolName`|PT1M |Yes|
|**Creating Sessions Count**<br><br>Number of creating session pods in the session pool |`PoolPendingPodCount` |Count |Total (Sum), Average, Maximum, Minimum |`poolName`|PT1M |Yes|
|**Ready Sessions Count**<br><br>Number of ready session pods in the session pool |`PoolReadyPodCount` |Count |Total (Sum), Average, Maximum, Minimum |`poolName`|PT1M |Yes|