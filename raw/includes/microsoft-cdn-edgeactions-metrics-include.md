---
ms.topic: include
ms.date: 01/20/2026
ms.custom: Microsoft.Cdn/edgeactions, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Latency
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Action CPU Time**<br><br>CPU Time consumed by the action code. |`action_cpu_time_millis` |Milliseconds |Average |`result`, `error`|PT1M |Yes|
|**Action Execution Time**<br><br>Wall Time taken to execute the action code. |`action_execution_latency` |Milliseconds |Average |`result`, `error`|PT1M |Yes|