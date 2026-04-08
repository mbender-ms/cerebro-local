---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.RecoveryServices/Vaults, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Health
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Backup Health Events (preview)**<br><br>The count of health events pertaining to backup job health |`BackupHealthEvent` |Count |Count |`dataSourceURL`, `backupInstanceUrl`, `dataSourceType`, `healthStatus`, `backupInstanceName`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, PT24H |Yes|
|**Restore Health Events (preview)**<br><br>The count of health events pertaining to restore job health |`RestoreHealthEvent` |Count |Count |`dataSourceURL`, `backupInstanceUrl`, `dataSourceType`, `healthStatus`, `backupInstanceName`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, PT24H |Yes|