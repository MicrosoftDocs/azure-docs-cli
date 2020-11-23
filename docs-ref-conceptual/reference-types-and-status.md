---
title: Azure CLI reference types
description: An explanation of reference types and status
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 11/19/2020
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli 
ms.custom: devx-track-azurecli
---

# Overview: Azure CLI reference types and status

The Azure CLI has different reference types, which are sometimes described interchangeably with reference status.  This article explains the difference between an Azure CLI type and a status, and provides information for working with both.

## Azure CLI syntax components

The Azure CLI syntax is a combination of references, commands, and parameters.  Often the **full reference command** is referred to as **command**.

| Azure Service | Reference | Reference subservice | Command | Full reference command | Parameter Examples
|-|-|-|-|-|-|
| Azure CLI | [az configure](/cli/azure/reference-index#az-configure) | | | az configure | --defaults, --list-default, --scope
| Azure Network | [az network](/cli/azure/network) | application-gateway | create | [az network application-gateway create](/cli/azure/network/application-gateway#az-network-application-gateway-create) | --name, --resource-group, --capacity
| Azure DevOps Server | [az pipelines](/cli/azure/pipelines) | agent | list | [az pipelines agent list](/cli/azure/pipelines/agent) | --pool-id, --agent-name, --demands

## Reference types

A reference type tells you if the reference command is part of the primary Azure CLI service, or if it is an optional add-on.  There are two types of Azure CLI reference commands: **core** and **extension**.

|         | Core  | Extension
|-|-|-|
| **References** | Are part of the primary Azure CLI service | Are optional reference commands that must be installed
| **Install** | Jointly with the [MSI installer]() | Individually with [az extension add]()|
| **Released** | On a schedule | As new features or updates become available
| **Status** | Can be GA (Generally Available), preview or experimental | Also can be GA, preview or experimental

All Azure CLI references can be run in Windows, macOS, Linux, Docker, and Azure Cloud Shell.

### Core

Azure CLI references that have been published as a permanent part of the CLI are called **core references**.  All core references install with the Azure CLI and you cannot choose a subset of references.  If you run the CLI through Azure Cloud Shell, core references are always up to date.  See [Core reference list for the Azure CLI](/cli/azure/reference-index) for a complete list of core reference commands.

### Extension

Extensions aren't shipped as part of the CLI but run as CLI commands.  Some extensions are a permanent part of the Azure CLI, but often, an extension will give you access to private preview and experimental commands.  A single reference, such as **az iot hub**, can have both core and extension commands.  Here are a four examples:

| Full reference command | Is Core | Is Extension
|-|-|-|
| az iot hub list | yes |
| az iot hub query | | yes
| az iot hub certificate create | yes |
| az iot hub device identify create | | yes

> [!IMPORTANT]
> You must install an extension prior to use by running the [az extension add](/cli/azure/extension#az-extension-add) command.

You can learn more about extension references including installation and updating in [Use extensions with the Azure CLI](azure-cli-extensions-overview.md).  Review the extension [wiki tips](https://github.com/Azure/azure-network-cli-extension/wiki/Tips) to maximize usage.  See [Available extensions for the Azure CLI](azure-cli-extensions-list.md) for a complete list of extension reference commands.

## Reference status

Regardless of type, Azure CLI references fall into three status categories: **GA** (Generally Available), **public preview** or **experimental**.  It is the reference command status, not type, that determines stability and support level.

| | GA  | Public preview | Experimental
|-|-|-|-|
| **Stability** | Permanent | Can change in response to customer feedback.  Is subject to the terms of [Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/). | Can change in response to customer feedback.  Will often migrate to public preview.  Can be removed.
| **Support level** | Full | Partial | None

Although most commands and parameters for a single reference have a single status, this is not always the case.  A GA reference that is being built out to offer more commands can have GA, preview, and experimental reference commands. As new parameters are added to increase functionality, a single command can also have parameters that fall under different status categories.  Here are example references that have different statuses:

| Full reference command | Parameters | Type | GA | Public preview | Experimental
|-|-|-|-|-|-|
| az network dns zone list | All | Core | yes |
| az network dns zone create | --name, --resource-group, --if-none-match, --parent-name | Core | yes |
|  | --newFutureParameter1 | Core | | yes
|  | --newFutureParameter2 | Core | | | yes
| az network vhub list | All |Extension | yes
| az network vhub create | --address-prefix, --name, --resource-group, -vwan, --location, --sku |Extension | yes
|  | --newFutureParameter1 |Extension | | yes
|  | --newFutureParameter2|Extension | | | yes
| az network firewall create | All | Extension | | | yes

> [!NOTE]
> Warnings indicating **public preview** or **experimental** are part of the Azure CLI command output and should be expected.

## See also

- [Core reference list for the Azure CLI](/cli/azure/reference-index)
- [Available extensions for the Azure CLI](azure-cli-extensions-list.md)
