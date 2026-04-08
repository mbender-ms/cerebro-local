---
ms.topic: include
ms.date: 03/23/2026
ms.custom: Microsoft.Quantum/providerAccounts, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---


|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**CPU usage percentage**<br><br>CPU usage on the Device compute node |`CpuPercentage` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |No|
|**Quantum Device 1-qubit gate fidelity**<br><br>1-qubit gate fidelity of the Quantum Device in % |`Device1QubitGateFidelity` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device 1-qubit gate fidelity standard error**<br><br>Standard error of 1-qubit gate fidelity of the Quantum Device in % |`Device1QubitGateFidelityStdError` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device 2-qubit gate fidelity**<br><br>2-qubit gate fidelity of the Quantum Device in % |`Device2QubitGateFidelity` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device 2-qubit gate fidelity probability of loss (loss sources other than the gate)**<br><br>2-qubit gate fidelity probability of loss (loss sources other than gate) of the Quantum Device in % |`Device2QubitGateFidelityLossOther` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device 2-qubit gate fidelity probability of loss (loss sources other than the gate) standard error**<br><br>Standard error of 2-qubit gate fidelity probability of loss (loss sources other than the gate) of the Quantum Device in % |`Device2QubitGateFidelityLossOtherStdError` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device 2-qubit gate fidelity probability of loss**<br><br>2-qubit gate fidelity probability of loss of the Quantum Device in % |`Device2QubitGateFidelityLossProbability` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device 2-qubit gate fidelity probability of loss standard error**<br><br>Standard error of 2-qubit gate fidelity probability of loss of the Quantum Device in % |`Device2QubitGateFidelityLossProbabilityStdError` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device 2-qubit gate fidelity standard error**<br><br>Standard error of 2-qubit gate fidelity of the Quantum Device in % |`Device2QubitGateFidelityStdError` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device chilled water temperature**<br><br>Chilled water temperature of the Quantum Device in C |`DeviceChilledWaterTemperature` |Count |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device enclosure humidity**<br><br>Humidity inside the Quantum Device enclosure in % |`DeviceEnclosureHumidity` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device enclosure pressure**<br><br>Pressure inside the Quantum Device enclosure in hPa |`DeviceEnclosurePressure` |Count |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device enclosure temperature**<br><br>Temperature inside the Quantum Device enclosure in C |`DeviceEnclosureTemperature` |Count |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device helium flow rate**<br><br>Helium flow rate of the Quantum Device in L/min |`DeviceHeliumFlowRate` |Count |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device idle error rate**<br><br>Idle error rate of the Quantum Device in % |`DeviceIdleErrorRate` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device laser lock state**<br><br>Laser lock state of the Quantum Device (0 - unlocked, 1 - locked) |`DeviceLaserLockState` |Count |Maximum, Minimum, Average |`DeviceName`|PT1M |Yes|
|**Quantum Device atom loading loss rate**<br><br>Atom loading loss rate of the Quantum Device in % |`DeviceLoadingLossRate` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device atom movement loss rate**<br><br>Atom movement loss rate of the Quantum Device in % |`DeviceMovementLossRate` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device qubit mismeasurement 0 as 1 probability**<br><br>Qubit mismeasurement 0 as 1 probability of the Quantum Device in % |`DeviceQubitMeasurement01Probability` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Quantum Device qubit mismeasurement 1 as 0 probability**<br><br>Qubit mismeasurement 1 as 0 probability of the Quantum Device in % |`DeviceQubitMeasurement10Probability` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Disk free space percentage**<br><br>Disk free space on the Device compute node |`DiskSpaceAvailabilityPercentage` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |No|
|**Quantum Engine availability**<br><br>Shows the availability of the Quantum Engine. |`EngineAvailability` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |Yes|
|**Job cancellation rate**<br><br>Shows the rate at which jobs that are in processing get cancelled by users. |`JobCancellationRate` |Count |Count, Total (Sum), Average |`QueueId`, `QueueName`, `TargetId`, `TargetName`|PT1M |Yes|
|**Job completion rate**<br><br>Shows the rate at which job processing completes successfully. |`JobCompletionRate` |Count |Count, Total (Sum), Average |`QueueId`, `QueueName`, `TargetId`, `TargetName`|PT1M |Yes|
|**Job creation rate**<br><br>Shows the rate at which jobs are being submitted to a queue. |`JobCreationRate` |Count |Count, Total (Sum), Average |`QueueId`, `QueueName`, `TargetId`, `TargetName`|PT1M |Yes|
|**Job failure rate**<br><br>Shows the rate at which jobs are failing during processing. |`JobFailureRate` |Count |Count, Total (Sum), Average |`QueueId`, `QueueName`, `TargetId`, `TargetName`|PT1M |Yes|
|**Job queue size**<br><br>Current size of the job queue. |`JobQueueSize` |Count |Average, Maximum, Minimum |`QueueId`, `QueueName`|PT1M |Yes|
|**Job queue wait time**<br><br>Shows the average time (in seconds) a job spends in the queue until it starts processing. |`JobQueueWaitTime` |Seconds |Average, Maximum, Minimum |`QueueId`, `QueueName`|PT1M |Yes|
|**Memory usage percentage**<br><br>Memory usage on the Device compute node |`MemoryPercentage` |Percent |Average, Maximum, Minimum |`DeviceName`|PT1M |No|
|**Remaining subscription quota**<br><br>Shows rate at which the subscription quota is being used up. |`SubscriptionQuotaUsageRate` |Count |Average, Maximum, Minimum |`SubscriptionId`, `QuotaPriorityName`|PT1M |Yes|
|**Target availability**<br><br>Shows the availability of the target. |`TargetAvailability` |Percent |Average, Maximum, Minimum |`QueueId`, `QueueName`, `TargetId`, `TargetName`|PT1M |Yes|
|**Target queue size**<br><br>Current size of the target queue. |`TargetQueueSize` |Count |Average, Maximum, Minimum |`QueueId`, `QueueName`, `TargetId`, `TargetName`|PT1M |Yes|
|**Target wait time**<br><br>Shows the average time (in seconds) a job spends in the target until it starts processing. |`TargetWaitTime` |Seconds |Average, Maximum, Minimum |`QueueId`, `QueueName`, `TargetId`, `TargetName`|PT1M |Yes|