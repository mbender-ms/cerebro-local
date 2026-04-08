---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.Storage/storageAccounts/storageTasks, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Transaction
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Objects operated count**<br><br>The number of objects operated in storage task |`ObjectsOperatedCount` |Count |Total (Sum) |`AccountName`, `TaskAssignmentId`|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Objects failed count**<br><br>The number of objects failed in storage task |`ObjectsOperationFailedCount` |Count |Total (Sum) |`AccountName`, `TaskAssignmentId`|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Objects targed count**<br><br>The number of objects targeted in storage task |`ObjectsTargetedCount` |Count |Total (Sum) |`AccountName`, `TaskAssignmentId`|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|