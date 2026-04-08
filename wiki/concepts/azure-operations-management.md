---
title: Azure Operations and Management
created: 2026-04-07
updated: 2026-04-07
sources:
  - automation/*.md
  - update-manager/*.md
  - managed-grafana/*.md
  - azure-app-configuration/*.md
tags:
  - networking-concept
  - management
  - operations
---

# Azure Operations and Management

Key services for managing, automating, and monitoring Azure resources at scale.

## Azure Automation

Runbook-based automation. Process automation (PowerShell/Python), configuration management (DSC), and update management. (source: automation/*.md)

**Key capabilities:** Runbooks (cloud + hybrid), schedules, webhooks, source control integration, shared resources (credentials, variables, connections).

## Azure Update Manager

Unified patch management for Azure VMs, Arc-enabled servers, and on-premises. Schedule patches, assess compliance, deploy updates at scale. Replaces the older Automation Update Management solution. (source: update-manager/*.md)

## Azure Managed Grafana

Fully managed Grafana for dashboards and visualization. Pre-configured data sources for Azure Monitor, Azure Data Explorer, Prometheus. (source: managed-grafana/*.md)

## Azure App Configuration

Centralized configuration management. Feature flags, key-value store, dynamic configuration without redeployment. Integrates with Azure Key Vault for secrets. (source: azure-app-configuration/*.md)

## SRE Agent

AI-powered SRE operations. Automates incident response, root cause analysis, and remediation. Integrates with Azure Monitor, PagerDuty, ServiceNow. (source: sre-agent/*.md)

## Links

- [[entities/automation]]
- [[entities/update-manager]]
- [[entities/managed-grafana]]
- [[entities/azure-app-configuration]]
- [[entities/sre-agent]]
- [[concepts/troubleshooting-azure-monitor]] — monitoring troubleshooting
