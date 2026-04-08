---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.MobileNetwork/radioAccessNetworks, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Derived Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Derived Connection Success Rate (CSR)**<br><br>Percentage of successful connections on the given access point. |`dConnectionSuccessRate` |Percent |Average |`APIdentifier`|PT1M |Yes|
|**Derived Mobility Success Rate (MSR)**<br><br>Percentage of successful handovers on the given access point. |`dMobilitySuccessRate` |Percent |Average |`APIdentifier`|PT1M |Yes|
|**Derived Receive Throughput**<br><br>Throughput of received data on a given access point. |`dReceiveThroughput` |BitsPerSecond |Average |`APIdentifier`|PT1M |Yes|
|**Derived Transmit Throughput**<br><br>Throughput of transmitted data by a given access point. |`dTransmitThroughput` |BitsPerSecond |Average |`APIdentifier`|PT1M |Yes|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Active Receive Time**<br><br>The actual time of receiving data on the access point during the last sampling interval. |`ActiveReceiveTime` |MilliSeconds |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Active Transmit Time**<br><br>The actual time of transmitted data by the access poiont during the last sampling interval. |`ActiveTransmitTime` |MilliSeconds |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Active Users**<br><br>Number of currently active users on the Access Point. |`ActiveUsers` |Count |Total (Sum) |`APIdentifier`|PT1M |No|
|**Availability Rate**<br><br>Percentage of the sampling interval time that the access point was available. |`AvailabilityRate` |Percent |Average |`APIdentifier`|PT1M |Yes|
|**Attempted Connection Handovers**<br><br>Number of attempts made to handover connections on the access point during the last sampling interval. |`ConnectionHandoverAttempts` |Count |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Successful Connection Handovers**<br><br>Number of connection handovers on the access point during the last sampling interval. |`ConnectionHandoverSuccesses` |Count |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Additionally Established Connections**<br><br>Number of additional connections established on the access point during the last sampling interval. |`ConnectionsAdditionallyEstablished` |Count |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Connection Attempts**<br><br>Number of connection attempts on the access point during the last sampling interval. |`ConnectionsAttempted` |Count |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Abnormal Connection Terminations**<br><br>Number of abnormally terminated connections on the access point during the last sampling interval. |`ConnectionsDropped` |Count |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Connections Successfully Established**<br><br>Number of established connections on the access point during the last sampling interval. |`ConnectionsEstablished` |Count |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Initially Established Connections**<br><br>Number of connections that were initially established with the access point during the last sampling interval. |`ConnectionsInitiallyEstablished` |Count |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Re-Connection Attempts**<br><br>Number of re-connection attempts on the access point during the last sampling interval. |`ConnectionsReAttempted` |Count |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Connections Successfully Re-Established**<br><br>Number of connections re-established on the access point during the last sampling interval. |`ConnectionsReEstablished` |Count |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Downtime**<br><br>Number of seconds that the access point was down during the last sampling interval. |`Downtime` |Seconds |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Online Status**<br><br>Indicates if an access point was online during the whole sampling interval or not. The value 0 represents Offline and 1 represents Online. |`OnlineStatus` |Count |Total (Sum), Count, Maximum, Minimum |`APIdentifier`|PT1M |Yes|
|**Receive Data Rate**<br><br>The rate at which the data was received on the access point during the last sampling interval. |`ReceiveDataRate` |BitsPerSecond |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Receive Volume**<br><br>Volume of received data on the access point during the last sampling interval. |`ReceiveVolume` |Bytes |Total (Sum) |`APIdentifier`, `RANIdentifier`|PT1M |Yes|
|**Transmit Data Rate**<br><br>The rate at which the data was transmitted by the access point during last sampling interval. |`TransmitDataRate` |BitsPerSecond |Total (Sum) |`APIdentifier`|PT1M |Yes|
|**Transmit Volume**<br><br>Volume of data transmitted by the access point during the last sampling interval. |`TransmitVolume` |Bytes |Total (Sum) |`APIdentifier`, `RANIdentifier`|PT1M |Yes|