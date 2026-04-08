---
author: msmbaldwin
ms.service: key-vault
ms.topic: include
ms.date: 07/23/2025
ms.author: mbaldwin
---

### Resource type: Managed HSM

This section describes service limits for resource type `managed HSM`.

#### Object limits

|Item|Limits|
|----|------:|
|Number of HSM instances per subscription per region|5
|Number of keys per HSM instance|5000
|Number of versions per key|100
|Number of custom role definitions per HSM instance|50
|Number of role assignments at HSM scope|50
|Number of role assignments at each individual key scope|10

For detailed performance capacity planning and scaling guidance, see [Azure Managed HSM scaling guidance](/azure/key-vault/managed-hsm/scaling-guidance).
