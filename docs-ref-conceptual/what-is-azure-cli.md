---
title: What is the Azure CLI? | Microsoft Docs
description: The Azure Command-Line Interface (CLI) is a command-line tool designed to create and manage Azure resources available in Windows, macOS, Linux, and Docker containers.
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.date: 9/21/2021
ms.topic: overview
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: command line interface, azure cli, azure command line, azure command line interface, what is cli, azure cli examples
---
# What is the Azure CLI?

The Azure Command-Line Interface (CLI) is a cross-platform command-line tool to connect to Azure and execute administrative commands on Azure resources. It allows the execution of commands through a terminal using interactive command-line prompts or a script.

For interactive use, you first launch a shell such as cmd.exe on Windows, or Bash on Linux or macOS, and then issue a command at the shell prompt. To automate repetitive tasks, you assemble the CLI commands into a shell script using the script syntax of your chosen shell, and then you execute the script.

You can install the Azure CLI locally on Linux, Mac, or Windows computers. It can also be used from a browser through the Azure Cloud Shell or run from inside a Docker container.

## Current Version

[!INCLUDE [current-version](includes/current-version.md)]

## Data collection

Azure CLI collects telemetry data by default. Microsoft aggregates collected data to identify patterns of usage to identify common issues and to improve the experience of Azure CLI. Microsoft Azure CLI does not collect any private or personal data. For example, the usage data helps identify issues such as commands with low success and helps prioritize our work.

While we appreciate the insights this data provides, we also understand that not everyone wants to send usage data. You can disable data collection with the `az config set core.collect_telemetry=false` command. You can also read our [privacy statement](https://privacy.microsoft.com/privacystatement) to learn more.

## Prepare your environment

Before running Azure CLI commands, you need to setup your environment.

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]

## Azure CLI examples
This article provides different Azure CLI examples for the following :
- Subscription syntax
- Role assignment syntax
- PowerShell syntax


## Subscription syntax example

The Azure CLI syntax follows a simple `reference name` - `command` - `parameter` - `parameter value` pattern.  For example, switching between subscriptions is often a common task.  Here is the syntax.

```azurecli
az account set --subscription "my subscription name"
```

Now, how easy was that?!  See [Manage subscriptions with Azure CLI](manage-azure-subscriptions-azure-cli.md) to learn more about using the Azure CLI to work with subscriptions and create management groups.

## Role assignment syntax example

Another common use of the Azure CLI is managing role assignments.

```azurecli
az role assignment create --assignee servicePrincipalName --role Reader --scope /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName
az role assignment delete --assignee userSign-inName --role Contributor
```

See [Create an Azure service principal with the Azure CLI](create-an-azure-service-principal-azure-cli.md) for an in-depth turorial on managing service principals and role assignments.

## PowerShell syntax comparison

[Choose the right command-line tool](choose-the-right-azure-command-line-tool.md) explains the difference between `tools` and `environments` with an emphasis on the Azure CLI and Azure PowerShell.  It also gives many [side-by-side command comparisons](choose-the-right-azure-command-line-tool.md#azure-cli-vs-azure-powershell-side-by-side-command-comparison).  Here are two examples:

|Command|Azure CLI|Azure PowerShell|
| --- | --- | --- |
| Create Resource Group | az group create --name \<ResourceGroupName> --location eastus |New-AzResourceGroup -Name \<ResourceGroupName> -Location eastus
| Create Azure Storage Account | az storage account create --name \<StorageAccountName> --resource-group \<ResourceGroupName> --location eastus --sku Standard_LRS --kind StorageV2 | New-AzStorageAccount -Name \<StorageAccountName> -ResourceGroupName \<ResourceGroupName> -Location eastus -SkuName Standard_LRS -Kind StorageV2

## See Also

* [Get started with the Azure CLI](./get-started-with-azure-cli.md)
* [Control Azure services with the Azure CLI](/learn/modules/control-azure-services-with-cli/)
* [Azure resources that the Azure CLI can manage](./azure-services-the-azure-cli-can-manage.md)
* [Full command reference list for the Azure CLI](../latest/docs-ref-autogen/reference-index.yml)
