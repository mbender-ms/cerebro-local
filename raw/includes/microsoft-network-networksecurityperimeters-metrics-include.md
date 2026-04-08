---
ms.topic: include
ms.date: 02/02/2026
ms.custom: Microsoft.Network/networkSecurityPerimeters, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**NSP Access Metrics**<br><br>NSP Access Metrics record inbound and outbound traffic to the associated PaaS resources, showing whether each was allowed or denied by NSP or resource rules. |`NspAccessMetric` |Count |Average, Maximum, Minimum, Total (Sum), Count |`AccessCategory`, `AccessMode`, `AccessRuleVersion`, `PaasArmId`, `ProfileName`|PT1M |Yes|