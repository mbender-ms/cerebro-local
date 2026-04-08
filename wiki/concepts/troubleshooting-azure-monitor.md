---
title: Troubleshooting Azure Monitor and Observability
created: 2026-04-07
updated: 2026-04-07
sources:
  - support-azure-monitor/*.md
tags:
  - troubleshooting
  - monitoring
  - support
---

# Troubleshooting Azure Monitor and Observability

Compiled from 73 Microsoft Support articles covering Azure Monitor Agent, Log Analytics, Application Insights, and diagnostic settings.

## Azure Monitor Agent (AMA)

| Problem | Fix |
|---------|-----|
| AMA installation failures (Windows) | Check .NET prereqs, proxy settings, extension handler logs |
| AMA installation failures (Linux) | Check Python version, permissions, proxy/firewall blocking |
| Keyset does not exist (0x80090016) | Certificate store corruption; re-register the agent |
| Agent not collecting data | Verify Data Collection Rules (DCR) are associated and correct |
| Migration from Log Analytics Agent | Follow migration guide; validate DCR coverage matches legacy config |

## Log Analytics

| Problem | Fix |
|---------|-----|
| SSL connectivity check fails | Proxy/firewall blocking *.ods.opinsights.azure.com endpoints |
| Workspace data ingestion gaps | Check agent health, DCR, workspace daily cap |
| Activity log export issues | Configure diagnostic settings to send to Log Analytics or Event Hub |
| Long-term storage | Export to Storage Account; configure data export rules |

## Application Insights

| Problem | Fix |
|---------|-----|
| JS SDK errors | Check CDN availability, Content-Security-Policy headers, SDK version |
| Portal connectivity issues | Network/proxy blocking Application Insights endpoints |
| Daily cap unexpected behavior | Cap applies at UTC midnight; ingestion can burst before cap triggers |
| Availability test failures | Check test location, DNS, SSL certificate, response time threshold |
| Missing telemetry | SDK initialization order, sampling configuration, ingestion endpoint |
| Correlation header errors | Request-Context header blocked by CORS or proxy |

## Diagnostic Settings

| Problem | Fix |
|---------|-----|
| Deleted Event Hub auto-recreated | Diagnostic setting still active; delete the diagnostic setting first |
| Metrics not flowing | Resource doesn't support platform metrics; check supported metrics list |
| Logs delayed | Ingestion pipeline latency (typically 2-5 min); check for throttling |

(source: support-azure-monitor/*.md — 73 articles)

## Links

- [[entities/azure-network-watcher]] — network-specific monitoring
- [[concepts/flow-logs]] — NSG and VNet flow logs
