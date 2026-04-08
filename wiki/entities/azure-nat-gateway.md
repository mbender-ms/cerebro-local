---
title: Azure NAT Gateway
created: 2026-04-07
updated: 2026-04-07
sources:
  - nat-gateway/nat-overview.md
  - nat-gateway/nat-gateway-resource.md
  - nat-gateway/nat-gateway-snat.md
  - nat-gateway/nat-gateway-design.md
  - nat-gateway/nat-sku.md
  - nat-gateway/nat-gateway-flow-logs.md
  - nat-gateway/nat-metrics.md
  - nat-gateway/resource-health.md
tags:
  - azure-service
  - networking
  - nat
  - outbound-connectivity
---

# Azure NAT Gateway

A fully managed, highly resilient Network Address Translation (NAT) service. Provides outbound internet connectivity for private instances in a subnet while blocking unsolicited inbound connections. Only response packets to outbound-originated connections pass through. (source: nat-overview.md)

## How It Works

NAT Gateway uses software-defined networking as a fully managed, distributed service spanning multiple fault domains. It performs [[concepts/snat]] — rewriting private source IPs/ports to public IPs/ports for outbound connections. NAT Gateway becomes the subnet's default next hop for all internet-bound outbound traffic with no extra routing configuration needed. (source: nat-gateway-resource.md)

Key behaviors:
- **Dynamic SNAT port allocation** — ports allocated on-demand across all VMs in the subnet, no preallocation. Prevents the SNAT exhaustion problems common with load balancer outbound rules. (source: nat-gateway-snat.md)
- **Many-to-one NAT** — multiple private instances share the same public IP(s) via port masquerading. (source: nat-gateway-snat.md)
- **No unsolicited inbound** — DNAT only for response packets. (source: nat-overview.md)
- **Subnet-level attachment** — NAT Gateway attaches to subnets, not individual VMs. Up to 800 subnets per NAT Gateway, but only within 1 VNet. (source: nat-sku.md)

## SKUs

| Feature | StandardV2 | Standard |
|---------|------------|----------|
| Availability zones | Zone-redundant | Single zone only |
| IPv6 support | Yes (IPv4 + IPv6) | IPv4 only |
| Bandwidth | 100 Gbps (1 Gbps/connection) | 50 Gbps |
| Packets/sec | 10M (100K/connection) | 5M |
| Public IPs | 16 IPv4 + 16 IPv6 | 16 IPv4 |
| Public IP prefixes | /28 IPv4, /124 IPv6 | /28 IPv4 |
| Flow logs | Supported | Not supported |
| Connections/IP/destination | 50,000 | 50,000 |
| Total connections | 2 million | 2 million |

(source: nat-sku.md)

> [!CONFLICT]
> **Standard → StandardV2 upgrade**: No in-place upgrade path. You must deploy a new StandardV2 NAT Gateway and replace Standard on your subnet. Must also re-IP to StandardV2 SKU public IPs. (source: nat-overview.md, nat-sku.md)

## Key Limitations

- No ICMP support (source: nat-gateway-resource.md)
- No IP fragmentation (source: nat-gateway-resource.md)
- Not supported in secured virtual hub (vWAN) architecture (source: nat-gateway-resource.md)
- Public IPs with DDoS protection not supported (source: nat-gateway-resource.md)
- Public IPs with routing type "internet" not supported (source: nat-gateway-resource.md)
- Basic load balancers incompatible — use Standard LB (source: nat-gateway-resource.md)
- StandardV2 doesn't support delegated subnets for: SQL MI, ACI, PostgreSQL Flex, MySQL Flex, Data Factory, Power Platform, Stream Analytics, Web Apps, Container Apps, DNS Private Resolver (source: nat-overview.md)
- Terraform doesn't yet support StandardV2 deployments (source: nat-overview.md)

## StandardV2 Known Issues

- IPv6 outbound via LB outbound rules disrupted when StandardV2 attached to subnet (source: nat-overview.md)
- Attaching StandardV2 to empty subnets created before April 2025 can fail the VNet — workaround: remove, add VM, reattach (source: nat-overview.md)
- Adding StandardV2 may interrupt existing outbound via LB/Firewall/instance-level PIPs — new connections use NAT Gateway (source: nat-overview.md)

## Configuration

- Attach to subnet + assign public IP or prefix → done. Zero maintenance, zero routing config. (source: nat-overview.md)
- Each public IP provides 64,512 SNAT ports. Scale to 16 IPs = ~1M SNAT ports. (source: nat-gateway-snat.md)
- TCP idle timeout: configurable 4-120 minutes. (source: nat-gateway-resource.md)
- Port reuse timer (cool down after connection close): varies by close method. See [[concepts/snat]]. (source: nat-gateway-resource.md)

## Monitoring

- **Metrics**: Datapath availability, SNAT connection count, total connection count, packet/byte count, dropped packets. (source: nat-metrics.md)
- **Flow logs** (StandardV2 only): IP-based traffic info for outbound flow analysis. (source: nat-gateway-flow-logs.md)
- **Resource Health**: Status indicators (Available/Degraded/Unavailable/Unknown). (source: resource-health.md)
- **Alerts**: Recommended on datapath availability drop <90%, SNAT connection count spikes, packet drops. (source: nat-metrics.md)

## Links

- [[concepts/snat]] — how NAT Gateway translates addresses
- [[concepts/default-outbound-access]] — what NAT Gateway replaces
- [[concepts/availability-zones]] — zone behavior for Standard vs StandardV2
- [[comparisons/nat-gateway-standard-vs-standardv2]] — detailed SKU comparison
- [[patterns/nat-gateway-hub-spoke]] — hub-and-spoke deployment patterns
- [[patterns/nat-gateway-with-load-balancer]] — integration with load balancers
- [[sources/nat-gateway-docs]] — source summary for all 27 articles
- [[concepts/aks-networking]]
- [[concepts/availability-zones-nat]]
- [[concepts/load-balancer-components]]
- [[concepts/troubleshooting-aks]]
- [[concepts/troubleshooting-nat-gateway]]
