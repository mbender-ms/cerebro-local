---
ms.topic: include
ms.date: 03/23/2026
ms.custom: microsoft.deviceregistry/namespaces, naam

# NOTE:  This content is automatically generated using API calls to Azure. Any edits made on these files will be overwritten in the next run of the script. 
 
---




### Category: Traffic (Business)
|Metric|Name in REST API|Unit|Aggregation|Dimensions|Time Grains|DS Export|
|---|---|---|---|---|---|---|
|**Device Certificate Issued**<br><br>Total device certificates issued (including renewals/rotations). Use to track device certificate issuance volume by policy and verify provisioning flows. Updated every minute. |`DeviceCertificateIssued/Count` |Count |Total (Sum) |`PolicyName`, `Status`, `StatusCode`|PT1M |Yes|
|**Device Certificate Revoked**<br><br>Total device certificates revoked. Use to audit revocation activity, validate revocation policies, and detect unexpected spikes. Updated every minute. |`DeviceCertificateRevoked/Count` |Count |Total (Sum) |`PolicyName`, `Status`, `StatusCode`|PT1M |Yes|
|**Policy Certificate Issued**<br><br>Total policy certificates issued (including renewals/rotations). Use to track policy certificate (ICA) issuance volume. Updated every minute. |`PolicyCertificateIssued/Count` |Count |Total (Sum) |`PolicyName`, `Status`, `StatusCode`|PT1M |Yes|
|**Policy Certificate Revoked**<br><br>Total policy certificates revoked. Use to audit revocation activity, validate revocation policies, and detect unexpected spikes. Updated every minute. |`PolicyCertificateRevoked/Count` |Count |Total (Sum) |`PolicyName`, `Status`, `StatusCode`|PT1M |Yes|