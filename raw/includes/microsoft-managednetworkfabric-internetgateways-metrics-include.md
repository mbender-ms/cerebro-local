---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.ManagedNetworkFabric/internetGateways, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Proxy Connection Metrics
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Inbound active connections**<br><br>Count of inbound active connections |`InboundConnectionsActive` |Count |Average, Maximum, Minimum |`nfcId`, `gatewayType`|PT1M |Yes|
|**Total inbound connections**<br><br>Count of inbound connections |`InboundConnectionsTotal` |Count |Average, Maximum, Minimum |`nfcId`, `gatewayType`|PT1M |Yes|
|**Total outbound active connections**<br><br>Count of outbound active connections |`OutboundConnectionsActive` |Count |Average, Maximum, Minimum |`nfcId`, `gatewayType`|PT1M |Yes|
|**Total outbound failed connections**<br><br>Count of outbound total failed connections |`OutboundConnectionsFail` |Count |Average, Maximum, Minimum |`nfcId`, `gatewayType`|PT1M |Yes|
|**Total outbound connection timeouts**<br><br>Count of outbound connection timeouts |`OutboundConnectionsTimeout` |Count |Average, Maximum, Minimum |`nfcId`, `gatewayType`|PT1M |Yes|
|**Total outbound connections**<br><br>Count of outbound total connections |`OutboundConnectionsTotal` |Count |Average, Maximum, Minimum |`nfcId`, `gatewayType`|PT1M |Yes|