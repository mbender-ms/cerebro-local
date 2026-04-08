---
title: Default Outbound Access
created: 2026-04-07
updated: 2026-04-07
sources:
  - nat-gateway/nat-overview.md
  - nat-gateway/nat-gateway-design.md
  - nat-gateway/tutorial-migrate-outbound-nat.md
tags:
  - networking-concept
  - outbound-connectivity
  - deprecation
---

# Default Outbound Access

Azure provides default outbound internet connectivity to VMs that don't have explicit outbound configuration (no NAT Gateway, no load balancer outbound rules, no instance-level public IP). This implicit SNAT uses a non-deterministic public IP that you don't control. (source: nat-overview.md)

## Why Replace It

- **Non-deterministic IP** — the outbound IP can change, breaking allowlists and audit trails
- **No control** — you can't scale, configure idle timeouts, or monitor it
- **Security risk** — Microsoft recommends explicit outbound methods for production workloads
- **Being deprecated** — Azure is moving to require explicit outbound configuration

(source: nat-gateway-design.md)

## Migration Path

NAT Gateway is the recommended replacement. Tutorials cover:
- Migrating from default outbound access to NAT Gateway (source: tutorial-migrate-outbound-nat.md)
- Migrating from load balancer outbound rules to NAT Gateway (source: tutorial-migrate-outbound-nat.md)
- Migrating from VM instance-level public IPs to NAT Gateway (source: tutorial-migrate-ilip-nat.md)

## Links

- [[entities/azure-nat-gateway]] — the recommended replacement
- [[concepts/snat]] — how NAT Gateway handles address translation
