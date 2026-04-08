---
title: NAT Gateway Standard vs StandardV2
created: 2026-04-07
updated: 2026-04-07
sources:
  - nat-gateway/nat-sku.md
  - nat-gateway/nat-overview.md
  - nat-gateway/nat-gateway-v2-migrate.md
tags:
  - comparison
  - nat-gateway
  - sku
---

# NAT Gateway: Standard vs StandardV2

Side-by-side comparison of Azure NAT Gateway SKUs. StandardV2 launched with zone-redundancy, higher throughput, IPv6, and flow logs. (source: nat-sku.md)

## Feature Comparison

| Category | Feature | StandardV2 | Standard |
|----------|---------|------------|----------|
| **Reliability** | Availability zones | Zone-redundant (all zones) | Single zone or no-zone |
| **Protocols** | IPv4 | ✅ | ✅ |
| | IPv6 | ✅ | ❌ |
| **Performance** | Bandwidth | 100 Gbps (1 Gbps/conn) | 50 Gbps |
| | Packets/sec | 10M (100K/conn) | 5M |
| **Scale** | Public IPs | 16 IPv4 + 16 IPv6 | 16 IPv4 |
| | Public IP prefixes | /28 IPv4 + /124 IPv6 | /28 IPv4 |
| | Subnets | 800 | 800 |
| | Connections/IP/dest | 50,000 | 50,000 |
| | Total connections | 2M | 2M |
| **Monitoring** | Metrics | ✅ | ✅ |
| | Flow logs | ✅ | ❌ |
| **SNAT** | Dynamic port allocation | ✅ | ✅ |
| | Idle timeout (configurable) | ✅ | ✅ |
| | Port reuse timer | ✅ | ✅ |

(source: nat-sku.md)

## When to Use Each

### Choose StandardV2 when:
- You need zone-redundant outbound connectivity (production workloads)
- You need IPv6 outbound support
- You need flow logs for traffic monitoring/analysis
- You need >50 Gbps throughput

### Choose Standard when:
- StandardV2 is unavailable in your region
- You use delegated subnets for services StandardV2 doesn't support (SQL MI, ACI, Container Apps, etc.)
- You need Terraform deployment (StandardV2 not yet supported)

## Migration Path

**No in-place upgrade.** You must: (source: nat-gateway-v2-migrate.md)
1. Create new StandardV2 NAT Gateway
2. Create new StandardV2 public IPs (Standard IPs incompatible)
3. Associate StandardV2 to your subnets (removes Standard association)
4. Delete old Standard NAT Gateway and IPs

**Unsupported migration scenarios**: (source: nat-gateway-v2-migrate.md)
- Subnets with delegated services (SQL MI, ACI, etc.)
- Subnets with VNet-injected services that don't support StandardV2

**Known migration issues**: (source: nat-gateway-v2-migrate.md)
- Existing outbound connections may be interrupted during switchover
- Empty subnets created before April 2025 may cause VNet failed state
- IPv6 outbound via LB outbound rules disrupted with StandardV2

## Regional Availability

StandardV2 not available in: Brazil Southeast, Canada East, Central India, Chile Central, Indonesia Central, Israel Northwest, Malaysia West, Qatar Central, Sweden South, UAE Central, West Central US, West India. (source: nat-overview.md)

## Links

- [[entities/azure-nat-gateway]]
- [[concepts/snat]]
- [[concepts/availability-zones-nat]]
- [[sources/nat-gateway-docs]]
