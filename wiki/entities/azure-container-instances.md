---
title: Azure Container Instances (ACI)
created: 2026-04-07
updated: 2026-04-07
sources:
  - container-instances/*.md
tags:
  - azure-service
  - compute
  - containers
  - serverless
---

# Azure Container Instances (ACI)

Fastest and simplest way to run containers in Azure. No VM management, no orchestrator required. Start Linux or Windows containers in seconds. (source: container-instances-overview.md — 89 articles)

## Key Features

- **Seconds-fast startup** — no VM provisioning; pull image and run
- **Custom sizes** — specify exact vCPU and memory per container
- **Public IP + FQDN** — expose directly to internet with custom DNS label
- **Persistent storage** — mount Azure Files shares
- **Linux and Windows** — both OS types supported
- **Container groups** — multiple containers sharing lifecycle, network, and storage (like Kubernetes pods)
- **Virtual network** — deploy into a VNet subnet for private networking
- **Spot containers** — reduced cost for interruptible workloads
- **Confidential containers** — hardware-based TEE with encrypted execution
- **Standby pools** — pre-warmed containers for even faster cold starts
- **Virtual nodes** — AKS integration (schedule AKS pods onto ACI for burst scaling)

## When to Use ACI vs Other Compute

| Use ACI when | Use something else when |
|-------------|------------------------|
| Simple container workloads | Need full orchestration → AKS |
| Burst scaling from AKS (virtual nodes) | Need persistent stateful workloads → AKS/VMs |
| CI/CD build agents | Need auto-scaling with HTTP triggers → Container Apps |
| Batch processing / task runners | Need integrated Dapr, KEDA, service mesh → Container Apps |
| Quick prototyping | Need complex networking → AKS |

## Links

- [[comparisons/compute-options]] — VM vs Functions vs Container Apps vs ACI
- [[entities/azure-virtual-machines]] — IaaS alternative
- [[sources/container-instances-docs]]
