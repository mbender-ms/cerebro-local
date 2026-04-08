---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.DocumentDB/garnetClusters, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Garnet Client
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**connected clients**<br><br>Number of connected clients. |`garnet_connected_clients` |Count |Average, Minimum, Maximum, Count |`datacenter`, `node`, `Kind`|PT1M |No|

### Category: Garnet Store
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**index size**<br><br>Size of the index in the main store |`garnet_index_size` |Bytes |Average, Minimum, Maximum |`datacenter`, `node`, `Kind`|PT1M |No|
|**log size**<br><br>Size of the log in the main store |`garnet_log_size` |Bytes |Average, Minimum, Maximum |`datacenter`, `node`, `Kind`|PT1M |No|
|**main store size**<br><br>size of the main garnet store (index + log + overflow) |`garnet_main_store_size` |Bytes |Average, Minimum, Maximum |`datacenter`, `node`, `Kind`|PT1M |No|
|**read cache size**<br><br>Size of the read cache in the main store |`garnet_read_cache_size` |Bytes |Average, Minimum, Maximum |`datacenter`, `node`, `Kind`|PT1M |No|

### Category: Query Performance
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**mean query latency (microseconds)**<br><br>mean latency of processing in microseconds, per network receive call (server side), considering only non-admin requests |`garnet_latency_mean` |Unspecified |Average, Minimum, Maximum |`datacenter`, `node`, `Kind`|PT1M |No|
|**p99 query latency (microseconds)**<br><br>p99 latency of processing in microseconds, per network receive call (server side), considering only non-admin requests |`garnet_latency_p99` |Unspecified |Average, Minimum, Maximum |`datacenter`, `node`, `Kind`|PT1M |No|
|**command process rate (commands/second)**<br><br>The number of commands, per second, processed |`garnet_total_commands_processed_rate` |Count |Average, Minimum, Maximum |`datacenter`, `node`, `Kind`|PT1M |No|
|**read command process rate (commands/second)**<br><br>The number of read commands, per second, processed |`garnet_total_read_commands_processed_rate` |Count |Average, Minimum, Maximum |`datacenter`, `node`, `Kind`|PT1M |No|
|**write command process rate (commands/second)**<br><br>The number of write commands, per second, processed |`garnet_total_write_commands_processed_rate` |Count |Average, Minimum, Maximum |`datacenter`, `node`, `Kind`|PT1M |No|

### Category: System
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**CPU usage active**<br><br>CPU usage (active). |`cpu` |Percent |Average |`ClusterResourceName`, `DataCenterResourceName`, `Address`, `Kind`, `CPU`|PT1M |Yes|
|**network received bytes**<br><br>Cumulative network received bytes. |`ethtool_rx_bytes` |Bytes |Average, Minimum, Maximum, Count |`ClusterResourceName`, `DataCenterResourceName`, `Address`, `Kind`|PT1M |No|
|**network received packets**<br><br>Cumulative network received packets. |`ethtool_rx_packets` |Count |Average, Minimum, Maximum, Count |`ClusterResourceName`, `DataCenterResourceName`, `Address`, `Kind`|PT1M |No|
|**network transmitted bytes**<br><br>Cumulative network transmitted bytes. |`ethtool_tx_bytes` |Bytes |Average, Minimum, Maximum, Count |`ClusterResourceName`, `DataCenterResourceName`, `Address`, `Kind`|PT1M |No|
|**network transmitted packets**<br><br>Cumulative network transmitted packets. |`ethtool_tx_packets` |Count |Average, Minimum, Maximum, Count |`ClusterResourceName`, `DataCenterResourceName`, `Address`, `Kind`|PT1M |No|
|**memory utilization**<br><br>Memory utilization rate. |`percent_mem` |Percent |Average |`ClusterResourceName`, `DataCenterResourceName`, `Address`|PT1M |Yes|
|**average CPU usage active**<br><br>Average CPU usage (active) across all the CPUs. |`total_cpu` |Percent |Average |`ClusterResourceName`, `DataCenterResourceName`, `Address`, `Kind`|PT1M |Yes|