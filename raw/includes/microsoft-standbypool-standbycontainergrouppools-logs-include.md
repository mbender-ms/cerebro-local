---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.StandbyPool/standbycontainergrouppools, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`ContainerGroupExecution` |Standby container group pool updates |[SCGPoolExecutionLog](/azure/azure-monitor/reference/tables/scgpoolexecutionlog)<p>Contains Execution Logs for a StandbyContainerGroupPool, which can be used for audit and troubleshooting.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/scgpoolexecutionlog)|Yes |
|`ContainerGroupRequest` |Standby container group pool settings updates ||No|No||Yes |