---
ms.topic: include
ms.date: 03/27/2026
ms.custom: Microsoft.DataReplication/replicationVaults, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`HealthEvents` |ASRv2 Health Event Data ||No|No||Yes |
|`JobEvents` |ASRv2 Job Event Data ||No|No||Yes |
|`ProtectedItems` |ASRv2 Protected Item Data |[ASRv2ProtectedItems](/azure/azure-monitor/reference/tables/asrv2protecteditems)<p>This table contains records of Azure Site Recovery v2 (ASRv2) protected item related events.|Yes|Yes||Yes |
|`ReplicationExtensions` |ASRv2 Replication Extension Data ||No|No||Yes |
|`ReplicationPolicies` |ASRv2 Replication Policy Data ||No|No||Yes |
|`ReplicationVaults` |ASRv2 Replication Vault Data ||No|No||Yes |