---
title: "Source: Azure Virtual Network Documentation (76 articles)"
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-network/*.md
tags:
  - source-summary
  - azure-virtual-network
  - ms-learn
---

# Source: Azure Virtual Network Documentation

76 articles from `MicrosoftDocs/azure-docs/articles/virtual-network/`, covering the foundational Azure networking service.

## Articles by Type

### Overviews (3)
- virtual-networks-overview.md — VNet overview, key scenarios, communication patterns
- virtual-network-encryption-overview.md — VNet encryption requirements and limitations
- ip-based-access-control-list-overview.md — IP-based ACLs

### Concepts (16)
- virtual-networks-udr-overview.md — Traffic routing, system routes, UDRs, BGP, next hop types
- network-security-groups-overview.md — NSG rules, defaults, stateful behavior, service tags
- network-security-group-how-it-works.md — NSG processing flow
- application-security-groups.md — ASGs for intent-based security rules
- virtual-network-peering-overview.md — Peering types, connectivity, gateway transit, constraints
- virtual-network-service-endpoints-overview.md — Service endpoints, optimal routing, limitations
- virtual-network-service-endpoint-policies-overview.md — Per-instance endpoint policies
- vnet-integration-for-azure-services.md — Private endpoints vs service endpoints comparison
- subnet-delegation-overview.md — Subnet delegation for Azure services
- virtual-network-tap-overview.md — Virtual network TAP for traffic mirroring
- container-networking-overview.md — Container networking with VNets
- concepts-and-best-practices.md — VNet design best practices
- network-overview.md — VM networking concepts
- virtual-machine-network-throughput.md — VM bandwidth and throughput
- virtual-network-routing-appliance-overview.md — NVA routing overview
- service-tags-overview.md — Service tags for NSGs and UDRs

### How-To (25)
- Quickstart: Create VNet (Portal/PS/CLI/Bicep/Terraform)
- Peering management (create, change, delete, cross-subscription)
- NSG management, NIC management, subnet management
- Accelerated Networking / MANA configuration (Linux, Windows)
- Encryption, MTU, DHCP, DPDK setup
- Route table and routing appliance configuration
- Service endpoint policies, TAP configuration

### Tutorials (4)
- Connect VNets with peering
- Route traffic with route table
- Filter traffic with NSG
- Restrict access with service endpoints

### Troubleshooting (4)
- Diagnose routing problems
- Diagnose traffic filter problems
- Troubleshoot NVA issues
- Support and help options

## Wiki Pages Created from These Sources

- [[entities/azure-virtual-network]] — foundational VNet service entity
- [[concepts/network-security-groups]] — NSGs, rules, defaults, ASGs, service tags
- [[concepts/user-defined-routes]] — UDRs, next hop types, route selection, BGP
- [[concepts/vnet-peering]] — peering types, gateway transit, service chaining
- [[concepts/service-endpoints]] — VNet-to-PaaS direct backbone path
- [[comparisons/private-endpoints-vs-service-endpoints]] — full comparison table with guidance
