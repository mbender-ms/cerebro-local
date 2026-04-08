---
title: Azure Hybrid and Edge Options
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-vmware/*.md
  - baremetal-infrastructure/*.md
  - azure-large-instances/*.md
  - extended-zones/*.md
tags:
  - comparison
  - hybrid
  - edge
---

# Azure Hybrid and Edge Options

## Decision Matrix

| Service | Model | Best for |
|---------|-------|----------|
| **Azure Arc** | Control plane for hybrid/multicloud | Manage servers, K8s, databases, services anywhere from Azure |
| [[entities/azure-vmware]] | VMware on Azure | Migrate/extend VMware workloads without re-platforming |
| [[entities/baremetal-infrastructure]] | Dedicated bare metal | SAP HANA, Oracle on dedicated hardware in Azure datacenters |
| [[entities/azure-large-instances]] | Large dedicated servers | SAP HANA on very large hardware (up to 24TB RAM) |
| [[entities/extended-zones]] | Small Azure footprint in metro areas | Low-latency edge compute close to users |
| [[entities/private-5g-core]] | Private mobile network | On-premises 5G/4G network managed from Azure |
| [[entities/azure-edge-hardware-center]] | Hardware ordering | Order and manage Azure edge devices (ASE, HCI, etc.) |

## Connectivity to Azure

| Solution | Connection | Latency | Bandwidth |
|----------|-----------|---------|-----------|
| [[entities/azure-expressroute]] | Private fiber | Low, consistent | Up to 100 Gbps |
| [[entities/azure-vpn-gateway]] | Encrypted internet tunnel | Variable | Up to 10 Gbps |
| [[entities/azure-virtual-wan]] | Managed hub (VPN + ER) | Mixed | Aggregate |
| Azure Arc | Public internet / ER / VPN | Variable | Control plane only |
