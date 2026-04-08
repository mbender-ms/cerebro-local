---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.DevOpsInfrastructure/pools, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Latency
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**AllocationDurationMs**<br><br>Average time to allocate requests (ms) |`AllocationDurationMs` |Milliseconds |Average |`PoolId`, `Type`, `ResourceRequestType`, `Image`|PT1M |Yes|

### Category: Saturation
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Allocated**<br><br>Resources that are allocated |`Allocated` |Count |Average, Maximum, Minimum |`PoolId`, `SKU`, `Images`, `ProviderName`|PT1M |Yes|
|**NotReady**<br><br>Resources that are not ready to be used |`NotReady` |Count |Average, Maximum, Minimum |`PoolId`, `SKU`, `Images`, `ProviderName`|PT1M |Yes|
|**PendingReimage**<br><br>Resources that are pending reimage |`PendingReimage` |Count |Average, Maximum, Minimum |`PoolId`, `SKU`, `Images`, `ProviderName`|PT1M |Yes|
|**PendingReturn**<br><br>Resources that are pending return |`PendingReturn` |Count |Average, Maximum, Minimum |`PoolId`, `SKU`, `Images`, `ProviderName`|PT1M |Yes|
|**Provisioned**<br><br>Resources that are provisioned |`Provisioned` |Count |Average, Maximum, Minimum |`PoolId`, `SKU`, `Images`, `ProviderName`|PT1M |Yes|
|**Ready**<br><br>Resources that are ready to be used |`Ready` |Count |Average, Maximum, Minimum |`PoolId`, `SKU`, `Images`, `ProviderName`|PT1M |Yes|
|**Starting**<br><br>Resources that are starting |`Starting` |Count |Average, Maximum, Minimum |`PoolId`, `SKU`, `Images`, `ProviderName`|PT1M |Yes|
|**Total**<br><br>Total Number of Resources |`Total` |Count |Average, Maximum, Minimum |`PoolId`, `SKU`, `Images`, `ProviderName`|PT1M |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Count**<br><br>Number of requests in last dump |`Count` |Count |Count |`RequestType`, `Status`, `PoolId`, `Type`, `ErrorCode`, `FailureStage`|PT1M |Yes|