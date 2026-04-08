---
author: limwainstein
ms.author: lwainstein
ms.service: azure-monitor
ms.topic: include
ms.date: 05/18/2025
---

## Configure Syslog data source
On the **Collect and deliver** tab of the DCR, select **Linux Syslog** from the **Data source type** dropdown.

Select a **Minimum log level** for each facility or **NONE** to collect no events for that facility. You can configure multiple facilities at once by selecting their checkbox and then selecting a log level in **Set minimum log level for selected facilities**.

:::image type="content" source="/azure/azure-monitor/vm/media/data-collection-syslog/create-rule-data-source.png" lightbox="/azure/azure-monitor/vm/media/data-collection-syslog/create-rule-data-source.png" alt-text="Screenshot that shows the page to select the data source type and minimum log level.":::

All logs with the selected severity level and higher are collected for the facility. The supported severity levels and their relative severity are as follows:

1. Debug
2. Info
3. Notice
4. Warning
5. Error
6. Critical
7. Alert
8. Emergency

## Add destinations
Syslog data can only be sent to a Log Analytics workspace where it's stored in the [Syslog](/azure/azure-monitor/reference/tables/syslog) table. Add a destination of type **Azure Monitor Logs** and select a Log Analytics workspace. While you can add multiple workspaces, be aware that this will send duplicate data to each which will result in additional cost.

:::image type="content" source="/azure/azure-monitor/vm/media/data-collection/destination-workspace.png" lightbox="/azure/azure-monitor/vm/media/data-collection/destination-workspace.png" alt-text="Screenshot that shows configuration of an Azure Monitor Logs destination in a data collection rule." :::

## Verify data collection
To verify that data is being collected, check for records in the **Syslog** table. From the virtual machine or from the Log Analytics workspace in the Azure portal, select **Logs** and then click the **Tables** button. Under the **Virtual machines** category, click **Run** next to **Syslog**. 

:::image type="content" source="/azure/azure-monitor/vm/media/data-collection-syslog/verify-syslog.png" lightbox="/azure/azure-monitor/vm/media/data-collection-syslog/verify-syslog.png" alt-text="Screenshot that shows records returned from Syslog table." :::