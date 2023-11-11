---
title: Use the Azure CLI by first configuring your environment | Microsoft Docs
description: Learn Azure CLI terms, change a subscription, set environment variables, and create resource groups containing a random ID.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 11/15/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure, az account, az group, az config, az init, configuration
---
# Prepare your environment for the Azure CLI

In this tutorial step, you onboard with the Azure CLI! This includes choosing the environment that works best for you, and setting your default values. You will also learn how to find and change your active Azure subscription, and use random IDs to always guarantee unique resource names.

## Install the Azure CLI

* If you don't have an [Azure subscription](/azure/guides/developer/azure-developer-guide#understanding-accounts-subscriptions-and-billing), create an [Azure free account](https://azure.microsoft.com/free/?ref=microsoft.com&utm_source=microsoft.com&utm_medium=docs&utm_campaign=visualstudio) before you begin.

* Use the Bash environment in [Azure Cloud Shell](/azure/cloud-shell/overview) by selecting the **Open Cloud Shell** button in the top right corner of each Azure CLI code block.

* If you prefer to run the Azure CLI reference commands locally, [install](/cli/azure/install-azure-cli) the Azure CLI.

* To complete the steps in this tutorial, you will need `contributor` permissions in your subscription.

[!INCLUDE [include](./includes/current-version.md)]

## Sign in with Azure CLI

There are several authentication options when working with the Azure CLI. The Azure CLI's default authentication method for logins uses a web browser and access token to sign in.

[!INCLUDE [interactive_login](includes/interactive-login.md)]

## Find and change your active subscription

After logging into the Azure CLI, always check your default subscription. If you aren't working under the subscription you prefer, change your subscription using [az account set](/cli/azure/account#az-account-set). Here is a code example you can use.

```azurecli-interactive
# see your current default subscription
az account show

# find the list of subscriptions available to you
az account list --output table

# set your default subscription
az account set --subscription <mySubscriptionName>

# you can also set your subscription using your subscription ID
az account set --subscription <00000000-0000-0000-0000-000000000000>
```

## Learn about resource groups

A resource group is a container for Azure resources. To create a resource group, you need role permissions of `contributor` or higher in your subscription.

### Create a resource group

1. A resource group name must be globally unique. First check if the name you want is available using the [az group exists](/cli/azure/group#az-group-exists) command.

   ```azurecli-interactive
   az group exists --name <theNameIwant>
   ```

1. Retrieve a list of supported regions for your subscription with the [az account list-locations](/cli/azure/account#az-account-list-locations) command. For a list of available Azure locations, see [Choose the right Azure region for you](https://azure.microsoft.com/explore/global-infrastructure/geographies/#overview).

   ```azurecli-interactive
   az account list-locations --query "[].{Region:name}" --output table
   ```

1. It is time to create your resource group! Use the [az group create](/cli/azure/group#az-group-create) command.

   ```azurecli-interactive
   az group create --location <eastus> --name <myRG1>
   ```

### Use a random ID

When testing, it is best to create a resource group that contains a random ID. Using a random ID allows you to retest your code without having to wait for a prior resource group of the same name to be removed from Azure. Bash and PowerShell variable syntax is different. Copy the correct script for your environment.

# [Bash](#tab/bash)

```azurecli-interactive
let "randomIdentifier=$RANDOM*$RANDOM"
location="eastus"
resourceGroup="msdocs-tutorial-rg-$randomIdentifier"
az group create --name $resourceGroup --location $location --output json
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$location="eastus"
$resourceGroup="msdocs-tutorial-rg-$randomIdentifier"
az group create --name $resourceGroup --location $location --output json
```

---

Console output in both Bash and PowerShell:

```output
{
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/msdocs-tutorial-rg-000000000",
  "location": "eastus",
  "managedBy": null,
  "name": "msdocs-tutorial-rg-000000000",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}


### Remove a resource group

**TODO**: Move this to final step cleanup doc

Using random IDs and running every step in this tutorial multiple times creates test resource groups that should be removed. When you delete a resource group, you delete every object inside that resource group so when you cleanup, make sure you delete the right group!

```azurecli-interactive
# Get a list of resource groups
az group list --output table

# Delete a resource group and tell your console not to wait
az group delete --name <msdocs-tutorial-rg-0000000> --no-wait
```

## Set environment variables

The Azure CLI offers several options to allow you to reuse common parameter values. These default values are stored in environment variables and are unique for each login.

1. Set your default resource group.

   ```azurecli-interactive
   az config set defaults.group=<msdocs-tutorial-rg-0000000>
   ```

1. Set multiple environment variables at once.

   When working with the Azure CLI, many parameters take multiple values separated by a space. Configuration values is one such instance. This example sets both the `.location` and `.group` defaults that will be used by the `--location` and `--resource-group` parameters.

   ```azurecli-interactive
   az config set defaults.location=westus2 defaults.group=<msdocs-tutorial-rg-0000000>
   ```

1. Set your default output.

   When you chose to work in Azure Cloud Shell, or installed the Azure CLI locally, the default output is automatically sent to `json`.  However, this is one of the most important defaults to understand and set.  **Output determines what appears on your console and what is written to your log file.** Always use an output of `none` when you are creating resources that return keys, passwords and secrets.

   ```azurecli-interactive
   az config set core.output=none
   ```

   In this tutorial we are not working with secrets.  Set the default back to `json` so you can see the returned output of each reference command.

   ```azurecli-interactive
   az config set core.output=json
   ```

1. Learn to use `az init`.

   The Azure CLI has a reference command that walks you through configuring your environment. Type `az init` in your console and press <kbd>Enter</kbd>.  Follow the prompts provided. (The first nice thing about [az init](/cli/azure/reference-index#az-init) is that it gives you all of your current settings!)

   ```azurecli-interactive
   az init
   ```

1. Find and read your configuration file.

   If you work under a "trust but verify" mindset, you'll want to know where your configuration files are stored and what they contain.  The configuration file itself is located at `$AZURE_CONFIG_DIR/config`. The default value of `AZURE_CONFIG_DIR` is `$HOME/.azure` on Linux and macOS, and `%USERPROFILE%\.azure` on Windows. Find your config file now and see what it contains.

## Get more detail

Do you want more detail on one of the topics covered in this tutorial step? Use the links in this table to learn more.

|Topic| Learn more|
|-|-|
| Environments | [Choose the right Azure command-line tool](./choose-the-right-azure-command-line-tool.md)
| Sign in options | [Sign in with Azure CLI](authenticate-azure-cli.md)
| Terms | [Azure CLI terminology and support levels](reference-types-and-status.md) |
| Subscriptions | [Manage subscriptions using the Azure CLI](manage-azure-subscriptions-azure-cli.md)
| Resource groups | [Manage resource groups using the Azure CLI](manage-azure-groups-azure-cli.md)
| Configurations | [Configure the Azure CLI](azure-cli-configuration.md)
| Azure roles | [Azure roles, Microsoft Entra roles, and classic subscription administrator roles](/azure/role-based-access-control/rbac-and-directory-admin-roles)

## Next Step

Now that you've learned how to configure your environment, proceed to the next step to learn the scripting differences between Bash, PowerShell and Cmd.

> [!div class="nextstepaction"]
> [Write Azure CLI commands for different environments](./get-started-tutorial-2-work-environments.md)
