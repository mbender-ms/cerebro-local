---
ms.topic: include
ms.date: 08/28/2025
ms.custom: Microsoft.NetApp/scaleAccounts/scaleCapacityPools/scaleVolumes, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Average read latency**<br><br>Average read latency in milliseconds per operation |`AverageReadLatency` |MilliSeconds |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Average write latency**<br><br>Average write latency in milliseconds per operation |`AverageWriteLatency` |MilliSeconds |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Other iops**<br><br>Other In/out operations per second |`OtherIops` |CountPerSecond |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Other throughput**<br><br>Other throughput (that is not read or write) in bytes per second |`OtherThroughput` |BytesPerSecond |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Read iops**<br><br>Read In/out operations per second |`ReadIops` |CountPerSecond |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Read throughput**<br><br>Read throughput in bytes per second |`ReadThroughput` |BytesPerSecond |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Total iops**<br><br>Sum of all In/out operations per second |`TotalIops` |CountPerSecond |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Total throughput**<br><br>Sum of all throughput in bytes per second |`TotalThroughput` |BytesPerSecond |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Volume allocated size**<br><br>The provisioned size of a volume |`VolumeAllocatedSize` |Bytes |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Percentage Volume Consumed Size**<br><br>The percentage of the volume consumed including snapshots. |`VolumeConsumedSizePercentage` |Percent |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Volume Consumed Size**<br><br>Logical size of the volume (used bytes) |`VolumeLogicalSize` |Bytes |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Volume snapshot size**<br><br>Size of all snapshots in volume |`VolumeSnapshotSize` |Bytes |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Write iops**<br><br>Write In/out operations per second |`WriteIops` |CountPerSecond |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Write throughput**<br><br>Write throughput in bytes per second |`WriteThroughput` |BytesPerSecond |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|