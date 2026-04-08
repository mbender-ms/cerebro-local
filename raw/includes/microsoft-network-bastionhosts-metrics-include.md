---
ms.topic: include
ms.date: 04/16/2025
ms.custom: microsoft.network/bastionHosts, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Availability
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Bastion Communication Status**<br><br>Communication status shows 1 if all communication is good and 0 if its bad. |`pingmesh` |Count |Average |\<none\>|PT1M |No|

### Category: Saturation
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Total Memory**<br><br>Total memory stats. |`total` |Count |Average |`host`|PT1M |Yes|
|**CPU Usage**<br><br>CPU Usage stats. |`usage_user` |Count |Average |`cpu`, `host`|PT1M |No|
|**Memory Usage**<br><br>Memory Usage stats. |`used` |Count |Average |`host`|PT1M |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Session Count**<br><br>Sessions Count for the Bastion. View in sum and per instance. |`sessions` |Count |Total (Sum), Average |`host`|PT5M, PT15M |No|