---
title: Azure Automanage
created: 2026-04-07
updated: 2026-04-07
sources:
  - automanage/*.md
tags:
  - compute
  - management
  - best-practices
  - vms
---

# Azure Automanage

Automatically onboards and configures Azure best-practice services for VMs. Applies Microsoft's recommended configuration for backup, monitoring, security, patching, and more — without manual setup.

## Configuration Profiles

| Profile | Services Applied |
|---------|-----------------|
| **Production** | Azure Backup, Microsoft Defender, Azure Monitor, Update Management, Boot Diagnostics, etc. |
| **Dev/Test** | Lighter configuration — monitoring and basic security |
| **Custom** | Pick and choose which best practices to apply |

## Services Managed

- Azure Backup (daily backups with retention policy)
- Microsoft Defender for Cloud
- Azure Monitor (VM insights, log analytics)
- Update Management (OS patching)
- Change Tracking and Inventory
- Boot Diagnostics
- Guest Configuration (policy compliance)

## How It Works

1. Assign configuration profile to VM(s)
2. Automanage onboards and configures all included services
3. Continuously monitors and remediates drift
4. If a service is misconfigured or removed, Automanage re-applies

## Links

- [[entities/azure-virtual-machines]] — primary target for Automanage
- [[entities/azure-vmss]] — also supported
- [[concepts/waf-operational-excellence]] — Automanage implements WAF operations best practices
