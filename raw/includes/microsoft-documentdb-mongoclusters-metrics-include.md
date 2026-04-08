---
ms.topic: include
ms.date: 03/02/2026
ms.custom: Microsoft.DocumentDB/mongoClusters, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Latency
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Mongo request duration**<br><br>The end-to-end duration in milliseconds of client Mongo DB requests handled by the Mongo cluster. Updated every 60 seconds. |`MongoRequestDurationMs` |Milliseconds |Average, Count, Maximum, Minimum, Total (Sum) |`Authentication`, `CollectionName`, `DatabaseName`, `ErrorCode`, `Operation`, `Protocol`, `ServerName`, `StatusCode`, `StatusCodeClass`, `StatusText`|PT1M |Yes|

### Category: Saturation
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Autoscale Utilization percent**<br><br>Percent Autoscale utilization |`AutoscaleUtilizationPercent` |Percent |Average, Maximum, Minimum |\<none\>|PT1M |Yes|
|**Committed Memory percent**<br><br>Percentage of Commit Memory Limit allocated by applications on node |`CommittedMemoryPercent` |Percent |Average, Maximum, Minimum |`ServerName`|PT1M |Yes|
|**CPU percent**<br><br>Percent CPU utilization on node |`CpuPercent` |Percent |Average, Maximum, Minimum |`ServerName`|PT1M |Yes|
|**Memory percent**<br><br>Percent memory utilization on node |`MemoryPercent` |Percent |Average, Maximum, Minimum |`ServerName`|PT1M |Yes|
|**Storage percent**<br><br>Percent of available storage used on node |`StoragePercent` |Percent |Average, Maximum, Minimum |`ServerName`|PT1M |Yes|
|**Storage used**<br><br>Quantity of available storage used on node |`StorageUsed` |Bytes |Average, Maximum, Minimum |`ServerName`|PT1M |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**IOPS**<br><br>Disk IO operations per second on node |`IOPS` |Count |Average, Maximum, Minimum |`ServerName`|PT1M |Yes|