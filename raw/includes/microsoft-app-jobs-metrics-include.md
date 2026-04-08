---
ms.topic: include
ms.date: 08/28/2025
ms.custom: Microsoft.App/jobs, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Basic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Job Executions**<br><br>Executions run by the Container Apps Job |`Executions` |Count |Average, Total (Sum), Maximum, Minimum |`state`, `jobName`, `executionName`|PT1M |Yes|
|**Requested Bytes**<br><br>Container App Job memory requests of customer containers in bytes. |`RequestedBytes` |Bytes |Total (Sum), Average, Maximum, Minimum |`state`, `jobName`, `executionName`|PT1M |Yes|
|**Requested Cores**<br><br>Container App Job requested cpu in cores. |`RequestedCores` |Cores |Total (Sum), Average, Maximum, Minimum |`state`, `jobName`, `executionName`|PT1M |Yes|
|**Total Job Execution Restart Count**<br><br>The cumulative number of times container app job execution has restarted since it was created. |`RestartCount` |Count |Average, Total (Sum), Maximum, Minimum |`state`, `jobName`, `executionName`|PT1M |Yes|
|**Network In Bytes**<br><br>Network received bytes |`RxBytes` |Bytes |Average, Total (Sum), Maximum, Minimum |`state`, `jobName`, `executionName`|PT1M |Yes|
|**Network Out Bytes**<br><br>Network transmitted bytes |`TxBytes` |Bytes |Average, Total (Sum), Maximum, Minimum |`state`, `jobName`, `executionName`|PT1M |Yes|
|**Usage Bytes**<br><br>Container App Job memory used in bytes. |`UsageBytes` |Bytes |Total (Sum), Average, Maximum, Minimum |`state`, `jobName`, `executionName`|PT1M |Yes|
|**CPU Usage**<br><br>CPU consumed by the container app job, in nano cores. 1,000,000,000 nano cores = 1 core |`UsageNanoCores` |NanoCores |Total (Sum), Average, Maximum, Minimum |`state`, `jobName`, `executionName`|PT1M |Yes|