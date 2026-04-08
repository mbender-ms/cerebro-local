---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.NetworkCloud/storageAppliances, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`StorageApplianceAlert` |Storage Appliance alerts |[NCSStorageAlerts](/azure/azure-monitor/reference/tables/ncsstoragealerts)<p>Alert events logged from Nexus storage appliance providing storage system level alerts.|Yes|Yes||Yes |
|`StorageApplianceAudit` |Storage Appliance audits |[NCSStorageLogs](/azure/azure-monitor/reference/tables/ncsstoragelogs)<p>All Logs from Nexus storage appliance other than audit & alert logs.|Yes|Yes||Yes |
|`StorageApplianceLogs` |Storage Appliance logs |[NCSStorageLogs](/azure/azure-monitor/reference/tables/ncsstoragelogs)<p>All Logs from Nexus storage appliance other than audit & alert logs.|Yes|Yes||Yes |