---
title: Routing Preference — Microsoft Network vs Internet
created: 2026-04-07
updated: 2026-04-07
sources:
  - ip-services/routing-preference-overview.md
tags:
  - networking
  - routing
  - ip-services
  - cost-optimization
---

# Routing Preference

Azure routing preference controls how traffic routes between Azure and the internet. Choose between Microsoft's global backbone (premium, lower latency) or ISP transit (cost-optimized).

## Options

| Option | Also Called | Path | Latency | Cost |
|--------|-----------|------|---------|------|
| **Microsoft network** | Cold potato routing | Traffic stays on Microsoft WAN as long as possible | Lower | Higher |
| **Internet routing** | Hot potato routing | Traffic exits Microsoft network at nearest regional POP | Higher | Lower |

## How Each Works

### Microsoft Network (Cold Potato)
- **Ingress**: Traffic enters Microsoft network at nearest global POP (e.g., Singapore user → Singapore POP → Microsoft WAN → Chicago)
- **Egress**: Traffic travels Microsoft WAN to POP closest to destination user
- Default for all Azure services

### Internet Routing (Hot Potato)
- **Ingress**: Traffic enters Microsoft network at POP nearest to the hosted service region
- **Egress**: Traffic exits Microsoft network in the same region as the service, then traverses ISP network
- Cost-optimized — comparable to other cloud providers

> Traffic to Azure destinations always uses the Microsoft WAN direct path, regardless of routing preference setting.

## Configuration

- Set at **public IP creation time** — cannot be changed after creation
- Supported on: VMs, VMSS, internet-facing Load Balancers, Storage (blobs, files)
- Standard v2 IPs: Internet routing not supported
- Available in select regions

## Links

- [[entities/azure-ip-services]] — public IP and prefix management
- [[concepts/snat]] — outbound connectivity and IP selection
- [[entities/azure-front-door]] — global anycast routing (different mechanism)
