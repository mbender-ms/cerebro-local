---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.MixedReality/spatialAnchorsAccounts, arm

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Capacity
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Anchors Created**<br><br>Number of Anchors created |`AnchorsCreated` |Count |Total (Sum) |`DeviceFamily`, `SDKVersion`|PT5M, PT1H, PT12H, P1D |Yes|
|**Anchors Deleted**<br><br>Number of Anchors deleted |`AnchorsDeleted` |Count |Total (Sum) |`DeviceFamily`, `SDKVersion`|PT5M, PT1H, PT12H, P1D |Yes|
|**Anchors Queried**<br><br>Number of Spatial Anchors queried |`AnchorsQueried` |Count |Total (Sum) |`DeviceFamily`, `SDKVersion`|PT5M, PT1H, PT12H, P1D |Yes|
|**Anchors Updated**<br><br>Number of Anchors updated |`AnchorsUpdated` |Count |Total (Sum) |`DeviceFamily`, `SDKVersion`|PT5M, PT1H, PT12H, P1D |Yes|
|**Poses Found**<br><br>Number of Poses returned |`PosesFound` |Count |Total (Sum) |`DeviceFamily`, `SDKVersion`|PT5M, PT1H, PT12H, P1D |Yes|
|**Total Daily Anchors**<br><br>Total number of Anchors - Daily |`TotalDailyAnchors` |Count |Average, Total (Sum) |`DeviceFamily`, `SDKVersion`|P1D |Yes|