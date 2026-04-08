---
title: "Azure Security Services"
created: 2026-04-07
updated: 2026-04-07
sources:
  - security/*.md
tags:
  - security
  - defender
  - sentinel
  - zero-trust
---

# Azure Security Services

Comprehensive security stack covering identity, network, data, workload, and operations security.

## Security Service Map

| Layer | Services |
|-------|----------|
| **Identity** | Entra ID, Conditional Access, PIM, B2C |
| **Network** | Firewall, NSG, WAF, DDoS Protection, Private Link |
| **Data** | Key Vault, CMK encryption, Purview, Information Protection |
| **Workload** | Defender for Cloud, Defender for Servers/Containers/SQL/Storage |
| **IoT/OT** | Defender for IoT, firmware analysis |
| **SIEM/SOAR** | Microsoft Sentinel (log analytics, hunting, automation) |
| **External** | Defender EASM (attack surface management) |
| **Posture** | Secure Score, Security Benchmark, regulatory compliance |

## Zero Trust Architecture

Azure implements Zero Trust across: identity (Entra ID), endpoints (Defender for Endpoint), network (private access, micro-segmentation), data (encryption, classification), apps (Conditional Access), and infrastructure (policy enforcement).

## Links

- [[comparisons/security-services]] — detailed service comparison
- [[concepts/waf-security]] — WAF security pillar
- [[entities/azure-firewall]] — network security
- [[concepts/network-security-groups]] — network filtering
- [[entities/external-attack-surface-management]] — Defender EASM
