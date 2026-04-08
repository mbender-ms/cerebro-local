---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.Network/privateLinkServices, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Bytes In**<br><br>Total number of Bytes In |`PLSBytesIn` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Bytes Out**<br><br>Total number of Bytes Out |`PLSBytesOut` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Nat Ports Usage**<br><br>Nat Ports Usage |`PLSNatPortsUsage` |Percent |Average |`PrivateLinkServiceIPAddress`|PT1M |Yes|