---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.Network/natgateways, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Bytes**<br><br>Total number of Bytes transmitted within time period |`ByteCount` |Bytes |Total (Sum) |`Protocol`, `Direction`|PT1M |No|
|**Datapath Availability**<br><br>NAT Gateway Datapath Availability |`DatapathAvailability` |Count |Average |\<none\>|PT1M |No|
|**Packets**<br><br>Total number of Packets transmitted within time period |`PacketCount` |Count |Total (Sum) |`Protocol`, `Direction`|PT1M |No|
|**Dropped Packets**<br><br>Count of dropped packets |`PacketDropCount` |Count |Total (Sum) |\<none\>|PT1M |No|
|**SNAT Connection Count**<br><br>Total concurrent active connections |`SNATConnectionCount` |Count |Total (Sum) |`Protocol`, `ConnectionState`|PT1M |No|
|**Total SNAT Connection Count**<br><br>Total number of active SNAT connections |`TotalConnectionCount` |Count |Total (Sum) |`Protocol`|PT1M |No|