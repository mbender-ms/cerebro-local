---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.DBforPostgreSQL/serversv2, arm

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Saturation
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**CPU percent**<br><br>CPU percent |`cpu_percent` |Percent |Average, Maximum, Minimum |\<none\>|PT1M |Yes|
|**IOPS**<br><br>IO Operations per second |`iops` |Count |Average, Maximum, Minimum |\<none\>|PT1M |Yes|
|**Memory percent**<br><br>Memory percent |`memory_percent` |Percent |Average, Maximum, Minimum |\<none\>|PT1M |Yes|
|**Storage percent**<br><br>Storage percent |`storage_percent` |Percent |Average, Maximum, Minimum |\<none\>|PT1M |Yes|
|**Storage used**<br><br>Storage used |`storage_used` |Bytes |Average, Maximum, Minimum |\<none\>|PT1M |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Active Connections**<br><br>Active Connections |`active_connections` |Count |Average, Maximum, Minimum |\<none\>|PT1M |Yes|
|**Network Out**<br><br>Network Out across active connections |`network_bytes_egress` |Bytes |Total (Sum) |\<none\>|PT1M |Yes|
|**Network In**<br><br>Network In across active connections |`network_bytes_ingress` |Bytes |Total (Sum) |\<none\>|PT1M |Yes|