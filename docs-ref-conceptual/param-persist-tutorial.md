---
title: Tutorial - how to use persisted parameters with the Azure CLI | Microsoft Docs
description: Learn how to use az config param-persist and persisted parameters with the Azure CLI to store parameter values for repeated use and execute sequential commands.
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.service: azure-cli
ms.date: 09/16/2021
ms.topic: tutorial
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: persisted parameter tutorial
---

# Tutorial: Use persisted parameters to simplify sequential Azure CLI commands

Azure CLI offers persisted parameters that enable you to store parameter values for continued use.  In this tutorial, you learn how to work with persisted values, and use these local values to efficiently execute sequential commands.

In this tutorial, you will learn to:

> [!div class="checklist"]
> * Use `az config param-persist` reference commands
> * Execute sequential commands using persisted parameters

This tutorial uses the following Azure CLI commands

- [az config param-persist delete](/cli/azure/config/param-persist#az_config_param_persist_delete)
- [az config param-persist off](/cli/azure/config/param-persist#az_config_param_persist_off)
- [az config param-persist on](/cli/azure/config/param-persist#az_config_param_persist_on)
- [az config param-persist show](/cli/azure/config/param-persist#az_config_param_persist_show)
- [az function app create](/cli/azure/functionapp#az_functionapp_create)
- [az group create](/cli/azure/group#az_group_create)
- [az storage account create](/cli/azure/storage/account#az_storage_account_create)


If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.

## Prerequisites

1. [Install the Azure CLI](install-azure-cli.md)

   If you prefer, you can also use Azure Cloud Shell to complete the steps in this tutorial.  Azure Cloud Shell is an interactive shell environment that you use through your browser.  Start Cloud Shell by using one of these methods:

   - Open Cloud Shell by going to [https://shell.azure.com](https://shell.azure.com)

   - Select the **Cloud Shell** button on the menu bar at the upper right corner in the [Azure portal](https://portal.azure.com)

1. If you are using a local install of the Azure CLI, complete the following:
   - Sign in using the [az login](/cli/azure/reference-index#az_login) command, then follow the steps displayed in your terminal to complete the authentication process.

     ```azurecli
     az login
     ```
    - This tutorial requires version 2.12.0 or later of the Azure CLI.  Run [az version](/cli/azure/reference-index#az_version) to find the version and dependent libraries that are installed. To upgrade to the latest version, run [az upgrade](/cli/azure/reference-index#az_upgrade).

## 1. Determine your local directory

Persisted parameter values are stored in the working directory of the Azure storage account used by Azure Cloud Shell.  If you are using a local install of the Azure CLI, values are stored in the working directory on your machine.

To find, create or change the working directory being used by the Azure CLI, use these familiar CLI commands.

```azurecli
# List directories
dir

# Make directory
mkdir azCLI

# Change directory
cd azCLI
```

## 2. Turn on Persisted parameters

[Persisted parameters](../latest/docs-ref-autogen/config/param-persist.yml) must be turned on before parameter values can be stored.  You will receive a warning until `az config param-persist` moves out of the experimental stage.  See [Overview: Azure CLI reference types and status](./reference-types-and-status.md) to learn about the Azure CLI reference types, status, and support levels.

```azurecli
az config param-persist on
```

## 3. Create persisted parameters

To store values for persisted parameters, execute an Azure CLI command of your choice that contains the parameters you want to store.  For example, create a resource group and the `--location` and `--name` parameters are stored for future use.

1. Store the location and resource group name.
   ```azurecli
   # With persisted parameters turned on, create a resource group
   az group create --name RG1forTutorial --location eastus2

   # See new persisted parameters
   az config param-persist show
   ```

   ```output
   {
     "all": {
       "location": "eastus2",
       "resource_group_name": "RG1forTutorial"
     }
   }
   ```

1. Using the new persisted parameters, create a storage account.

   ```azurecli
   # Create a storage account
   az storage account create --name sa1fortutorial

   # See that storage_account_name has been added to persisted parameters
   az config param-persist show
   ```

   ```output
   {
     "all": {
       "location": "eastus2",
       "resource_group_name": "RG1forTutorial",
       "storage_account_name": "sa1fortutorial"
     }
   }
   ```

1. Create a persisted parameter without creating a new resource.

   If you do not want to create a new Azure resource, `resource_group_name` and `location` parameters can be stored by using non-create commands like `show` or `list`.   See [Azure CLI persisted parameters](./param-persist-howto.md) for a full list of supported parameters,   and the action needed to retain values.  This example also removes all parameter values by using the [az config param-persist delete](/cli/azure/config/param-persist#az_param_persist_delete) command.

   ```azurecli
   # Clear all persisted parameters for demonstration.
   az config param-persist delete --all

   # List all storage accounts which will create the `resource_group_name` stored parameter value.
   az storage account show --resource-group RG1forTutorial --name sa1fortutorial

   # See the new stored value created for resource group.  The storage account name is only stored with a 'create' command.
   az config param-persist show
   ```

   ```output
   {
     "all": {
       "resource_group_name": "RG1forTutorial"
     }
   }
   ```

## 4. Replace persisted parameters

Replacing a stored parameter value is as simple as executing a command containing a different value.

1. Create new persisted parameters.
   ```azurecli
   # Clear all persisted parameters for demonstration
   az config param-persist delete --all

   # Create a storage account placing "location", "resource_group_name", and "storage_account_name" into persisted parameters
   az storage account create --name sa1fortutorial --resource-group RG1forTutorial --location eastus2

   # See persisted parameters entries
   az config param-persist show
   ```

   ```output
   {
     "all": {
       "location": "eastus2",
       "resource_group_name": "RG1forTutorial",
       "storage_account_name": "sa1fortutorial"
     }
   }
   ```

1. Replace the newly stored values.

   ```azurecli
   # Create a second storage account while changing both the "storage_account_name" and "location" persisted parameters
   az storage account create --name sa2fortutorial --location westeurope

   # See new persisted parameters
   az config param-persist show
   ```

   ```output
   {
     "all": {
       "location": "westeurope",
       "resource_group_name": "RG1forTutorial",
       "storage_account_name": "sa2fortutorial"
     }
   }
   ```

   > [!NOTE]
   >
   > Even if persisted parameters are turned on, you don't have to use them.  You can still
   > execute commands with all parameter values specified.  However, be aware that with persisted parameters
   > turned on, _you will be creating new persisted parameters, or overwriting existing ones._

## 5. Execute sequential commands

These scripts create an Azure Function app using the Consumption plan.

### [Using persisted parameters](#tab/azure-cli)

```azurecli
# Reminder: function app and storage account names must be unique.

# Turn persisted parameters on.
az config param-persist on

# Create a resource group.
az group create --name RG2forTutorial --location westeurope

# Create an Azure storage account in the resource group omitting "--location" and "--resource-group" parameters.
az storage account create \
  --name sa3fortutorial \
  --sku Standard_LRS

# Create a serverless function app in the resource group omitting "--storage-account" and "--resource-group" parameters.
az functionapp create \
  --name FAforTutorial \
  --consumption-plan-location westeurope \
  --functions-version 2

# See the stored parameter values.
az config param-persist show
```

### [Without persisted parameters](#tab/azure-portal)

```azurecli
# Reminder: function app and storage account names must be unique.

# turn persisted parameters off
az config param-persist off

# Create a resource group.
az group create --name RG2forTutorial --location westeurope

# Create an Azure storage account in the resource group.
az storage account create \
  --name sa3fortutorial \
  --location westeurope \
  --resource-group RG2forTutorial \
  --sku Standard_LRS

# Create a serverless function app in the resource group.
az functionapp create \
  --name FAforTutorial \
  --storage-account sa3fortutorial \
  --consumption-plan-location westeurope \
  --resource-group RG2forTutorial \
  --functions-version 2
```

* * *

## 6. Delete persisted parameters

Use the [az config param-persist delete](/cli/azure/param-persist#az_param_persist_delete) command to remove entries.

```azurecli
# Remove a single persisted parameters entry by specifying the name, not the value
az config param-persist delete resource_group_name

# Remove all persisted parameters entries and do not prompt for confirmation
az config param-persist delete --all --yes
```

> [!IMPORTANT]
>
> Persisted parameters do not get updated when an Azure resource is deleted.
>
> ```azurecli
> # delete a resource group
> az group delete --name RG1forTutorial
>
> # verify that the resource group no longer exists
> az group list --output table
>
> # See that the resource group name remains in persisted parameters
> az config param-persist show
> ```

## 7. Turn persisted parameters off

You can turn persisted parameters off by using the [az config param-persist off](/cli/azure/param-persist#az_param_persist_off) command, but your saved persisted parameters data won't be deleted.

```azurecli
# Turn persisted parameters off
az config param-persist off

# See that your persisted parameters still exist
az config param-persist show

# Try to create a new resource relying on persisted parameters and receive error "...the following arguments are required:..."
az storage account create --name SA4inAzCLI --sku Standard_LRS
```

## 8. Clean up resources

When no longer needed, use the [az group delete](../latest/docs-ref-autogen/group.yml) command to remove the resource group, and all related resources.

```azurecli
az group delete --name RG1forTutorial
```

## See also

- [(How to work with Azure CLI persisted parameters](param-persist-howto.md)
- [Azure CLI configuration options](./azure-cli-configuration.md)
