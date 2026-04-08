---
title: Azure Private Link
created: 2026-04-07
updated: 2026-04-07
sources:
  - private-link/private-link-overview.md
  - private-link/private-endpoint-overview.md
  - private-link/private-link-service-overview.md
tags:
  - azure-service
  - networking
  - security
  - private-connectivity
---

# Azure Private Link

Enables access to Azure PaaS services (Storage, SQL, etc.) and customer/partner-hosted services over a **private endpoint** in your VNet. Traffic stays on the Microsoft backbone — no public internet. (source: private-link-overview.md)

## Components

| Component | Description |
|-----------|-------------|
| **Private endpoint** | A NIC with a private IP in your VNet that connects to a specific PaaS resource instance. Brings the service into your VNet. (source: private-endpoint-overview.md) |
| **Private Link service** | Your own service behind a Standard LB, exposed to consumers via Private Link. Consumers connect with a private endpoint in their VNet. (source: private-link-service-overview.md) |

## Key Benefits

- **Private access** — service gets a private IP in your VNet; no public IP needed (source: private-link-overview.md)
- **On-premises access** — reachable over ExpressRoute private peering and VPN (source: private-link-overview.md)
- **Data exfiltration protection** — private endpoint maps to a specific resource instance, not the entire service (source: private-link-overview.md)
- **Global reach** — connect to services in other regions privately (source: private-link-overview.md)
- **Zone resilient** — spans availability zones (source: private-link-overview.md)

## DNS Configuration

Private endpoints require DNS resolution to return the private IP instead of the public IP. Typically via Azure Private DNS zones (e.g., `privatelink.blob.core.windows.net`). (source: private-endpoint-overview.md)

## Approval Workflow

Connection requests can be auto-approved or require manual approval by the resource owner. (source: private-endpoint-overview.md)

## Links

- [[comparisons/private-endpoints-vs-service-endpoints]] — when to use which
- [[concepts/service-endpoints]] — simpler alternative (no private IP)
- [[entities/azure-virtual-network]]
- [[sources/private-link-docs]]
