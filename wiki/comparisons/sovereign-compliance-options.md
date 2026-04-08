---
title: Sovereign and Compliance Cloud Options
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-government/*.md
  - confidential-computing/*.md
tags:
  - compliance
  - government
  - sovereign
  - comparison
---

# Sovereign and Compliance Cloud Options

Azure options for regulated workloads requiring data sovereignty, compliance certifications, or enhanced confidentiality.

## Options

| Option | Isolation Level | Use Case |
|--------|----------------|----------|
| **Azure Government** | Separate cloud (US datacenters) | US federal, state, local government |
| **Azure China (21Vianet)** | Separate cloud (China datacenters) | China data residency |
| **Confidential Computing** | Hardware-level encryption (in-use) | Protect data even from cloud operator |
| **Azure Dedicated Host** | Physical server isolation | Single-tenant hardware |
| **Azure Private Link** | Network-level isolation | No internet exposure for PaaS |
| **Customer-managed keys** | Encryption control | Key ownership |

## Azure Government Compliance

| Standard | Supported |
|----------|-----------|
| FedRAMP High | ✅ |
| DoD IL2-IL6 | ✅ |
| CJIS | ✅ |
| IRS 1075 | ✅ |
| ITAR | ✅ |
| HIPAA | ✅ |

Same Azure APIs and tools; separate endpoints (`.usgovcloudapi.net`).

## Confidential Computing

Hardware-based trusted execution environments (TEEs) that encrypt data while being processed:

| Technology | Vendor | VMs |
|-----------|--------|-----|
| **AMD SEV-SNP** | AMD | DCasv5, DCadsv5, ECasv5 |
| **Intel SGX** | Intel | DCsv3, DCdsv3 |
| **Intel TDX** | Intel | DCesv5, ECesv5 |

Use cases: multi-party computation, secure ML training, blockchain, healthcare data processing.

## Links

- [[entities/azure-government]] — US sovereign cloud
- [[comparisons/security-services]] — full security stack
- [[concepts/waf-security]] — security pillar guidance
