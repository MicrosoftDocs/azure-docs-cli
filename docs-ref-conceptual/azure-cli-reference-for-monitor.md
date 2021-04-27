---
title: Azure CLI references for Azure Monitor
description: Azure CLI reference landing page for Azure Monitor
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 04/09/2021
ms.author: dbradish
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli
---

# Azure CLI for Azure Monitor

The Azure Command Line Interface ([Azure CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources for many Azure services. For Azure Monitor, over 100 different commands are available, which give you the ability to work effectively with the service from a command line.

## References for Azure Monitor

The [Azure Monitor](/azure/azure-monitor/) CLI experience is composed of two parts: Azure CLI (commonly referred to as CLI **core**) and the Azure Monitor CLI footprint **extension**. The extension is automatically installed the first time you run an extension reference. For more information about extension references, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).

> [!IMPORTANT]
>
> Azure Monitor now includes Application Insights and Log Analytics. As such, you must install the extensions for each sub-area when working with Azure Monitor CLI.

### References

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the `az extension add` command to manually install an extension.

| Reference | Install extension | Description | For more information
|-|-|-|-|
| [az monitor](/cli/azure/monitor) | | The top-level command group for all Azure CLI commands for Azure Monitor. | [Azure Monitor overview](/azure/azure-monitor/overview)
| [az monitor action-group](/cli/azure/monitor/action-group) | | Manage action groups, which relate to notifications once an alert has fired. | [Azure Monitor alerts](/azure/azure-monitor/platform/alerts-overview)
| [az monitor action-rule](/cli/azure/monitor/action-rule) | yes | Manage action rules, which let you add or suppress the action groups on your fired alerts. | [Azure Monitor alerts](/azure/azure-monitor/alerts/alerts-action-rules)
| [az monitor activity-log](/cli/azure/monitor/activity-log) | | Manage activity logs, including activity log alerts. | [Azure activity logs](/azure/azure-monitor/platform/activity-log)
| [az monitor app-insights](/cli/azure/monitor/app-insights) | yes | Manage Application Insights for application monitoring. | [Application insights overview](/azure/azure-monitor/app/app-insights-overview)
| [az monitor autoscale](/cli/azure/monitor/autoscale) | | Manage autoscale settings. | [Autoscale overview](/azure/azure-monitor/platform/autoscale-overview)
| [az monitor data-collection](/cli/azure/monitor/data-collection) | yes | Manage data collection rules. | [Data collection rules](/azure/azure-monitor/agents/data-collection-rule-overview)
| [az monitor diagnostic-settings](/cli/azure/monitor/diagnostic-settings) | | Manage service diagnostic settings, which set up collection and routing of many types of platform metrics and logs. | [Create diagnostic settings](/azure/azure-monitor/platform/diagnostic-settings)
| [az footprint](/cli/azure/footprint) | yes | Manage Azure Footprint settings. |
| [az monitor log-analytics](/cli/azure/monitor/log-analytics) | | Manage log clusters and work spaces. | [Designing your Azure Monitor Logs deployment](/azure/azure-monitor/platform/design-logs-deployment)
| [az monitor log-analytics solution](/cli/azure/monitor/log-analytics/solution) | yes | Manage Log Analytics solutions. |
| [az monitor log-profiles](/cli/azure/monitor/log-profiles) | | DO NOT USE for new development. This command was previously used to route activity logs to Azure Monitor Logs and Log Analytics.  Use [diagnostic settings](/azure/azure-monitor/platform/diagnostic-settings) instead.  | [Send the Activity log to a Log Analytics workspace](/azure/azure-monitor/platform/activity-log#send-to-log-analytics-workspace)
| [az monitor metrics](/cli/azure/monitor/metrics) | | Manage platform metrics and near-realtime metric alert rules. | [Overview of metrics in Azure Monitor](/azure/azure-monitor/platform/data-platform-metrics) and [Understand how metric alerts work](/azure/azure-monitor/platform/alerts-metric-overview)
| [az monitor private-link-scope](/cli/azure/monitor/private-link-scope) | | Manage monitor private link scope resources. | [Use Azure Private Link to securely connect networks to Azure Monitor](/azure/azure-monitor/platform/private-link-security)
| [az monitor scheduled-query](/cli/azure/monitor/scheduled-query) | yes | Manage scheduled queries.

## Popular Monitor articles using the Azure CLI

- [Azure Monitor CLI samples](/azure/azure-monitor/samples/cli-samples)
- [Create a Log Analytics workspace with Azure CLI](/azure/azure-monitor/learn/quick-create-workspace-cli)

## Azure CLI reference examples

Examples are provided with every Azure CLI reference. Although you can also complete these tasks through the Azure portal, using the Azure CLI requires a command line. Here are a few code blocks to give you an idea of how easy it is to use the Azure CLI.

To work with Azure Monitor, you first need a resource group.  Azure resource groups are simple to create and manage with the Azure CLI.  

```azurecli
#create a resource group
az group create --location westus --name MyResourceGroup

#get a list of resource groups for a subscription
az group list --subscription MySubscription --output table
```

It's also easy to create an Azure Monitor log alert.

```azurecli
#create an Azure Monitor activity log alert
az monitor activity-log alert create --name MyAlertName --resource-group MyResourceGroup
```

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [core](/cli/azure/reference-index) and [extension](./azure-cli-extensions-list.md) references in the Azure CLI documentation.

- Learn more about extension references in [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).
