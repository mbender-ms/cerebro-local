---
title: NAT Gateway with Load Balancer Patterns
created: 2026-04-07
updated: 2026-04-07
sources:
  - nat-gateway/nat-gateway-design.md
  - nat-gateway/tutorial-nat-gateway-load-balancer-internal-portal.md
  - nat-gateway/tutorial-nat-gateway-load-balancer-public-portal.md
tags:
  - pattern
  - nat-gateway
  - load-balancer
---

# NAT Gateway with Load Balancer Patterns

How [[entities/azure-nat-gateway]] interacts with Azure Load Balancer for inbound + outbound scenarios. (source: nat-gateway-design.md)

## Problem Statement

Many workloads need both inbound connectivity (via load balancer) and outbound connectivity (via NAT Gateway). Understanding which resource handles which direction is critical.

## Pattern 1: NAT Gateway + Internal Load Balancer

**Use case**: Backend VMs receive traffic via internal LB (private frontend IP) and connect outbound via NAT Gateway.

**Architecture**: (source: tutorial-nat-gateway-load-balancer-internal-portal.md)
- Internal Standard LB distributes inbound private traffic to backend pool
- NAT Gateway on the same subnet provides all outbound internet connectivity
- No conflict — internal LB has no outbound path

**This is the cleanest pattern** — clear separation of inbound (LB) and outbound (NAT Gateway).

## Pattern 2: NAT Gateway + Public Load Balancer

**Use case**: Backend VMs receive inbound from internet via public LB and connect outbound via NAT Gateway.

**Architecture**: (source: tutorial-nat-gateway-load-balancer-public-portal.md)
- Public Standard LB distributes inbound internet traffic
- NAT Gateway handles all outbound connections

**Key behavior**: NAT Gateway **takes priority** over load balancer outbound rules for outbound traffic. If you have LB outbound rules configured, they are overridden when NAT Gateway is attached to the subnet. (source: nat-gateway-design.md)

## Pattern 3: NAT Gateway + VM with Instance-Level Public IP

**Outbound**: NAT Gateway wins — all outbound uses NAT Gateway's public IP. (source: nat-gateway-design.md)
**Inbound**: The instance-level PIP still works for inbound to that specific VM.

## Priority Rules (Outbound)

When multiple outbound methods exist on the same subnet:

| Priority | Method | Notes |
|----------|--------|-------|
| 1 (highest) | **NAT Gateway** | Always wins for outbound when attached |
| 2 | LB outbound rules | Only used if no NAT Gateway |
| 3 | Instance-level public IP | Only used if no NAT Gateway or LB rules |
| 4 (lowest) | Default outbound access | Only if nothing else configured |

(source: nat-gateway-design.md)

## Links

- [[entities/azure-nat-gateway]]
- [[concepts/snat]]
- [[concepts/default-outbound-access]]
- [[patterns/nat-gateway-hub-spoke]]
