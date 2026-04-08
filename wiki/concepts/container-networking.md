---
title: Container Networking in Azure
created: 2026-04-07
updated: 2026-04-07
sources:
  - aks/*.md
  - container-instances/*.md
  - application-network/*.md
tags:
  - networking
  - containers
  - aks
  - kubernetes
---

# Container Networking in Azure

How container workloads connect to VNets, the internet, and each other across Azure's container platforms.

## AKS Networking Models

| Model | Pod IP Source | VNet Integration | Scale |
|-------|-------------|------------------|-------|
| **kubenet** | Node NATs pod traffic | Pods not directly on VNet | Simple, limited scale |
| **Azure CNI** | Pod gets VNet IP | Full VNet integration | IP-heavy, plan subnets |
| **Azure CNI Overlay** | Overlay network + VNet node IPs | Nodes on VNet, pods on overlay | Best scale, less IP consumption |
| **Azure CNI with Cilium** | eBPF-based data plane | High-performance networking | Advanced network policies |

## Ingress Options for AKS

| Ingress | Type | Features |
|---------|------|----------|
| **NGINX Ingress Controller** | Community OSS | Path routing, TLS, rate limiting |
| **Application Gateway Ingress Controller (AGIC)** | Microsoft (legacy) | L7 routing via App Gateway |
| **Application Gateway for Containers (AGC)** | Microsoft (current) | Managed L7, traffic splitting, mutual TLS |
| **Azure Service Mesh (Istio)** | Managed Istio | mTLS, observability, traffic management |

## Container Instances (ACI) Networking

- **Public IP** — ACI gets a public IP for internet-facing workloads
- **VNet injection** — deploy into a VNet subnet (private IP, access VNet resources)
- **Private DNS** — integrate with Azure Private DNS for name resolution
- **NSG support** — apply NSGs to the ACI subnet

## Network Policies

| Provider | Level | Features |
|----------|-------|----------|
| **Azure NPM** | L3/L4 | Native Azure network policy enforcement |
| **Calico** | L3/L4 | Rich policy model, DNS-based rules |
| **Cilium** | L3/L4/L7 | eBPF-based, identity-aware, HTTP-level policies |

## Egress Control

- **Azure NAT Gateway** — deterministic SNAT for outbound from AKS nodes
- **Azure Firewall** — centralized egress filtering (FQDN rules)
- **User-defined routes** — force tunnel through NVA or firewall
- **Outbound type options**: loadBalancer (default), userDefinedRouting, managedNATGateway

## Links

- [[concepts/aks-networking]] — deeper AKS networking concepts
- [[entities/azure-aks]] — AKS service overview
- [[entities/azure-container-instances]] — ACI service overview
- [[entities/application-network]] — AGC for AKS ingress
- [[entities/azure-nat-gateway]] — egress for container workloads
- [[comparisons/container-compute-options]] — which container platform to choose
