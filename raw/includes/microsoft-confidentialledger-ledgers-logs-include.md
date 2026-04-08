---
ms.topic: include
ms.date: 03/27/2026
ms.custom: Microsoft.ConfidentialLedger/Ledgers, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`transactionlogs` |Azure Confidential Ledger activity Logs with UserId |[ACLTransactionLogs](/azure/azure-monitor/reference/tables/acltransactionlogs)<p>Logs related to transactions.|Yes|No|[Queries](/azure/azure-monitor/reference/queries/acltransactionlogs)|Yes |
|`userdefinedlogs` |Azure Confidential Ledger UDE/UDF logs |[ACLUserDefinedLogs](/azure/azure-monitor/reference/tables/acluserdefinedlogs)<p>Logs related to User Defined Functions and User Defined Endpoints.|Yes|No|[Queries](/azure/azure-monitor/reference/queries/acluserdefinedlogs)|Yes |