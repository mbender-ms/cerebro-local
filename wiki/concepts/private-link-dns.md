---
title: Private Link DNS Configuration
created: 2026-04-07
updated: 2026-04-07
sources:
  - private-link/private-endpoint-dns.md
  - private-link/private-endpoint-overview.md
tags:
  - networking-concept
  - private-link
  - dns
---

# Private Link DNS Configuration

Private endpoints require DNS to resolve the service FQDN to the private IP instead of the public IP. This is the most common configuration challenge with Private Link. (source: private-endpoint-dns.md)

## How It Works

1. Without private endpoint: `mystorageaccount.blob.core.windows.net` → public IP
2. With private endpoint: must resolve to → `10.0.1.5` (private IP in your VNet)

Azure uses a CNAME chain: the service FQDN → `mystorageaccount.privatelink.blob.core.windows.net` → private IP.

## DNS Configuration Options

| Option | Scope | Best for |
|--------|-------|----------|
| **Azure Private DNS zone** | Azure VNets (linked) | Most Azure-native deployments |
| **Conditional forwarder** | On-premises + Azure | Hybrid with [[entities/azure-dns-private-resolver]] |
| **Host file / custom DNS** | Individual machines | Testing only |

## Private DNS Zone Names

Each Azure service has a specific `privatelink.*` zone name. Examples:

| Service | Zone name |
|---------|-----------|
| Blob Storage | `privatelink.blob.core.windows.net` |
| SQL Database | `privatelink.database.windows.net` |
| Key Vault | `privatelink.vaultcore.azure.net` |
| Azure Monitor | `privatelink.monitor.azure.com` |
| App Service | `privatelink.azurewebsites.net` |

Full list in the docs covers 100+ services across AI, compute, databases, storage, etc. (source: private-endpoint-dns.md)

## Hybrid DNS Pattern

For on-premises resolution of private endpoints:
1. Create Azure Private DNS zone (e.g., `privatelink.blob.core.windows.net`)
2. Link zone to VNet with private endpoint
3. Deploy [[entities/azure-dns-private-resolver]] with inbound endpoint
4. On-premises DNS conditional forwarder: `privatelink.blob.core.windows.net` → resolver inbound IP

See [[patterns/dns-hybrid-resolution]] for full patterns.

## Links

- [[entities/azure-private-link]]
- [[entities/azure-dns-private-resolver]]
- [[patterns/dns-hybrid-resolution]]
- [[comparisons/private-endpoints-vs-service-endpoints]]
