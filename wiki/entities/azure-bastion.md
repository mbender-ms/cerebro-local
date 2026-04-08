---
title: Azure Bastion
created: 2026-04-07
updated: 2026-04-07
sources:
  - bastion/bastion-overview.md
tags:
  - azure-service
  - networking
  - security
  - remote-access
---

# Azure Bastion

Fully managed PaaS service for secure RDP/SSH connectivity to VMs over TLS directly from the Azure portal or native client. VMs don't need public IPs, agents, or special client software. Deployed in a dedicated subnet (AzureBastionSubnet) within the VNet. (source: bastion-overview.md)

## Key Benefits

- RDP/SSH over TLS (port 443) — traverses firewalls and NATs
- No public IP needed on VMs — reduces attack surface
- No NSG management needed on VMs for RDP/SSH access
- Protection against port scanning — VMs not exposed to public internet
- Hardened platform service — Azure manages patching

(source: bastion-overview.md)

## SKUs

| Feature | Developer | Basic | Standard | Premium |
|---------|-----------|-------|----------|---------|
| Azure portal access | ✅ | ✅ | ✅ | ✅ |
| Native client (SSH/RDP) | ❌ | ❌ | ✅ | ✅ |
| Scale units | 1 | 1 | 1-50 | 1-50 |
| VNet peering support | ❌ | ❌ | ✅ | ✅ |
| File transfer | ❌ | ❌ | ✅ | ✅ |
| Shareable link | ❌ | ❌ | ✅ | ✅ |
| Private-only | ❌ | ❌ | ❌ | ✅ |

## Links

- [[entities/azure-virtual-network]] — deployed within VNet
- [[sources/bastion-docs]]
- [[concepts/troubleshooting-virtual-machines]]
