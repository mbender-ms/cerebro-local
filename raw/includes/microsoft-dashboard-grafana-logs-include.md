---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.Dashboard/grafana, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`GrafanaLoginEvents` |Grafana Login Events |[AGSGrafanaLoginEvents](/azure/azure-monitor/reference/tables/agsgrafanaloginevents)<p>Login events for an instance of Azure Managed Workspace for Grafana including user identity, user Grafana role (in success) and detailed message (in failure).|No|Yes|[Queries](/azure/azure-monitor/reference/queries/agsgrafanaloginevents)|Yes |
|`GrafanaUsageInsightsEvents` |Grafana Usage Insights Events |[AGSGrafanaUsageInsightsEvents](/azure/azure-monitor/reference/tables/agsgrafanausageinsightsevents)<p>Usage insights events for an instance of Azure Managed Workspace for Grafana.|No|Yes||Yes |