---
title: Azure DNS Private Resolver
created: 2026-04-07
updated: 2026-04-07
sources:
  - dns/dns-private-resolver-overview.md
  - dns/private-resolver-endpoints-rulesets.md
  - dns/private-resolver-architecture.md
  - dns/dns-private-resolver-reliability.md
tags:
  - azure-service
  - dns
  - hybrid
  - private-resolver
---

# Azure DNS Private Resolver

Fully managed service for DNS resolution between Azure virtual networks and on-premises environments. Eliminates need to deploy custom DNS servers (IaaS VMs running BIND/Windows DNS). (source: dns-private-resolver-overview.md)

## How It Works

1. Client in VNet issues DNS query
2. If custom DNS servers configured → forward there
3. If Azure-provided → check Private DNS zones linked to VNet
4. If DNS forwarding ruleset linked → evaluate rules (longest suffix match)
5. If suffix match → forward to target DNS server(s)
6. If no match → Azure DNS resolves

Requires ExpressRoute or VPN for on-premises connectivity. (source: dns-private-resolver-overview.md)

## Components

### Inbound Endpoints
- Receive DNS queries from on-premises or other private locations
- IP address is part of your VNet address space
- Configure on-premises DNS conditional forwarder to point here
- Requires a dedicated subnet (delegated to `Microsoft.Network/dnsResolvers`)
- IP can be static or dynamic

(source: dns-private-resolver-overview.md)

### Outbound Endpoints
- Send DNS queries from Azure to on-premises or external DNS servers
- Requires a dedicated subnet (delegated to `Microsoft.Network/dnsResolvers`)
- Associated with DNS forwarding rulesets

(source: dns-private-resolver-overview.md)

### DNS Forwarding Rulesets
- Up to 1,000 rules per ruleset
- Each rule: domain name suffix → target DNS server IP/port
- Longest suffix match wins
- Can link to multiple VNets (one-to-many)

(source: private-resolver-endpoints-rulesets.md)

## Benefits

- Fully managed, built-in HA and zone redundancy (source: dns-private-resolver-overview.md)
- Cost reduction vs IaaS DNS servers (source: dns-private-resolver-overview.md)
- DevOps friendly — Terraform, ARM, Bicep support (source: dns-private-resolver-overview.md)
- High performance per endpoint (source: dns-private-resolver-overview.md)

## Restrictions

- Subnets must be dedicated (delegated to `Microsoft.Network/dnsResolvers` only) (source: dns-private-resolver-overview.md)
- Customer data stays in deployment region (source: dns-private-resolver-overview.md)

## Links

- [[entities/azure-dns]] — parent service
- [[entities/azure-private-dns]] — private zones resolved through this
- [[patterns/dns-hybrid-resolution]] — architecture patterns
