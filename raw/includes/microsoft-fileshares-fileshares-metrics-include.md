---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.FileShares/fileShares, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Capacity
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**File Capacity**<br><br>The used storage in bytes used by the file share. |`FileCapacity` |Bytes |Average |`FileShare`, `Tier`|PT1H, PT6H, PT12H, P1D |No|
|**File Count**<br><br>The number of files in the file share. |`FileCount` |Count |Average |`FileShare`, `Tier`|PT1H, PT6H, PT12H, P1D |No|
|**File Share Provisioned IOPS**<br><br>The number of IOPS provisioned on the file share. |`FileShareProvisionedIOPS` |CountPerSecond |Average |`FileShare`|PT1H, PT6H, PT12H, P1D |No|
|**File Share Provisioned Storage Bytes**<br><br>The amount of storage provisioned on the file share. |`FileShareProvisionedStorageBytes` |Bytes |Average |`FileShare`|PT1H, PT6H, PT12H, P1D |No|
|**File Share Provisioned Throughput MiB/s**<br><br>The amount of throughput provisioned on the file share. |`FileShareProvisionedThroughputMiBps` |CountPerSecond |Average |`FileShare`|PT1H, PT6H, PT12H, P1D |No|
|**File Share Snapshot Count**<br><br>The number of file share snapshots of the file share. |`FileShareSnapshotCount` |Count |Average |`FileShare`|PT1H, PT6H, PT12H, P1D |No|
|**File Share Snapshot Size**<br><br>The amount of differential storage used by the file share snapshots of the file share. |`FileShareSnapshotSize` |Bytes |Average |`FileShare`|PT1H, PT6H, PT12H, P1D |No|

### Category: Transaction
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Availability**<br><br>The percentage of availability for the file share (or the specified API operation). Availability is calculated by taking the TotalBillableRequests value and dividing it by the number of applicable requests, including those that produced unexpected errors. All unexpected errors result in reduced availability for the file share (or the specified API operation). |`Availability` |Percent |Average, Minimum, Maximum |`GeoType`, `ApiName`, `Authentication`, `FileShare`|PT1M |Yes|
|**Egress**<br><br>The amount of data read from the file share in bytes, including from clients inside of Azure. |`Egress` |Bytes |Total (Sum), Average, Minimum, Maximum |`GeoType`, `ApiName`, `Authentication`, `FileShare`|PT1M |Yes|
|**Burst Credits For IOPS**<br><br>The number of burst credits for IOPS available for the file share. |`FileShareAvailableBurstCredits` |Count |Average |`FileShare`|PT1M |No|
|**Max Used IOPS**<br><br>The maximum used IOPS at the lowest time granularity of 1-minute for the file share. |`FileShareMaxUsedIOPS` |CountPerSecond |Maximum |`FileShare`|PT1M |No|
|**Max Used Throughput MiB/s**<br><br>The maximum used bandwidth (throughput) in MiB/s at the lowest time granularity of 1-minute for the file share. |`FileShareMaxUsedThroughputMiBps` |CountPerSecond |Maximum |`FileShare`|PT1M |No|
|**Ingress**<br><br>The amount of data written to the file share in bytes, including from clients inside of Azure. |`Ingress` |Bytes |Total (Sum), Average, Minimum, Maximum |`GeoType`, `ApiName`, `Authentication`, `FileShare`|PT1M |Yes|
|**Success E2E Latency**<br><br>The average end-to-end latency of successful requests made to the file share (or the specified API operation) in milliseconds. This value includes the required processing time by the file share. |`SuccessE2ELatency` |MilliSeconds |Average, Minimum, Maximum |`GeoType`, `ApiName`, `Authentication`, `FileShare`|PT1M |Yes|
|**Success Server Latency**<br><br>The average time used to process a successful request by the file share. This value does not include the network latency specified in SuccessE2ELatency. |`SuccessServerLatency` |MilliSeconds |Average, Minimum, Maximum |`GeoType`, `ApiName`, `Authentication`, `FileShare`|PT1M |Yes|
|**Transactions**<br><br>The number of requests made to the file share, including both successful and failed requests. Can be filtered further by the ResponseType dimension. |`Transactions` |Count |Total (Sum) |`ResponseType`, `GeoType`, `ApiName`, `Authentication`, `FileShare`, `TransactionType`|PT1M |Yes|