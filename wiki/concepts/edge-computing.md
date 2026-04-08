---
title: Edge Computing on Azure
created: 2026-04-07
updated: 2026-04-07
sources:
  - databox-online/*.md
  - azure-arc/*.md
  - iot-edge/*.md
tags:
  - edge
  - hybrid
  - iot
  - compute
---

# Edge Computing on Azure

Running Azure services and workloads at the network edge — on-premises, in factories, at remote sites, or on devices.

## Azure Edge Services

| Service | Form Factor | Use Case |
|---------|-------------|----------|
| **Azure Stack Edge** | Microsoft hardware appliance | AI inference, data transfer, VMs at edge |
| **Azure Stack HCI** | Customer hardware, Azure-managed | Run Azure services on-prem (VMs, AKS, AVD) |
| **Azure Arc** | Software agent on any infrastructure | Manage any K8s, SQL, VM from Azure |
| **Azure IoT Edge** | Software runtime on Linux devices | Deploy containerized workloads to IoT devices |
| **Azure Private MEC** | Carrier-grade edge with 5G | Ultra-low latency applications |
| **Azure Extended Zones** | Small Azure regions near metro areas | Edge of Microsoft's network |

## Azure Arc for Edge

Arc extends Azure management plane to any infrastructure:
- **Arc-enabled Kubernetes** — manage any K8s cluster from Azure portal
- **Arc-enabled servers** — Azure policy, monitoring, extensions on any VM
- **Arc-enabled data services** — SQL Managed Instance and PostgreSQL anywhere
- **Arc-enabled app services** — App Service, Functions, Logic Apps on Arc K8s

## Data at the Edge

| Pattern | Tool | Description |
|---------|------|-------------|
| **Continuous upload** | Azure Stack Edge | NFS/SMB shares → Azure Blob/Files |
| **Edge inference** | Azure Stack Edge GPU | Run ML models locally, send results to cloud |
| **Store and forward** | IoT Edge | Buffer telemetry, upload when connected |
| **Gateway** | Data Box Gateway | Virtual appliance for cloud storage gateway |

## Links

- [[entities/databox-online]] — Azure Stack Edge appliances
- [[entities/azure-arc]] — Arc management plane
- [[comparisons/hybrid-edge-options]] — full comparison of edge options
- [[entities/azure-kubernetes-fleet]] — manage Arc K8s at scale via Fleet
