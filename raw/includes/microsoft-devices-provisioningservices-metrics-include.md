---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.Devices/provisioningServices, arm

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Attestation attempts**<br><br>Number of device attestations attempted |`AttestationAttempts` |Count |Total (Sum) |`ProvisioningServiceName`, `Status`, `Protocol`|PT1M |Yes|
|**Devices assigned**<br><br>Number of devices assigned to an IoT hub |`DeviceAssignments` |Count |Total (Sum) |`ProvisioningServiceName`, `IotHubName`|PT1M |Yes|
|**Registration attempts**<br><br>Number of device registrations attempted |`RegistrationAttempts` |Count |Total (Sum) |`ProvisioningServiceName`, `IotHubName`, `Status`|PT1M |Yes|