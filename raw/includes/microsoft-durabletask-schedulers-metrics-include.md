---
ms.topic: include
ms.date: 01/20/2026
ms.custom: Microsoft.DurableTask/schedulers, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Basic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Activity Active Items**<br><br>Number of active work items being actively processed |`ActivityActiveItems` |Count |Total (Sum), Average, Maximum, Minimum |`TaskHubName`|PT1M |Yes|
|**Activity Pending Items**<br><br>Number of activity work items ready to be processed |`ActivityPendingItems` |Count |Total (Sum), Average, Maximum, Minimum |`TaskHubName`|PT1M |Yes|
|**Connected Workers**<br><br>Number of connected workers to a task hub |`ConnectedWorkers` |Count |Total (Sum), Average, Maximum, Minimum |`TaskHubName`|PT1M |Yes|
|**Data Used In Bytes**<br><br>Size of payloads table in bytes |`DataUsedInBytes` |Bytes |Total (Sum), Average, Maximum, Minimum |\<none\>|PT1M |Yes|
|**Entity Active Items**<br><br>Number of entity work items being actively processed |`EntityActiveItems` |Count |Total (Sum), Average, Maximum, Minimum |`TaskHubName`|PT1M |Yes|
|**Entity Pending Items**<br><br>Number of entity work items ready to be processed |`EntityPendingItems` |Count |Total (Sum), Average, Maximum, Minimum |`TaskHubName`|PT1M |Yes|
|**Orchestrator Active Items**<br><br>Number of orchestrator work items being actively processed |`OrchestratorActiveItems` |Count |Total (Sum), Average, Maximum, Minimum |`TaskHubName`|PT1M |Yes|
|**Orchestrator Pending Items**<br><br>Number of orchestrator work items ready to be processed |`OrchestratorPendingItems` |Count |Total (Sum), Average, Maximum, Minimum |`TaskHubName`|PT1M |Yes|