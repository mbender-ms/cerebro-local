---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Oracle.Database/exadbVmClusters, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Availability
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Node Status**<br><br>Indicates whether the host is reachable. |`oci_database_cluster/NodeStatus` |Count |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `hostName`, `deploymentType`, `Oracle.resourceId_dbnode`, `Oracle.resourceName_dbnode`|PT1M |Yes|

### Category: Saturation
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**CPU Utilization (OCI Database Cluster)**<br><br>Percent CPU utilization |`oci_database_cluster/CpuUtilization` |Percent |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `hostName`, `deploymentType`, `Oracle.resourceId_dbnode`, `Oracle.resourceName_dbnode`|PT1M |Yes|
|**Filesystem Utilization**<br><br>Percent utilization of provisioned filesystem |`oci_database_cluster/FilesystemUtilization` |Percent |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `hostName`, `deploymentType`, `Oracle.resourceId_dbnode`, `Oracle.resourceName_dbnode`, `filesystemName`|PT1M |Yes|
|**Load Average**<br><br>System load average over 5 minutes |`oci_database_cluster/LoadAverage` |Count |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `hostName`, `deploymentType`, `Oracle.resourceId_dbnode`, `Oracle.resourceName_dbnode`|PT1M |Yes|
|**Memory Utilization**<br><br>Percentage of memory available for starting new applications, without swapping. The available memory can be obtained via the following command: cat /proc/meminfo |`oci_database_cluster/MemoryUtilization` |Percent |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `hostName`, `deploymentType`, `Oracle.resourceId_dbnode`, `Oracle.resourceName_dbnode`|PT1M |Yes|
|**OCPU Allocated**<br><br>The number of OCPUs allocated |`oci_database_cluster/OcpusAllocated` |Count |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `deploymentType`|PT1M |Yes|
|**Swap Utilization**<br><br>Percent utilization of total swap space |`oci_database_cluster/SwapUtilization` |Percent |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `hostName`, `deploymentType`, `Oracle.resourceId_dbnode`, `Oracle.resourceName_dbnode`|PT1M |Yes|
|**DB Block Changes**<br><br>The Average number of blocks changed per second. |`oci_database/BlockChanges` |CountPerSecond |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `instanceNumber`, `instanceName`, `hostName`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1M |Yes|
|**CPU Utilization (OCI Database)**<br><br>The CPU utilization expressed as a percentage, aggregated across all consumer groups. The utilization percentage is reported with respect to the number of CPUs the database is allowed to use. |`oci_database/CpuUtilization` |Percent |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `instanceNumber`, `instanceName`, `hostName`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1M |Yes|
|**Parse Count**<br><br>The number of hard and soft parses during the selected interval. |`oci_database/ParseCount` |Count |Minimum, Maximum, Average, Total (Sum) |`Oracle.resourceId`, `Oracle.resourceName`, `instanceNumber`, `instanceName`, `hostName`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1M |Yes|
|**Storage Space Allocated**<br><br>Total amount of storage space allocated to the database at the collection time |`oci_database/StorageAllocated` |Bytes |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1H, PT6H, PT12H, P1D |Yes|
|**Allocated Storage Space By Tablespace**<br><br>Total amount of storage space allocated to the tablespace at the collection time. In case of container database, this metric provides root container tablespaces. |`oci_database/StorageAllocatedByTablespace` |Bytes |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `TablespaceName`, `tablespaceType`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1H, PT6H, PT12H, P1D |Yes|
|**Storage Space Used**<br><br>Total amount of storage space used by the database at the collection time. |`oci_database/StorageUsed` |Bytes |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1H, PT6H, PT12H, P1D |Yes|
|**Storage Space Used By Tablespace**<br><br>Total amount of storage space used by tablespace at the collection time. In case of container database, this metric provides root container tablespaces. |`oci_database/StorageUsedByTablespace` |Bytes |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `tablespaceName`, `tablespaceType`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1H, PT6H, PT12H, P1D |Yes|
|**Storage Utilization**<br><br>The percentage of provisioned storage capacity currently in use. Represents the total allocated space for all tablespaces. |`oci_database/StorageUtilization` |Percent |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1H, PT6H, PT12H, P1D |Yes|
|**Storage Space Utilization By Tablespace**<br><br>This indicates the percentage of storage space utilized by the tablespace at the collection time. In case of container database, this metric provides root container tablespaces.. |`oci_database/StorageUtilizationByTablespace` |Percent |Minimum, Maximum, Average |`Oracle.resourceId`, `Oracle.resourceName`, `tablespaceName`, `tablespaceType`, `deploymentType`|PT1H, PT6H, PT12H, P1D |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Current Logons**<br><br>The number of successful logons during the selected interval. |`oci_database/CurrentLogons` |Count |Minimum, Maximum, Average, Total (Sum) |`Oracle.resourceId`, `Oracle.resourceName`, `instanceNumber`, `instanceName`, `hostName`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1M |Yes|
|**Execute Count**<br><br>The number of user and recursive calls that executed SQL statements during the selected interval. |`oci_database/ExecuteCount` |Count |Minimum, Maximum, Average, Total (Sum) |`Oracle.resourceId`, `Oracle.resourceName`, `instanceNumber`, `instanceName`, `hostName`, `deploymentType`|PT1M |Yes|
|**Transaction Count**<br><br>The combined number of user commits and user rollbacks during the selected interval. |`oci_database/TransactionCount` |Count |Minimum, Maximum, Average, Total (Sum) |`Oracle.resourceId`, `Oracle.resourceName`, `instanceNumber`, `instanceName`, `hostName`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1M |Yes|
|**User Calls**<br><br>The combined number of logons, parses, and execute calls during the selected interval. |`oci_database/UserCalls` |Count |Minimum, Maximum, Average, Total (Sum) |`Oracle.resourceId`, `Oracle.resourceName`, `instanceNumber`, `instanceName`, `hostName`, `deploymentType`, `Oracle.resourceId_database`, `Oracle.resourceName_database`|PT1M |Yes|