---
title: Security Admin Rules (Virtual Network Manager)
created: 2026-04-07
updated: 2026-04-07
sources:
  - virtual-network-manager/concept-security-admins.md
  - virtual-network-manager/overview.md
tags:
  - networking-concept
  - security
  - governance
  - virtual-network-manager
---

# Security Admin Rules

Centralized security rules in [[entities/azure-virtual-network-manager]] that enforce network security policies across all VNets in a network group. Unlike NSGs, security admin rules **cannot be overridden** by VNet owners. (source: concept-security-admins.md)

## How They Differ from NSGs

| Feature | Security Admin Rules | NSGs |
|---------|---------------------|------|
| **Scope** | Network group (hundreds of VNets) | Per-subnet or per-NIC |
| **Override** | Cannot be overridden by VNet owners | Can be modified by anyone with access |
| **Evaluation** | Evaluated BEFORE NSGs | Evaluated after admin rules |
| **Use case** | Org-wide baselines (block risky ports) | Workload-specific micro-segmentation |
| **Management** | VNet Manager | Per-resource |

## Processing Order

1. Security admin **Allow** rules
2. Security admin **Deny** rules
3. Security admin **Always Allow** rules (override denies — for exceptions)
4. NSG rules (standard processing)

## Common Use Cases

- Block high-risk ports (RDP 3389, SSH 22) across all VNets org-wide
- Enforce that certain traffic must flow through a central firewall
- Create exceptions for specific VNets that need direct access

(source: concept-security-admins.md)

## Links

- [[entities/azure-virtual-network-manager]]
- [[concepts/network-security-groups]]
- [[comparisons/firewall-vs-nsg]]
