---
title: AKS Networking
created: 2026-04-07
updated: 2026-04-07
sources:
  - aks/concepts-network.md
  - aks/concepts-network-cni-overview.md
  - aks/dns-concepts.md
tags:
  - networking-concept
  - aks
  - kubernetes
  - cni
---

# AKS Networking

How networking works in Azure Kubernetes Service — CNI models, egress control, network policies, and DNS. (source: concepts-network.md)

## Networking Models

### Overlay (Recommended for most)
- Pods get IPs from a private CIDR, separate from the VNet subnet
- Node subnet is small; pod CIDR can be very large
- Traffic leaving the cluster is SNAT'd to node IP
- Simpler IP management, better scalability
- Pods not directly routable from outside the cluster

### Flat (Azure CNI)
- Pods get IPs from the VNet subnet (same as nodes)
- Pod IPs directly visible to other VNet resources (no SNAT)
- Requires larger subnets (one IP per pod)
- Useful when external services need direct pod-to-pod communication

### Kubenet (Legacy)
- Pods get IPs from a private CIDR
- UDRs needed for cross-node pod traffic
- Limited to 400 nodes
- Simpler but less feature-rich

(source: concepts-network-cni-overview.md)

## Egress (Outbound) Control

| Method | Description |
|--------|-------------|
| **Load Balancer (default)** | Standard LB with outbound rules; Azure assigns public IP |
| **[[entities/azure-nat-gateway]]** | Deterministic outbound IPs, dynamic SNAT scaling (recommended) |
| **User-defined routing** | Route through Azure Firewall or NVA for inspection |
| **Managed NAT Gateway** | AKS manages the NAT Gateway lifecycle |

NAT Gateway is the recommended egress method for production AKS clusters — provides deterministic IPs and avoids SNAT exhaustion. (source: concepts-network.md)

## Network Policies

Control pod-to-pod and pod-to-external traffic:
- **Azure Network Policy** — Azure-native, supports Linux only
- **Calico** — open-source, supports Linux + Windows
- **Cilium** — eBPF-based, advanced observability (with Azure CNI Overlay)

## DNS

- CoreDNS runs on the cluster for service discovery
- Can configure custom upstream DNS servers
- Private DNS zone integration for private clusters
- Node-level DNS configured via VNet DNS settings

(source: dns-concepts.md)

## Network Security

- **NSGs** — applied to node subnet; AKS adds required rules automatically
- **Private cluster** — API server gets a private endpoint (no public IP)
- **Authorized IP ranges** — restrict public API server access to specific IPs
- **Azure Firewall / NVA** — centralized egress inspection via UDRs

## Links

- [[entities/azure-aks]]
- [[entities/azure-nat-gateway]] — recommended egress
- [[concepts/network-security-groups]] — NSGs on AKS subnets
- [[concepts/user-defined-routes]] — egress through firewall/NVA
- [[entities/azure-virtual-network]] — VNet fundamentals
