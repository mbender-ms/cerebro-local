---
title: "Troubleshooting: Azure Virtual Machines"
created: 2026-04-07
updated: 2026-04-07
sources:
  - support-virtual-machines/*.md
tags:
  - support
  - troubleshooting
  - virtual-machines
---

# Troubleshooting: Azure Virtual Machines

292 troubleshooting articles — the largest support area. Covers Windows and Linux VMs.

## Issue Categories

| Category | Count | Common Issues |
|----------|-------|--------------|
| **Boot failures** | 50+ | BSOD, kernel panic, dracut, GRUB, fstab errors |
| **Connectivity** | 40+ | RDP/SSH failures, NSG rules, NVA routing |
| **Performance** | 30+ | High CPU, memory pressure, disk I/O throttling |
| **Extensions** | 25+ | Custom script failures, DSC, monitoring agent |
| **Disk/storage** | 20+ | Disk attach failures, encryption, OS disk swap |
| **Deployment** | 20+ | Allocation failures, quota exceeded, SKU not available |
| **Linux-specific** | 40+ | Kernel updates, GRUB recovery, dracut, cloud-init |
| **Windows-specific** | 40+ | RDP, activation, Windows Update, Group Policy |

## Key Troubleshooting Patterns

- **Serial console** — access VM console when RDP/SSH is unavailable
- **Boot diagnostics** — screenshot of VM boot screen for diagnosis
- **Run command** — execute scripts inside VM without SSH/RDP
- **Nested virtualization** — attach OS disk to rescue VM for offline repair
- **Network Watcher** — diagnose connectivity issues

## Links

- [[entities/azure-virtual-machines]] — service overview
- [[concepts/troubleshooting-virtual-machines]] — VM troubleshooting patterns
- [[concepts/vm-availability]] — availability options
