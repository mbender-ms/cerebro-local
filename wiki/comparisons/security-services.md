---
title: Azure Security Services
created: 2026-04-07
updated: 2026-04-07
sources:
  - sentinel/*.md
  - security/*.md
  - defender-for-iot/*.md
  - ddos-protection/*.md
  - confidential-computing/*.md
tags:
  - comparison
  - security
---

# Azure Security Services

## Network Security Stack

| Layer | Service | Purpose |
|-------|---------|---------|
| **Edge (L7)** | [[entities/azure-waf]] | OWASP protection for web apps (on App Gateway, Front Door) |
| **Perimeter (L3-L7)** | [[entities/azure-firewall]] | Centralized stateful firewall with threat intelligence, TLS inspection |
| **VNet (L3-L4)** | [[concepts/network-security-groups]] | Stateful packet filter per-subnet/NIC |
| **VNet (governance)** | [[concepts/security-admin-rules]] | Centralized rules via VNet Manager; can't be overridden |
| **DDoS** | [[entities/ddos-protection]] | Volumetric and protocol DDoS mitigation for public IPs |
| **DNS** | [[concepts/dns-security-policy]] | DNS query filtering and threat intelligence at VNet level |
| **Data** | [[entities/azure-private-link]] | Private endpoints eliminate public exposure for PaaS |

## SIEM & Threat Detection

| Service | Purpose |
|---------|---------|
| [[entities/sentinel]] | Cloud-native SIEM + SOAR; log collection, threat detection, automated response |
| [[entities/defender-for-iot]] | Threat detection for IoT/OT networks; agentless monitoring |
| Microsoft Defender for Cloud | Unified security posture management + threat protection across Azure, hybrid, multicloud |

## Data Protection

| Service | Purpose |
|---------|---------|
| [[entities/confidential-computing]] | Hardware-based TEEs (enclaves); process data while encrypted in memory |
| [[entities/managed-ccf]] | Managed Confidential Consortium Framework for multi-party ledger |
| [[entities/artifact-signing]] | Sign container images and artifacts for supply chain integrity |
