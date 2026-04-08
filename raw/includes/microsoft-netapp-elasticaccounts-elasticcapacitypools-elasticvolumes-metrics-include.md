---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.NetApp/elasticAccounts/elasticCapacityPools/elasticVolumes, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Average read latency**<br><br>Average read latency in milliseconds per operation |`AverageReadLatency` |MilliSeconds |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Average write latency**<br><br>Average write latency in milliseconds per operation |`AverageWriteLatency` |MilliSeconds |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Is Volume Backup Suspended**<br><br>Is the backup policy suspended for the volume? 0 if yes, 1 if no. |`CbsVolumeBackupActive` |Count |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Volume Backup Bytes**<br><br>Total bytes backed up for this volume. |`CbsVolumeLogicalBackupBytes` |Bytes |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Volume Backup Operation Last Transferred Bytes**<br><br>Total bytes transferred for last backup operation. |`CbsVolumeOperationBackupTransferredBytes` |Bytes |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Is Volume Backup Operation Complete**<br><br>Did the last volume backup or restore operation complete successfully? 1 if yes, 0 if no. |`CbsVolumeOperationComplete` |Count |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Volume Backup Restore Operation Last Transferred Bytes**<br><br>Total bytes transferred for last backup restore operation. |`CbsVolumeOperationRestoreTransferredBytes` |Bytes |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**Is Volume Backup Enabled**<br><br>Is backup enabled for the volume? 1 if yes, 0 if no. |`CbsVolumeProtected` |Count |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
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