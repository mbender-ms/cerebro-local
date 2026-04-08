---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.MachineLearningServices/registries, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`RegistryAssetReadEvent` |Registry Asset Read Event |[AmlRegistryReadEventsLog](/azure/azure-monitor/reference/tables/amlregistryreadeventslog)<p>Azure ML Registry Read events log. It keeps records of Read operations with registries data access (data plane), including user identity, asset name and version for each access event.|No|Yes||Yes |
|`RegistryAssetWriteEvent` |Registry Asset Write Event |[AmlRegistryWriteEventsLog](/azure/azure-monitor/reference/tables/amlregistrywriteeventslog)<p>Azure ML Registry Write events log. It keeps records of Write operations with registries data access (data plane), including user identity, asset name and version for each access event.|No|Yes|[Queries](/azure/azure-monitor/reference/queries/amlregistrywriteeventslog)|Yes |