---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.Synapse/workspaces/bigDataPools, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Apache Spark pool
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**vCores allocated**<br><br>Allocated vCores for an Apache Spark Pool |`BigDataPoolAllocatedCores` |Count |Maximum, Minimum, Average |`SubmitterId`|PT1M |No|
|**Memory allocated (GB)**<br><br>Allocated Memory for Apach Spark Pool (GB) |`BigDataPoolAllocatedMemory` |Count |Maximum, Minimum, Average |`SubmitterId`|PT1M |No|
|**Active Apache Spark applications**<br><br>Total Active Apache Spark Pool Applications |`BigDataPoolApplicationsActive` |Count |Maximum, Minimum, Average |`JobState`|PT1M |No|
|**Ended Apache Spark applications**<br><br>Count of Apache Spark pool applications ended |`BigDataPoolApplicationsEnded` |Count |Total (Sum) |`JobType`, `JobResult`|PT1M |No|