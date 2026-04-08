---
ms.topic: include
ms.date: 03/27/2026
ms.custom: Microsoft.ResourceBuilder/workspaces/pipelines/jobs, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Job Execution**<br><br>Execution of a Job |`JobExecution` |Count |Count |`FinalState`|PT1M |Yes|
|**Job Latency**<br><br>Latency of a Job Execution |`JobLatency` |Seconds |Average, Maximum, Minimum |`FinalState`|PT1M |Yes|