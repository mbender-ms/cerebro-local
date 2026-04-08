---
ms.topic: include
ms.date: 01/20/2026
ms.custom: Microsoft.Cdn/profiles, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Latency
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Origin Latency**<br><br>The time calculated from when the request was sent by AFDX edge to the backend until AFDX received the last response byte from the backend. |`OriginLatency` |MilliSeconds |Average |`Origin`, `Endpoint`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Total Latency**<br><br>The time calculated from when the client request was received by the HTTP/S proxy until the client acknowledged the last response byte from the HTTP/S proxy |`TotalLatency` |MilliSeconds |Average |`HttpStatus`, `HttpStatusGroup`, `ClientRegion`, `ClientCountry`, `Endpoint`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|

### Category: Origin Health
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Origin Health Percentage**<br><br>The percentage of successful health probes from AFDX to backends. |`OriginHealthPercentage` |Percent |Average |`Origin`, `OriginGroup`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|

### Category: Request Status
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Byte Hit Ratio**<br><br>This is the ratio of the total bytes served from the cache compared to the total response bytes |`ByteHitRatio` |Percent |Average |`Endpoint`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Percentage of 4XX**<br><br>The percentage of all the client requests for which the response status code is 4XX |`Percentage4XX` |Percent |Average |`Endpoint`, `ClientRegion`, `ClientCountry`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Percentage of 5XX**<br><br>The percentage of all the client requests for which the response status code is 5XX |`Percentage5XX` |Percent |Average |`Endpoint`, `ClientRegion`, `ClientCountry`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Active Websocket Connections**<br><br>The number of active WebSocket connection |`ActiveWebSocketConnections` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Average WebSocket Connection Duration**<br><br>The average time taken by WebSocket connection |`AverageWebSocketConnectionDuration` |MilliSeconds |Average |`HttpStatus`, `HttpStatusGroup`, `ClientRegion`, `ClientCountry`, `Endpoint`|PT1M |Yes|
|**Origin Request Count**<br><br>The number of requests sent from AFDX to origin. |`OriginRequestCount` |Count |Total (Sum) |`HttpStatus`, `HttpStatusGroup`, `Origin`, `Endpoint`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Origin Shield Origin Request Count (Preview)**<br><br>The number of requests sent from Origin Shield to origin. |`OriginShieldOriginRequestCount` |Count |Total (Sum) |`Region`, `HttpStatus`, `HttpStatusGroup`, `Origin`, `Origin Group`, `Endpoint`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Origin Shield Rate Limit Request Count (Preview)**<br><br>The number of blocked requests by Origin Shield |`OriginShieldRateLimitRequestCount` |Count |Total (Sum) |`Region`, `Origin Group`, `Rule Name`, `Origin Host`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Origin Shield Request Count (Preview)**<br><br>The number of requests sent from AFDX to Origin Shield. |`OriginShieldRequestCount` |Count |Total (Sum) |`Region`, `HttpStatus`, `HttpStatusGroup`, `Endpoint`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Origin Shield Request Size (Preview)**<br><br>The number of bytes sent as requests from AFDX to Origin Shield. |`OriginShieldRequestSize` |Bytes |Total (Sum) |`Region`, `Endpoint`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Request Count**<br><br>The number of client requests served by the HTTP/S proxy |`RequestCount` |Count |Total (Sum) |`HttpStatus`, `HttpStatusGroup`, `ClientRegion`, `ClientCountry`, `Endpoint`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Request Size**<br><br>The number of bytes sent as requests from clients to AFDX. |`RequestSize` |Bytes |Total (Sum) |`HttpStatus`, `HttpStatusGroup`, `ClientRegion`, `ClientCountry`, `Endpoint`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Response Size**<br><br>The number of bytes sent as responses from HTTP/S proxy to clients |`ResponseSize` |Bytes |Total (Sum) |`HttpStatus`, `HttpStatusGroup`, `ClientRegion`, `ClientCountry`, `Endpoint`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Web Application Firewall CAPTCHA Request Count**<br><br>The number of CAPTCHA requests evaluated by the Web Application Firewall |`WebApplicationFirewallCaptchaRequestCount` |Count |Total (Sum) |`PolicyName`, `RuleName`, `Action`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Web Application Firewall JS Challenge Request Count**<br><br>The number of JS challenge requests evaluated by the Web Application Firewall |`WebApplicationFirewallJsRequestCount` |Count |Total (Sum) |`PolicyName`, `RuleName`, `Action`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Web Application Firewall Request Count**<br><br>The number of client requests processed by the Web Application Firewall |`WebApplicationFirewallRequestCount` |Count |Total (Sum) |`PolicyName`, `RuleName`, `Action`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**WebSocket Connections**<br><br>The number of WebSocket connections requested |`WebSocketConnections` |Count |Total (Sum) |`HttpStatus`, `HttpStatusGroup`, `ClientRegion`, `ClientCountry`, `Endpoint`|PT1M |Yes|