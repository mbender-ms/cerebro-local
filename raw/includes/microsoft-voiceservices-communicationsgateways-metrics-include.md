---
ms.topic: include
ms.date: 04/16/2025
ms.custom: Microsoft.VoiceServices/CommunicationsGateways, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Error
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Active Call Failures**<br><br>Percentage of active call failures |`ActiveCallFailures` |Percent |Average, Minimum, Maximum |`Region`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|

### Category: Preview Call Protection
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Bot Incoming Requests**<br><br>Count of the total number of incoming requests to the AI Voice Services bot |`ACGBotIncomingRequestsCounter` |Count |Total (Sum) |`BotType`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**AI Voice Services Incoming Requests**<br><br>Count of the total number of incoming requests to AI Voice Services |`ACGVBCIncomingRequestsCounter` |Count |Total (Sum) |\<none\>|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**Fraud Detected Utterance Average**<br><br>Average number of utterances per call before a scam is detected |`AOCPVishingFraudDetectedHistogram` |Count |Average, Minimum, Maximum |`BotType`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**Fraud Alert SMS Sent Counter**<br><br>Count of the total number of fraud warning SMSs sent |`AOCPVishingSmsSentCounter` |Count |Total (Sum) |`BotType`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|

### Category: Traffic
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Active Calls**<br><br>Count of the total number of active calls (signaling sessions) |`ActiveCalls` |Count |Average, Minimum, Maximum |`Region`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**Active Emergency Calls**<br><br>Count of the total number of active emergency calls |`ActiveEmergencyCalls` |Count |Average, Minimum, Maximum |`Region`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**SIP 2xx Responses Received**<br><br>SIP 2xx Responses Received for both OPTIONS and INVITE SIP Methods by this Communications Gateway Resource from your Network |`OPTIONS2XXReceived` |Count |Total (Sum) |`Region`, `index`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**SIP 2xx Responses Sent**<br><br>SIP 2xx Responses Sent for both OPTIONS and INVITE SIP Methods by this Communications Gateway Resource to your Network |`OPTIONS2XXSent` |Count |Total (Sum) |`Region`, `index`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**SIP 3xx Responses Received**<br><br>SIP 3xx Responses Received for both OPTIONS and INVITE SIP Methods by this Communications Gateway Resource from your Network |`OPTIONS3XXReceived` |Count |Total (Sum) |`Region`, `index`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**SIP 3xx Responses Sent**<br><br>SIP 3xx Responses Sent for both OPTIONS and INVITE SIP Methods by this Communications Gateway Resource to your Network |`OPTIONS3XXSent` |Count |Total (Sum) |`Region`, `index`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**SIP 4xx Responses Received**<br><br>SIP 4xx Responses Received for both OPTIONS and INVITE SIP Methods by this Communications Gateway Resource from your Network |`OPTIONS4XXReceived` |Count |Total (Sum) |`Region`, `index`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**SIP 4xx Responses Sent**<br><br>SIP 4xx Responses Sent for both OPTIONS and INVITE SIP Methods by this Communications Gateway Resource to your Network |`OPTIONS4XXSent` |Count |Total (Sum) |`Region`, `index`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**SIP 5xx Responses Received**<br><br>SIP 5xx Responses Received for both OPTIONS and INVITE SIP Methods by this Communications Gateway Resource from your Network |`OPTIONS5XXReceived` |Count |Total (Sum) |`Region`, `index`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**SIP 5xx Responses Sent**<br><br>SIP 5xx Responses Sent for both OPTIONS and INVITE SIP Methods by this Communications Gateway Resource to your Network |`OPTIONS5XXSent` |Count |Total (Sum) |`Region`, `index`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**SIP 6xx Responses Received**<br><br>SIP 6xx Responses Received for both OPTIONS and INVITE SIP Methods by this Communications Gateway Resource from your Network |`OPTIONS6XXReceived` |Count |Total (Sum) |`Region`, `index`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|
|**SIP 6xx Responses Sent**<br><br>SIP 6xx Responses Sent for both OPTIONS and INVITE SIP Methods by this Communications Gateway Resource to your Network |`OPTIONS6XXSent` |Count |Total (Sum) |`Region`, `index`|PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, P1D |No|