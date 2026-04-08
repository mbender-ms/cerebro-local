---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.HealthcareInterop/fhirQueryEventBatchChannels, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Errors
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Destination Write Errors**<br><br>Number of errors in writing files to destination. |`DestinationWriteFileFailure` |Count |Total (Sum) |`fhirResourceType`, `channelId`, `jobId`|PT1M |Yes|

### Category: Latency
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**EMR Query Latency**<br><br>Latency of EMR FHIR endpoints. |`EmrQueryLatencyMs` |Count |Average |`fhirResourceType`, `channelId`, `jobId`|PT1M |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**EMR Queries**<br><br>Number of FHIR Queries on EMR endpoint. |`EmrQueries` |Count |Total (Sum) |`fhirResourceType`, `channelId`, `jobId`|PT1M |Yes|
|**FHIR Resources Retrieved**<br><br>Number of FHIR Resources retrieved from EMR endpoint. |`FhirResourcesRetrieved` |Count |Total (Sum) |`fhirResourceType`, `channelId`, `jobId`|PT1M |Yes|
|**Destination Write Count**<br><br>Number of resources written to destination as part of NDJSON transformation. |`FhirTransformationOutputCreated` |Count |Total (Sum) |`fhirResourceType`, `channelId`, `jobId`|PT1M |Yes|
|**FHIR ID Extracted**<br><br>Number of FHIR resource identifiers extracted during file ingestion. |`IdentifierExtracted` |Count |Total (Sum) |`channelId`, `jobId`|PT1M |Yes|
|**Job Completed**<br><br>Number of jobs completed. |`JobCompleted` |Count |Total (Sum) |`channelId`, `jobId`|PT1M |Yes|
|**Job Started**<br><br>Number of jobs started. |`JobStarted` |Count |Total (Sum) |`channelId`, `jobId`|PT1M |Yes|