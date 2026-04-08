---
author: rboucher
ms.author: robb
ms.service: azure-monitor
ms.topic: include
ms.date: 01/17/2024
---

## System-imported platform metrics

Some Azure services send metrics into the metrics database by using the Azure Monitor REST API when the resource provider/namespace model can't be used. For example, virtual machines provide Guest OS level metrics that Azure Monitor itself can't see because they're running inside the resource. Once these metrics are collected and sent to Azure Monitor metrics, you can use the same methods to analyze and alert on them as any other metric.

**Collection:** Other platform metrics are usually collected by agents running inside the service. Often you must deploy and configure these agents. For more information, see [Overview of Azure Monitor agents](/azure/azure-monitor/platform/agents-overview).

**Routing:** Agents can route metrics to Azure Monitor metrics or Azure Monitor logs. For more information, see [Azure Monitor Agent overview](/azure/azure-monitor/agents/agents-overview).
