---
title: Availability Zones (NAT Gateway)
created: 2026-04-07
updated: 2026-04-07
sources:
  - nat-gateway/nat-overview.md
  - nat-gateway/nat-sku.md
  - nat-gateway/nat-gateway-resource.md
  - nat-gateway/nat-gateway-design.md
tags:
  - networking-concept
  - reliability
  - availability-zones
---

# Availability Zones (NAT Gateway)

How Azure NAT Gateway handles availability zones differs significantly between the two SKUs. This is the primary reliability differentiator. (source: nat-sku.md)

## Standard SKU — Zonal Only

- Deployed to a **single availability zone** or **no zone** (regional placement by Azure)
- If the zone goes down, NAT Gateway goes down with it
- Zonal deployment: you pick the zone; NAT Gateway and its public IPs must be in the same zone
- No-zone deployment: Azure places it; survives some failures but no explicit zone guarantee

(source: nat-gateway-resource.md)

## StandardV2 SKU — Zone-Redundant

- Operates across **all availability zones** in the region automatically
- Maintains connectivity during any single zone failure
- No zone selection needed — it spans all zones by design
- This is the primary reason to choose StandardV2 over Standard

(source: nat-overview.md, nat-gateway-design.md)

## Design Guidance

> Use StandardV2 NAT gateway for zone-redundancy. StandardV2 operates across all availability zones in a region, maintaining outbound connectivity even during zone failures. (source: nat-gateway-design.md)

For Standard SKU: if you need zone resilience, deploy separate zonal NAT Gateways per zone with zone-matched public IPs. This is complex — StandardV2 eliminates this need. (source: nat-gateway-resource.md)

## Links

- [[entities/azure-nat-gateway]]
- [[comparisons/nat-gateway-standard-vs-standardv2]]
