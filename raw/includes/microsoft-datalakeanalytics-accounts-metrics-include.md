---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.DataLakeAnalytics/accounts, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Cancelled AU Time**<br><br>Total AU time for cancelled jobs. |`JobAUEndedCancelled` |Seconds |Total (Sum) |\<none\>|PT1M |Yes|
|**Failed AU Time**<br><br>Total AU time for failed jobs. |`JobAUEndedFailure` |Seconds |Total (Sum) |\<none\>|PT1M |Yes|
|**Successful AU Time**<br><br>Total AU time for successful jobs. |`JobAUEndedSuccess` |Seconds |Total (Sum) |\<none\>|PT1M |Yes|
|**Cancelled Jobs**<br><br>Count of cancelled jobs. |`JobEndedCancelled` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Failed Jobs**<br><br>Count of failed jobs. |`JobEndedFailure` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Successful Jobs**<br><br>Count of successful jobs. |`JobEndedSuccess` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Jobs in Stage**<br><br>Number of jobs in each stage. |`JobStage` |Count |Total (Sum) |\<none\>|PT1M |Yes|