---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.ClusterStor/nodes, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Availability
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**TotalCapacityUsed**<br><br>The total capacity used in lustre file system |`TotalCapacityUsed` |Bytes |Average |`filesystem_name`, `category`, `system`|PT1M |No|
|**TotalRead**<br><br>The total lustre file system read per second |`TotalRead` |BytesPerSecond |Average |`filesystem_name`, `category`, `system`|PT1M |No|
|**TotalWrite**<br><br>The total lustre file system write per second |`TotalWrite` |BytesPerSecond |Average |`filesystem_name`, `category`, `system`|PT1M |No|
|**TotalCapacityAvailable**<br><br>The total capacity available in lustre file system |`TotalCapacityAvailable` |Bytes |Average |`filesystem_name`, `category`, `system`|PT1M |No|