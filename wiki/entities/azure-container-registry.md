---
title: Azure Container Registry (ACR)
created: 2026-04-07
updated: 2026-04-07
sources:
  - container-registry/*.md
tags:
  - azure-service
  - containers
  - registry
---

# Azure Container Registry (ACR)

Managed Docker registry service for storing and managing container images and OCI artifacts. Based on open-source Docker Registry 2.0. (source: container-registry-intro.md — 133 articles)

## Tiers

| Tier | Storage | Throughput | Features |
|------|---------|-----------|----------|
| **Basic** | 10 GiB | Lower | Dev/test, learning |
| **Standard** | 100 GiB | Medium | Most production workloads |
| **Premium** | 500 GiB | Highest | Geo-replication, private link, content trust, customer-managed keys |

## Key Features

- **Geo-replication** (Premium) — replicate registry across regions for low-latency pulls
- **Private Link** — private endpoint for VNet-only access
- **Content trust** — sign images for integrity verification
- **Artifact cache** — cache images from public registries (Docker Hub, MCR, GitHub)
- **Connected registry** — sync images to on-premises/edge for disconnected scenarios
- **ACR Tasks** — automated image builds on code commit, base image update, or schedule
- **Helm chart support** — store and manage Helm charts as OCI artifacts
- **Vulnerability scanning** — Microsoft Defender for Containers integration

## Integration

- **AKS** — `AcrPull` role on managed identity for seamless pulls
- **App Service / Container Apps** — direct ACR integration for deployments
- **Azure DevOps / GitHub Actions** — CI/CD build and push workflows

## Links

- [[entities/azure-aks]] — primary consumer of ACR images
- [[comparisons/container-compute-options]] — container hosting choices
- [[comparisons/security-services]] — Defender for Containers
- [[sources/container-registry-docs]]
