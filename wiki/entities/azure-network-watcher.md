---
title: Azure Network Watcher
created: 2026-04-07
updated: 2026-04-07
sources:
  - network-watcher/network-watcher-overview.md
tags:
  - azure-service
  - networking
  - monitoring
  - diagnostics
---

# Azure Network Watcher

Suite of tools to monitor, diagnose, view metrics, and manage logs for Azure IaaS networking resources (VMs, VNets, application gateways, LBs). Not designed for PaaS or web analytics. (source: network-watcher-overview.md)

## Diagnostic Tools

| Tool | Purpose |
|------|---------|
| **IP flow verify** | Check if a packet is allowed/denied at a VM level; identifies which NSG rule matches |
| **NSG diagnostics** | Check traffic filtering at VM, VMSS, or App Gateway level; suggest new rules |
| **Next hop** | Determine the next hop for a packet from a VM; detect UDR misconfigurations |
| **Effective security rules** | View the aggregate NSG rules effective on a NIC |
| **Connection troubleshoot** | Test TCP connectivity between source and destination; shows latency and hops |
| **Packet capture** | Capture packets on a VM NIC for analysis |
| **VPN troubleshoot** | Diagnose VPN gateway and connection health |

(source: network-watcher-overview.md)

## Traffic Tools

| Tool | Purpose |
|------|---------|
| **NSG flow logs** | Log IP traffic through NSGs (source/dest IP, port, protocol, allow/deny) |
| **VNet flow logs** | Log IP traffic at VNet level (broader scope than NSG flow logs) |
| **Traffic analytics** | Analyze flow logs with Log Analytics for visualization, top talkers, security insights |

(source: network-watcher-overview.md)

## Monitoring

- **Connection monitor** — end-to-end connectivity monitoring between endpoints
- **Network Insights** — topology and health dashboard in Azure Monitor

## Links

- [[concepts/network-security-groups]] — NSG flow logs and diagnostics
- [[entities/azure-virtual-network]]
- [[sources/network-watcher-docs]]
- [[concepts/flow-logs]]
- [[concepts/troubleshooting-azure-monitor]]
- [[concepts/troubleshooting-networking-support]]
