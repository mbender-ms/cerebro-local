---
title: Troubleshooting NAT Gateway
created: 2026-04-07
updated: 2026-04-07
sources:
  - nat-gateway/troubleshoot-nat-connectivity.md
  - nat-gateway/troubleshoot-nat.md
  - nat-gateway/troubleshoot-nat-and-azure-services.md
tags:
  - troubleshooting
  - nat-gateway
---

# Troubleshooting NAT Gateway

Common failure modes, their causes, and solutions for [[entities/azure-nat-gateway]]. Compiled from three troubleshooting articles. (source: troubleshoot-nat-connectivity.md, troubleshoot-nat.md, troubleshoot-nat-and-azure-services.md)

## Symptom → Cause → Fix

### Datapath availability drops + connection failures

**Most common cause**: SNAT port exhaustion or hitting simultaneous connection limits. (source: troubleshoot-nat-connectivity.md)

**Fixes**:
- Add more public IPs to NAT Gateway (each adds 64,512 ports)
- Reduce application idle timeout
- Use connection pooling / connection reuse in application code
- Distribute workloads across more subnets

### Datapath availability drops but NO connection failures

**Cause**: Transient availability blip, typically self-resolving. (source: troubleshoot-nat-connectivity.md)

**Action**: Set up alert on datapath availability <90% to detect trends.

### No outbound connectivity to the internet

**Common causes**: (source: troubleshoot-nat-connectivity.md)
- NAT Gateway not associated to any subnet
- No public IP assigned to NAT Gateway
- NSG blocking outbound traffic on the subnet
- UDR overriding next hop (but note: NAT Gateway wins for internet traffic on its own subnet)
- NAT Gateway in a failed state

### NAT Gateway public IP not used for outbound

**Common causes**: (source: troubleshoot-nat-connectivity.md)
- VM has instance-level PIP but NAT Gateway not yet attached (attach NAT Gateway → it takes priority)
- LB outbound rules configured but NAT Gateway not yet attached
- Traffic going to a VNet service endpoint bypasses NAT Gateway

### Connection failures to specific internet destinations

**Common causes**: (source: troubleshoot-nat-connectivity.md)
- Destination firewall blocking NAT Gateway IPs
- Destination rate-limiting connections from same source IP
- TCP RST from destination

### FTP failures (active or passive mode)

- **Active FTP**: Fails because NAT Gateway blocks unsolicited inbound. Use passive FTP instead. (source: troubleshoot-nat-connectivity.md)
- **Passive FTP**: May fail if data connection uses a different port. Ensure firewall/NSG allows the port range.

### Port 25 (SMTP) blocked

Azure blocks outbound port 25 by default to prevent spam. Use authenticated SMTP relay (port 587) or a third-party email service. (source: troubleshoot-nat-connectivity.md)

### NAT Gateway in a failed state

Remove and reattach, or check ARM deployment for errors. (source: troubleshoot-nat.md)

### StandardV2 + VNet injection issues

StandardV2 doesn't support delegated subnets for certain services. Known issues with: App Services, AKS, Azure Firewall, Databricks. (source: troubleshoot-nat-and-azure-services.md)

**AKS specifics**: (source: troubleshoot-nat-and-azure-services.md)
- NAT Gateway must be in same VNet as AKS cluster
- AKS with kubenet: NAT Gateway on node subnet
- AKS with Azure CNI: NAT Gateway on pod subnet
- Must use Standard LB (not Basic) with NAT Gateway

## Best Practices for Outbound Connectivity

1. **Use connection pooling** — reuse TCP connections
2. **Reuse connections** — HTTP keep-alive, connection multiplexing
3. **Less aggressive retry logic** — exponential backoff with jitter
4. **Use keepalives** — reset idle timeout counters
5. **Use Private Link** — bypasses SNAT entirely for Azure PaaS services

(source: troubleshoot-nat-connectivity.md)

## Links

- [[entities/azure-nat-gateway]]
- [[concepts/snat]] — port exhaustion details
- [[concepts/default-outbound-access]]
- [[comparisons/nat-gateway-standard-vs-standardv2]]
