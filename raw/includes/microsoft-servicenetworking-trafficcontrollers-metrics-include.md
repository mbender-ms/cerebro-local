---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.ServiceNetworking/trafficControllers, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**WAF Custom Rule Matches**<br><br>Matched Custom Rules |`AzwafCustomRule` |Count |Total (Sum) |`Action`, `CustomRuleID`, `Mode`, `CountryCode`, `PolicyName`, `PolicyScope`|PT1M |Yes|
|**WAF Managed Rule Matches**<br><br>Matched Managed Rules |`AzwafSecRule` |Count |Total (Sum) |`Action`, `Mode`, `RuleGroupID`, `RuleID`, `CountryCode`, `PolicyName`, `PolicyScope`, `RuleSetName`|PT1M |Yes|
|**WAF Total Requests**<br><br>Total number of requests evaluated by WAF |`AzwafTotalRequests` |Count |Total (Sum) |`Action`, `CountryCode`, `Method`, `Mode`, `PolicyName`, `PolicyScope`|PT1M |Yes|
|**Backend Connection Timeouts**<br><br>Count of requests that timed out waiting for a response from the backend target (includes all retry requests initiated from Application Gateway for Containers to the backend target) |`BackendConnectionTimeouts` |Count |Total (Sum) |`Microsoft.regionName`, `BackendService`|PT1M |Yes|
|**Backend Healthy Targets**<br><br>Count of healthy backend targets |`BackendHealthyTargets` |Count |Average |`Microsoft.regionName`, `BackendService`|PT1M |Yes|
|**Backend HTTP Response Status**<br><br>HTTP response status returned by the backend target to Application Gateway for Containers |`BackendHTTPResponseStatus` |Count |Total (Sum) |`Microsoft.regionName`, `BackendService`, `HttpResponseCode`|PT1M |Yes|
|**Total Connection Idle Timeouts**<br><br>Count of connections closed, between client and Application Gateway for Containers frontend, due to exceeding idle timeout |`ClientConnectionIdleTimeouts` |Count |Total (Sum) |`Microsoft.regionName`, `Frontend`|PT1M |Yes|
|**Connection Timeouts**<br><br>Count of connections closed due to timeout between clients and Application Gateway for Containers |`ConnectionTimeouts` |Count |Total (Sum) |`Microsoft.regionName`, `Frontend`|PT1M |Yes|
|**Current Connections**<br><br>Count of current connections between clients and Application Gateway for Containers frontend |`CurrentConnections` |Count |Total (Sum) |`Microsoft.regionName`, `Frontend`|PT1M |Yes|
|**Current Upgraded Connections**<br><br>Count of current connections that are upgraded to a different protocol (e.g. HTTP/1.1 to websocket) |`CurrentConnectionUpgrades` |Count |Total (Sum) |`Microsoft.regionName`, `Frontend`|PT1M |Yes|
|**HTTP Response Status**<br><br>HTTP response status returned by Application Gateway for Containers |`HTTPResponseStatus` |Count |Total (Sum) |`Microsoft.regionName`, `Frontend`, `HttpResponseCode`|PT1M |Yes|
|**New Connections**<br><br>Count of new connections between clients and Application Gateway for Containers frontend |`NewConnections` |Count |Total (Sum) |`Microsoft.regionName`, `Frontend`|PT1M |Yes|
|**New Upgraded Connections**<br><br>Count of new connections that were upgraded to a different protocol (e.g. HTTP/1.1 to websocket) |`NewConnectionUpgrades` |Count |Total (Sum) |`Microsoft.regionName`, `Frontend`|PT1M |Yes|
|**Total Requests**<br><br>Count of requests Application Gateway for Containers has served |`TotalRequests` |Count |Total (Sum) |`Microsoft.regionName`, `Frontend`|PT1M |Yes|