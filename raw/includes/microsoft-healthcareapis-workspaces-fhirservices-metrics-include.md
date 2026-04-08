---
ms.topic: include
ms.date: 03/02/2026
ms.custom: Microsoft.HealthcareApis/workspaces/fhirservices, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Availability
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Availability**<br><br>The availability rate of the service. |`Availability` |Percent |Average |\<none\>|PT1M |Yes|

### Category: Errors
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Total Errors**<br><br>The total number of internal server errors encountered by the service. |`TotalErrors` |Count |Total (Sum) |`Protocol`, `StatusCode`, `StatusCodeClass`, `StatusText`|PT1M |Yes|

### Category: Saturation
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Total Data Size**<br><br>Total size of the data in the backing database, in bytes. |`TotalDataSize` |Bytes |Total (Sum) |\<none\>|PT1M |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Total Latency**<br><br>The response latency of the service. |`TotalLatency` |MilliSeconds |Average |`Protocol`|PT1M |Yes|
|**Total Requests**<br><br>The total number of requests received by the service. |`TotalRequests` |Count |Total (Sum) |`Protocol`|PT1M |Yes|