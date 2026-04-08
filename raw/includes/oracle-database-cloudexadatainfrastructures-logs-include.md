---
ms.topic: include
ms.date: 03/27/2026
ms.custom: Oracle.Database/cloudExadataInfrastructures, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`Creation` |Creation Events ||No|No||Yes |
|`Critical` |Critical events ||No|No||Yes |
|`Delete` |Delete Events ||No|No||Yes |
|`Information` |Information Events ||No|No||Yes |
|`Maintenance` |Maintenance Events |[OracleCloudDatabase](/azure/azure-monitor/reference/tables/oracleclouddatabase)<p>Oracle Cloud Event logs.|Yes|No||Yes |
|`Update` |Update Events |[OracleCloudDatabase](/azure/azure-monitor/reference/tables/oracleclouddatabase)<p>Oracle Cloud Event logs.|Yes|No||Yes |