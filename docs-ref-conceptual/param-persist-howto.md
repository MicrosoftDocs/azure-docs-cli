---
title: Azure CLI parameter persistence options
description: How-to use Azure CLI parameter persistence to store reusable parameter values
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.prod: azure
ms.date: 10/30/2020
ms.topic: conceptual
ms.devlang: azurecli
ms.technology: azure-cli
ms.custom: devex-track-azurecli
---

# Azure CLI parameter persistence

The Azure CLI [az config param-persist](/cli/azure/param-persist) reference provides the ability to retain local persisted parameter values for Azure CLI commands.  This removes the need to continually retype common parameters. For example, location and resource-group are required parameters in many CLI commands, but they don’t contribute to the _intent_ of the command.  When you store parameter values with parameter persistence, you reduce redundancy and can significantly shorten CLI command syntax.

Configuration values used by the CLI are evaluated in the following precedence, with items higher on the list taking priority.

1. Command-line parameters
1. Values in the local working directory set by **az config param-persist**
1. Environment variables
1. Values in the configuration file or set with **az config**

[Install the Azure CLI](install-azure-cli.md) or open [Azure Cloud Shell](https://shell.azure.com) to run the scripts in this article.

## Parameter persistence data file

Parameter persistence data is kept in a file named **.param_persist** which is stored in your working directory.  If you are using [Azure Cloud Shell](https://shell.azure.com) to execute Azure CLI commands, your working directory is in the storage account being used by the Azure CLI.  If you are using a [local install](/install-azure-cli) of the Azure CLI, your working directory is on your local machine.  In either case, the parameter persistence file is a hidden file and should not be manually updated.

## Parameter persistence parameters

The following Azure CLI parameters are supported by parameter persistence.  The **resource_group_name** and **location** parameters are stored differently in that you can add them to parameter persistence _without_ executing a create command.

| parameter persistence parameter | Storage action | Supported by
|-|-|-|
| location | Execute any command | All Azure CLI references
| resource_group_name | Execute any command | All Azure CLI references
| vnet_name | Execute a create command | Azure Web Apps only
| storage_account_name | Execute a create command |  Azure Web Apps only
| webapp_name | Execute a create command | Azure Web Apps only
| function_app_name | Execute a create command | Azure Functions only

## Sample script without parameter persistence

Without parameter persistence, sequential CLI commands must repeat the same parameter values.  In this example, the **location**, **resource group name** or **storage account name** are repeated in subsequent commands.

```azurecli
# Reminder: function app and storage account names must be unique.

# turn parameter persistence off for demonstration purposes
az config param-persist off

# Create a resource group.
az group create --name RGlocalContext --location westeurope

# Create an Azure storage account in the resource group.
az storage account create \
  --name sa1localcontext \
  --location westeurope \
  --resource-group RGlocalContext \
  --sku Standard_LRS

# Create a serverless function app in the resource group.
az functionapp create \
  --name FAlocalContext \
  --storage-account sa1localcontext \
  --consumption-plan-location westeurope \
  --resource-group RGlocalContext \
  --functions-version 2
```

## Sample script with parameter persistence

With parameter persistence enabled, stored parameter values can be omitted from sequential commands.

```azurecli
# Reminder: function app and storage account names must be unique.

# turn parameter persistence on
az config param-persist on

# Create a resource group which will store group and location in parameter persistence
az group create --name RGlocalContext --location westeurope

# Create an Azure storage account omitting location and resource group
az storage account create \
  --name sa1localcontext \
  --sku Standard_LRS

# Create a serverless function app in the resource group omitting storage account and resource group
az functionapp create \
  --name FAlocalContext \
  --consumption-plan-location westeurope \
  --functions-version 2

# See the stored parameter values
az config param-persist show
```

## Compare parameter persistence and global variables

There are two Azure CLI commands that can be used to default parameter values: **az config** and **az config param-persist**.  Use the **az config** command to specify _global variables_ such as group, location, or web.  Use **az param-persist** to specify _local default values_ unique to your workload.  In both cases, the stored values are used by the CLI in place of required arguments.

> [!Important]
> Parameter persistence overrides global context values.
>

| Reference | Scope | Set | Use
|-|-|-|-|
[az config](//cli/azure/config) | Scoped globally across the CLI | Set explicitly using **az config set** | Use for settings such as logging, data collection, and default argument values
[az config param-persist](/cli/azure/config/param-persist) | Scoped locally to a specific working directory | Set automatically once parameter persistence is turned on | Use for individual workload sequential commands.

### Command examples

Use **az config** to set a global variable used in the creation of an Azure storage account.

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

Use **az config param-persist** to set parameter persistence used in the creation of an Azure storage account.  If a global variable is set for the same object, parameter persistence will override the global variable.

```azurecli
# turn parameter persistence on
az config param-persist on

# Create a resource group in order to write to parameter persistence
az group create --name myParamPersistRG --location westeurope

# Create an Azure storage account omitting the resource group relying on the parameter persistence value
# Substitute the storage account name parameter with a unique value
az storage account create \
  --name mystorageaccount2 \
  --location westeurope \
  --sku Standard_LRS
```

Even with a global variable set for resource group with a value of `myGlobalVariableRG`, with parameter persistence turned on, the new storage account was created with `myParamPersistRG`.

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

* [Azure CLI Configuration using az config](azure-cli-configuration.md)
* [Tutorial: Use persisted parameters with sequential Azure CLI commands](param-persist-tutorial.md)
