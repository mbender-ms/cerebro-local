---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.DocumentDB/DatabaseAccounts, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 

---
  
  
|Category|Category display name| Log table| [Supports basic log plan](/azure/azure-monitor/logs/basic-logs-configure?tabs=portal-1#compare-the-basic-and-analytics-log-data-plans)|[Supports ingestion-time transformation](/azure/azure-monitor/essentials/data-collection-transformations)| Example queries |Costs to export|
|---|---|---|---|---|---|---|
|`CassandraRequests` |CassandraRequests |[CDBCassandraRequests](/azure/azure-monitor/reference/tables/cdbcassandrarequests)<p>This table details data plane operations, specifically for Cassandra API accounts.|Yes|Yes||No |
|`ControlPlaneRequests` |ControlPlaneRequests |[CDBControlPlaneRequests](/azure/azure-monitor/reference/tables/cdbcontrolplanerequests)<p>This table details all control plane operations executed on the account, which include modifications to the regional failover policy, indexing policy, IAM role assignments, backup/restore policies, VNet and firewall rules, private links as well as updates and deletes of the account.|Yes|Yes||No |
|`DataPlaneRequests` |DataPlaneRequests |[CDBDataPlaneRequests](/azure/azure-monitor/reference/tables/cdbdataplanerequests)<p>The DataPlaneRequests table captures every data plane operation for the Cosmos DB account. Data Plane requests are operations executed to create, update, delete or retrieve data within the account.|Yes|Yes||No |
|`DataPlaneRequests15M` |DataPlaneRequests - Aggregated 15 Min |[CDBDataPlaneRequests15M](/azure/azure-monitor/reference/tables/cdbdataplanerequests15m)<p>The CDBDataPlaneRequests5M table consolidates logs for data-plane requests every fifteen minutes. These logs are aggregated based on the columns in the CDBDataPlaneRequests table. For detailed information about the log context, please refer to the CDBDataPlaneRequests table.|Yes|No||Yes |
|`DataPlaneRequests5M` |DataPlaneRequests - Aggregated 5 Min |[CDBDataPlaneRequests5M](/azure/azure-monitor/reference/tables/cdbdataplanerequests5m)<p>The CDBDataPlaneRequests5M table consolidates logs for data-plane requests every five minutes. These logs are aggregated based on the columns in the CDBDataPlaneRequests table. For detailed information about the log context, please refer to the CDBDataPlaneRequests table.|Yes|No||Yes |
|`GremlinRequests` |GremlinRequests |[CDBGremlinRequests](/azure/azure-monitor/reference/tables/cdbgremlinrequests)<p>This table details data plane operations, specifically for Graph API accounts.|Yes|Yes||No |
|`MongoRequests` |MongoRequests |[CDBMongoRequests](/azure/azure-monitor/reference/tables/cdbmongorequests)<p>This table details data plane operations, specifically for Mongo API accounts.|Yes|Yes||No |
|`PartitionKeyRUConsumption` |PartitionKeyRUConsumption |[CDBPartitionKeyRUConsumption](/azure/azure-monitor/reference/tables/cdbpartitionkeyruconsumption)<p>This table details the RU (Request Unit) consumption for logical partition keys in each region, within each of their physical partitions. This data can be used to identify hot partitions from a request volume perspective.|Yes|Yes||No |
|`PartitionKeyStatistics` |PartitionKeyStatistics |[CDBPartitionKeyStatistics](/azure/azure-monitor/reference/tables/cdbpartitionkeystatistics)<p>This table provides outlier logical partition keys that have consumed more storage space than others. Statistics are based on a sub-sampling of partition keys within the collection and hence these are approximate. Partition keys that are below 1GB of storage may not show up in the reported statistics.|Yes|Yes||No |
|`QueryRuntimeStatistics` |QueryRuntimeStatistics |[CDBQueryRuntimeStatistics](/azure/azure-monitor/reference/tables/cdbqueryruntimestatistics)<p>This table details query operations executed against a SQL API account. By default, the query text and its parameters are obfuscated to avoid logging PII data with full text query logging available by request.|Yes|Yes||No |
|`TableApiRequests` |TableApiRequests |[CDBTableApiRequests](/azure/azure-monitor/reference/tables/cdbtableapirequests)<p>This table details data plane operations, specifically for Table API accounts.|Yes|Yes||Yes |