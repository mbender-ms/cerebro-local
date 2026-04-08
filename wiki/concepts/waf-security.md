---
title: "WAF: Security Pillar"
created: 2026-04-07
updated: 2026-04-07
sources:
  - well-architected/*.md
tags:
  - networking-concept
  - waf
  - security
  - architecture
---

# WAF: Security Pillar

Protect workloads from threats to confidentiality, integrity, and availability. (source: well-architected/security)

## Design Principles

1. **Plan security from the start** — security is not an afterthought
2. **Zero Trust** — never trust, always verify; least privilege
3. **Defense in depth** — multiple layers of security controls
4. **Minimize attack surface** — reduce exposure with private endpoints, NSGs, firewalls
5. **Classify and protect data** — encrypt at rest and in transit; manage keys
6. **Monitor and respond** — detect threats and automate response

## Azure Mapping

| Layer | Azure services |
|-------|---------------|
| Identity | Entra ID, [[concepts/azure-rbac]], managed identity |
| Network | [[concepts/network-security-groups]], [[entities/azure-firewall]], [[entities/azure-private-link]], [[entities/azure-waf]] |
| Data | Azure Key Vault, disk encryption, TLS |
| Monitoring | [[entities/sentinel]], Microsoft Defender for Cloud |
| Governance | Azure Policy, [[concepts/security-admin-rules]] |

## Links

- [[entities/azure-well-architected-framework]]
- [[comparisons/security-services]]
- [[concepts/waf-reliability]]
