---
ms.topic: include
ms.date: 10/31/2025
ms.custom: NGINX.NGINXPLUS/nginxDeployments, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`NginxLogs` |NGINX Logs |[NGXOperationLogs](/azure/azure-monitor/reference/tables/ngxoperationlogs)<p>NGINX access and error logs captured by NGINXaaS.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/ngxoperationlogs)|Yes |
|`NginxSecurityLogs` |NGINX Security Logs |[NGXSecurityLogs](/azure/azure-monitor/reference/tables/ngxsecuritylogs)<p>NGINX security logs captured by NGINXaaS.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/ngxsecuritylogs)|Yes |
|`NginxUpstreamUpdateLogs` |NGINX Upstream Update Logs |[NginxUpstreamUpdateLogs](/azure/azure-monitor/reference/tables/nginxupstreamupdatelogs)<p>NGINX upstream update logs captured by NGINXaaS.|Yes|Yes|[Queries](/azure/azure-monitor/reference/queries/nginxupstreamupdatelogs)|Yes |