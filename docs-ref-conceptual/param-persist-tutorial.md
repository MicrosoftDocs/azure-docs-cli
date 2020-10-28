---
title: Tutorial on how to use parameter persistence with the Azure CLI
description: Tutorial on using az config param-persist to store Azure CLI parameter values for repeated use
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

# Tutorial: Use persisted parameters with sequential Azure CLI commands

Azure CLI offers persisted parameters that enable you to store parameter values for continued use.  In this tutorial, you learn how to work with persisted values, and use these local values to efficiently execute sequential commands.

In this tutorial, you will learn to:

> [!div class="checklist"]
> * Turn paramter persistence on/off
> * Create and update stored parameter values
> * Execute sequential commands using parameter persistence
> * Delete stored parameter values

If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.

## Prepare your environment

1. [Install the Azure CLI](install-azure-cli.md)

   If you prefer, you can also use Azure Cloud Shell to complete the steps in this tutorial.  Azure Cloud Shell is an interactive shell environment that you use through your browser.  Start Cloud Shell by using one of these methods:

   - Open Cloud Shell by going to [https://shell.azure.com](https://shell.azure.com)

   - Select the **Cloud Shell** button on the menu bar at the upper right corner in the [Azure portal](https://portal.azure.com)

1. If you are using a local install of the Azure CLI, complete the following:
   - Sign in using the [az login](/cli/azure/reference-index#az-login) command, then follow the steps displayed in your terminal to complete the authentication process.

     ```azurecli
     az login
     ```
    - This tutorial requires version x.x.x or later of the Azure CLI.  Run [az version](/cli/azure/reference-index?#az_version) to find the version and dependent libraries that are installed. To upgrade to the latest version, run [az upgrade](/cli/azure/reference-index?#az_upgrade).

## Determine your local directory

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

## Turn parameter persistence on

[Parameter persistence](/cli/azure/param-persist) must be turned on before parameter values can be stored.  You will receive a warning until **az config param-persist** moves out of the experimental stage.  See [Overview: Azure CLI reference types and status](/cli/azure/reference-types-and-status) to learn about the Azure CLI reference types, status, and support levels.

```azurecli
az config param-persist on
```

```output
Command group 'config param-persist' is experimental and not covered by customer support. Please use with discretion.
```

## Add values to parameter persistence

To create entries for parameter persistence, execute an Azure CLI command of your choice that contains the parameters you want to store.  For example, create a resource group and the **--location** and **--name** parameters are stored for future use.

1. Persist the location and resource group name.
   ```azurecli
   # With parameter persistence turned on, create a resource group
   az group create --name RG1forTutorial --location eastus2

   # See new parameter persistence values
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

1. Using the new parameter persisted values, create a storage account.

   ```azurecli
   # Create a storage account
   az storage account create --name sa1fortutorial

   # See that storage_account_name has been added to parameter persistence
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

1. Persist parameter values without creating a new resource.

   If you do not want to create a new Azure resource, **resource_group_name** and **location** parameters can be stored by using non-create commands like **show** or **list**.   See [Azure CLI parameter persistence](/cli/azure/param-persist-howto#compare-parameter-persistence-and-global-variables) for a full list of supported parameters,   and the action needed to retain values.  This example also removes all parameter values by using the [az config param-persist delete](/cli/azure/config/param-persist#az-param-persist-delete) command.

   ```azurecli
   # Clear all persisted parameters for demonstration.
   az config param-persist delete --all

   # List all storage accounts which will create the **resource_group_name** stored parameter value.
   az storage account show --resource-group RG1forTutorial --name sa1fortutorial

   # See the new stored value created for resource group.  The storage account name will not be saved.
   az config param-persist show
   ```

   ```output
   {
     "all": {
       "resource_group_name": "RG1forTutorial"
     }
   }
   ```

## Replace parameter persisted values

Updating a stored parameter value is as simple as executing a command containing a replacement value.

1. Create new persisted parameters.
   ```azurecli
   # Clear all parameter persistence values for demonstration
   az config param-persist delete --all

   # Create a storage account placing "*location", "resource_group_name", and "storage_account_name" into parameter persistence
   az storage account create --name sa1fortutorial --resource-group RG1forTutorial --location eastus2

   # See parameter persistence entries
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
   # Create a second storage account while changing both the "storage_account_name" and "location" parameter persisted values
   az storage account create --name sa2fortutorial --location westeurope

   # See new parameter persistence values
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
   > Even if parameter persistence is turned on, you don't have to use it.  You can still
   > execute commands with all parameter values specified.  However, be aware that with parameter persistence
   > turned on, _you will be creating new parameter persistence entries, or overwriting existing ones._

## Execute sequential commands

These scripts create an Azure Function app using the Consumption plan.

### [With parameter persistence](#tab/azure-cli)

```azurecli
# Reminder: function app and storage account names must be unique.

# Turn parameter persistence on.
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

### [Without parameter persistence](#tab/azure-portal)

```azurecli
# Reminder: function app and storage account names must be unique.

# turn parameter persistence off
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

## Delete parameter persistence values

Use the [az config param-persist delete](/cli/azure/param-persist#az-param-persist-delete) command to remove entries.

```azurecli
# Remove a single parameter persistence entry by specifying the name, not the value
az config param-persist delete --name resource_group_name

# Remove all parameter persistence entries and do not prompt for confirmation
az config param-persist delete --all --yes
```

> [!IMPORTANT]
>
> Parameter persistence does not get updated when an Azure resource is deleted.
>
> ```azurecli
> # delete a resource group
> az group delete --name RG1forTutorial
>
> # verify that the resource group no longer exists
> az group list --output table
>
> # See that the resource group name remains in parameter persistence
> az config param-persist show
> ```

## Turn parameter persistence off

You can turn parameter persistence off by using the [az config param-persist off](/cli/azure/param-persist#az-param-persist-off) command, but your saved parameter persistence data won't be deleted.

```azurecli
# Turn parameter persistence off
az config param-persist off

# See that your parameter persistence values still exist
az config param-persist show

# Try to create a new resource relying on parameter persistence and receive error "...the following arguments are required:..."
az storage account create --name SA4inAzCLI --sku Standard_LRS
```

## Clean up resources

When no longer needed, use the [az group delete](/cli/azure/group) command to remove the resource group, and all related resources.

```azurecli
az group delete --name RG1forTutorial
```

## See also

- [Azure CLI parameter persistence](param-persist-howto.md)
- [Azure CLI Configuration using az config](/cli/azure/azure-cli-configuration)
