---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.IoTFirmwareDefense/workspaces, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Firmware Analysis Error Count**<br><br>Count of firmware uploads that errored or timed out |`FirmwareAnalysisErrorCount` |Count |Count, Total (Sum) |`AnalyzerType`|PT1M |Yes|
|**Firmware Analysis Latency**<br><br>Average time taken to complete firmware analysis |`FirmwareAnalysisLatency` |Milliseconds |Average, Minimum, Maximum, Total (Sum) |\<none\>|PT1M |Yes|