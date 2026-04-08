---
title: Azure Container Registry
created: 2026-04-07
updated: 2026-04-07
sources:
  - container-registry/*.md
tags:
  - containers
  - registry
  - docker
  - aks
---

# Azure Container Registry (ACR)

Managed Docker registry service for storing, building, and deploying container images and OCI artifacts.

## SKUs

| Feature | Basic | Standard | Premium |
|---------|-------|----------|---------|
| Storage | 10 GB | 100 GB | 500 GB+ |
| Webhooks | ✅ | ✅ | ✅ |
| Entra ID auth | ✅ | ✅ | ✅ |
| Geo-replication | ❌ | ❌ | ✅ |
| Content trust (signing) | ❌ | ❌ | ✅ |
| Private endpoints | ❌ | ❌ | ✅ |
| Customer-managed keys | ❌ | ❌ | ✅ |
| Connected registries | ❌ | ❌ | ✅ |
| Artifact cache | ❌ | ✅ | ✅ |

## Key Features

### ACR Tasks
Automate container image builds in the cloud:
- **Quick tasks** — on-demand `docker build` in Azure
- **Auto-triggered builds** — on source code commit, base image update, or schedule
- **Multi-step tasks** — build, test, and patch in parallel
- **Base image update triggers** — automatically rebuild when base image updates

### Geo-Replication (Premium)
Replicate registry across Azure regions for network-close pulls and HA. Single registry, multiple regions, local push/pull latency.

### Artifact Cache
Cache public container images (Docker Hub, MCR, GitHub) in your private registry. Reduces pull failures from rate limits and improves reliability.

### Connected Registries
Extend ACR to on-premises/edge devices (IoT, Arc). Sync images from cloud registry to nested edge registries for disconnected scenarios.

## Security

| Feature | Description |
|---------|-------------|
| **Private endpoints** | Access registry over private IP (Premium) |
| **Managed identity** | Authenticate without credentials |
| **RBAC roles** | AcrPull, AcrPush, AcrDelete, AcrImageSigner |
| **Content trust** | Sign images with Notary v2 (Premium) |
| **Defender scanning** | Vulnerability scanning via Microsoft Defender |
| **Token/scope maps** | Fine-grained repository-level access |
| **Zone redundancy** | HA within a region (Premium) |

## Supported Artifacts

- Docker container images (Windows + Linux)
- Helm charts
- OCI images and artifacts
- Singularity images (SIF)

## Deployment Targets

Pull images to: AKS, App Service, Batch, Service Fabric, Container Instances, Container Apps, Azure Functions, IoT Edge, Docker Swarm.

## Links

- [[entities/azure-aks]] — primary consumer; `az aks create --attach-acr`
- [[entities/azure-container-instances]] — pull images for serverless containers
- [[comparisons/container-compute-options]] — where ACR images deploy
- [[entities/azure-private-link]] — private endpoint for Premium ACR
