---
ms.topic: include
ms.date: 03/31/2026
ms.custom: Microsoft.DevCenter/devcenters, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`AgentHealthStatus` |Agent Health Status |[DevCenterAgentHealthLogs](/azure/azure-monitor/reference/tables/devcenteragenthealthlogs)<p>Agent health logs pertaining to the underlying Azure VM of the dev box.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/devcenteragenthealthlogs)|Yes |
|`ConnectionEvent` |Connections |[DevCenterConnectionLogs](/azure/azure-monitor/reference/tables/devcenterconnectionlogs)<p>Connection events which include information around when a dev box was connected to, if the connection was successful and what client was used in connecting.|Yes|Yes||Yes |
|`DataplaneAuditEvent` |Dataplane audit logs |[DevCenterDiagnosticLogs](/azure/azure-monitor/reference/tables/devcenterdiagnosticlogs)<p>Data plane audit logs related to your dev center resources. Will display information concerning stop/start/deletes on dev boxes and environments.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/devcenterdiagnosticlogs)|Yes |
|`ResourceOperation` |Resource Operations |[DevCenterResourceOperationLogs](/azure/azure-monitor/reference/tables/devcenterresourceoperationlogs)<p>Operation logs pertaining to DevCenter resources, including information around resource health status changes.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/devcenterresourceoperationlogs)|Yes |
|`Usage` |Billing events |[DevCenterBillingEventLogs](/azure/azure-monitor/reference/tables/devcenterbillingeventlogs)<p>Billing event related to DevCenter resources. Logs contains information about the quantity and unit charged per meter.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/devcenterbillingeventlogs)|Yes |