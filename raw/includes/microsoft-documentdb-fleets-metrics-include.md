---
ms.topic: include
ms.date: 06/03/2025
ms.custom: Microsoft.DocumentDB/fleets, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Requests
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Fleetspace Autoscaled Throughput (Preview)**<br><br>The throughput scaled to by the fleetspace pool within the time range. |`FleetspaceAutoscaledThroughput` |Count |Maximum |`Region`, `FleetspaceName`|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|