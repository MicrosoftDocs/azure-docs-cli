---
title: Azure CLI reference types
description: An explanation of reference types and status
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 08/14/2020
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli 
ms.custom: devx-track-azurecli
---

# Overview: Azure CLI reference types and status

The Azure CLI has different reference types which are sometimes used interchangeably with reference status.  This article explains the difference between an Azure CLI **type** and a **status**, and provides information for working with both.

## Reference types

A reference type tells you if the reference command is part of the primary Azure CLI service, or if it is an optional add-on.  There are two types of Azure CLI references: **core** and **extension**.

|         | Core  | Extension
|-|-|-|
| **References** | Are part of the primary Azure CLI service | Must be installed as needed
| **Install** | With the [MSI installer]() | With [az extension add]()|
| **Released** | On a schedule | As new features or updates become available

All Azure CLI references can be run in Windows, macOS, Linux, Docker and Azure Cloud Shell.

> [!NOTE]
> A reference can have both core and extension commands or parameters.  Therefore, the support level of a reference varies with the [status](#reference-status) of the command or parameter.

### Core

Azure CLI references that have been published as a permanent part of the CLI are called **core references**.  All core references install with the Azure CLI and you cannot choose a subset of references.  If you run the CLI through Azure Cloud Shell, core references are always up to date.  See [Core reference overview](/cli/azure/reference-index) for a complete list.

### Extension

Extensions aren't shipped as part of the CLI but run as CLI commands.  Some extensions are a permanent part of the CLI, but you With extensions, you also gain access to experimental and pre-release commands.  An extension reference must be installed prior to use.  You can learn more about extension references including installation and updating in [Use extensions with the Azure CLI](azure-cli-extensions-overview.md).  Review the extension [wiki tips](https://github.com/Azure/azure-network-cli-extension/wiki/Tips) to maximize usage.  See [Available extensions for the Azure CLI](azure-cli-extensions-list.md) for a complete list.

## Reference status

Regardless of type, Azure CLI references fall into three status categories: **GA** (Generally Available), **public preview** or **experimental**.  

| | GA  | Public preview | Experimental
|-|-|-|-|
| **Stability** | Permanent | Subject to the terms of [Microsoft Azure Previews](/support/legal/preview-supplemental-terms/) | can be removed
| **Support level** | full | partial | none
| **Released** | On a schedule | As new features or updates become available | As new features or updates become available

Warnings indicating **public preview** or **experimental** are part of the Azure CLI command output and should be expected.

> [!NOTE]
> Although most commands and parameters for a single reference have a single status, this is not always the case.  A GA reference that is being built out to offer more commands can have GA, preview and experimental commands.  Usually in response to public feedback and as new parameters are added to increase functionality, a single command can also have parameters that fall under different status categories.
