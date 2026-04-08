---
ms.topic: include
ms.date: 04/16/2025
ms.custom: microsoft.bing/accounts, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Errors
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Client Errors**<br><br>Number of calls with any client error (HTTP status code 4xx) |`ClientErrors` |Count |Total (Sum) |`ApiName`, `ServingRegion`, `StatusCode`|PT1M |Yes|
|**Server Errors**<br><br>Number of calls with any server error (HTTP status code 5xx) |`ServerErrors` |Count |Total (Sum) |`ApiName`, `ServingRegion`, `StatusCode`|PT1M |Yes|
|**Total Errors**<br><br>Number of calls with any error (HTTP status code 4xx or 5xx) |`TotalErrors` |Count |Total (Sum) |`ApiName`, `ServingRegion`, `StatusCode`|PT1M |Yes|

### Category: Latency
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Latency**<br><br>Latency in milliseconds |`Latency` |Milliseconds |Average, Minimum, Maximum |`ApiName`, `ServingRegion`, `StatusCode`|PT1M |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Blocked Calls**<br><br>Number of calls that exceeded the rate or quota limit |`BlockedCalls` |Count |Total (Sum) |`ApiName`, `ServingRegion`, `StatusCode`|PT1M |Yes|
|**Data In**<br><br>Incoming request Content-Length in bytes |`DataIn` |Bytes |Total (Sum) |`ApiName`, `ServingRegion`, `StatusCode`|PT1M |Yes|
|**Data Out**<br><br>Outgoing response Content-Length in bytes |`DataOut` |Bytes |Total (Sum) |`ApiName`, `ServingRegion`, `StatusCode`|PT1M |Yes|
|**Successful Calls**<br><br>Number of successful calls (HTTP status code 2xx) |`SuccessfulCalls` |Count |Total (Sum) |`ApiName`, `ServingRegion`, `StatusCode`|PT1M |Yes|
|**Total Calls**<br><br>Total number of calls |`TotalCalls` |Count |Total (Sum) |`ApiName`, `ServingRegion`, `StatusCode`|PT1M |Yes|