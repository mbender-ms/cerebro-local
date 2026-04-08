---
ms.topic: include
ms.date: 03/27/2026
ms.custom: Oracle.Database/dbSystems, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`Backup` |Database Backup Events ||No|No||Yes |
|`Creation` |Creation Events ||No|No||Yes |
|`Critical` |Database Critical Events ||No|No||Yes |
|`Delete` |Delete and Terminate Events ||No|No||Yes |
|`Health` |System Health Events ||No|No||Yes |
|`Information` |Database Information Events |[OracleCloudDatabase](/azure/azure-monitor/reference/tables/oracleclouddatabase)<p>Oracle Cloud Event logs.|Yes|No||Yes |
|`Restore` |Database Restore Events ||No|No||Yes |
|`Update` |Update Events |[OracleCloudDatabase](/azure/azure-monitor/reference/tables/oracleclouddatabase)<p>Oracle Cloud Event logs.|Yes|No||Yes |