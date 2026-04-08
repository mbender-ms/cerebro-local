---
ms.topic: include
ms.date: 02/02/2026
ms.custom: Microsoft.Web/hostingEnvironments, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**CPU Percentage**<br><br>CPU used across all front end instances |`CpuPercentage` |Percent |Average |`Instance`|PT1M |Yes|
|**Disk Queue Length**<br><br>Number of both read and write requests that were queued on storage |`DiskQueueLength` |Count |Average |`Instance`|PT1M |Yes|
|**Memory Percentage**<br><br>Memory used across all front end instances |`MemoryPercentage` |Percent |Average |`Instance`|PT1M |Yes|
|**Total Front Ends**<br><br>Number of front end instances |`TotalFrontEnds` |Count |Average |\<none\>|PT1M |Yes|