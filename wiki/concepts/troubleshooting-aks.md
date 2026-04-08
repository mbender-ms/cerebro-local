---
title: Troubleshooting Azure Kubernetes Service (AKS)
created: 2026-04-07
updated: 2026-04-07
sources:
  - support-azure-kubernetes/*.md
tags:
  - troubleshooting
  - aks
  - kubernetes
  - support
---

# Troubleshooting Azure Kubernetes Service (AKS)

Compiled from 189 Microsoft Support articles covering cluster operations, networking, node issues, and workload failures.

## Cluster Creation and Upgrade Failures

| Error | Cause | Fix |
|-------|-------|-----|
| `QuotaExceeded` / `InsufficientVCPUQuota` | Subscription vCPU quota hit | Request quota increase for the VM size/region |
| `CreateOrUpdateVirtualNetworkLinkFailed` | Private DNS zone link conflict | Remove stale VNet links before upgrade |
| `InvalidLoadBalancerProfileAllocatedOutboundPorts` | SNAT port config invalid | Adjust outbound allocated ports (min 0, max 64000) |
| Upgrade fails due to NSG rules | NSG blocking required AKS control plane traffic | Allow required ports/service tags for AKS |
| `AKSOperationPreempted` | New operation started before previous completed | Wait for previous operation to finish |
| Custom Azure Policy blocks upgrade | Policy prevents required node image changes | Exclude AKS resources from blocking policies |

## Networking Issues

| Symptom | Common cause |
|---------|-------------|
| Pods can't reach external services | NSG or Azure Firewall blocking outbound; missing UDR for kubenet |
| DNS resolution failures in pods | CoreDNS pod unhealthy; custom DNS misconfigured |
| Load balancer can't be deleted | Attached private link or private endpoint still exists |
| Public IP / subnet in use can't be deleted | AKS resources still referencing them |
| 429 Too Many Requests | ARM throttling; too many API calls from cluster operations |
| Internal LB not working | Wrong subnet annotation; service annotations incorrect |

## Node Issues

| Symptom | Common cause |
|---------|-------------|
| Node NotReady | Kubelet crash, disk pressure, memory pressure, network unreachable |
| Node pool creation fails | Subnet exhaustion, NSG blocking, quota exceeded |
| CrashLoopBackOff | Application failure, missing config/secrets, resource limits too low |
| ImagePullBackOff | ACR authentication failure, image doesn't exist, network policy blocking |
| Pod stuck in Pending | Insufficient resources, node affinity constraints, PV not bound |

## Identity and Auth

| Symptom | Common cause |
|---------|-------------|
| `AADSTS7000222` / `InvalidClientSecret` | Expired service principal or managed identity credential |
| ACR pull failures | Missing `AcrPull` role assignment on managed identity |
| Workload identity token errors | Federated credential misconfigured |

## Storage

| Symptom | Common cause |
|---------|-------------|
| Azure Files "Could not change permissions" | NFSv3 or permission mode incompatibility |
| Persistent volume claim stuck Pending | Storage class misconfigured, zone mismatch |

## Cost and Observability

- **AKS Cost Analysis add-on** — issues with cost visibility and allocation
- **Container Insights** — log collection gaps, agent connectivity issues

(source: support-azure-kubernetes/*.md — 189 articles)

## Links

- [[entities/azure-virtual-network]] — AKS networking fundamentals
- [[concepts/network-security-groups]] — NSG rules affecting AKS
- [[entities/azure-nat-gateway]] — outbound connectivity for AKS nodes
- [[entities/azure-load-balancer]] — AKS service type: LoadBalancer
- [[sources/support-azure-kubernetes-docs]]
