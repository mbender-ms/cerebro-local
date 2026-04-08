---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.StorageMover/storageMovers, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Job runs
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Job Run Scan Throughput Items**<br><br>Job Run scan throughput in items/sec |`JobRunScanThroughputItems` |CountPerSecond |Average, Maximum, Minimum |`JobRunName`|PT1M |Yes|
|**Job Run Transfer Throughput**<br><br>Job Run transfer throughput |`JobRunTransferThroughputBytes` |BytesPerSecond |Average, Maximum, Minimum |`JobRunName`|PT1M |Yes|
|**Job Run Transfer Throughput Items**<br><br>Job Run transfer throughput in items/sec |`JobRunTransferThroughputItems` |CountPerSecond |Average, Maximum, Minimum |`JobRunName`|PT1M |Yes|
|**Job Run Upload Limit**<br><br>Job Run applied upload limit |`UploadLimitBytesPerSecond` |BytesPerSecond |Average, Maximum, Minimum |`JobRunName`|PT1M |Yes|