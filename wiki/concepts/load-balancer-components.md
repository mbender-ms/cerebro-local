---
title: Azure Load Balancer Components and SKUs
created: 2026-04-07
updated: 2026-04-07
sources:
  - load-balancer/components.md
  - load-balancer/skus.md
  - load-balancer/load-balancer-overview.md
tags:
  - networking-concept
  - load-balancer
---

# Azure Load Balancer Components and SKUs

## Components

| Component | Description |
|-----------|-------------|
| **Frontend IP** | Entry point; public IP (internet-facing) or private IP (internal) |
| **Backend pool** | VMs or VMSS instances receiving traffic; IP-based or NIC-based |
| **Health probes** | TCP, HTTP, or HTTPS checks to determine backend health |
| **Load balancing rules** | Map frontend IP:port to backend pool:port with distribution algorithm |
| **HA ports** | Load balance ALL protocols on ALL ports simultaneously (internal LB only) |
| **Inbound NAT rules** | Forward specific frontend port to specific backend VM (e.g., RDP) |
| **Outbound rules** | Configure SNAT for backend pool outbound connectivity |

(source: components.md)

## SKU Comparison

| Feature | Standard | Basic (retired) |
|---------|----------|----------------|
| Backend pool size | 5,000 | 300 |
| Health probes | TCP, HTTP, HTTPS | TCP, HTTP |
| Availability zones | ✅ Zone-redundant/zonal | ❌ |
| HA ports | ✅ | ❌ |
| Outbound rules (SNAT) | ✅ | ❌ |
| Multiple frontends | ✅ Inbound + outbound | Inbound only |
| Secure by default | ✅ Closed (needs NSG) | Open by default |
| Global VNet peering | ✅ | ❌ |
| NAT Gateway support | ✅ | ❌ |
| Private Link support | ✅ | ❌ |
| Cross-region (Global tier) | ✅ | ❌ |
| SLA | 99.99% | None |

> **Basic LB is retired.** All new deployments must use Standard. (source: skus.md)

## Gateway Load Balancer

Transparent chaining of NVAs (firewalls, DPI, analytics) into the data path. Consumer LB chains to a Gateway LB; traffic passes through the NVA and returns. Used for bump-in-the-wire scenarios. (source: load-balancer-overview.md)

## Links

- [[entities/azure-load-balancer]]
- [[entities/azure-nat-gateway]] — preferred for outbound SNAT
- [[patterns/nat-gateway-with-load-balancer]]
- [[comparisons/load-balancing-options]]
