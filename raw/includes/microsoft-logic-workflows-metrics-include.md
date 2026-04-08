---
ms.topic: include
ms.date: 10/31/2025
ms.custom: Microsoft.Logic/Workflows, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Actions
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Action Latency**<br><br>Latency of completed workflow actions. |`ActionLatency` |Seconds |Average |\<none\>|PT1M |Yes|
|**Actions Completed**<br><br>Number of workflow actions completed. |`ActionsCompleted` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Actions Failed**<br><br>Number of workflow actions failed. |`ActionsFailed` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Actions Skipped**<br><br>Number of workflow actions skipped. |`ActionsSkipped` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Actions Started**<br><br>Number of workflow actions started. |`ActionsStarted` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Actions Succeeded**<br><br>Number of workflow actions succeeded. |`ActionsSucceeded` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Action Success Latency**<br><br>Latency of succeeded workflow actions. |`ActionSuccessLatency` |Seconds |Average |\<none\>|PT1M |Yes|
|**Action Throttled Events**<br><br>Number of workflow action throttled events.. |`ActionThrottledEvents` |Count |Total (Sum) |\<none\>|PT1M |Yes|

### Category: Agent
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Agent Loop Executions**<br><br>Number of agent loop executions. |`AgentLoopExecution` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Completion Token Overflow Usage**<br><br>Overflow usage for agent loop completion tokens. |`CompletionTokenOverflowUsage` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Prompt Token Overflow Usage**<br><br>Overflow usage for agent loop prompt tokens. |`PromptTokenOverflowUsage` |Count |Total (Sum) |\<none\>|PT1M |Yes|

### Category: Billing
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Billable Action Executions**<br><br>Number of workflow action executions getting billed. |`BillableActionExecutions` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Billable Trigger Executions**<br><br>Number of workflow trigger executions getting billed. |`BillableTriggerExecutions` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Billing Usage for Native Operation Executions**<br><br>Number of native operation executions getting billed. |`BillingUsageNativeOperation` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Billing Usage for Standard Connector Executions**<br><br>Number of standard connector executions getting billed. |`BillingUsageStandardConnector` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Billing Usage for Storage Consumption Executions**<br><br>Number of storage consumption executions getting billed. |`BillingUsageStorageConsumption` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Total Billable Executions**<br><br>Number of workflow executions getting billed. |`TotalBillableExecutions` |Count |Total (Sum) |\<none\>|PT1M |Yes|

### Category: Runs
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Run Failure Percentage**<br><br>Percentage of workflow runs failed. |`RunFailurePercentage` |Percent |Total (Sum) |\<none\>|PT1M |Yes|
|**Run Latency**<br><br>Latency of completed workflow runs. |`RunLatency` |Seconds |Average |\<none\>|PT1M |Yes|
|**Runs Cancelled**<br><br>Number of workflow runs cancelled. |`RunsCancelled` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Runs Completed**<br><br>Number of workflow runs completed. |`RunsCompleted` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Runs Failed**<br><br>Number of workflow runs failed. |`RunsFailed` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Runs Started**<br><br>Number of workflow runs started. |`RunsStarted` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Runs Succeeded**<br><br>Number of workflow runs succeeded. |`RunsSucceeded` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Run Start Throttled Events**<br><br>Number of workflow run start throttled events. |`RunStartThrottledEvents` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Run Success Latency**<br><br>Latency of succeeded workflow runs. |`RunSuccessLatency` |Seconds |Average |\<none\>|PT1M |Yes|
|**Run Throttled Events**<br><br>Number of workflow action or trigger throttled events. |`RunThrottledEvents` |Count |Total (Sum) |\<none\>|PT1M |Yes|

### Category: Triggers
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Trigger Fire Latency**<br><br>Latency of fired workflow triggers. |`TriggerFireLatency` |Seconds |Average |\<none\>|PT1M |Yes|
|**Trigger Latency**<br><br>Latency of completed workflow triggers. |`TriggerLatency` |Seconds |Average |\<none\>|PT1M |Yes|
|**Triggers Completed**<br><br>Number of workflow triggers completed. |`TriggersCompleted` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Triggers Failed**<br><br>Number of workflow triggers failed. |`TriggersFailed` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Triggers Fired**<br><br>Number of workflow triggers fired. |`TriggersFired` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Triggers Skipped**<br><br>Number of workflow triggers skipped. |`TriggersSkipped` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Triggers Started**<br><br>Number of workflow triggers started. |`TriggersStarted` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Triggers Succeeded**<br><br>Number of workflow triggers succeeded. |`TriggersSucceeded` |Count |Total (Sum) |\<none\>|PT1M |Yes|
|**Trigger Success Latency**<br><br>Latency of succeeded workflow triggers. |`TriggerSuccessLatency` |Seconds |Average |\<none\>|PT1M |Yes|
|**Trigger Throttled Events**<br><br>Number of workflow trigger throttled events. |`TriggerThrottledEvents` |Count |Total (Sum) |\<none\>|PT1M |Yes|