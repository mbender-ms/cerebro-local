---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.Attestation/attestationProviders, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`AuditEvent` |AuditEvent message log category. ||No|No||No |
|`NotProcessed` |Requests which could not be processed. ||No|No||Yes |
|`Operational` |Operational message log category. |[AzureAttestationDiagnostics](/azure/azure-monitor/reference/tables/azureattestationdiagnostics)<p>Logs from attestation requests.|No|Yes|[Queries](/azure/azure-monitor/reference/queries/azureattestationdiagnostics)|Yes |