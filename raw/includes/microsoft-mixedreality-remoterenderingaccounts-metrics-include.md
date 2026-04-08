---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.MixedReality/remoteRenderingAccounts, arm

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Capacity
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Active Rendering Sessions**<br><br>Total number of active rendering sessions |`ActiveRenderingSessions` |Count |Average, Minimum, Maximum |`SessionType`, `SDKVersion`|PT1M, PT5M, PT1H, PT12H, P1D |Yes|
|**Assets Converted**<br><br>Total number of assets converted |`AssetsConverted` |Count |Total (Sum) |`SDKVersion`|PT1M, PT5M, PT1H, PT12H, P1D |Yes|