---
title: Azure Linux
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-linux/*.md
tags:
  - azure-service
  - compute
  - linux
---

# Azure Linux (CBL-Mariner / Azure Linux)

Microsoft's Linux distribution optimized for Azure and edge. Lightweight, secure, hardened for Azure workloads. Used as the default container host OS for AKS. (source: azure-linux/*.md — 28 articles)

## Key Features

- **Minimal footprint** — only packages needed for container hosting
- **Security hardened** — CIS benchmarks, signed packages, dm-verity
- **OS Guard** (preview) — runtime integrity monitoring and protection
- **AKS optimized** — default node OS for AKS, faster boot, smaller attack surface
- **Edge support** — runs on Azure Stack Edge and IoT devices

## Links

- [[entities/azure-aks]] — uses Azure Linux as default node OS
- [[entities/azure-virtual-machines]] — available as VM image
- [[comparisons/container-compute-options]]
- [[sources/azure-linux-docs]]
