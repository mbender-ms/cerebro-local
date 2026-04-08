---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.Network/azureFirewalls, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Application rules hit count**<br><br>Number of times Application rules were hit |`ApplicationRuleHit` |Count |Total (Sum) |`Status`, `Reason`, `Protocol`|PT1M |Yes|
|**Data processed**<br><br>Total amount of data processed by this firewall |`DataProcessed` |Bytes |Total (Sum) |\<none\>|PT1M |Yes|
|**Firewall health state**<br><br>Indicates the overall health of this firewall |`FirewallHealth` |Percent |Average |`Status`, `Reason`|PT1M |Yes|
|**Latency Probe**<br><br>Estimate of the average latency of the Firewall as measured by latency probe |`FirewallLatencyPng` |Milliseconds |Average |\<none\>|PT1M |Yes|
|**Network rules hit count**<br><br>Number of times Network rules were hit |`NetworkRuleHit` |Count |Total (Sum) |`Status`, `Reason`|PT1M |Yes|
|**Observed Capacity Units**<br><br>Reported number of capacity units for the Azure Firewall |`ObservedCapacity` |Unspecified |Average, Minimum, Maximum |\<none\>|PT1M |Yes|
|**SNAT port utilization**<br><br>Percentage of outbound SNAT ports currently in use |`SNATPortUtilization` |Percent |Average, Maximum |`Protocol`|PT1M |Yes|
|**Throughput**<br><br>Throughput processed by this firewall |`Throughput` |BitsPerSecond |Average |\<none\>|PT1M |No|
