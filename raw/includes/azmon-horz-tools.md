---
ms.service: azure-monitor
ms.topic: include
ms.date: 11/05/2024
ms.author: abbyweisberg
author: AbbyMSFT
---

## Use Azure Monitor tools to analyze the data

These Azure Monitor tools are available in the Azure portal to help you analyze monitoring data:

- Some Azure services have a built-in monitoring dashboard in the Azure portal. These dashboards are called *insights*, and you can find them in the **Insights** section of Azure Monitor in the Azure portal.

- [Metrics explorer](/azure/azure-monitor/essentials/metrics-getting-started) allows you to view and analyze metrics for Azure resources. For more information, see [Analyze metrics with Azure Monitor metrics explorer](/azure/azure-monitor/essentials/metrics-getting-started).

- [Log Analytics](/azure/azure-monitor/learn/quick-create-workspace) allows you to query and analyze log data using the [Kusto query language (KQL)](/azure/data-explorer/kusto/query). For more information, see [Get started with log queries in Azure Monitor](/azure/azure-monitor/logs/get-started-queries).

- The Azure portal has a user interface for viewing and basic searches of the [activity log](/azure/azure-monitor/essentials/activity-log). To do more in-depth analysis, route the data to Azure Monitor logs and run more complex queries in Log Analytics.

- [Application Insights](/azure/azure-monitor/app/app-insights-overview) monitors the availability, performance, and usage of your web applications, so you can identify and diagnose errors without waiting for a user to report them. </br>Application Insights includes connection points to various development tools and integrates with Visual Studio to support your DevOps processes. For more information, see [Application monitoring for App Service](/azure/azure-monitor/app/azure-web-apps). 

Tools that allow more complex visualization include:

- [Dashboards](/azure/azure-monitor/visualize/tutorial-logs-dashboards) that let you combine different kinds of data into a single pane in the Azure portal.
- [Workbooks](/azure/azure-monitor/visualize/workbooks-overview), customizable reports that you can create in the Azure portal. Workbooks can include text, metrics, and log queries.
- [Grafana](/azure/azure-monitor/visualize/grafana-plugin), an open platform tool that excels in operational dashboards. You can use Grafana to create dashboards that include data from multiple sources other than Azure Monitor.
- [Power BI](/azure/azure-monitor/logs/log-powerbi), a business analytics service that provides interactive visualizations across various data sources. You can configure Power BI to automatically import log data from Azure Monitor to take advantage of these visualizations.
