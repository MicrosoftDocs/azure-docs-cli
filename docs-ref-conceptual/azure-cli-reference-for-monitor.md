---
title: Azure CLI references for Azure Monitor | Microsoft Docs
description: LFind Azure CLI core and extension reference commands to manage Azure Monitor. Follow links to popular articles to learn how to use the Azure CLI for Azure Monitor
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: reference
ms.date: 06/19/2023
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure references, azure monitor
---

# Azure CLI reference commands for Azure Monitor

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources for many Azure services. For Azure Monitor, over 100 different commands are available, which give you the ability to work effectively with the service from a command-line.

The Azure CLI commands for [Azure Monitor](/azure/azure-monitor/) are composed of two parts: Azure CLI (commonly referred to as CLI **core**) and the Azure Monitor CLI footprint **extension**. The Azure CLI extension for Azure Monitor is automatically installed the first time you run the extension reference. For more information about extension references, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).

> [!IMPORTANT]
>
> Azure Monitor now includes Application Insights and Log Analytics. You must install the extensions for each sub-area when working with the Azure CLI for Azure Monitor. You're prompted to install an extension reference on first use. Or, you can use the `az extension add` command to manually install an extension.

## Azure Monitor references

List of Azure CLI references that can be used to manage Azure Monitor, reference descriptions, and links to popular articles:

| Reference | Install extension | Description | For more information
|-|-|-|-|
| [az monitor](../latest/docs-ref-autogen/monitor.yml) | | The top-level command group for all Azure CLI commands for Azure Monitor. | [Azure Monitor overview](/azure/azure-monitor/overview)
| [az monitor action-group](../latest/docs-ref-autogen/monitor/action-group.yml) | | Manage action groups, which relate to notifications once an alert has fired. | [Azure Monitor alerts](/azure/azure-monitor/platform/alerts-overview)
| [az monitor action-rule](/azure/azure-monitor/alerts/alerts-action-rules) | yes | Manage action rules, which let you add or suppress the action groups on your fired alerts. | [Azure Monitor alerts](/azure/azure-monitor/alerts/alerts-action-rules)
| [az monitor activity-log](../latest/docs-ref-autogen/monitor/activity-log.yml) | | Manage activity logs, including activity log alerts. | [Azure activity logs](/azure/azure-monitor/platform/activity-log)
| [az monitor app-insights](../latest/docs-ref-autogen/monitor/app-insights.yml) | yes | Manage Application Insights for application monitoring. | [Application insights overview](/azure/azure-monitor/app/app-insights-overview)
| [az monitor autoscale](../latest/docs-ref-autogen/monitor/autoscale.yml) | | Manage autoscale settings. | [Autoscale overview](/azure/azure-monitor/platform/autoscale-overview)
| [az monitor data-collection](../latest/docs-ref-autogen/monitor/data-collection.yml) | yes | Manage data collection rules. | [Data collection rules](/azure/azure-monitor/agents/data-collection-rule-overview)
| [az monitor diagnostic-settings](../latest/docs-ref-autogen/monitor/diagnostic-settings.yml) | | Manage service diagnostic settings, which set up collection and routing of many types of platform metrics and logs. | [Create diagnostic settings](/azure/azure-monitor/platform/diagnostic-settings)
| [az footprint](../latest/docs-ref-autogen/footprint.yml) | yes | Manage Azure Footprint settings. |
| [az monitor log-analytics](../latest/docs-ref-autogen/monitor/log-analytics.yml) | | Manage log clusters and work spaces. | [Designing your Azure Monitor Logs deployment](/azure/azure-monitor/platform/design-logs-deployment)
| [az monitor log-analytics solution](../latest/docs-ref-autogen/monitor/log-analytics/solution.yml) | yes | Manage Log Analytics solutions. |
| [az monitor log-profiles](../latest/docs-ref-autogen/monitor/log-profiles.yml) | | DO NOT USE for new development. This command was previously used to route activity logs to Azure Monitor Logs and Log Analytics.  Use [diagnostic settings](/azure/azure-monitor/platform/diagnostic-settings) instead.  | [Send the Activity log to a Log Analytics workspace](/azure/azure-monitor/platform/activity-log#send-to-log-analytics-workspace)
| [az monitor metrics](../latest/docs-ref-autogen/monitor/metrics.yml) | | Manage platform metrics and near-realtime metric alert rules. | [Overview of metrics in Azure Monitor](/azure/azure-monitor/platform/data-platform-metrics) and [Understand how metric alerts work](/azure/azure-monitor/platform/alerts-metric-overview)
| [az monitor private-link-scope](../latest/docs-ref-autogen/monitor/private-link-scope.yml) | | Manage monitor private link scope resources. | [Use Azure Private Link to securely connect networks to Azure Monitor](/azure/azure-monitor/platform/private-link-security)
| [az monitor scheduled-query](../latest/docs-ref-autogen/monitor/scheduled-query.yml) | yes | Manage scheduled queries.

## Popular Azure Monitor articles using the Azure CLI

- [Azure Monitor CLI samples](/azure/azure-monitor/samples/cli-samples)
- [Create a Log Analytics workspace with Azure CLI](/azure/azure-monitor/learn/quick-create-workspace-cli)

## Azure CLI reference examples for Azure Monitor

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

* [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.
* Discover additional [reference commands](../latest/docs-ref-autogen/reference-index.yml) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)
