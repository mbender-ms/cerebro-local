---
author: rboucher
ms.author: robb
ms.service: azure-monitor
ms.topic: include
ms.date: 01/17/2024
---

## Container metrics

Containers generate similar data as other Azure resources, but they require a containerized agent to collect required data. [Azure Monitor managed service for Prometheus](/azure/azure-monitor/essentials/prometheus-metrics-overview) and [Azure Monitor container insights](/azure/azure-monitor/containers/container-insights-overview) work together for complete monitoring of your Kubernetes environment.

- Azure Monitor managed service for Prometheus is a fully managed service that allows you to collect and analyze metrics from your Kubernetes cluster at scale and analyze them using prebuilt dashboards in Grafana.

- Container insights is a feature of Azure Monitor that collects and analyzes container logs from Azure Kubernetes Service (AKS) clusters or Azure Arc-enabled Kubernetes clusters and their components. You can analyze the collected data for the different components in your cluster with a collection of views and prebuilt workbooks.

**Collection:** Container insights collects metrics data from your cluster in addition to logs. The metrics collection functionality has been replaced by Azure Monitor managed service for Prometheus. You can analyze the metrics data by using built-in dashboards in Managed Grafana, and alert on metrics by using prebuilt Prometheus alert rules.

If you want the container insights monitoring experience, you can continue to have container insights collect your metrics data. However, you can save costs by disabling this collection and using Grafana for metrics analysis.

**Routing:** Container insights sends data to a Log Analytics workspace where you can analyze it with Azure Monitor. Managed Prometheus sends data to an Azure Monitor workspace where Managed Grafana can access it.

### Prometheus alerts

[Prometheus alerts](/azure/azure-monitor/alerts/alerts-types#prometheus-alerts) alert on Prometheus metrics stored in Azure Monitor managed services for Prometheus. The alert rules are based on the PromQL open-source query language. Currently, Prometheus metrics are used on a limited set of services with a guest operating system, such as Azure Virtual Machine and Azure Container Instances.
