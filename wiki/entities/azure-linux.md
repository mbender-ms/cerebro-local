---
title: Azure Linux (Mariner)
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-linux/*.md
tags:
  - compute
  - linux
  - os
  - aks
---

# Azure Linux (CBL-Mariner)

Microsoft's Linux distribution optimized for Azure and edge workloads. Lightweight, secure, and maintained by Microsoft. Default node OS option for AKS.

## Key Properties

- **Small footprint** — minimal base image, reduced attack surface
- **Security-focused** — signed packages, dm-verity, FIPS 140-2 support
- **Azure-optimized** — tuned kernel for Azure VM and AKS performance
- **Container-optimized** — excellent for container host OS
- **Microsoft-maintained** — regular security patches and updates

## Use Cases

| Scenario | Details |
|----------|---------|
| **AKS node pools** | Default Linux option for AKS nodes |
| **Azure IoT Edge** | Container host for edge devices |
| **Azure Stack Edge** | OS for edge compute |
| **VM workloads** | General-purpose Linux VM image |

## AKS Integration

```bash
# Create AKS cluster with Azure Linux nodes
az aks create --os-sku AzureLinux ...
# Migrate existing nodes
az aks nodepool update --os-sku AzureLinux ...
```

## Links

- [[entities/azure-aks]] — Azure Linux as default node OS
- [[entities/azure-virtual-machines]] — available as VM image
- [[comparisons/compute-options]] — compute platform choices
