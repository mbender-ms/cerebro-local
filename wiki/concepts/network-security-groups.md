---
title: Network Security Groups (NSGs)
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-network/network-security-groups-overview.md
  - virtual-network/network-security-group-how-it-works.md
  - virtual-network/application-security-groups.md
tags:
  - networking-concept
  - security
  - virtual-network
---

# Network Security Groups (NSGs)

Stateful packet filter at L3/L4. Contains security rules that allow or deny inbound/outbound traffic by source, destination, port, and protocol. Can be associated with subnets or individual network interfaces. (source: network-security-groups-overview.md)

## Rule Properties

| Property | Description |
|----------|-------------|
| **Priority** | 100-4096; lower number = higher priority. Processing stops at first match. |
| **Source/Destination** | Any, IP address, CIDR block, service tag, or application security group |
| **Protocol** | TCP, UDP, ICMP, ESP, AH, or Any |
| **Port range** | Single port, range (10000-10005), or comma-separated mix |
| **Action** | Allow or Deny |
| **Direction** | Inbound or Outbound |

Rules evaluated by **five-tuple**: source, source port, destination, destination port, protocol. (source: network-security-groups-overview.md)

## Default Rules

**Inbound**: AllowVNetInBound (65000) → AllowAzureLoadBalancerInBound (65001) → **DenyAllInbound** (65500)

**Outbound**: AllowVnetOutBound (65000) → AllowInternetOutBound (65001) → **DenyAllOutBound** (65500)

Custom rules (100-4096) always process before defaults (65000+). (source: network-security-groups-overview.md)

## Stateful Behavior

NSGs are **stateful** — if you allow outbound traffic on port 80, return traffic is automatically allowed inbound. Removing a rule that allowed a connection does NOT break existing connections; only new connections are affected. (source: network-security-groups-overview.md)

## Application Security Groups (ASGs)

Group VMs by application role (e.g., "WebServers", "DbServers") and reference them in NSG rules instead of IP addresses. Enables intent-based security rules that scale with your application. (source: application-security-groups.md)

Example rules:
- Allow-HTTP-Inbound-Internet: Internet → WebServers ASG, port 80/443
- Deny-Database-All: Any → DbServers ASG, port 1433, Deny
- Allow-Database-BusinessLogic: BusinessLogic ASG → DbServers ASG, port 1433, Allow

(source: application-security-groups.md)

## Service Tags

Predefined groups of IP prefixes managed by Microsoft (e.g., `Internet`, `VirtualNetwork`, `AzureLoadBalancer`, `Storage`, `Sql`). Use in NSG rules instead of raw IP ranges. Automatically updated. (source: network-security-groups-overview.md)

## Links

- [[entities/azure-virtual-network]]
- [[concepts/user-defined-routes]]
- [[concepts/service-endpoints]]
