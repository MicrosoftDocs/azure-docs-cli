---
title: Reference types, status and support levels – Azure CLI | Microsoft Docs
description: Learn about the Azure CLI reference types, statuses and support levels
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 06/19/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, reference types, reference status
---

# Overview: Azure CLI terminology and support levels

This article explains Azure CLI terminologies.  There are syntax components, reference types, and statuses.  it's the status that determines the support level.

## Azure CLI syntax components

The Azure CLI syntax is a combination of groups, references, commands, and parameters. Often the **full reference command** is referred to as **command**.

| Azure Service | Reference group | Reference subgroup(s) | Command | Full reference command | Parameter Examples
|-|-|-|-|-|-|
| Azure CLI | [az config](../latest/docs-ref-autogen/config.yml) | | | az config | --local, --output -o
| Azure Network | [az network](../latest/docs-ref-autogen/network.yml) | application-gateway | create | [az network application-gateway create](/cli/azure/network/application-gateway#az-network-application-gateway-create) | --name, --resource-group, --capacity
| Azure DevOps Server | [az pipelines](../latest/docs-ref-autogen/pipelines.yml) | agent | list | [az pipelines agent list](../latest/docs-ref-autogen/pipelines/agent.yml) | --pool-id, --agent-name, --demands

A **reference subgroup** can have multiple levels such as `az network application-gateway private-link ip-config add`

| Reference Group | Subgroup 1 | Subgroup 2 | Subgroup 3| Command|
|-|-|-|-|-|
|network|application-gateway|private-link|ip-config|add

See [Reference list A to Z](../latest/docs-ref-autogen/reference-index.yml) for a complete list of reference commands.

## What is reference type?

Azure CLI commands are either part of the **core** Azure CLI service, or they are an **extension**.  Extensions are optional add-ons.  The reference type determines the release schedule, status and installation method as described here:

|                |                           Core                           |                       Extension                        |
| -------------- | -------------------------------------------------------- | ------------------------------------------------------ |
| **References** | Are part of the primary Azure CLI service                | Are optional reference commands that must be installed |
| **Install**    | Jointly with the [MSI installer]()                       | Individually with [az extension add]()                 |
| **Released**   | On a schedule                                            | As new features or updates become available            |
| **Status**     | Can be GA (Generally Available), preview or experimental | Also can be GA, preview or experimental                |

To get a list of command groups run `az`.  For a list of extensions, use [az extension list-available --output table](/cli/azure/extension#az-extension-list-available) commands.

```azurecli-interactive
# Get list of all command groups
az

# Get list of extensions
az extension list-available --output table
```

### Core

Azure CLI references that have been published as a permanent part of the CLI are called **core references**. All core references install with the Azure CLI and you cannot choose a subset of references. If you run the CLI through Azure Cloud Shell, core references are always up to date. 

### Extension

Extensions aren't shipped as part of the CLI but run as CLI commands. Some extensions are a permanent part of the Azure CLI, but often, an extension will give you access to private preview and experimental commands. A single reference group, such as **az iot hub**, can have both core and extension commands.  Here are two examples:

|      Full reference command       | Is Core | Is Extension |
| --------------------------------- | ------- | ------------ |
| az iot hub list                   | yes     |              |
| az iot hub job list               |         | yes          |

You will be prompted to install an extension upon first use.  You can also install an extension by running the [az extension add](/cli/azure/extension#az-extension-add) command.

You can learn more about extension references including installation and updating in [Use extensions with the Azure CLI](azure-cli-extensions-overview.md).  See [Available extensions for the Azure CLI](azure-cli-extensions-list.md) for a complete list of extension reference commands.

## What is reference status?

Regardless of reference type, Azure CLI references fall into three status categories: **GA** (Generally Available), **public preview** or **experimental**. it's the reference command status, not type, that determines stability and support level.

| | GA  | Public preview | Experimental
|-|-|-|-|
| **Stability** | Permanent | Can change in response to customer feedback. Is subject to the terms of [Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/). | Can change in response to customer feedback. Will often migrate to public preview.  Can be removed.
| **Support level** | Full | Partial | None

> [!NOTE]
> Warnings indicating **public preview** or **experimental** are part of the Azure CLI command output and should be expected.

Although most commands and parameters for a single reference have a single status, this is not always the case. A GA reference that is being built out to offer more commands can have GA, preview, and experimental reference commands. As new parameters are added to increase functionality, a single command can also have parameters that fall under different status categories. Here are example references that have different statuses:

|   Full reference command   |                              Parameters                              |   Type    | GA  | Public preview | Experimental |
| -------------------------- | -------------------------------------------------------------------- | --------- | --- | -------------- | ------------ |
| az network dns zone list   | All                                                                  | Core      | yes |                |              |
| az network dns zone create | --name, --resource-group, --if-none-match, --parent-name             | Core      | yes |                |              |
|                            | --newFutureParameter1                                                | Core      |     | yes            |              |
|                            | --newFutureParameter2                                                | Core      |     |                | yes          |
| az network vhub list       | All                                                                  | Extension | yes |                |              |
| az network vhub create     | --address-prefix, --name, --resource-group, -vwan, --location, --sku | Extension | yes |                |              |
|                            | --newFutureParameter1                                                | Extension |     | yes            |              |
|                            | --newFutureParameter2                                                | Extension |     |                | yes          |
| az network firewall create | All                                                                  | Extension |     |                | yes          |

The above table is only an example and **isn't** representative of current reference status for examples.

## See also

- [Azure CLI A - Z reference list](../latest/docs-ref-autogen/reference-index.yml)
- [Available extensions for the Azure CLI](azure-cli-extensions-list.md)