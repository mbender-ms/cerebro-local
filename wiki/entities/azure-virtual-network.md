---
title: Azure Virtual Network
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-network/virtual-networks-overview.md
  - virtual-network/virtual-networks-udr-overview.md
  - virtual-network/network-security-groups-overview.md
  - virtual-network/virtual-network-peering-overview.md
  - virtual-network/virtual-network-service-endpoints-overview.md
  - virtual-network/vnet-integration-for-azure-services.md
  - virtual-network/virtual-network-encryption-overview.md
  - virtual-network/virtual-networks-faq.md
tags:
  - azure-service
  - networking
  - virtual-network
  - foundational
---

# Azure Virtual Network

The fundamental building block for private networking in Azure. Enables Azure resources (VMs, AKS, App Service Environments, etc.) to securely communicate with each other, the internet, and on-premises networks. Delivers scale, availability, and isolation of Azure infrastructure with familiar datacenter networking concepts. (source: virtual-networks-overview.md)

Part of the **Network Foundations** category alongside [[entities/azure-dns]] and Azure Private Link. (source: virtual-networks-overview.md)

## Core Scenarios

| Scenario | Mechanism | See also |
|----------|-----------|---------|
| Internet communication | Default outbound; manage with PIP, [[entities/azure-nat-gateway]], or public LB | [[concepts/default-outbound-access]] |
| Azure-to-Azure communication | VNet deployment, service endpoints, VNet peering | [[concepts/vnet-peering]], [[concepts/service-endpoints]] |
| On-premises communication | Point-to-site VPN, site-to-site VPN, ExpressRoute | |
| Traffic filtering | [[concepts/network-security-groups]], NVAs | |
| Traffic routing | [[concepts/user-defined-routes]], BGP | |
| Service integration | Service endpoints, Private Link, subnet delegation | [[comparisons/private-endpoints-vs-service-endpoints]] |

(source: virtual-networks-overview.md)

## Key Networking Primitives

| Primitive | Purpose |
|-----------|---------|
| **Subnets** | Segment address space; attach NSGs, route tables, NAT Gateway, delegations |
| **[[concepts/network-security-groups]]** | Stateful packet filter (L3/L4); allow/deny rules by priority |
| **[[concepts/user-defined-routes]]** | Override Azure system routes; next hop: NVA, VNet gateway, internet, none |
| **[[concepts/vnet-peering]]** | Connect VNets with backbone-speed, low-latency, no gateway |
| **[[concepts/service-endpoints]]** | Extend VNet identity to PaaS services; optimal routing on backbone |
| **Subnet delegation** | Reserve a subnet for a specific Azure service (e.g., SQL MI, Container Instances) |
| **Network interfaces** | Attach VMs to subnets; support multiple IPs, NSGs, accelerated networking |

## VNet Encryption

Encrypts traffic between VMs in the same VNet or peered VNets. Data-in-transit encryption at the virtual network layer. Limited to supported VM sizes. (source: virtual-network-encryption-overview.md)

## Accelerated Networking

Hardware offload via SR-IOV to the NIC. Reduces latency, jitter, CPU utilization. Uses Microsoft Azure Network Adapter (MANA) on newer VMs. (source: accelerated-networking-overview.md, accelerated-networking-mana-overview.md)

## Limits (key)

- Address spaces per VNet: 500
- Subnets per VNet: 3,000
- VNet peerings per VNet: 500
- NSGs per subscription: 5,000
- Rules per NSG: 1,000
- Route tables per subscription: 200
- Routes per route table: 400 (1,000 with VNet Manager)

(source: virtual-networks-faq.md)

## Links

- [[concepts/network-security-groups]]
- [[concepts/user-defined-routes]]
- [[concepts/vnet-peering]]
- [[concepts/service-endpoints]]
- [[comparisons/private-endpoints-vs-service-endpoints]]
- [[entities/azure-nat-gateway]]
- [[entities/azure-dns]]
- [[sources/virtual-network-docs]]
- [[concepts/aks-networking]]
- [[concepts/flow-logs]]
- [[concepts/troubleshooting-aks]]
- [[concepts/troubleshooting-virtual-machines]]
