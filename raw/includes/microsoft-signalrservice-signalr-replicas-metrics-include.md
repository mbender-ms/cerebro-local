---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.SignalRService/SignalR/replicas, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Errors
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**System Errors**<br><br>The percentage of system errors |`SystemErrors` |Percent |Maximum |\<none\>|PT1M |Yes|
|**User Errors**<br><br>The percentage of user errors |`UserErrors` |Percent |Maximum |\<none\>|PT1M |Yes|

### Category: Saturation
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Server Load**<br><br>SignalR server load. |`ServerLoad` |Percent |Minimum, Maximum, Average |\<none\>|PT1M |No|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Connection Close Count**<br><br>The count of connections closed by various reasons. |`ConnectionCloseCount` |Count |Total (Sum) |`Endpoint`, `ConnectionCloseCategory`|PT1M |Yes|
|**Connection Count**<br><br>The amount of user connection. |`ConnectionCount` |Count |Maximum |`Endpoint`|PT1M |Yes|
|**Connection Open Count**<br><br>The count of new connections opened. |`ConnectionOpenCount` |Count |Total (Sum) |`Endpoint`|PT1M |Yes|
|**Connection Quota Utilization**<br><br>The percentage of connection connected relative to connection quota. |`ConnectionQuotaUtilization` |Percent |Minimum, Maximum, Average |\<none\>|PT1M |Yes|
|**Inbound Traffic**<br><br>The inbound traffic of service |`InboundTraffic` |Bytes |Total (Sum) |\<none\>|PT1M |Yes|
|**Message Count**<br><br>The total amount of messages. |`MessageCount` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Outbound Traffic**<br><br>The outbound traffic of service |`OutboundTraffic` |Bytes |Total (Sum) |\<none\>|PT1M |Yes|
|**Server Connection Latency**<br><br>The latency of server connection in milliseconds |`ServerConnectionLatency` |Milliseconds |Minimum, Maximum, Average |\<none\>|PT1M |Yes|