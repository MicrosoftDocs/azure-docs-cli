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

The Azure CLI [az local-context](/cli/azure/local-context) reference provides the ability to retain local persisted parameter values for Azure CLI commands.  This removes the need to continually retype common parameters. For example, location and resource-group are required parameters in many CLI commands, but they don’t contribute to the _intent_ of the command.  When you store parameter values with local context, you reduce redundancy and can significantly shorten CLI command syntax.

Configuration values used by the CLI are evaluated in the following precedence, with items higher on the list taking priority.

1. Command-line parameters
1. Values in the local working directory set by `az local-context`
1. Environment variables
1. Values in the configuration file or set with `az configure`

## Local context data file

Local context data is kept in a file named `.local_context` which is stored in your working directory.  If you are using [Azure Cloud Shell](https://shell.azure.com) to execute Azure CLI commands, your working directory is in the storage account being used by the Azure CLI.  If you are using a [local install](/install-azure-cli) of the Azure CLI, your working directory is on your local machine.  In either case, the local context file is a hidden file and should not be manually updated.

## Local context parameters

The following Azure CLI parameters are supported by local context.  The `resource_group_name` and `location` parameters are stored differently in that you can add them to local context _without_ executing a create command.

| Local context parameter | Storage action | Supported by
|-|-|-|
| location | Execute any command | All Azure CLI references
| resource_group_name | Execute any command | All Azure CLI references
| vnet_name | Execute a create command | Azure Web Apps only
| storage_account_name | Execute a create command |  Azure Web Apps only
| webapp_name | Execute a create command | Azure Web Apps only
| function_app_name | Execute a create command | Azure Functions only

## Sample script without local context

Without local context, sequential CLI commands must repeat the same parameter values.  In this example, the `location`, `resource group name` or `storage account name` are repeated in subsequent commands.

```azurecli
# Reminder: function app and storage account names must be unique.

# turn local context off for demonstration purposes
az local-context off

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

## Sample script with local context

With local context enabled, stored parameter values can be omitted from sequential commands.

```azurecli
# Reminder: function app and storage account names must be unique.

# turn local context on
az local-context on

# Create a resource group which will store group and location in local context
az group create --name RGlocalContext --location westeurope

# Create an Azure storage account omitting location and resource group
az storage account create \
  --name SAlocalContext \
  --sku Standard_LRS

# Create a serverless function app in the resource group omitting storage account and resource group
az functionapp create \
  --name FAlocalContext \
  --consumption-plan-location westeurope \
  --functions-version 2

# See the stored local context values
az local-context show
```

## Compare local context with az configure

There are two Azure CLI commands that can be used to default parameter values: `az configure` and `az local-context`.  Use the `az configure` command to specify **global variables** such as group, location, or web.  Use `az local context` to specify **local default values** unique to your workload.  In both cases, the stored values are used by the CLI in place of required arguments.

> [!Important]
> Local context overrides global context values.
>

| Reference | Scope | Set | Use
|-|-|-|-|
[az configure](/cli/azure/reference-index#az-configure) | Scoped globally across the CLI | Set explicitly using `az configure` | Use for settings such as logging, data collection, and default argument values
[az local-context](/cli/azure/local-context) | Scoped locally to a specific working directory | Set automatically once local context is turned on | Use for individual workload sequential commands.

### Command examples

Use `az configure` to set a global variable used in the creation of an Azure storage account.

```azurecli
# set the global variable for resource group
az configure --defaults group=myGlobalVariableRG

# Create an Azure storage account omitting the resource group relying on the global variable value
az storage account create \
  --name myStorageAccount \
  --location westeurope \
  --sku Standard_LRS
```

You can see that a new storage account was created in the resource group found in the global variable.

```output
  },
  "primaryLocation": "westeurope",
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "resourceGroup": "myGlobalVariableRG",
  "routingPreference": null,
  "secondaryEndpoints": null,
  "secondaryLocation": null,
  "sku": {
    "name": "Standard_LRS",
    "tier": "Standard"
  },
```

Use `az local-context` to set local context used in the creation of an Azure storage account.  If a global variable is set for the same object, local context will override the global variable.

```azurecli
# turn local context on
az local-context on

# Create a resource group in order to write to local context
az group create --name myLocalContextRG --location westeurope

# Create an Azure storage account omitting the resource group relying on the local context value
az storage account create \
  --name myStorageAccount \
  --location westeurope \
  --sku Standard_LRS
```

Even with a global variable set for resource group with a value of `myGlobalVariableRG`, with local context turned on, the new storage account was created with `myLocalContextRG`.

```output
  },
  "primaryLocation": "westeurope",
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "resourceGroup": "myLocalContextRG",
  "routingPreference": null,
  "secondaryEndpoints": null,
  "secondaryLocation": null,
  "sku": {
    "name": "Standard_LRS",
    "tier": "Standard"
  },
```

## See also

* [Azure CLI Configuration using az configure](azure-cli-configuration.md)
* [Tutorial: Use local context with the Azure CLI](azure-cli-local-context-tutorial.md)
