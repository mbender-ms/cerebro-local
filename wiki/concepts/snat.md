---
title: Source Network Address Translation (SNAT)
created: 2026-04-07
updated: 2026-04-07
sources:
  - nat-gateway/nat-gateway-snat.md
  - nat-gateway/nat-gateway-resource.md
  - nat-gateway/nat-overview.md
tags:
  - networking-concept
  - nat
  - outbound-connectivity
---

# Source Network Address Translation (SNAT)

SNAT rewrites the source IP and port of packets originating from a private virtual network to a public IP and port, enabling outbound internet connectivity while keeping private instances private. The internet uses a five-tuple hash (protocol, source IP/port, destination IP/port) to distinguish connections. (source: nat-gateway-snat.md)

## How NAT Gateway Does SNAT

NAT Gateway enables **many-to-one SNAT** — multiple private instances share the same public IP via port masquerading (IP masquerading). Each new connection to a destination gets a unique SNAT port. (source: nat-gateway-snat.md)

### Dynamic Port Allocation

Unlike load balancer SNAT (which preallocates ports per VM), NAT Gateway allocates ports **on-demand** across all VMs in the subnet. No VM holds unused ports while others starve. A released port is immediately available to any VM. (source: nat-gateway-snat.md)

This is the primary advantage over load balancer outbound rules for SNAT — it eliminates per-VM port exhaustion.

### Port Inventory

- Each public IP → 64,512 SNAT ports
- Max 16 IPs per NAT Gateway → ~1,032,192 ports
- TCP and UDP maintain **separate** port inventories (source: nat-gateway-snat.md)
- Ports shared across all subnets attached to the same NAT Gateway (source: nat-gateway-snat.md)

### Port Selection and Reuse

NAT Gateway selects ports **randomly** from available inventory. If no ports are available, it reuses a port. The same port CAN connect to multiple different destinations simultaneously. (source: nat-gateway-snat.md)

Before reusing a port to the **same destination**, a cool-down timer applies:

| Close method | Timer |
|-------------|-------|
| TCP FIN | 65 seconds |
| TCP RST | 16 seconds |
| Idle timeout | Configurable: 4-120 min (default 4 min) |

(source: nat-gateway-resource.md)

### SNAT Exhaustion

Occurs when all available ports are in use. Connections fail. Solutions:
1. Add more public IPs to NAT Gateway (up to 16)
2. Use public IP prefixes for bulk allocation
3. Reduce idle timeout to recycle ports faster
4. Use connection pooling in applications

(source: nat-gateway-snat.md, troubleshoot-nat-connectivity.md)

## Example Flow

| Flow | Private source | After SNAT | Destination |
|------|---------------|------------|-------------|
| 1 | 10.0.0.1:4283 | 65.52.1.1:**1234** | 23.53.254.142:80 |
| 2 | 10.0.0.1:4284 | 65.52.1.1:**1235** | 23.53.254.142:80 |
| 3 | 10.2.0.1:5768 | 65.52.1.1:**1236** | 23.53.254.142:80 |

All three VMs appear as 65.52.1.1 to the destination. (source: nat-gateway-snat.md)

## Links

- [[entities/azure-nat-gateway]] — the service that performs SNAT
- [[concepts/default-outbound-access]] — the legacy SNAT method NAT Gateway replaces
- [[comparisons/nat-gateway-standard-vs-standardv2]] — port inventory differs by SKU
