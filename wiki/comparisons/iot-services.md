---
title: Azure IoT Services
created: 2026-04-07
updated: 2026-04-07
sources:
  - iot-hub/*.md
  - iot-central/*.md
  - iot-edge/*.md
  - iot-dps/*.md
  - iot-operations/*.md
  - digital-twins/*.md
tags:
  - comparison
  - iot
---

# Azure IoT Services

## Decision Matrix

| Service | Level | Best for |
|---------|-------|----------|
| [[entities/iot-hub]] | PaaS (build-your-own) | Custom IoT solutions with full control over device communication, routing, and processing |
| [[entities/iot-central]] | SaaS (managed app) | Rapid IoT prototyping and production with minimal code; templates for common scenarios |
| [[entities/iot-edge]] | Edge runtime | Run cloud intelligence on IoT devices; modules for ML, Stream Analytics, Functions |
| [[entities/iot-dps]] | Provisioning | Zero-touch device provisioning at scale; auto-assign devices to the right IoT Hub |
| [[entities/iot-operations]] | Kubernetes-based edge | Industrial IoT on Arc-enabled Kubernetes; MQTT broker, OPC UA, data pipelines |
| [[entities/digital-twins]] | Digital modeling | Live graph model of physical environments; query, simulate, integrate with IoT Hub |

## IoT Hub vs IoT Central

| Dimension | IoT Hub | IoT Central |
|-----------|---------|-------------|
| **Abstraction** | PaaS — you build everything | SaaS — managed app with UI |
| **Device management** | SDK-based, custom | Built-in dashboards, rules, templates |
| **Message routing** | Configurable endpoints (Event Hubs, Storage, Service Bus) | Built-in data export |
| **Customization** | Full control | Template-based, extensible via APIs |
| **Effort** | Higher (more code) | Lower (less code) |
