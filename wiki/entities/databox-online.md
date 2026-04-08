---
title: Azure Stack Edge (Data Box Online)
created: 2026-04-07
updated: 2026-04-07
sources:
  - databox-online/*.md
tags:
  - edge
  - compute
  - iot
  - hybrid
---

# Azure Stack Edge (Data Box Online)

Edge computing appliance from Microsoft that brings Azure compute, storage, and AI capabilities to the edge (on-premises, remote sites, factory floors).

## Product Line

| Device | Use Case |
|--------|----------|
| **Stack Edge Pro GPU** | AI inference, ML training at edge, NVIDIA GPU |
| **Stack Edge Pro FPGA** | Hardware-accelerated inference (legacy) |
| **Stack Edge Pro R** | Rugged — military, maritime, harsh environments |
| **Stack Edge Mini R** | Portable rugged edge device |

## Key Capabilities

- **Azure-managed** — deploy and manage from Azure portal
- **VM workloads** — run VMs on edge device
- **Kubernetes** — deploy containerized workloads via Arc-enabled K8s
- **AI/ML** — GPU-accelerated inference at edge
- **Data transfer** — continuous data pipeline to Azure Blob/Files
- **Network functions** — run Azure Private MEC, 5G core at edge
- **Certificates** — managed TLS certificates for secure communication

## Data Path

Edge device → Azure Storage (Blob/Files) → Cloud processing. Supports continuous upload, bandwidth scheduling, and local caching.

## Links

- [[entities/azure-arc]] — Arc-enabled K8s on Stack Edge
- [[comparisons/hybrid-edge-options]] — Stack Edge vs Azure Arc vs VMware
- [[entities/azure-kubernetes-fleet]] — manage edge K8s clusters at scale
