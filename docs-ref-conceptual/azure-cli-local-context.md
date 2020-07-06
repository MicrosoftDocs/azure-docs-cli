---
title: Azure CLI local context options
description: How to use Azure CLI local context to store reusable parameter values
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.prod: azure
ms.date: 06/30/2020
ms.topic: conceptual
ms.devlang: azurecli
ms.technology: azure-cli
---

# Azure CLI local context

Azure CLI [az local-context](/cli/azure/local-contex) provides local persisted parameter values for Azure CLI commands.  The purpose of local context is to remove the need to continually retype common parameters. For example, location and resource-group are required parameters in many CLI commands, but they don’t contribute to the _intent_ of the command.  By storing parameter values with local context, you reduce redundancy and can significantly shorten CLI command syntax.

## Local context data file

The local context file name is `.local_context` and is stored in your working directory.  If you are using [Azure Cloud Shell](https://shell.azure.com) to execute Azure CLI commands, your working directory is in the storage account being used by the Azure CLI.  If you are using a [local install](/install-azure-cli) of the Azure CLI, your working directory is on your local machine.  In either case, the local context file is a hidden file and should not be manually updated.

## Local context parameters

The following Azure CLI parameters are supported by local context.  The `resource_group_name` and `location` parameters are stored differently in that you can add them to local context _without_ executing a create command.

| Local context parameter | Storage action
|-|-|
| location | Execute any command
| resource_group_name | Execute any command
| vnet_name | Execute a create command
| storage_account_name | Execute a create command
| webapp_name | Execute a create command
| function_app_name | Execute a create command

## Local context example

Without local context, sequential CLI commands must repeatedly specify the same parameter values.  In this example, the `location`, `resource group name` or `storage account name` are repeated in each command

### Sample script without local context

```azurecli

# Reminder: function app and storage account names must be unique.

# Create a resource group.
az group create --name RGlocalContext --location westeurope

# Create an Azure storage account in the resource group.
az storage account create \
  --name SAlocalContext \
  --location westeurope \
  --resource-group RGlocalContext \
  --sku Standard_LRS

# Create a serverless function app in the resource group.
az functionapp create \
  --name FAlocalContext \
  --storage-account SAlocalContext \
  --consumption-plan-location westeurope \
  --resource-group RGlocalContext \
  --functions-version 2

```

With local context enabled, stored parameter values can be omitted from subsequent commands.  Local context reduces the number of potential errors and ultimately leads to improving your in-tool experience.

### Sample script with local context

```azurecli

# Reminder: function app and storage account names must be unique.

# turn local context on
az local-context on

# Create a resource group.
az group create --name RGlocalContext --location westeurope

# Create an Azure storage account in the resource group omitting location and resource group name
az storage account create \
  --name SAlocalContext \
  --sku Standard_LRS

# Create a serverless function app in the resource group omitting storage account and resouce group names
az functionapp create \
  --name FAlocalContext \
  --consumption-plan-location westeurope \
  --functions-version 2

# See the stored local context values
az local-context show
```

## Compare local context with az configure

write something here

## Next steps

- [Tutorial: Use local context with the Azure CLI](azure-cli-local-context-tutorial.md)
