---
ms.topic: include
ms.date: 03/31/2026
ms.custom: Microsoft.Storage/storageAccounts, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Capacity
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Used capacity**<br><br>The amount of storage used by the storage account. For standard storage accounts, it's the sum of capacity used by blob, table, file, and queue. For premium storage accounts and Blob storage accounts, it is the same as BlobCapacity or FileCapacity. |`UsedCapacity` |Bytes |Average |\<none\>|PT1H |No|

### Category: Transaction
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Availability**<br><br>The percentage of availability for the storage service or the specified API operation. Availability is calculated by taking the TotalBillableRequests value and dividing it by the number of applicable requests, including those that produced unexpected errors. All unexpected errors result in reduced availability for the storage service or the specified API operation. |`Availability` |Percent |Average, Minimum, Maximum |`GeoType`, `ApiName`, `Authentication`|PT1M |Yes|
|**Egress**<br><br>The amount of egress data. This number includes egress to external client from Azure Storage as well as egress within Azure. As a result, this number does not reflect billable egress. |`Egress` |Bytes |Total (Sum), Average, Minimum, Maximum |`GeoType`, `ApiName`, `Authentication`|PT1M |Yes|
|**Ingress**<br><br>The amount of ingress data, in bytes. This number includes ingress from an external client into Azure Storage as well as ingress within Azure. |`Ingress` |Bytes |Total (Sum), Average, Minimum, Maximum |`GeoType`, `ApiName`, `Authentication`|PT1M |Yes|
|**Blob Geo-Replication Lag**<br><br>The amount of Geo-replication lag for Blob data in seconds. Geo-replication lag is the time it takes for data stored in the primary region of the storage account to replicate to the secondary region. Since the data written to geo-redundant accounts replicates asynchronously, any data written to the primary region will not be instantly available in the secondary region. |`ReplicationLagSeconds` |Seconds |Average, Minimum, Maximum |\<none\>|PT1M |Yes|
|**Success E2E Latency**<br><br>The average end-to-end latency of successful requests made to a storage service or the specified API operation, in milliseconds. This value includes the required processing time within Azure Storage to read the request, send the response, and receive acknowledgment of the response. |`SuccessE2ELatency` |MilliSeconds |Average, Minimum, Maximum |`GeoType`, `ApiName`, `Authentication`|PT1M |Yes|
|**Success Server Latency**<br><br>The average time used to process a successful request by Azure Storage. This value does not include the network latency specified in SuccessE2ELatency. |`SuccessServerLatency` |MilliSeconds |Average, Minimum, Maximum |`GeoType`, `ApiName`, `Authentication`|PT1M |Yes|
|**Transactions**<br><br>The number of requests made to a storage service or the specified API operation. This number includes successful and failed requests, as well as requests which produced errors. Use ResponseType dimension for the number of different type of response. |`Transactions` |Count |Total (Sum) |`ResponseType`, `GeoType`, `ApiName`, `Authentication`, `TransactionType`|PT1M |Yes|