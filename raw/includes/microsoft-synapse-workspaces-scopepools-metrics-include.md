---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.Synapse/workspaces/scopePools, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: SCOPE pool
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**PN duration of SCOPE job**<br><br>PN (process node) duration (Milliseconds) used by each SCOPE job |`ScopePoolJobPNMetric` |Milliseconds |Maximum, Minimum, Average, Total (Sum), Count |`JobType`, `JobResult`|PT1M |Yes|
|**Queued duration of SCOPE job**<br><br>Queued duration (Milliseconds) used by each SCOPE job |`ScopePoolJobQueuedDurationMetric` |Milliseconds |Maximum, Minimum, Average, Total (Sum), Count |`JobType`|PT1M |Yes|
|**Running duration of SCOPE job**<br><br>Running duration (Milliseconds) used by each SCOPE job |`ScopePoolJobRunningDurationMetric` |Milliseconds |Maximum, Minimum, Average, Total (Sum), Count |`JobType`, `JobResult`|PT1M |Yes|