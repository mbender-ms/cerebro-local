---
title: Network Watcher Flow Logs
created: 2026-04-07
updated: 2026-04-07
sources:
  - network-watcher/vnet-flow-logs-overview.md
  - network-watcher/nsg-flow-logs-overview.md
  - network-watcher/network-watcher-overview.md
tags:
  - networking-concept
  - monitoring
  - network-watcher
---

# Network Watcher Flow Logs

Log IP traffic flowing through your network. Two types: NSG flow logs (legacy) and VNet flow logs (newer, recommended).

## VNet Flow Logs vs NSG Flow Logs

| Feature | VNet Flow Logs | NSG Flow Logs |
|---------|---------------|---------------|
| **Scope** | Entire virtual network | Per-NSG |
| **Enable on** | VNet or subnet | NSG |
| **Captures** | All traffic in the VNet | Only traffic through the NSG |
| **Encrypted VNet traffic** | ✅ | ❌ |
| **VNet-peered traffic** | ✅ | Limited |
| **Cost** | Lower per-flow | Higher (more logs for same coverage) |
| **Recommended** | ✅ Yes | Legacy |

(source: vnet-flow-logs-overview.md, nsg-flow-logs-overview.md)

## Log Data

Sent to Azure Storage. Each flow record contains: source/dest IP, source/dest port, protocol, direction, action (allow/deny), flow state, bytes, packets. (source: vnet-flow-logs-overview.md)

## Traffic Analytics

Flow logs → Log Analytics workspace → Traffic Analytics for:
- Top talkers (VMs generating most traffic)
- Security insights (open ports, malicious IPs)
- Bandwidth utilization
- Geographic traffic distribution

(source: network-watcher-overview.md)

## Links

- [[entities/azure-network-watcher]]
- [[concepts/network-security-groups]] — NSG flow logs
- [[entities/azure-virtual-network]]
