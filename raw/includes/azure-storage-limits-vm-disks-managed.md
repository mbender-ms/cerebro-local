---
 title: include file
 description: include file
 services: virtual-machines
 author: roygara
 ms.service: virtual-machines
 ms.topic: include
 ms.date: 04/28/2025
 ms.author: rogarana
 ms.custom: include file
---

### Standard HDD managed disks
[!INCLUDE [disk-storage-standard-hdd-sizes](./disk-storage-standard-hdd-sizes.md)]

### Standard SSD managed disks
[!INCLUDE [disk-storage-standard-ssd-sizes](./disk-storage-standard-ssd-sizes.md)]

### Premium SSD managed disks: Per-disk limits 
[!INCLUDE [disk-storage-premium-ssd-sizes](./disk-storage-premium-ssd-sizes.md)]

### Premium SSD v2 managed disks

Unlike Premium SSDs, Premium SSD v2 doesn't have dedicated sizes. You can set a Premium SSD v2 to any supported size you prefer, and make granular adjustments to the performance without downtime.

|Disk Size  |Maximum available IOPS  |Maximum available throughput (MB/s)  |
|---------|---------|---------|
|1 GiB-64 TiBs    |3,000-80,000 (Increases by 500 IOPS per GiB)        |125-1,200 (increases by 0.25 MB/s per set IOPS)         |

### Ultra Disks

Ultra Disk sizes work like Premium SSD, Standard SSD, and Standard HDD sizes. When you create or modify an Ultra Disk, the size you set is billed as the next largest provisioned disk size. So if you deploy a 200 GiB Ultra Disk or set a 200 GiB Ultra Disk, you'd have a 200 GiB Ultra Disk that's billed as if it was 256 GiB, since that's the next largest provisioned disk size.

The following table provides a comparison of disk sizes and performance caps to help you decide which to use.

[!INCLUDE [disks-ultra-sizes](disks-ultra-sizes.md)]
