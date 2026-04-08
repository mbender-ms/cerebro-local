---
title: Azure IP Services
created: 2026-04-07
updated: 2026-04-07
sources:
  - ip-services/*.md
tags:
  - networking
  - ip-addresses
  - public-ip
  - byoip
---

# Azure IP Services

Azure IP Services manages public and private IP address allocation, prefixes, and routing preferences for all Azure networking resources.

## Public IP Addresses

Public IPs allow internet resources to communicate inbound to Azure resources and Azure resources to communicate outbound to internet.

### SKUs

| Property | Standard (v1/v2) | Basic (retired Sept 2025) |
|----------|-------------------|---------------------------|
| Allocation | Static only | Dynamic or Static |
| Security | Secure by default (closed to inbound) | Open by default |
| Availability zones | Supported (zonal, zone-redundant) | Not supported |
| Routing preference | Supported (v1 only) | Not supported |
| Global tier | Supported for cross-region LB (v1 only) | Not supported |

> **Important**: Standard v2 IPs can only be used with Standard v2 NAT Gateway at this time.

### Resource Associations

Public IPs can be associated with: VM NICs, Public Load Balancers, VPN/ER Gateways, NAT Gateways, Application Gateways, Azure Firewalls, Bastion Hosts, Route Servers, API Management.

## Public IP Prefixes

Contiguous range of public IPs allocated to your subscription. Benefits:
- Predictable IP ranges for firewall allowlisting
- Simplify outbound rules (single prefix instead of individual IPs)
- Associate with NAT Gateway for deterministic SNAT

Sizes: /28 (16 IPs) to /31 (2 IPs) for IPv4; /124 (16 IPs) to /127 (2 IPs) for IPv6.

## Custom IP Address Prefix (BYOIP)

Bring your own IP ranges to Azure. Three-phase process:

1. **Validation** — Prove ownership via RIR (ARIN/RIPE), authorize Microsoft to advertise
2. **Provisioning** — Create custom IP prefix resource, derive public IP prefixes and IPs
3. **Commissioning** — Microsoft advertises range from Azure region, then globally via WAN

Use cases: maintain established IP reputation, pass external allowlists, regulatory compliance.

## Routing Preference

Choose how traffic routes between Azure and internet:

| Option | Path | Latency | Cost |
|--------|------|---------|------|
| **Microsoft network** (cold potato) | Traffic stays on Microsoft WAN as long as possible | Lower | Higher |
| **Internet** (hot potato) | Traffic exits Microsoft network at nearest regional POP | Higher | Lower |

Set at public IP creation time — cannot be changed after creation.

## IPv6 Support

- Dual-stack deployments supported (IPv4 + IPv6 on same VNet/subnet)
- IPv6 public IPs: Standard SKU required
- Supported on: VMs, Load Balancers, VPN Gateways (ER preview), Application Gateways
- NAT Gateway: IPv6 not yet supported on Standard v1, not supported on Standard v2

## Links

- [[entities/azure-nat-gateway]] — uses public IPs and prefixes for SNAT
- [[entities/azure-load-balancer]] — frontend public IP association
- [[entities/azure-firewall]] — requires static Standard public IP
- [[concepts/snat]] — how public IPs relate to SNAT behavior
- [[concepts/default-outbound-access]] — what happens without a public IP
- [[comparisons/nat-gateway-standard-vs-standardv2]] — Standard v2 IP compatibility
