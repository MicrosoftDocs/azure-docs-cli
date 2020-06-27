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

## Prepare your environment

1. Use Azure Cloud Shell

   Azure hosts Azure Cloud Shell, an interactive shell environment that you can use through your browser. You can use either Bash or PowerShell with Cloud Shell to work with Azure services. You can use the Cloud Shell preinstalled commands to run the code in this article without having to install anything on your local environment.

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

2. Install the Azure CLI extension.

   When working with extension references for the Azure CLI, you must first install the extension.  Azure CLI extensions give you access to experimental and pre-release commands that have not yet shipped as part of the core CLI.  To learn more about extensions including updating and uninstalling, see [Use extensions with Azure CLI](/cli/azure/azure-cli-extensions-overview).

   Install the [extension for local context](/cli/azure/local-context/) by running the following command:

    ```azurecli
    az extension add --name local-context
   ```

## Determine your local directory

Local context parameter values are stored in the Azure storage account used by Azure Cloud Shell.  To list current directories or to create new ones, use these familiar CLI commands.

```azurecli-interactive
# list directories
dir

# make directory
mkdir azCLI

# change directory
cd azCLI
```

## Turn local context on

Local context must be turned on before this feature can be used and any parameter values stored.

```azurecli
# see what commands are available
az local-context --help

# turn local context on
az local-context on
```

When turning local context on, you will receive an expirimental warning until `az local-context` moves to Azure CLI core.

```output
Command group 'local-context' is experimental and not covered by customer support. Please use with discretion.
```

## Add parameters and values to local context

To create enteries for local context, local context must be turned on, and you need to execute a command.

Create a resource group and view new local context entries.

```azurecli
# with local context turned on, create a resource group
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

If you don't want to create a new Azure service, use a `--show` or `--list` command that allows accepts parameters.

```azurecli
# clear all local context values for demonstration
az local-context delete --all

# list all storage accounts
az storage account show --resource-group RG1inAzCLIcontext --name SA1inAzCLI

# see new local context values
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

Updating a local context parameter value is as simple as executing a new command with a new value.

```azurecli
# clear all local context values for demonstration
az local-context delete --all

# create a storage account placing `--location`, `resource_group_name`, and `storage_account_name` into local context
az storage account create --name SA1inAzCLI --resource-group RG1inAzCLI --location eastus2

# see local context enteries
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

Replace current local context eneries.

```azurecli
# create a second storage account while changing both the `storage_account_name' and `location` local context values
az storage account create --name SA2inAzCLI --location westus

# see new local context values
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

> [!NOTE]
> Just because you have local context turned on doesn't mean you have to use it.  You can still execute commands with all parameter values specified.  However, be aware that with local context turned on, _you will be creating new local context enteries, or overwriting existing ones._

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

Use the [az local-context delete](/cli/azure/local-context#az-local-context-delete) command to remove enteries.

```azurecli
# remove all local context enteries and do not prompt for confirmation
az local-context delete --all --yes

# remove a single local context entry by specifiying the name, not the value
az local-context delete --name resource_group_name
```

> [!IMPORTANT]
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
>

## Turn local context off

You can turn local context off by using the [az local-context off](/cli/azure/local-context#az-local-context-off) command, but your saved local context data will not be deleted.

```azurecli

# turn local context off
az local-context off

# see that your local context values still exist
az local-context show

# try to create a new resource relying on local context and receive error ""
az storage account create --name SA4inAzCLI
```

## Clean up resources

When no longer needed, use the [az group delete](/cli/azure/group) command to remove the resource group, and all related resources.

```azurecli
az group delete --name RG1inAzCLI
```

Remove all local context enteries by using the [az local-context delete](/cli/azure/local-context#az-local-context-delete) command.

```azurecli
az local-context delete --all
```
