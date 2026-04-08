---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.Network/dnsResolverPolicies, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Resolver Policy Rule Count**<br><br>This metric indicates the number of rules present in each DNS Resolver Policy. |`ResolverPolicyRuleCount` |Count |Average, Minimum, Maximum, Count |\<none\>|PT1H, PT6H, PT12H, P1D |Yes|
|**Virtual Network Link Count**<br><br>This metric indicates the number of associated virtual network links to a Resolver Policy. |`ResolverPolicyVNetLinksCount` |Count |Average, Minimum, Maximum, Count |\<none\>|PT1H, PT6H, PT12H, P1D |Yes|