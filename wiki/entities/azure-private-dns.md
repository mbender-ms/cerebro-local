---
title: Azure Private DNS
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/private-dns-overview.md
  - dns/private-dns-scenarios.md
  - dns/private-dns-autoregistration.md
  - dns/private-dns-virtual-network-links.md
  - dns/private-dns-resiliency.md
tags:
  - azure-service
  - dns
  - private
  - virtual-network
---

# Azure Private DNS

Managed DNS service for virtual networks using custom domain names without deploying custom DNS servers. Resolves names within and across linked VNets. (source: private-dns-overview.md)

## Key Features

- **Custom domain names** — use `contoso.internal` instead of Azure-provided `*.internal.cloudapp.net` (source: private-dns-overview.md)
- **Autoregistration** — VMs automatically get A records in the private zone when created; records removed on deletion (source: private-dns-overview.md)
- **Cross-VNet resolution** — link multiple VNets to the same private zone; no peering required for DNS (but needed for data path) (source: private-dns-overview.md)
- **Split-horizon DNS** — same zone name can resolve differently in private vs public (source: private-dns-overview.md)
- **Global resource** — zone data is not tied to a single region; survives regional outages (source: private-dns-resiliency.md)

## Virtual Network Links

A link associates a private DNS zone with a VNet. Two types:
- **With autoregistration** — VM records created/deleted automatically. Only ONE autoregistration link per VNet. (source: private-dns-virtual-network-links.md)
- **Without autoregistration** — read-only resolution from that VNet. Multiple zones can be linked. (source: private-dns-virtual-network-links.md)

## Scenarios

| Scenario | How it works |
|----------|-------------|
| Single VNet | Link zone to VNet, enable autoregistration (source: private-dns-scenarios.md) |
| Cross-VNet | Link same zone to multiple VNets; all resolve each other's records (source: private-dns-scenarios.md) |
| Split-horizon | Same zone name in public and private DNS; VNet resolves private, internet resolves public (source: private-dns-scenarios.md) |

## Limitations

- One autoregistration-enabled link per VNet (source: private-dns-overview.md)
- Reverse DNS for private IPs returns `internal.cloudapp.net` suffix by default (plus private zone suffix if autoregistered) (source: private-dns-overview.md)
- Don't use `.local` domain — not all OSes support it (source: private-dns-overview.md)
- Conditional forwarding requires [[entities/azure-dns-private-resolver]] (source: private-dns-overview.md)

## Links

- [[entities/azure-dns]] — parent service
- [[entities/azure-dns-private-resolver]] — for hybrid/conditional forwarding
- [[concepts/dns-zones-and-records]]
- [[patterns/dns-hybrid-resolution]]
