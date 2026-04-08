---
ms.topic: include
ms.date: 03/23/2026
ms.custom: Microsoft.Monitor/pipelineGroups, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Logs exported(preview)**<br><br>Number of log records successfully sent by the exporter to the destination. |`exporter_sent_log_records` |Count |Total (Sum) |`instanceId`, `pipelineName`, `componentName`|PT1M |Yes|
|**CPU utilization(preview)**<br><br>The percentage of CPU utilized by the pipeline group process, normalized across all cores. |`process_cpu_utilization` |Percent |Average, Minimum, Maximum |`instanceId`|PT1M |Yes|
|**Memory used(preview)**<br><br>Total physical memory (resident set size) used by the pipeline group process. |`process_memory_usage` |Bytes |Average, Minimum, Maximum |`instanceId`|PT1M |Yes|
|**Process uptime(preview)**<br><br>Uptime of the pipeline group process since last start. |`process_uptime` |Seconds |Maximum |`instanceId`|PT1M |Yes|