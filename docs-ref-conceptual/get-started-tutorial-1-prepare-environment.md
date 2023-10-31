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

Welcome to the Azure CLI! You have chosen a tool that will allow you to create, update, and delete Azure resources from a command-line. In this tutorial, you will onboard with the Azure CLI and learn how to complete the following tasks:

> [!div class="checklist"]
>
> * Prepare your environment to use the Azure CLI
>   * Understand Azure CLI terms
>   * Find and change a subscription
>   * Use random IDs for resources
>   * Set environment variables (defaults)
> * Write commands for Bash, Powershell and Cmd environments
>   * Be aware of line continuation
>   * Learn quoting differences
>   * Debug
> * Using variables
>   * Store command output in a variable (`--query`)
>   * Get a value from a blob storage (CosmosDB?) and store it in a variable 
>   * Get a value from a local file and store it in a variable
> * Use interactive commands (az `interactive`, `scenario`, `next` and `find`)
> * Find examples for a specific commands 
>   * Information/links to ref content, conceptual index, sample index
>   * Give examples of Portal CoPilot for Azure CLI searches specifically

This tutorial also covers these advanced topics:

> [!div class="checklist"]
>
> * Use generic commands (`az rest`, `az resource`)
> * Run scripts concurrently
> * Learn advanced Bash commands
> * Use az-dif-x site before you upgrade

## Prerequisites

* If you don't have an [Azure subscription](/azure/guides/developer/azure-developer-guide#understanding-accounts-subscriptions-and-billing), create an [Azure free account](https://azure.microsoft.com/free/?ref=microsoft.com&utm_source=microsoft.com&utm_medium=docs&utm_campaign=visualstudio) before you begin.

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]

* To complete the steps in this tutorial, you will need `contributor` permissions in your subscription.

[!INCLUDE [include](./includes/current-version.md)]

## Understand Azure CLI terms

This first section of the tutorial is a brief summary of Azure CLI terms and status options. For a full explanation, see [Azure CLI terminology and support levels](reference-types-and-status.md).

The Azure CLI is comprised of four objects:

* Reference **groups**: `az account`, `az vm`, and `az iot` are all examples of reference groups.
* Space-delimited reference **subgroups**: `subscription-enable` is the subgroup in `az account subscription-enabled`.
* Reference **commands**: `az account create` is a reference command.
* Reference command **parameters**: `--name`, `--resource-group` and `--debug` are all examples of parameters.

These objects all sit under one of two "umbrellas" often referred to as "type":

* Core
* Extension

Every Azure CLI reference group, subgroup, command and parameter has one of three statuses. The status determines the support level.

* Experimental
* Preview
* GA (General acceptance)

Here is a table showing how all the terms fit together, but _use the reference link for actual information._

|Type|Group|space-delimited subgroups|Command|Parameter example|Status|Link|
|-|-|-|-|-|-|-|
|Extension|az account| | create| `--offer-type`| GA | [az account create](/cli/azure/account#az-account-create)
|Extension|az account|subscription|enable|`--id`|Experimental|[az account subscription enable](/cli/azure/account/subscription#az-account-subscription-enable)
|Core|az network|application-gateway waf-policy managed-rule exclusion|add | `--match-operator` | Preview | [az network application-gateway waf-policy managed-rule exclusion add](/cli/azure/cdn/waf/policy/managed-rule-set/rule-group-override#az-cdn-waf-policy-managed-rule-set-rule-group-override-list-available)

For a history of each command group, see [release notes](release-notes-azure-cli.md).

## Find and change your subscription

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

## Create and remove a resource group

A resource group is a container for Azure resources. To create a resource group, you need permissions of a `contributor` role or higher in your subscription.

### Create a resource group

1. A resource group name must be unique. First check if the name you want is available using the [az group exists](/cli/azure/group#az-group-exists) command.

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

When testing, it is better to create a resource group that contains a random ID. Using a random ID allows you to retest your code without having to wait for a prior resource group of the same name to be removed from Azure.

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="East US"
resourceGroup="msdocs-tutorial-rg-$randomIdentifier"
az group create --name $resourceGroup --location $location --output json
```

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
```

### Remove a resource group

When you delete a resource group, you delete every object inside that resource group. It is an easy way to cleanup resources, but make sure you delete the right group!

```azurecli-interactive
# Get a list of resource groups
az group list --output table

# Delete a resource group and tell your console not to wait
az group delete --name <msdocs-tutorial-rg-0000000> --no-wait
```

## Work with environment variables

The Azure CLI offers several options to allow you to reuse common parameter values. These default values are stored in environment variables.

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

   A key take-way from this step is that configuration settings are user-specific.

## Get more detail

Do you want more detail on one of the topics covered in this tutorial step? Use the links in this table to learn more.

|Topic| Learn more|
|-|-|
|Sign in options|[Sign in with Azure CLI](authenticate-azure-cli.md)
|Terms| [Azure CLI terminology and support levels](reference-types-and-status.md) |
|Subscriptions| [Manage subscriptions using the Azure CLI](manage-azure-subscriptions-azure-cli.md)
|Resource groups|[Manage resource groups using the Azure CLI](manage-azure-groups-azure-cli.md)
|Configurations|[Configure the Azure CLI](azure-cli-configuration.md)

## Next Step

Now that you've learned how to configure your environment to work successfully with the Azure CLI, proceed to the next step to learn the scripting differences between Bash and PowerShell.

> [!div class="nextstepaction"]
> [Write Azure CLI commands for different environments](./get-started-tutorial-2-work-environments.md)
