---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.NetworkFunction/azureTrafficCollectors, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`ATCMicrosoftPeeringMetadata` |Microsoft Peering Metadata |[ATCMicrosoftPeeringMetadata](/azure/azure-monitor/reference/tables/atcmicrosoftpeeringmetadata)<p>This table has Microsoft Peering public IP metadata.|No|Yes||Yes |
|`ATCPrivatePeeringMetadata` |Private Peering Metadata |[ATCPrivatePeeringMetadata](/azure/azure-monitor/reference/tables/atcprivatepeeringmetadata)<p>This table has Private Peering Vnet metadata.|No|Yes||Yes |
|`ExpressRouteCircuitIpfix` |Express Route Circuit IPFIX Flow Records |[ATCExpressRouteCircuitIpfix](/azure/azure-monitor/reference/tables/atcexpressroutecircuitipfix)<p>This table has Express Route Circuit IPFIX flow records. Flow records are captured and emitted by Azure Traffic Collector (ATC).|No|Yes|[Queries](/azure/azure-monitor/reference/queries/atcexpressroutecircuitipfix)|Yes |