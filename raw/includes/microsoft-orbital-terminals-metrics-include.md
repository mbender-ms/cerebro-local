---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.Orbital/terminals, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Error
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**SDWAN alarms**<br><br>SDWAN alarms |`JuniperAlarm` |Count |Total (Sum), Count |`category`, `id`, `message`, `node`, `number`, `process`, `router`, `severity`, `shelvedReason`, `source`, `time`|PT1M |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Satcom SDWAN bandwidth**<br><br>Satcom SDWAN bandwidth in bytes per second |`JuniperSsrBandwidthBytesPerSecond` |BytesPerSecond |Average |\<none\>|PT1M |Yes|
|**Satcom SDWAN bytes**<br><br>Satcom SDWAN total bytes |`JuniperSsrBytes` |Bytes |Average |\<none\>|PT1M |Yes|
|**Satcom SDWAN packet loss**<br><br>Satcom SDWAN total packets lost |`JuniperSsrPacketLoss` |Count |Average |\<none\>|PT1M |Yes|
|**Satcom VPN gateway incoming bytes**<br><br>Satcom VPN gateway total incoming bytes |`TunnelIncomingTotalBytes` |Bytes |Average |\<none\>|PT1M |Yes|
|**Satcom VPN gateway outgoing bytes**<br><br>Satcom VPN gateway total outgoing bytes |`TunnelOutgoingTotalBytes` |Bytes |Average |\<none\>|PT1M |Yes|
|**Satcom VPN gateway bandwidth**<br><br>Satcom VPN gateway bandwidth in bytes per second |`TunnelTotalBandwidthBytesPerSecond` |BytesPerSecond |Average |\<none\>|PT1M |Yes|