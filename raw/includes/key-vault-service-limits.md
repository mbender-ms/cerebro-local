---
author: msmbaldwin
ms.service: key-vault
ms.topic: include
ms.date: 07/23/2025
ms.author: mbaldwin
---

### Resource type: vault

This section describes service limits for resource type `vaults`.

#### Key transactions (maximum transactions allowed in 10 seconds, per vault per region<sup>1</sup>)

|Key type|HSM key<br>CREATE key|HSM key<br>All other transactions|Software key<br>CREATE key|Software key<br>All other transactions|
|:---|---:|---:|---:|---:|
|RSA 2,048-bit|10|2,000|20|4,000|
|RSA 3,072-bit|10|500|20|1,000|
|RSA 4,096-bit|10|250|20|500|
|ECC P-256|10|2,000|20|4,000|
|ECC P-384|10|2,000|20|4,000|
|ECC P-521|10|2,000|20|4,000|
|ECC SECP256K1|10|2,000|20|4,000|
||||||

> [!NOTE]
> In the previous table, we see that for RSA 2,048-bit software keys, 4,000 GET transactions per 10 seconds are allowed. For RSA 2,048-bit HSM-keys, 2,000 GET transactions per 10 seconds are allowed.
>
> The throttling thresholds are weighted, and enforcement is on their sum. For example, as shown in the previous table, when you perform GET operations on RSA HSM-keys, it's eight times more expensive to use 4,096-bit keys compared to 2,048-bit keys because 2,000/250 = 8.
>
> In a given 10-second interval, an Azure Key Vault client can do *only one* of the following operations before it encounters a `429` throttling HTTP status code:
> - 4,000 RSA 2,048-bit software-key GET transactions
> - 2,000 RSA 2,048-bit HSM-key GET transactions
> - 250 RSA 4,096-bit HSM-key GET transactions
> - 248 RSA 4,096-bit HSM-key GET transactions and 16 RSA 2,048-bit HSM-key GET transactions

#### Secrets, managed storage account keys, and vault transactions

| Transactions type | Maximum transactions allowed in 10 seconds, per vault per region<sup>1</sup> |
| --- | --- |
| Secret<br>CREATE secret| 300 (collectively across all three operations) |
| Certificate<br>IMPORT certificate| 300 (collectively across all three operations) |
| Key<br>IMPORT key| 300 (collectively across all three operations) |
| All other transactions |4,000 |

> [!NOTE]
> The 300-transaction limit applies collectively across the "CREATE secret," "IMPORT certificate," and "IMPORT key" operations. For example, if within 10 seconds you create 100 secrets, import 100 certificates, and import 100 keys, you will reach the limit and encounter throttling.  For information on how to handle throttling when these limits are exceeded, see [Azure Key Vault throttling guidance](/azure/key-vault/general/overview-throttling).

<sup>1</sup> A subscription-wide limit for all transaction types is five times per key vault limit.

#### Backup keys, secrets, certificates

When you back up a key vault object, such as a secret, key, or certificate, the backup operation downloads the object as an encrypted blob. This blob cannot be decrypted outside of Azure. To get usable data from this blob, you must restore the blob into a key vault within the same Azure subscription and Azure geography

| Transactions type | Maximum key vault object versions allowed |
| --- | --- |
| Back up individual key, secret, certificate |500 |

> [!NOTE]
> If you attempt to back up a key, secret, or certificate object with more versions than the limit, the operation results in an error. It is not possible to delete previous versions of a key, secret, or certificate.

### Limits on count of keys, secrets, and certificates

Key Vault does not restrict the number of keys, secrets or certificates that can be stored in a vault. The transaction limits on the vault should be taken into account to ensure that operations are not throttled.

Key Vault does not restrict the number of versions on a secret, key or certificate, but storing a large number of versions (500+) can impact the performance of backup operations. See [Azure Key Vault Backup](/azure/key-vault/general/backup).
