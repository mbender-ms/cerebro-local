---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.ManagedNetworkFabric/networkFabrics, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Interface Operational State
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**TS File Server Availability**<br><br>The availability status of the HttpFileServer running on the terminal server. Value 2 indicates that the HttpFileServer is accessible and 1 indicates that it is not accessible. |`NnfFileServer` |Unspecified |Average, Minimum, Maximum, Total (Sum), Count |`InterfaceName`, `HttpStatusCode`, `Url`|PT1M |Yes|
|**TS Ping Reachability**<br><br>The reachability status of terminal server interfaces through ICMP Ping. A value of 2 signifies that the interface is reachable, while a value of 1 indicates it is not reachable via ICMP Ping. |`TsPing` |Unspecified |Average, Minimum, Maximum, Total (Sum), Count |`InterfaceName`, `PingStatusCode`, `IpAddress`|PT1M |Yes|