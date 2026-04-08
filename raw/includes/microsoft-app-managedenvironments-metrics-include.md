---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.App/managedEnvironments, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Basic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Ingress CPU Usage Percentage (Preview)**<br><br>CPU consumed by the ingress pods as a percentage of the total CPU limit. |`IngressCpuPercentage` |Percent |Average, Maximum, Minimum |`podName`, `nodeName`|PT1M |Yes|
|**Ingress Memory Usage Percentage (Preview)**<br><br>Ingress memory usage as a percentage of the total memory limit. |`IngressMemoryPercentage` |Percent |Average, Maximum, Minimum |`podName`, `nodeName`|PT1M |Yes|
|**Ingress Memory Usage Bytes (Preview)**<br><br>Ingress pods usage memory in bytes. Represents the total memory consumed by a container |`IngressUsageBytes` |Bytes |Total (Sum), Average, Maximum, Minimum |`podName`, `nodeName`|PT1M |Yes|
|**Ingress CPU Usage (Preview)**<br><br>CPU consumed by the ingress pods in nano cores. 1,000,000,000 nano cores = 1 core |`IngressUsageNanoCores` |NanoCores |Total (Sum), Average, Maximum, Minimum |`podName`, `nodeName`|PT1M |Yes|
|**Cores Quota Limit (Deprecated)**<br><br>The cores quota limit of managed environment (Deprecated) |`EnvCoresQuotaLimit` |Count |Average, Maximum, Minimum |\<none\>|PT1M |Yes|
|**Percentage Cores Used Out Of Limit (Deprecated)**<br><br>The cores quota utilization of managed environment (Deprecated) |`EnvCoresQuotaUtilization` |Percent |Average, Maximum, Minimum |\<none\>|PT1M |Yes|
|**Workload Profile Node Count (Preview)**<br><br>The Node Count per workload profile |`NodeCount` |Count |Average, Total (Sum), Maximum, Minimum |`workloadProfileName`|PT1M |Yes|