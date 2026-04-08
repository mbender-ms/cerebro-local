---
title: "Azure IoT Central"
created: 2026-04-07
updated: 2026-04-07
sources:
  - iot-central/*.md
tags:
  - iot
  - saas
  - device-management
---

# Azure IoT Central

Fully managed IoT SaaS platform. Build IoT solutions without deep cloud expertise. Provides device management, data visualization, rules/alerts, and integration — all from a web UI.

## Comparison with IoT Hub

| Feature | IoT Central | IoT Hub |
|---------|-------------|---------|
| **Type** | SaaS (managed) | PaaS (build your own) |
| **Setup** | Minutes (web UI) | Hours/days (code + infra) |
| **Device management** | Built-in UI | SDK + custom code |
| **Dashboards** | Built-in | Build with Power BI/Grafana |
| **Rules & alerts** | Built-in | Azure Stream Analytics + Logic Apps |
| **Data export** | Built-in connectors | Event Hubs, Service Bus, custom |
| **Customization** | Template-based | Unlimited |
| **Best for** | Rapid prototyping, fleet management | Custom IoT backends |

## Key Features

- **Device templates** — define capabilities (telemetry, properties, commands) per device type
- **Rules engine** — trigger actions on telemetry conditions
- **Dashboards** — real-time data visualization without coding
- **Data export** — continuous export to Event Hubs, Service Bus, Blob, webhooks
- **Edge support** — manage IoT Edge devices from Central
- **Organizations** — multi-tenant device management

## Links

- [[entities/iot]] — IoT services overview
- [[comparisons/iot-services]] — Central vs Hub vs Edge
- [[entities/iot-hub-device-update]] — OTA updates for devices
