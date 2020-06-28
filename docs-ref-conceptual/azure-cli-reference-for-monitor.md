---
title: Azure CLI references for Azure Monitor
description: Azure CLI reference landing page for Azure Monitor
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 06/30/2020
ms.author: dbradish
ms.service: azure-cli
ms.devlang: azurecli
ms.reviewer: 
---

# Azure CLI for Azure Monitor

The Azure Command Line Interface ([Azure CLI](/cli/azure/what-is-azure-cli)) is a set of commands used to create and manage Azure resources.  It is available across many Azure services including Azure Monitor.  There are over 100 references for Azure Monitor giving you the ability to work effectively with monitor services from a command line.

## References for Monitor

The Azure Monitor CLI experience is composed of two parts: Azure CLI (commonly referred to as CLI **core**) and the Azure Monitor CLI **extension**.

> [!NOTE]
>
> **Replace with Azure Monitor details**
>
> Monitor functionality in Azure CLI **core** is focused on infrastructure management and configuration. Monitor Hub CRUD operations, or configuring > Monitor Hub message routes are typical use cases for core commands.
>
> The Monitor **extension** introduces rich features and functionality to manage, manipulate and interact with the data, entities and objects on the > infrastructure itself. For example managing fleets of devices, monitoring device-to-cloud events and invoking cloud to device methods are all enabled > via the Monitor extension. The Azure Monitor extension for Azure CLI unlocks the use of experimental or pre-release technology contributing to its > versatility in a variety of scenarios and use cases.

### Core reference commands

| Reference | Has extension | Description
|-|-|-|
| [az monitor](/cli/azure/monitor) | yes | Manage the Azure Monitor Service.
| [az monitor action-group](/cli/azure/monitor/action-group) | | Manage action groups.
| [az monitor activity-log](/cli/azure/monitor/activity-log) | | Manage activity logs.
| [az monitor alert](/cli/azure/monitor/alert) | | Manage classic metric-based alert rules.
| [az monitor autoscale](/cli/azure/monitor/autoscale) | | Manage autoscale settings.
| [az monitor diagnostic-settings](/cli/azure/monitor/diagnostic-settings) | | Manage service diagnostic settings.
| [az monitor log-analytics](/cli/azure/monitor/log-analytics) | yes | Manage Azure log analytics.
| [az monitor log-profiles](/cli/azure/monitor/log-profiles) | | Manage log profiles.
| [az monitor metrics](/cli/azure/monitor/metrics) | | Manage near-realtime metric alert rules.
| [az monitor private-link-scope](/cli/azure/monitor/private-link-scope) | | Manage monitor private link scope resource.

### Extension reference commands

| Reference | Has core | Description
|-|-|-|
| [az monitor app-insights](/cli/azure/ext/application-insights/monitor) |  | Manage Azure Central (Monitor Central) solutions & infrastructure.
| [az monitor log-analytics](/cli/azure/ext/log-analytics/monitor/log-analytics) | yes | Commands for querying data in Log Analytics workspaces.

## Popular Monitor articles using the Azure CLI

- [Azure Monitor CLI samples](/azure/azure-monitor/samples/cli-samples)
- [Create a Log Analytics workspace with Azure CLI 2.0](/azure/azure-monitor/learn/quick-create-workspace-cli)

## Azure CLI reference examples

Examples are provided with every Azure CLI reference. Although you can also complete these tasks through the Azure portal, using the Azure CLI requires a single command line.  Here are a few code blocks to give you an idea of how easy it is to use the Azure CLI.

To work with Azure Monitor, you'll first need a resource group.  Azure resource groups are simple to create and manage with the Azure CLI.  

```azurecli
#create a resource group
az group create -location westus -name MyResourceGroup
```

```azurecli
#get a list of resource groups for a subscription
az group list --subscription MySubscription --output table
```

It is as straightforward to create an Azure Monitor log alert.

```azurecli
#create an Azure Monitor activity log alert
az monitor activity-log alert create --name MyAlertName --resource-group MyResourceGroup
```

## See also

- [Get started with Azure CLI](/cli/azure/get-started-with-azure-cli) to learn about installation and sign in.

- Discover additional [released](/cli/azure/reference-index) and [extension](/cli/azure/azure-cli-extensions-list) references in the Azure CLI documentation.

- Find out more about extension references in [Use extensions with Azure CLI](/cli/azure/azure-cli-extensions-overview).
