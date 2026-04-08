---
title: Service Endpoints
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-network/virtual-network-service-endpoints-overview.md
  - virtual-network/virtual-network-service-endpoint-policies-overview.md
tags:
  - networking-concept
  - security
  - virtual-network
---

# Service Endpoints

Extend your VNet's identity and private address space to Azure PaaS services over a direct connection on the Azure backbone. Enable securing Azure service resources (Storage, SQL, etc.) to only your VNet. (source: virtual-network-service-endpoints-overview.md)

## Key Benefits

- **Improved security** — VNet rules restrict PaaS access to your VNet only; removes need for public IP allowlisting (source: virtual-network-service-endpoints-overview.md)
- **Optimal routing** — traffic stays on Azure backbone even with forced tunneling; avoids the NVA/firewall hop for PaaS traffic (source: virtual-network-service-endpoints-overview.md)
- **Simple setup** — single toggle on subnet; no NAT or gateway needed (source: virtual-network-service-endpoints-overview.md)

## How It Works

1. Enable service endpoint for the service (e.g., `Microsoft.Storage`) on a subnet
2. Add a VNet rule on the PaaS resource's firewall to allow that subnet
3. Traffic from the subnet to the service takes the direct backbone path
4. The service sees the traffic as coming from the VNet's private IP space

## Service Endpoint Policies

Fine-grained control over which specific PaaS resource instances are accessible from a subnet. Prevents data exfiltration to unauthorized accounts. (source: virtual-network-service-endpoint-policies-overview.md)

Example: allow access to only `mystorageaccount` from a subnet, blocking all other storage accounts.

## Limitations

- Resources secured to VNets are **not reachable from on-premises** via service endpoints (need to allowlist on-premises public/NAT IPs on the service firewall, or use Private Link instead) (source: virtual-network-service-endpoints-overview.md)
- Applies to entire service (all SQL Servers, all Storage), not individual instances (use endpoint policies or Private Link for that) (source: virtual-network-service-endpoints-overview.md)
- No built-in data exfiltration protection (unlike Private Link) (source: vnet-integration-for-azure-services.md)

See [[comparisons/private-endpoints-vs-service-endpoints]] for when to use which.

## Links

- [[entities/azure-virtual-network]]
- [[comparisons/private-endpoints-vs-service-endpoints]]
- [[concepts/network-security-groups]] — NSGs needed for service endpoint access
