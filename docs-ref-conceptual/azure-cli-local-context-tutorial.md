---
title: Tutorial on how to use local context with the Azure CLI
description: Use az local-context to store Azure CLI parameter values for repeated use
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.prod: azure
ms.date: 06/30/2020
ms.topic: conceptual
ms.devlang: azurecli
ms.technology: azure-cli
---

# Tutorial: Use local context with sequential Azure CLI commands

Azure CLI has a local context feature that enables you to store parameter values for continued use.  In this tutorial, you learn how to work with local context parameter values, and use local context to efficiently execute sequential commands.  

If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.

## Prepare your environment

1. Use Azure Cloud Shell

   Azure hosts Azure Cloud Shell, an interactive shell environment that you use through your browser. You can use either Bash or PowerShell with Cloud Shell to work with Azure services. You use the Cloud Shell preinstalled commands to run the code in this article.

   Start Cloud Shell by using one of these methods:

   - Select **Try It** in the upper-right corner of a code block. **Try It** will open Azure Cloud Shell, but it doesn't automatically copy the code to Cloud Shell.

   - Open Cloud Shell by going to [https://shell.azure.com](https://shell.azure.com)

   - Select the **Cloud Shell** button on the menu bar at the upper right corner in the [Azure portal](https://portal.azure.com)

1. Sign in.

   Sign in using the [az login](/cli/azure/reference-index#az-login) command if you're using a local install of the CLI.

    ```azurecli
    az login
    ```

    Follow the steps displayed in your terminal to complete the authentication process.

## Determine your local directory

Local context parameter values are stored in the working directory of the Azure storage account used by Azure Cloud Shell.  If you are using a local install of the Azure CLI, values are stored in the working directory on your machine.

To find, create or change the working directory being used by the Azure CLI, use these familiar CLI commands.

```azurecli-interactive
# List directories
dir

# Make directory
mkdir azCLI

# Change directory
cd azCLI
```

## Turn local context on

[Local context](/cli/azure/local-context) must be turned on before parameter values can be stored.  You will receive an warning until `az local-context` moves out of the experimental stage.

```azurecli
az local-context on
```

```output
Command group 'local-context' is experimental and not covered by customer support. Please use with discretion.
```

## Add parameters and values to local context

To create entries for local context, you need to execute an Azure CLI command of your choice that contains the parameters you want to store.  For example, create a resource group and the `--location` and `--name` parameters are stored for future use.

```azurecli
# With local context turned on, create a resource group
az group create --name RG1inAzCLI --location eastus2

# See new local context values
az local-context show
```

```output
{
  "all": {
    "location": "eastus2",
    "resource_group_name": "RG1inAzCLI"
  }
}
```

Using the new local context values, now create a storage account.  This example also removes all prior local context entries by using the [az local-context delete](/cli/azure/local-context#az-local-context-delete) command.

```azurecli
# Clear all local context values for demonstration
az local-context delete --all

# Create a storage account
az storage account create --name SA1inAzCLI --resource-group RG1inAzCLI --location eastus

# See new local context values
az local-context show
```

```output
{
  "all": {
    "location": "eastus",
    "resource_group_name": "RG1inAzCLI",
    "storage_account_name": "SA1inAzCLI"
  }
}
```

Only the `resource_group_name` and `location` parameters can be stored by using non-create commands like `show` or `list`.  In contrast, if you want to store `storage_account_name` you must use a create command

```azurecli
# Clear all local context values for demonstration
az local-context delete --all

# List all storage accounts
az storage account show --resource-group RG1inAzCLIcontext --name SA1inAzCLI

# See the new local context value created only for resource group
az local-context show
```

```output
{
  "all": {
    "resource_group_name": "RG1inAzCLIcontext"
  }
}
```

## Replace local context values

Updating a local context parameter value is as simple as executing a command containing a replacement value.

```azurecli
# Clear all local context values for demonstration
az local-context delete --all

# Create a storage account placing `--location`, `resource_group_name`, and `storage_account_name` into local context
az storage account create --name SA1inAzCLI --resource-group RG1inAzCLI --location eastus2

# See local context enteries
az loca-context show
```

```output
{
  "all": {
    "location": "eastus2",
    "resource_group_name": "RG1inAzCLI",
    "storage_account_name": "SA1inAzCLI"
  }
}
```

Replace current local context entries.

```azurecli
# Create a second storage account while changing both the `storage_account_name' and `location` local context values
az storage account create --name SA2inAzCLI --location westus

# See new local context values
az local-context show
```

```output
{
  "all": {
    "location": "westus",
    "resource_group_name": "RG1inAzCLI",
    "storage_account_name": "SA2inAzCLI"
  }
}
```

> [!NOTE]
>
> Just because you have local context turned on doesn't mean you have to use it.  You can still 
> execute commands with all parameter values specified.  However, be aware that with local context 
> turned on, _you will be creating new local context enteries, or overwriting existing ones._

## Execute sequential commands

These scripts create an Azure Function app using the Consumption plan.

### [Using local context](#tab/azure-cli)

```azurecli

# Function app and storage account names must be unique.
storageName=mystorageaccount$RANDOM
functionAppName=myserverlessfunc$RANDOM
region=westeurope

# Create a resource group.
az group create --name myResourceGroup --location $region

# Create an Azure storage account in the resource group.
# The resource group and location values are being used from local context
az storage account create \
  --name $storageName \
  --sku Standard_LRS

# Create a serverless function app in the resource group.
# The resource group and storage account values are being used from local context
az functionapp create \
  --name $functionAppName \
  --consumption-plan-location $region \
  --functions-version 2

```

### [Using traditional method](#tab/azure-portal)

```azurecli

# Function app and storage account names must be unique.
storageName=mystorageaccount$RANDOM
functionAppName=myserverlessfunc$RANDOM
region=westeurope

# Create a resource group.
az group create --name myResourceGroup --location $region

# Create an Azure storage account in the resource group.
az storage account create \
  --name $storageName \
  --location $region \
  --resource-group myResourceGroup \
  --sku Standard_LRS

# Create a serverless function app in the resource group.
az functionapp create \
  --name $functionAppName \
  --storage-account $storageName \
  --consumption-plan-location $region \
  --resource-group myResourceGroup \
  --functions-version 2

```

* * *

## Work with multiple directories

Intro here.  local context is not unique to each directory??

Change to a new directory and show local context

```azurecli
# Show the current local context values
az local-context show

# Create a new directory
mkdir azCLI2

# Change directories
cd azCLI2

# See that local context values persist
az local-context show
```

## Delete local context values

Use the [az local-context delete](/cli/azure/local-context#az-local-context-delete) command to remove entries.

```azurecli
# Remove all local context enteries and do not prompt for confirmation
az local-context delete --all --yes

# Remove a single local context entry by specifiying the name, not the value
az local-context delete --name resource_group_name
```

> [!IMPORTANT]
>
> Local context does not get updated when an Azure resource is deleted.
>
> ```azurecli
> # delete a resource group
> az group delete --name RG1inAzCLI
>
> # verify that the resource group no longer exists
> az group list --output table
>
> # See that the resource group name persists in local context
> az local-context show
> ```

## Turn local context off

You can turn local context off by using the [az local-context off](/cli/azure/local-context#az-local-context-off) command, but your saved local context data won't be deleted.

```azurecli

# Turn local context off
az local-context off

# See that your local context values still exist
az local-context show

# Try to create a new resource relying on local context and receive error ""
az storage account create --name SA4inAzCLI
```

## Clean up resources

When no longer needed, use the [az group delete](/cli/azure/group) command to remove the resource group, and all related resources.

```azurecli
az group delete --name RG1inAzCLI
```

## See also

- [Azure CLI local context](azure-cli-local-context)