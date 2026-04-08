---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.EventGrid/systemTopics, arm

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Advanced Filter Evaluations**<br><br>Total advanced filters evaluated across event subscriptions for this topic. |`AdvancedFilterEvaluationCount` |Count |Total (Sum) |`EventSubscriptionName`|PT1M |Yes|
|**Dead Lettered Events**<br><br>Total dead lettered events matching to this event subscription |`DeadLetteredCount` |Count |Total (Sum) |`DeadLetterReason`, `EventSubscriptionName`|PT1M |Yes|
|**Delivery Failed Events**<br><br>Total events failed to deliver to this event subscription |`DeliveryAttemptFailCount` |Count |Total (Sum) |`Error`, `ErrorType`, `EventSubscriptionName`|PT1M |No|
|**Delivered Events**<br><br>Total events delivered to this event subscription |`DeliverySuccessCount` |Count |Total (Sum) |`EventSubscriptionName`|PT1M |Yes|
|**Destination Processing Duration**<br><br>Destination processing duration in milliseconds |`DestinationProcessingDurationInMs` |Milliseconds |Average |`EventSubscriptionName`|PT1M |No|
|**Dropped Events**<br><br>Total dropped events matching to this event subscription |`DroppedEventCount` |Count |Total (Sum) |`DropReason`, `EventSubscriptionName`|PT1M |Yes|
|**Matched Events**<br><br>Total events matched to this event subscription |`MatchedEventCount` |Count |Total (Sum) |`EventSubscriptionName`|PT1M |Yes|
|**Publish Failed Events**<br><br>Total events failed to publish to this topic |`PublishFailCount` |Count |Total (Sum) |`ErrorType`, `Error`|PT1M |Yes|
|**Published Events**<br><br>Total events published to this topic |`PublishSuccessCount` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Publish Success Latency**<br><br>Publish success latency in milliseconds |`PublishSuccessLatencyInMs` |Milliseconds |Total (Sum) |\<none\>|PT1M |Yes|
|**Server Delivery Success Rate**<br><br>Success rate of events delivered to this event subscription where failure is caused due to server errors |`ServerDeliverySuccessRate` |Count |Total (Sum) |`EventSubscriptionName`|PT1M |Yes|
|**Unmatched Events**<br><br>Total events not matching any of the event subscriptions for this topic |`UnmatchedEventCount` |Count |Total (Sum) |\<none\>|PT1M |Yes|