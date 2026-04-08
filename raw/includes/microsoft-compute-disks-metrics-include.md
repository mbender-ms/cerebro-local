---
ms.topic: include
ms.date: 09/01/2025
ms.custom: microsoft.compute/disks, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Disk Performance
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Disk Read Bytes/sec**<br><br>Bytes/sec read from disk during monitoring period |`Composite Disk Read Bytes/sec` |BytesPerSecond |Average |\<none\>|PT1M |No|
|**Disk Read Operations/sec**<br><br>Number of read IOs performed on a disk during monitoring period |`Composite Disk Read Operations/sec` |CountPerSecond |Average |\<none\>|PT1M |No|
|**Disk Write Bytes/sec**<br><br>Bytes/sec written to disk during monitoring period |`Composite Disk Write Bytes/sec` |BytesPerSecond |Average |\<none\>|PT1M |No|
|**Disk Write Operations/sec**<br><br>Number of Write IOs performed on a disk during monitoring period |`Composite Disk Write Operations/sec` |CountPerSecond |Average |\<none\>|PT1M |No|
|**Disk On-demand Burst Operations**<br><br>The accumulated operations of burst transactions used for disks with on-demand burst enabled. Emitted on an hour interval |`DiskPaidBurstIOPS` |Count |Average |\<none\>|PT1M |No|