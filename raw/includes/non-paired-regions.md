---
author: msmbaldwin
ms.service: key-vault
ms.topic: include
ms.date: 07/23/2025
ms.author: msmbaldwin
# To inform users about Azure Key Vault's data replication strategy using zone redundant storage (ZRS) and the additional capability to manually replicate vault contents to another region through the backup and restore feature.

---

For [Azure regions with availability zones](/azure/reliability/availability-zones-overview?tabs=azure-cli), Azure Key Vault uses zone redundant storage to replicate your data within the region, across independent availability zones.

You can also use the [backup and restore](/azure/key-vault/general/backup) feature to replicate the contents of your vault to another region of your choice.
