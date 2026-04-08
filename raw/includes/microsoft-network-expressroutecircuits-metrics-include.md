---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.Network/expressRouteCircuits, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Circuit Availability
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Arp Availability**<br><br>ARP Availability from MSEE towards all peers. |`ArpAvailability` |Percent |Average |`PeeringType`, `Peer`|PT1M |Yes|
|**Bgp Availability**<br><br>BGP Availability from MSEE towards all peers. |`BgpAvailability` |Percent |Average |`PeeringType`, `Peer`|PT1M |Yes|

### Category: Circuit Qos
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**DroppedInBitsPerSecond**<br><br>Ingress bits of data dropped per second |`QosDropBitsInPerSecond` |BitsPerSecond |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|
|**DroppedOutBitsPerSecond**<br><br>Egress bits of data dropped per second |`QosDropBitsOutPerSecond` |BitsPerSecond |Average |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|

### Category: Circuit Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**BitsInPerSecond**<br><br>Bits ingressing Azure per second |`BitsInPerSecond` |BitsPerSecond |Average |`PeeringType`, `DeviceRole`|PT1M |Yes|
|**BitsOutPerSecond**<br><br>Bits egressing Azure per second |`BitsOutPerSecond` |BitsPerSecond |Average |`PeeringType`, `DeviceRole`|PT1M |Yes|
|**EgressBandwidthUtilization**<br><br>Egress Link Bandwidth percentage utilization |`EgressBandwidthUtilization` |Percent |Maximum |`PeeringType`, `DeviceRole`|PT1M |Yes|
|**IngressBandwidthUtilization**<br><br>Ingress Link Bandwidth percentage utilization |`IngressBandwidthUtilization` |Percent |Maximum |`PeeringType`, `DeviceRole`|PT1M |Yes|

### Category: Fastpath
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**FastPathRoutesCount**<br><br>Count of fastpath routes configured on circuit |`FastPathRoutesCountForCircuit` |Count |Maximum |\<none\>|PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |Yes|

### Category: GlobalReach Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**GlobalReachBitsInPerSecond**<br><br>Bits ingressing Azure per second |`GlobalReachBitsInPerSecond` |BitsPerSecond |Average |`PeeredCircuitSKey`|PT1M |No|
|**GlobalReachBitsOutPerSecond**<br><br>Bits egressing Azure per second |`GlobalReachBitsOutPerSecond` |BitsPerSecond |Average |`PeeredCircuitSKey`|PT1M |No|