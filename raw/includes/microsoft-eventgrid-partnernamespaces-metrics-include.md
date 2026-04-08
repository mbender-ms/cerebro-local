---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.EventGrid/partnerNamespaces, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Publish Failed Events**<br><br>Total events failed to publish to this partner namespace |`PublishFailCount` |Count |Total (Sum) |`ErrorType`, `Error`|PT1M |Yes|
|**Published Events**<br><br>Total events published to this partner namespace |`PublishSuccessCount` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Publish Success Latency**<br><br>Publish success latency in milliseconds |`PublishSuccessLatencyInMs` |MilliSeconds |Total (Sum) |\<none\>|PT1M |Yes|
|**Unmatched Events**<br><br>Total events not matching any of the partner topics |`UnmatchedEventCount` |Count |Total (Sum) |\<none\>|PT1M |Yes|