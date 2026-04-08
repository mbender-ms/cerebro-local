---
author: msmbaldwin
ms.service: security
ms.topic: include
ms.date: 12/03/2025
ms.author: mbaldwin
---
> [!IMPORTANT]
> Azure Disk Encryption is scheduled for retirement on **September 15, 2028**. Until that date, you can continue to use Azure Disk Encryption without disruption. On September 15, 2028, ADE-enabled workloads will continue to run, but encrypted disks will fail to unlock after VM reboots, resulting in service disruption. 
> 
> Use [encryption at host](/azure/virtual-machines/disk-encryption) for new VMs, or consider [Confidential VM sizes with OS disk encryption](/azure/confidential-computing/confidential-vm-overview#confidential-os-disk-encryption) for confidential computing workloads. All ADE-enabled VMs (including backups) must migrate to encryption at host before the retirement date to avoid service disruption. See [Migrate from Azure Disk Encryption to encryption at host](/azure/virtual-machines/disk-encryption-migrate) for details.