---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.Cache/redis, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`ConnectedClientList` |Connected client list ||No|No||Yes |
|`MSEntraAuthenticationAuditLog` |MSEntra authentication audit log |[ACREntraAuthenticationAuditLog](/azure/azure-monitor/reference/tables/acrentraauthenticationauditlog)<p>Logs Microsoft Entra authentication audit events for Azure Cache for Redis.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/acrentraauthenticationauditlog)|Yes |