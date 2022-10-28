---
title: Persisted parameter options – Azure CLI | Microsoft Docs
description: Learn how to use the Azure Command-Line Interface (CLI) persisted parameters to store reusable local persisted parameter values for Azure CLI commands.
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.service: azure-cli
ms.date: 08/19/2021
ms.topic: conceptual
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure persisted parameters, persisted parameters
---

# Azure CLI persisted parameter

The Azure CLI [az config param-persist](../latest/docs-ref-autogen/config/param-persist.yml) reference provides the ability to retain local persisted parameter values for Azure CLI commands.  This removes the need to continually retype common parameters. For example, location and resource-group are required parameters in many CLI commands, but they don't contribute to the _intent_ of the command.  When you store parameter values with persisted parameter, you reduce redundancy and can significantly shorten CLI command syntax.

Configuration values used by the CLI are evaluated in the following precedence, with items higher on the list taking priority.

1. Command-line parameters
1. Values in the local working directory set by `az config param-persist`
1. Environment variables
1. Values in the configuration file or set with `az config`

[Install the Azure CLI](install-azure-cli.md) or open [Azure Cloud Shell](https://shell.azure.com) to run the scripts in this article.  If you are using a local install of the Azure CLI, version 2.12.0 or later is needed to run `az config param-persist` commands.  Run [az version](/cli/azure/reference-index#az_version) to find the version and dependent libraries that are installed. To upgrade to the latest version, run [az upgrade](/cli/azure/reference-index#az_upgrade).  Azure Cloud Shell always has the latest version of the Azure CLI.

## Persisted parameter data file

Persisted parameter values are kept in a file named `.param_persist` which is stored in your working directory.  If you are using [Azure Cloud Shell](https://shell.azure.com) to execute Azure CLI commands, your working directory is in the storage account being used by the Azure CLI.  If you are using a [local install](install-azure-cli.md) of the Azure CLI, your working directory is on your local machine.  In either location, the `.param_persist` file is hidden and should not be manually updated.

## Persisted parameter storage and support

The following Azure CLI parameters are supported by persisted parameter.  The `resource_group_name` and `location` parameters are stored differently in that you can add them to persisted parameter _without_ executing a create command.

| Persisted parameter | Storage action | Supported by
|-|-|-|
| location | Execute any command | All Azure CLI references
| resource_group_name | Execute any command | All Azure CLI references
| vnet_name | Execute a create command | Azure Web Apps only
| storage_account_name | Execute a create command |  Azure Web Apps only
| webapp_name | Execute a create command | Azure Web Apps only
| function_app_name | Execute a create command | Azure Functions only

## Sample script using persisted parameters

Without persisted parameters, sequential CLI commands must repeat the same parameter values.  With persisted parameters enabled, your stored parameter values can be omitted from sequential commands.  In this example, the `location`, `resource group name` or `storage account name` are repeated in subsequent commands.

```azurecli
# Reminder: function app and storage account names must be unique.

# turn persisted parameters on
az config param-persist on

# Create a resource group which will store "resource group" and "location" in persisted parameter.
az group create --name RGlocalContext --location westeurope

# Create an Azure storage account omitting location and resource group.
az storage account create \
  --name sa1localcontext \
  --sku Standard_LRS

# Create a serverless function app in the resource group omitting storage account and resource group.
az functionapp create \
  --name FAlocalContext \
  --consumption-plan-location westeurope \
  --functions-version 2

# See the stored parameter values
az config param-persist show
```

## Persisted parameter and global variable comparison

There are two Azure CLI commands that can be used to default parameter values: `az config set defaults` and `az config param-persist`.  Use the `az config set defaults.<option>=<value>` command to specify _global variables_ such as group, location, or web. Use `az param-persist` to specify _local default values_ unique to your workload.  Stored values are used by the CLI in place of required arguments.

> [!Important]
> Persisted parameters override global context values.
>

| Reference | Scope | Set | Use
|-|-|-|-|
[`az config set defaults.<option>=<value>`](../latest/docs-ref-autogen/config.yml) | Scoped globally across the CLI | Set explicitly using `az config set defaults.<option>=<value>` | Use for settings such as logging, data collection, and default argument values
[`az config param-persist`](../latest/docs-ref-autogen/config/param-persist.yml) | Scoped locally to a specific working directory | Set automatically once persisted parameters are turned on | Use for individual workload sequential commands.

### Command examples

Use `az config param-persist` to set a global variable used in the creation of an Azure storage account.

```azurecli
# set the global variable for resource group
az config set defaults.group=myGlobalVariableRG

# Create an Azure storage account omitting the resource group relying on the global variable value
# Substitute the storage account name parameter with a unique value
az storage account create \
  --name mystorageaccount1 \
  --location westeurope \
  --sku Standard_LRS
```

CLI command output shows that a new storage account was created in the resource group found in the global variable, `myGlobalVariableRG'.

```output
...
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
...
```

Use `az config param-persist` to set persisted parameters used in the creation of an Azure storage account.  If a global variable is set for the same object, the persisted parameter will override the global variable.

```azurecli
# turn persisted parameter on
az config param-persist on

# Create a resource group in order to write to persisted parameter
az group create --name myParamPersistRG --location westeurope

# Create an Azure storage account omitting the resource group relying on the persisted parameter value
# Substitute the storage account name parameter with a unique value
az storage account create \
  --name mystorageaccount2 \
  --location westeurope \
  --sku Standard_LRS
```

Even with a global variable set for resource group with a value of `myGlobalVariableRG`, with persisted parameters turned on, the new storage account was created with `myParamPersistRG`.

```output
...
},
  "primaryLocation": "westeurope",
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "resourceGroup": "myParamPersistRG",
  "routingPreference": null,
  "secondaryEndpoints": null,
  "secondaryLocation": null,
  "sku": {
    "name": "Standard_LRS",
    "tier": "Standard"
},
...
```

## See also

* [Tutorial: Use persisted parameter with sequential Azure CLI commands](param-persist-tutorial.md)
* [Azure CLI Configuration using `az config`](azure-cli-configuration.md)