---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.SignalRService/WebPubSub/replicas, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Saturation
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Server Load**<br><br>WebPubSub server load. |`ServerLoad` |Percent |Minimum, Maximum, Average |\<none\>|PT1M |No|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Client Request Status Code**<br><br>The status code of client connection requests. |`ClientRequestStatus` |Count |Total (Sum) |`ClientType`, `Status`|PT1M |Yes|
|**Connection Close Count**<br><br>The count of connections closed by various reasons. |`ConnectionCloseCount` |Count |Total (Sum) |`ConnectionCloseCategory`|PT1M |Yes|
|**Connection Open Count**<br><br>The count of new connections opened. |`ConnectionOpenCount` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Connection Quota Utilization**<br><br>The percentage of connection connected relative to connection quota. |`ConnectionQuotaUtilization` |Percent |Minimum, Maximum, Average |\<none\>|PT1M |Yes|
|**Inbound Traffic**<br><br>The traffic originating from outside to inside of the service. It is aggregated by adding all the bytes of the traffic. |`InboundTraffic` |Bytes |Total (Sum) |\<none\>|PT1M |Yes|
|**Outbound Traffic**<br><br>The traffic originating from inside to outside of the service. It is aggregated by adding all the bytes of the traffic. |`OutboundTraffic` |Bytes |Total (Sum) |\<none\>|PT1M |Yes|
|**Rest API Response Time**<br><br>The response time of REST API request categorized by endpoint. |`RestApiResponseTimeCount` |Count |Total (Sum) |`ResponseTime`, `RestApiCategory`|PT1M |Yes|
|**Connection Count**<br><br>The number of user connections established to the service. It is aggregated by adding all the online connections. |`TotalConnectionCount` |Count |Maximum, Average |\<none\>|PT1M |Yes|