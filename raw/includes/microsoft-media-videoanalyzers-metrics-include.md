---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.Media/videoanalyzers, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Pipeline
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Ingress Bytes**<br><br>The number of bytes ingressed by the pipeline node. |`IngressBytes` |Bytes |Total (Sum) |`PipelineKind`, `PipelineTopology`, `Pipeline`, `Node`|PT1M |Yes|
|**Pipelines**<br><br>The number of pipelines of each kind and state |`Pipelines` |Count |Total (Sum) |`PipelineKind`, `PipelineTopology`, `PipelineState`|PT5M |Yes|