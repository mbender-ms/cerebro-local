---
ms.topic: include
ms.date: 04/16/2025
ms.custom: microsoft.securitydetonation/chambers, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Latency
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Submission Duration**<br><br>The submission duration (processing time), from creation to completion. |`SubmissionDuration` |MilliSeconds |Maximum, Minimum |`Region`|PT1M |No|

### Category: Saturation
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Capacity Utilization**<br><br>The percentage of the allocated capacity the resource is actively using. |`CapacityUtilization` |Percent |Maximum, Minimum |`Region`|PT1M |No|
|**CPU Utilization**<br><br>The percentage of the CPU that is being utilized across the resource. |`CpuUtilization` |Percent |Average, Maximum, Minimum |`Region`|PT1M |No|
|**Available Disk Space**<br><br>The percent amount of available disk space across the resource. |`PercentFreeDiskSpace` |Percent |Average, Maximum, Minimum |`Region`|PT1M |No|
|**Outstanding Submissions**<br><br>The average number of outstanding submissions that are queued for processing. |`SubmissionsOutstanding` |Count |Average, Maximum, Minimum |`Region`|PT1M |No|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**CreateSubmission Api Results**<br><br>The total number of CreateSubmission API requests, with return code. |`CreateSubmissionApiResult` |Count |Count |`OperationName`, `ServiceTypeName`, `Region`, `HttpReturnCode`|PT1M |No|
|**Completed Submissions / Hr**<br><br>The number of completed submissions / Hr. |`SubmissionsCompleted` |Count |Maximum, Minimum |`Region`|PT1M |No|
|**Failed Submissions / Hr**<br><br>The number of failed submissions / Hr. |`SubmissionsFailed` |Count |Maximum, Minimum |`Region`|PT1M |No|
|**Successful Submissions / Hr**<br><br>The number of successful submissions / Hr. |`SubmissionsSucceeded` |Count |Maximum, Minimum |`Region`|PT1M |No|