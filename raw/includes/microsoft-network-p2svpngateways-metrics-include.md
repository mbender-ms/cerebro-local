---
ms.topic: include
ms.date: 04/16/2025
ms.custom: microsoft.network/p2svpngateways, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Routing
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**User Vpn Route Count**<br><br>Count of P2S User Vpn routes learned by gateway |`UserVpnRouteCount` |Count |Total (Sum) |`RouteType`, `Instance`|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Gateway P2S Bandwidth**<br><br>Point-to-site bandwidth of a gateway in bytes per second |`P2SBandwidth` |BytesPerSecond |Average |`Instance`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**P2S Connection Count**<br><br>Point-to-site connection count of a gateway |`P2SConnectionCount` |Count |Total (Sum) |`Protocol`, `Instance`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|