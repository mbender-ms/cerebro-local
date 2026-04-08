---
ms.topic: include
ms.date: 08/28/2025
ms.custom: Microsoft.ContainerService/managedClusters, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: API Server
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**API Server CPU Usage Percentage**<br><br>Maximum CPU percentage (based off current limit) used by API server pod across instances |`apiserver_cpu_usage_percentage` |Percent |Maximum, Average |\<none\>|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**API Server Memory Usage Percentage**<br><br>Maximum memory percentage (based off current limit) used by API server pod across instances |`apiserver_memory_usage_percentage` |Percent |Maximum, Average |\<none\>|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|

### Category: API Server (PREVIEW)
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Inflight Requests**<br><br>Maximum number of currently used inflight requests on the apiserver per request kind in the last second |`apiserver_current_inflight_requests` |Count |Total (Sum), Average |`requestKind`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |No|

### Category: Cluster Autoscaler (PREVIEW)
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Cluster Health**<br><br>Determines whether or not cluster autoscaler will take action on the cluster |`cluster_autoscaler_cluster_safe_to_autoscale` |Count |Total (Sum), Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |No|
|**Scale Down Cooldown**<br><br>Determines if the scale down is in cooldown - No nodes will be removed during this timeframe |`cluster_autoscaler_scale_down_in_cooldown` |Count |Total (Sum), Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |No|
|**Unneeded Nodes**<br><br>Cluster auotscaler marks those nodes as candidates for deletion and are eventually deleted |`cluster_autoscaler_unneeded_nodes_count` |Count |Total (Sum), Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |No|
|**Unschedulable Pods**<br><br>Number of pods that are currently unschedulable in the cluster |`cluster_autoscaler_unschedulable_pods_count` |Count |Total (Sum), Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |No|

### Category: ETCD
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**ETCD CPU Usage Percentage**<br><br>Maximum CPU percentage (based off current limit) used by ETCD pod across instances |`etcd_cpu_usage_percentage` |Percent |Maximum, Average |\<none\>|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**ETCD Database Usage Percentage**<br><br>Maximum utilization of the ETCD database across instances |`etcd_database_usage_percentage` |Percent |Maximum, Average |\<none\>|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**ETCD Memory Usage Percentage**<br><br>Maximum memory percentage (based off current limit) used by ETCD pod across instances |`etcd_memory_usage_percentage` |Percent |Maximum, Average |\<none\>|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|

### Category: Nodes
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Total number of available cpu cores in a managed cluster**<br><br>Total number of available cpu cores in a managed cluster |`kube_node_status_allocatable_cpu_cores` |Count |Total (Sum), Average |\<none\>|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |No|
|**Total amount of available memory in a managed cluster**<br><br>Total amount of available memory in a managed cluster |`kube_node_status_allocatable_memory_bytes` |Bytes |Total (Sum), Average |\<none\>|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |No|
|**Statuses for various node conditions**<br><br>Statuses for various node conditions |`kube_node_status_condition` |Count |Total (Sum), Average |`condition`, `status`, `status2`, `node`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |No|

### Category: Nodes (PREVIEW)
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**CPU Usage Millicores**<br><br>Aggregated measurement of CPU utilization in millicores across the cluster |`node_cpu_usage_millicores` |MilliCores |Maximum, Average |`node`, `nodepool`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**CPU Usage Percentage**<br><br>Aggregated average CPU utilization measured in percentage across the cluster |`node_cpu_usage_percentage` |Percent |Maximum, Average |`node`, `nodepool`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**Disk Used Bytes**<br><br>Disk space used in bytes by device |`node_disk_usage_bytes` |Bytes |Maximum, Average |`node`, `nodepool`, `device`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**Disk Used Percentage**<br><br>Disk space used in percent by device |`node_disk_usage_percentage` |Percent |Maximum, Average |`node`, `nodepool`, `device`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**Memory RSS Bytes**<br><br>Container RSS memory used in bytes |`node_memory_rss_bytes` |Bytes |Maximum, Average |`node`, `nodepool`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**Memory RSS Percentage**<br><br>Container RSS memory used in percent |`node_memory_rss_percentage` |Percent |Maximum, Average |`node`, `nodepool`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**Memory Working Set Bytes**<br><br>Container working set memory used in bytes |`node_memory_working_set_bytes` |Bytes |Maximum, Average |`node`, `nodepool`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**Memory Working Set Percentage**<br><br>Container working set memory used in percent |`node_memory_working_set_percentage` |Percent |Maximum, Average |`node`, `nodepool`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**Network In Bytes**<br><br>Network received bytes |`node_network_in_bytes` |Bytes |Maximum, Average |`node`, `nodepool`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|
|**Network Out Bytes**<br><br>Network transmitted bytes |`node_network_out_bytes` |Bytes |Maximum, Average |`node`, `nodepool`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |Yes|

### Category: Pods
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Number of pods by phase**<br><br>Number of pods by phase |`kube_pod_status_phase` |Count |Total (Sum), Average |`phase`, `namespace`, `pod`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |No|
|**Number of pods in Ready state**<br><br>Number of pods in Ready state |`kube_pod_status_ready` |Count |Total (Sum), Average |`namespace`, `pod`, `condition`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H |No|