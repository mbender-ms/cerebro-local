---
ms.topic: include
ms.date: 01/28/2026
ms.custom: Microsoft.OrionDB/clusters, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Availability
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Database Is Alive**<br><br>Indicates if the database process is running |`is_db_alive` |Count |Average, Maximum, Minimum |`ReplicaName`|PT1M |No|

### Category: Errors
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Failed Connections**<br><br>Failed Connections |`connections_failed` |Count |Total (Sum) |`ReplicaName`|PT1M |Yes|

### Category: Saturation
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**CPU percent**<br><br>Host CPU utilization percent |`cpu_percent` |Percent |Average, Maximum, Minimum |`ReplicaName`|PT1M |Yes|
|**Memory percent**<br><br>Host memory utilization percent |`memory_percent` |Percent |Average, Maximum, Minimum |`ReplicaName`|PT1M |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Active Connections**<br><br>Active Database Connections |`active_connections` |Count |Average, Maximum, Minimum |`ReplicaName`|PT1M |Yes|
|**Succeeded Connections**<br><br>Succeeded Connections |`connections_succeeded` |Count |Total (Sum) |`ReplicaName`|PT1M |Yes|
|**Max Connections**<br><br>Maximum Database connections configured in server parameters |`max_connections` |Count |Maximum |`ReplicaName`|PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Network Out**<br><br>Network Out across active connections |`network_bytes_egress` |Bytes |Total (Sum) |`ReplicaName`|PT1M |Yes|
|**Network In**<br><br>Network In across active connections |`network_bytes_ingress` |Bytes |Total (Sum) |`ReplicaName`|PT1M |Yes|