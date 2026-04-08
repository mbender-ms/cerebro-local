---
title: "Microsoft Defender for IoT"
created: 2026-04-07
updated: 2026-04-07
sources:
  - defender-for-iot/*.md
tags:
  - security
  - iot
  - ot
  - monitoring
---

# Microsoft Defender for IoT

Agentless security monitoring for IoT and OT (Operational Technology) networks. Discovers devices, detects threats, and monitors vulnerabilities across industrial control systems, building management, and IoT deployments.

## Key Capabilities

| Feature | Description |
|---------|-------------|
| **Asset discovery** | Passive network monitoring to identify all IoT/OT devices |
| **Vulnerability assessment** | CVE detection, firmware analysis, risk scoring |
| **Threat detection** | Behavioral anomaly detection, known attack signatures |
| **OT protocol support** | Modbus, DNP3, BACnet, OPC-UA, Siemens S7, and 100+ protocols |
| **Network sensor** | On-premises sensor appliance for air-gapped OT networks |
| **Cloud integration** | Azure portal dashboard, Sentinel SIEM integration |
| **Micro-agent** | Lightweight agent for IoT devices (optional) |

## Deployment Models

| Model | Where | Use Case |
|-------|-------|----------|
| **Cloud-connected sensor** | On-prem sensor → Azure | Enterprise IoT with cloud management |
| **Air-gapped sensor** | On-prem only | Classified/isolated OT networks |
| **Micro-agent** | On IoT device | Endpoint-level security for managed devices |

## Links

- [[entities/iot]] — Azure IoT services overview
- [[comparisons/iot-services]] — IoT service comparison
- [[comparisons/security-services]] — where Defender for IoT fits in security stack
- [[entities/azure-firmware-analysis]] — firmware security analysis
