---
title: Azure CLI references for Azure Data Share | Microsoft Docs
description: Find Azure CLI core and extension reference commands to manage Azure Data Share. With 65 different commands available, you can work effectively with Data Share from a command line.
services: data-share
author: dbradish-microsoft
manager: barbkess
ms.service: data-share
ms.devlang: azurecli
ms.topic: reference
ms.date: 09/21/2021
ms.author: dbradish
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, azure data share cli
---

# Azure CLI reference commands for Azure Data Share

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources for many Azure services. For Azure Data Share, over 65 different commands are available, which give you the ability to work effectively with the service from a command-line.

All Azure CLI commands for [Azure Data Share](/azure/data-share/) are currently in an extension to the Azure CLI core. The datashare extension gives you access to experimental and pre-release commands and is automatically installed the first time you run an `az datashare` command. For more information about Azure CLI extensions, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).

## Reference list

List of Azure Data Share CLI references that can be used to manage Azure Data Share, and descriptions of each type of reference:

|Azure CLI Reference |Description
|-|-|
| [az datashare](../latest/docs-ref-autogen/datashare.yml) | All commands to manage Azure Data Share.
| [az datashare account](../latest/docs-ref-autogen/datashare/account.yml) | Commands to manage Azure Data Share accounts.
| [az datashare consumer](/cli/azure/datashare/consumer) | Commands for consumers to manage Azure Data Share.
| [az datashare dataset](/cli/azure/datashare/dataset) | Commands for providers to manage Azure Data Share datasets.
| [az datashare invitation](../latest/docs-ref-autogen/datashare/invitation.yml) | Commands for consumers to manage Azure Data Share invitations.
| [az datashare provider-share-subscription](../latest/docs-ref-autogen/datashare/provider-share-subscription.yml) | Commands for providers to manage Azure Data Share subscriptions.
| [az datashare synchronization](../latest/docs-ref-autogen/datashare.yml) | Commands to manage Azure Data Share synchronization.
| [az datashare synchronization-setting](../latest/docs-ref-autogen/datashare/synchronization-setting.yml) | Commands for providers to manage Azure Data Share synchronization settings.

## Reference examples

Examples are provided with every Azure CLI reference. Although you can also complete these tasks through the Azure portal, using the Azure CLI requires a command line. Here are a few code blocks to give you an idea of how easy it is to use the Azure CLI.

To work with Azure Data Share, you first need a resource group. Azure resource groups are simple to create and manage with the Azure CLI.  

```azurecli
#create a resource group
az group create --location westus --name MyResourceGroup
```

```azurecli
#get a list of resource groups for a subscription
az group list --subscription MySubscription --output table
```

It's also easy to create a data share account.

```azurecli
#create a data share account
az datashare account create --location westus --tags tag1=Red tag2=White --name MyAccount --resource-group MyResourceGroup
```

## See also

* [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.
* Discover additional [reference commands](../latest/docs-ref-autogen/reference-index.yml) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)