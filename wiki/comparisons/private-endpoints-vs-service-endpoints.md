---
title: Private Endpoints vs Service Endpoints
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-network/vnet-integration-for-azure-services.md
  - virtual-network/virtual-network-service-endpoints-overview.md
tags:
  - comparison
  - private-link
  - service-endpoints
  - virtual-network
---

# Private Endpoints vs Service Endpoints

Two mechanisms for securing access to Azure PaaS services from a VNet. Microsoft recommends Private Link/Private Endpoints for new designs. (source: vnet-integration-for-azure-services.md)

## Comparison

| Consideration | Service Endpoints | Private Endpoints |
|--------------|-------------------|-------------------|
| **Scope** | Entire service (all SQL Servers, all Storage) | Individual instance (your specific SQL Server) |
| **Data exfiltration protection** | ❌ No built-in protection | ✅ Built-in — can only reach the linked resource |
| **On-premises private access** | ❌ Not reachable from on-prem | ✅ Reachable via VPN/ExpressRoute |
| **Public IP required** | Yes (service keeps its public IP) | No (service gets a private IP in your VNet) |
| **NSG configuration** | Required (service tags) | Not required |
| **DNS changes** | None | Required (private DNS zone) |
| **Cost** | Free | Paid (Private Link pricing) |
| **SLA impact** | None | Yes (Private Link has 99.99% SLA) |
| **Setup complexity** | Simple (toggle on subnet) | More effort (endpoint + DNS + optional NIC) |
| **Traffic path** | Azure backbone | Azure backbone |
| **SNAT port exhaustion** | Avoids (direct backbone path) | Avoids (direct backbone path) |
| **Restrict from VNet** | Yes (subnet-level) | Yes (NSG on source subnet or PE NIC) |
| **Restrict from on-prem** | N/A (not accessible) | Yes |
| **Limits** | No limit on endpoint count | Subject to Private Link limits |

(source: vnet-integration-for-azure-services.md)

## When to Use Each

### Choose Private Endpoints when:
- You need on-premises access to the PaaS service over private network
- You need data exfiltration protection
- You want the service to have a private IP in your VNet
- You need to disable the service's public endpoint entirely

### Choose Service Endpoints when:
- You need a simple, free solution for VNet-level PaaS security
- On-premises access via private network isn't required
- You don't need per-instance granularity (or use endpoint policies)

### Choose both when:
- Migrating incrementally from service endpoints to private endpoints
- Different subnets have different requirements

## NVA/Firewall Routing Difference

- **Service endpoints**: Enable the endpoint on the **firewall's subnet**, not the source subnet
- **Private endpoints**: Put a UDR for the PE's private IP on the **source subnet**

(source: vnet-integration-for-azure-services.md)

## Links

- [[concepts/service-endpoints]]
- [[entities/azure-virtual-network]]
- [[concepts/network-security-groups]]
