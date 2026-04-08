---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.Sql/servers/jobAgents, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Basic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Elastic Jobs Executions Failed**<br><br>Number of job executions that failed while trying to execute on target |`elastic_jobs_failed` |Count |Total (Sum), Count |\<none\>|PT1M |Yes|
|**Elastic Jobs Executions Successful**<br><br>Number of job executions that were able to successfully execute on target |`elastic_jobs_successful` |Count |Total (Sum), Count |\<none\>|PT1M |Yes|
|**Elastic Jobs Executions Timed Out**<br><br>Number of job executions that expired before execution was able to finish on target. |`elastic_jobs_timeout` |Count |Total (Sum), Count |\<none\>|PT1M |Yes|