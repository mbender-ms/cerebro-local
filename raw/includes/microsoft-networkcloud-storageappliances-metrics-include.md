---
ms.topic: include
ms.date: 03/02/2026
ms.custom: Microsoft.NetworkCloud/storageAppliances, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Host
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Nexus Storage Host Bandwidth Bytes**<br><br>Host bandwidth of the pure storage array in bytes per second. |`PurefaHostPerformanceBandwidthBytes` |Bytes |Average |`Dimension`, `Host`|PT1M |No|
|**Nexus Storage Host Latency**<br><br>Latency of the pure storage array hosts. In the absence of data, this metric will default to 0. |`PurefaHostPerformanceLatencyMs` |MilliSeconds |Average |`Dimension`, `Host`|PT1M |No|
|**Nexus Storage Host Performance Throughput Iops**<br><br>The host throughput in I/O operations per second. |`PurefaHostPerformanceThroughputIops` |Count |Average |`Dimension`, `Host`|PT1M |No|
|**Nexus Storage Host Space Bytes**<br><br>Storage array host space. |`PurefaHostSpaceBytesV2` |Bytes |Average |`Host`, `Space`|PT1M |No|
|**Nexus Storage Host Space Data Reduction Ratio**<br><br>Host space data reduction ratio. |`PurefaHostSpaceDataReductionRatioV2` |Count |Average |`Host`|PT1M |No|

### Category: Storage Array
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Nexus Storage Alerts Open**<br><br>Number of open alert events. In the absence of data, this metric will default to 0. |`PurefaAlertsOpen2` |Count |Average |`Code`, `Component Type`, `Issue`, `Severity`, `Summary`|PT1M |No|
|**Nexus Storage Array Performance Average Bytes**<br><br>The average operations size by dimension, where dimension can be mirrored_write_bytes_per_sec, read_bytes_per_sec or write_bytes_per_sec. |`PurefaArrayPerformanceAverageBytes` |Bytes |Average |`Dimension`|PT1M |No|
|**Nexus Storage Array Bandwidth Bytes**<br><br>Performance of the pure storage array bandwidth in bytes per second. |`PurefaArrayPerformanceBandwidthBytes` |Bytes |Average |`Dimension`|PT1M |No|
|**Nexus Storage Array Latency**<br><br>Latency of the pure storage array. In the absence of data, this metric will default to 0. |`PurefaArrayPerformanceLatencyMs` |MilliSeconds |Average |`Dimension`|PT1M |No|
|**Nexus Storage Array Performance Queue Depth Operations**<br><br>The array queue depth size by number of operations. |`PurefaArrayPerformanceQueueDepthOps` |Count |Average |\<none\>|PT1M |No|
|**Nexus Storage Array Performance Throughput Iops**<br><br>The array throughput in operations per second. |`PurefaArrayPerformanceThroughputIops` |Count |Average |`Dimension`|PT1M |No|
|**Nexus Storage Array Space Bytes**<br><br>The amount of array space. The space filter can be used to filter the space by type. |`PurefaArraySpaceBytes` |Bytes |Average |`Space`|PT1M |No|
|**Nexus Storage Array Space Data Reduction Ratio**<br><br>Storage array overall data reduction ratio. |`PurefaArraySpaceDataReductionRatioV2` |Count |Average |\<none\>|PT1M |No|
|**Nexus Storage Array Space Utilization**<br><br>Array space utilization in percent. |`PurefaArraySpaceUtilization` |Percent |Average |\<none\>|PT1M |No|
|**Nexus Storage Hardware Component Status**<br><br>Status of a hardware component. |`PurefaHwComponentStatus` |Count |Average |`Component Name`, `Component Type`, `Component Status`|PT1M |No|
|**Nexus Storage Hardware Component Temperature Celsius**<br><br>Temperature of the temperature sensor component in Celsius. |`PurefaHwComponentTemperatureCelsius` |Unspecified |Average |`Component Name`|PT1M |No|
|**Nexus Storage Hardware Component Voltage**<br><br>Voltage used by the power supply component in volts. |`PurefaHwComponentVoltageVolt` |Unspecified |Average |`Component Name`|PT1M |No|
|**Nexus Storage Info (Preview)**<br><br>Storage array system information. In the absence of data, this metric will default to 0. |`PurefaInfo` |Unspecified |Average |`Array Name`, `Array Version`|PT1M |No|
|**Nexus Storage Network Interface Performance Errors**<br><br>The number of network interface errors per second. |`PurefaNetworkInterfacePerformanceErrors` |Count |Average |`Dimension`, `Name`, `Type`|PT1M |No|

### Category: Volume
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Nexus Storage Volume Performance Bandwidth Bytes**<br><br>Volume throughput in bytes per second. |`PurefaVolumePerformanceBandwidthBytesV2` |Bytes |Average |`Name`, `Dimension`|PT1M |No|
|**Nexus Storage Volume Latency**<br><br>Latency of the pure storage array volumes. In the absence of data, this metric will default to 0. |`PurefaVolumePerformanceLatencyMsV2` |MilliSeconds |Average |`Dimension`, `Name`|PT1M |No|
|**Nexus Storage Volume Performance Throughput Iops**<br><br>Volume throughput in operations per second. |`PurefaVolumePerformanceThroughputIops` |Count |Average |`Name`, `Dimension`|PT1M |No|
|**Nexus Storage Volume Space Bytes**<br><br>Pure storage array volume space. |`PurefaVolumeSpaceBytesV2` |Bytes |Average |`Name`, `Space`|PT1M |No|
|**Nexus Storage Volume Space Data Reduction Ratio**<br><br>Volume space data reduction ratio. |`PurefaVolumeSpaceDataReductionRatioV2` |Unspecified |Average |`Name`|PT1M |No|