---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.DataLakeStore/accounts, arm

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Data Read**<br><br>Total amount of data read from the account. |`DataRead` |Bytes |Total (Sum) |\<none\>|PT1M, PT1H |Yes|
|**Data Written**<br><br>Total amount of data written to the account. |`DataWritten` |Bytes |Total (Sum) |\<none\>|PT1M, PT1H |Yes|
|**Read Requests**<br><br>Count of data read requests to the account. |`ReadRequests` |Count |Total (Sum) |\<none\>|PT1M, PT1H |Yes|
|**Total Storage**<br><br>Total amount of data stored in the account. |`TotalStorage` |Bytes |Maximum |\<none\>|PT1M, PT1H |Yes|
|**Write Requests**<br><br>Count of data write requests to the account. |`WriteRequests` |Count |Total (Sum) |\<none\>|PT1M, PT1H |Yes|