---
title: NAT Gateway Hub-and-Spoke Patterns
created: 2026-04-07
updated: 2026-04-07
sources:
  - nat-gateway/nat-gateway-design.md
  - nat-gateway/tutorial-hub-spoke-nat-firewall.md
  - nat-gateway/tutorial-hub-spoke-route-nat.md
tags:
  - pattern
  - hub-spoke
  - nat-gateway
  - azure-firewall
---

# NAT Gateway Hub-and-Spoke Patterns

Deployment patterns for using [[entities/azure-nat-gateway]] in hub-and-spoke network topologies, with and without Azure Firewall. (source: nat-gateway-design.md)

## Problem Statement

Hub-and-spoke networks centralize connectivity through a hub VNet. Spoke VNets peer to the hub. Outbound internet traffic from spokes needs to be routed through the hub for centralized control. NAT Gateway only works on subnets in its own VNet — it can't directly serve peered spoke VNets.

## Pattern 1: NAT Gateway + Azure Firewall in Hub

The most common production pattern. Azure Firewall in the hub handles traffic inspection; NAT Gateway provides the outbound public IPs.

**Architecture**: (source: tutorial-hub-spoke-nat-firewall.md)
1. NAT Gateway attached to AzureFirewallSubnet in hub VNet
2. Azure Firewall deployed in hub with network/application rules
3. Spoke VNets peered to hub
4. UDRs on spoke subnets: 0.0.0.0/0 → Azure Firewall private IP
5. Traffic flow: Spoke VM → UDR → Firewall → NAT Gateway → Internet

**Why this works**: NAT Gateway provides deterministic outbound IPs for allowlisting. Firewall provides inspection, logging, and policy enforcement. NAT Gateway scales SNAT ports beyond Firewall's built-in limit.

**Gotcha**: NAT Gateway takes priority over Firewall's own SNAT. The outbound IP is the NAT Gateway's public IP, not the Firewall's. (source: nat-gateway-design.md)

## Pattern 2: NAT Gateway + NVA/Route Table in Hub

Uses route tables and a simulated NVA (or Linux VM with IP forwarding) instead of Azure Firewall.

**Architecture**: (source: tutorial-hub-spoke-route-nat.md)
1. NAT Gateway attached to NVA subnet in hub VNet
2. NVA VM with IP forwarding enabled
3. Hub route table: spoke address spaces → NVA private IP
4. Spoke route tables: 0.0.0.0/0 → NVA private IP
5. Traffic flow: Spoke VM → UDR → NVA → NAT Gateway → Internet

**When to use**: When you want custom routing logic or use a third-party NVA instead of Azure Firewall.

## Pattern 3: NAT Gateway per Spoke

Simpler but less centralized. Each spoke VNet gets its own NAT Gateway.

**When to use**: When spokes need independent outbound IPs, or when centralized inspection isn't required.

**Trade-off**: More NAT Gateway resources to manage; no centralized traffic inspection.

## Design Considerations

- NAT Gateway operates at the **subnet level within a single VNet** — it cannot span peered VNets (source: nat-gateway-design.md)
- UDRs with 0.0.0.0/0 → next-hop don't override NAT Gateway on the same subnet. NAT Gateway always takes precedence for internet-bound traffic on its attached subnet. (source: nat-gateway-design.md)
- When both NAT Gateway and a VM instance-level public IP exist, NAT Gateway wins for outbound. (source: nat-gateway-design.md)

## Links

- [[entities/azure-nat-gateway]]
- [[concepts/snat]]
- [[patterns/nat-gateway-with-load-balancer]]
- [[sources/nat-gateway-docs]]
