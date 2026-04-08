---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.StandbyPool/standbyvirtualmachinepools, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`Execution` |Standby virtual machine pool updates |[SVMPoolExecutionLog](/azure/azure-monitor/reference/tables/svmpoolexecutionlog)<p>Contains Execution Logs for a StandbyVirtualMachinePool, which can be used for audit and troubleshooting.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/svmpoolexecutionlog)|Yes |
|`Request` |Standby virtual machine pool settings updates |[SVMPoolRequestLog](/azure/azure-monitor/reference/tables/svmpoolrequestlog)<p>Contains Request Logs for a StandbyVirtualMachinePool, which can be used for audit and troubleshooting.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/svmpoolrequestlog)|Yes |