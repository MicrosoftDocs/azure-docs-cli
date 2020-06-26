---
title: How-to use local context with the Azure CLI
description: How to use az local-context to store Azure CLI parameter values
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.prod: azure
ms.date: 06/30/2020
ms.topic: conceptual
ms.devlang: azurecli
ms.technology: azure-cli
---

# Use local context with the Azure CLI

Azure CLI [az local-context](/cli/azure/local-contex) provides local persisted parameter values for Azure CLI commands.  The purpose of local context is to remove the need to continully retype common parameters. For example, location and resource-group are required parameters in many CLI commands, but they don’t contribute to the _intent_ of the command.  By storing parameter values with local context, you reduce redundency and can significantly shorten CLI command syntaz.

If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.

[!INCLUDE [cloud-shell-try-it.md](../../includes/cloud-shell-try-it.md)]

## Prepare your environment

1. Sign in.

   Sign in using the [az login](/cli/azure/reference-index#az-login) command if you're using a local install of the CLI.

    ```azurecli
    az login
    ```

    Follow the steps displayed in your terminal to complete the authentication process.

2. Install the Azure CLI extension.

   When working with extension references for the Azure CLI, you must first install the extension.  Azure CLI extensions give you access to experimental and pre-release commands that have not yet shipped as part of the core CLI.  To learn more about extensions including updating and uninstalling, see [Use extensions with Azure CLI](/cli/azure/azure-cli-extensions-overview).

   Install the [extension for local context](/cli/azure/local-context/) by running the following command:

    ```azurecli
    az extension add --name local-context
   ```

## Determine your local directory

Local context parameter values are stored in your Azure storage account used by Azure Cloud Shell.  To list current directories or to create new ones, use these familiar CLI commands.

```azurecli-interactive
# list directories
dir

# make directory
mkdir azCLI

# make a second directory for later use
mkdir azCLI2

# change directory
cd azCLI

```

## Turn local context on

Local context must be turned on before any parameter values can be stored.

```azurecli

# see what commands are available for `az local-context`
az local-context --help

# turn local context on
az local-context on

```

When turning local context on, you will receive an expirimental warning until `az local-context` moves to Azure CLI core.

```output

Command group 'local-context' is experimental and not covered by customer support. Please use with discretion.
```

## Add parameters and values to local context

To add stored objects to local context, local context must be turned on, and you have to execute a command. Here are two examples:

Create a resource group and view new local context entries.

```azurecli
# create a resource group
az group create --name RG1inAzCLI --location eastus2

# see new local context values
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

You don't always have to create a new resource group to get `location` and `resource_group_name` placed into local context.  You can use any command.

```azurecli
# clear all local context values for demonstration
az local-context delete --all

# create a storage account
az storage account create --name SA1inAzCLI --resource-group RG1inAzCLI --location eastus2

# see new local context values
az local-context show
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

If you don't want to create a new Azure service, use a `--show` or `--list` command that allows for several parameters.

```azurecli
# clear all local context values for demonstration
az local-context delete --all

# list all storage accounts
az storage account show --resource-group RG1inAzCLI --mySubscription

# see new local context values
az local-context show
```

```output
{
  "all": {
    "resource_group_name": "RG1inAzCLI",
    "storage_account_name": "mySubscription"
  }
}
```

## Replace local context values

Updating a local context parameter value is as simple as executing a new command with a new value.

```azurecli
# clear all local context values for demonstration
az local-context delete --all

# create a storage account
az storage account create --name SA1inAzCLI --resource-group RG1inAzCLI --location eastus2

# create a third storage account while changing both the `storage_account_name' and `location` local context
az storage account create --name SA3inAzCLI --location westus

# see new local context values
az local-context show
```

```output
{
  "all": {
    "location": "westus",
    "resource_group_name": "RG1inAzCLI",
    "storage_account_name": "SA3inAzCLI"
  }
}
```

> [!NOTE] Just because you have local context turned on doesn't mean you have to use it.  You can still execute commands with all parameter values specified.  However, be aware that with local context turned on, _you will be creating new local context enteries, or overwriting existing ones._
>
> ```azurecli
> # with local context turned on, create a storage account _without using_ local-context
> az storage account create --name saazclicontext --location westeurope --resource-group RG1inAzCLI  --sku Standard_LRS
>
> # create a storage account using local-context understanding that the `--location` has just been changed to `westeurope`
> az storage account create --name saazclicontext --sku Standard_LRS
> ```

## Work with multiple directories

Intro here.  local context is not unique to each directory??

Change to a new directory and show local context

```azurecli
# Show the current local context values
az local-context show

# create a new directory
mkdir azCLI2

#change directories
cd azCLI2

# See that local context values persist
az local-context show
```

## Delete local context values

```azurecli
# remove all local context enteries and do not prompt for confirmation
az local-context delete --all --yes

# remove a single local context entry.  
# specify the **name**, not the value
az local-context delete --name resource_group_name
```

> [!NOTE] Local context does not get updated when an Azure resource is deleted.
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

You can turn local context off, but your saved local context data will not be deleted.

```azurecli

# turn local context off
az local-context off

# see that your local context values still exist
az local-context show

# try to create a new resource relying on local context and receive error
az storage account create --name SA4inAzCLI
```
