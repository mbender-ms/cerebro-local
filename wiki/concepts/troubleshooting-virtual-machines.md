---
title: Troubleshooting Azure Virtual Machines
created: 2026-04-07
updated: 2026-04-07
sources:
  - support-virtual-machines/*.md
tags:
  - troubleshooting
  - virtual-machines
  - support
---

# Troubleshooting Azure Virtual Machines

Compiled from 292 Microsoft Support articles covering VM boot failures, connectivity, extensions, performance, and deployment issues.

## Boot Failures

| Symptom | Common cause | Key article area |
|---------|-------------|-----------------|
| VM doesn't start after kernel update | Incompatible kernel or missing initramfs modules | Linux kernel troubleshooting |
| Boot loops / dracut emergency shell | Filesystem corruption, missing VFAT support, fstab errors | Linux boot repair |
| Blue screen / BSOD on Windows | Driver issues, Windows Update failures, disk corruption | Windows boot diagnostics |
| VM stuck in "updating" state | Extension timeout, provisioning agent failure | Provisioning troubleshooting |

## Connectivity

| Symptom | Common cause |
|---------|-------------|
| Cannot RDP to Windows VM | NSG blocking port 3389, Windows Firewall, NLA issues |
| Cannot SSH to Linux VM | NSG blocking port 22, sshd not running, key mismatch |
| VM-to-VM connectivity failure | NSG rules, UDR misconfiguration, peering issues |
| Outbound connectivity lost | No public IP, no NAT Gateway, no LB outbound rules, [[concepts/default-outbound-access]] deprecated |

## Extensions and Agent

| Symptom | Common cause |
|---------|-------------|
| Extensions not processing | Guest agent not running or outdated |
| Linux agent (waagent) failures | Python version incompatibility, permissions, disk full |
| Windows guest agent failures | Service stopped, registry corruption, certificate issues |
| Custom script extension timeout | Script exceeds 90-minute limit, network dependency failures |

## Performance

| Symptom | Common cause |
|---------|-------------|
| High CPU | Undersized VM, runaway process, insufficient vCPUs for workload |
| Slow disk I/O | Standard HDD instead of SSD, IOPS throttling, temp disk misuse |
| Network throughput low | VM size bandwidth cap, accelerated networking not enabled |
| Memory pressure | Undersized VM, memory leak, swap not configured (Linux) |

## Deployment and Allocation

| Symptom | Common cause |
|---------|-------------|
| Allocation failure | Capacity constraints in the requested region/zone/size |
| "OverconstrainedAllocationRequest" | Too many constraints (availability set + size + zone) |
| Resize failure | Target size not available in current cluster |

## Repair Techniques

- **Serial Console** — direct console access for boot repair and debugging
- **Boot diagnostics** — screenshot and serial log of VM boot process
- **Offline repair** — attach OS disk to a rescue VM for filesystem repair
- **Run Command** — execute scripts on VM without RDP/SSH
- **VM assist** — automated troubleshooting tool for guest agent issues

(source: support-virtual-machines/*.md — 292 articles)

## Links

- [[entities/azure-virtual-network]] — NSG/UDR for connectivity issues
- [[concepts/network-security-groups]] — NSG rule troubleshooting
- [[entities/azure-bastion]] — secure VM access without public IPs
- [[sources/support-virtual-machines-docs]]
