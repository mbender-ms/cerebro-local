---
title: Azure Firewall SKU Comparison
created: 2026-04-07
updated: 2026-04-07
sources:
  - firewall/overview.md
  - firewall/choose-firewall-sku.md
tags:
  - comparison
  - firewall
  - security
---

# Azure Firewall SKU Comparison

Three SKUs targeting different security and scale requirements.

## Comparison

| Capability | Basic | Standard | Premium |
|-----------|-------|----------|---------|
| **Target workload** | SMB, small scale | Enterprise | Regulated, high-security |
| **Throughput** | 250 Mbps | 30 Gbps | 100 Gbps |
| **Threat intelligence** | Alert only | Alert & deny | Alert & deny |
| **FQDN filtering** | ✅ | ✅ | ✅ |
| **FQDN tags** | ✅ | ✅ | ✅ |
| **Network rules** | ✅ | ✅ | ✅ |
| **Application rules** | ✅ | ✅ | ✅ |
| **DNAT** | ✅ | ✅ | ✅ |
| **DNS proxy** | ❌ | ✅ | ✅ |
| **Custom DNS** | ❌ | ✅ | ✅ |
| **Web categories** | ❌ | ✅ | ✅ |
| **URL filtering** | ❌ | ✅ | ✅ |
| **TLS inspection** | ❌ | ❌ | ✅ |
| **IDPS** | ❌ | ❌ | ✅ |
| **Explicit proxy** | ❌ | ❌ | ✅ |
| **Availability zones** | ❌ | ✅ | ✅ |
| **Managed by Firewall Manager** | ✅ | ✅ | ✅ |
| **Certifications** | Same | Same | Same |

(source: overview.md, choose-firewall-sku.md)

## When to Use Each

- **Basic**: Dev/test, small workloads, budget-constrained, no TLS inspection needed
- **Standard**: Production enterprise workloads, threat intelligence filtering, FQDN/URL control
- **Premium**: Compliance-driven (TLS inspection for data-at-rest/transit), advanced threat detection (IDPS), regulated industries

## Links

- [[entities/azure-firewall]]
- [[entities/azure-firewall-manager]]
- [[entities/azure-waf]] — complementary L7 protection
- [[comparisons/firewall-vs-nsg]]
