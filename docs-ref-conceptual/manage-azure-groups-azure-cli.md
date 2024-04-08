---
title: How to manage Azure resource groups – Azure CLI | Microsoft Docs
description: Learn how to manage Azure resource groups in the Azure CLI, a cross-platform tool to connect to Azure and execute administrative commands on Azure resources.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/2/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: Azure resource groups, resource group in azure
---

# How to manage Azure resource groups with the Azure CLI

An Azure resource group is a container that holds related resources for an Azure solution. A resource group might contain storage, virtual machines, apps, dashboards, services, or almost anything you deal with in Azure.

The Azure Command-Line Interface (CLI) allows you to create, persist, and set default Azure resource groups. The CLI will also allow you to clean up resources after creating them. 

## Azure Region Identification

Azure customers can choose to deploy resources in many different regions.  In some cases, customers may be able to reduce costs by selecting nearby regions offering the same services.  If a nearby region is identified, a message will display the region to select for future deployments.

In the following example, the `az config` command is used to disable the region recommendation message:

```azurecli
az config set core.display_region_identified=no
```

For more information about Azure regions, see [Choose the right Azure region for you](https://azure.microsoft.com/explore/global-infrastructure/geographies/#overview). 

## Create a resource group

To create a resource group, use the [az group create](/cli/azure/group#az_group_create) command:

```azurecli
az group create --name MyResourceGroup --location eastus
```

A resource group belongs to a single location. To see all the locations supported in your current subscription, run the [az account list-locations](/cli/azure/account#az_account_list_locations) command:

```azurecli
az account list-locations
```

To see all the resource groups for your current subscription, use the [az group list](/cli/azure/group#az_group_list) command:

```azurecli
az group list --output table
```

> [!TIP]
> The `--output` parameter is a global parameter, available for all commands. The **table** value presents output in a friendly format. For more information, see [Output formats for Azure CLI commands](./format-output-azure-cli.md).

When you create a resource, you create it in a resource group. The following example shows a storage account created by using the [az storage account create](/cli/azure/storage/account#az_storage_account_create) command:

```azurecli
az storage account create --resource-group MyResourceGroup --name storage134 --location eastus --sku Standard_LRS
```

To remove a resource group, run the [az group delete](/cli/azure/group#az_group_delete) command:

```azurecli
az group delete --name MyResourceGroup
```

When you remove a resource group, you delete all the resources that belong to it. You can't undo this action. If you try any of the commands in this article, deleting the resource groups you create cleans up your account.

## Set a default resource group

You can set a default resource group for all the commands that you run from your local Azure CLI or from Azure Cloud Shell. Azure CLI stores this configuration locally in a *config* file. To see your current configuration, run the [az config get](/cli/azure/config#az_config_get) command:

```azurecli
az config get
```

The result shows default resource groups and other default values. If you're using Azure CLI for the first time, the results might be empty.

To set a default resource group for your Azure CLI installation, run the [az config set](/cli/azure/config#az_config_set) command:

```azurecli
az config set defaults.group=MyResourceGroup
```

The command sets a value for a specified key, in this case `defaults.group`. For available configuration options, see [Azure CLI configuration](./azure-cli-configuration.md).

> [!NOTE]
> The [az config set](/cli/azure/config#az_config_set) command does not validate the existence of the resource group you enter. The command simply stores the key-value pair.

After you run the command, the following two commands would give you the same result:

```azurecli
az storage account create --resource-group MyResourceGroup --name storage01  --location eastus --sku Standard_LRS
az storage account create --name storage01 --location eastus --sku Standard_LRS
```

A resource group belongs to a subscription. If your organization has more than one subscription, you need to set that subscription before working with a resource group in the subscription. If the default value of a resource group doesn't belong to your current subscription, an error results. For more information about multiple subscriptions, see [Use multiple Azure subscriptions](manage-azure-subscriptions-azure-cli.md).

You don't have to reset the default to use other resource groups. Instead, specify the resource group:

```azurecli
az group create --name OtherResourceGroup --location eastus
az storage account create --resource-group StorageGroups --name storage03  --location westus --sku Standard_LRS
```

The default value is for you only. It doesn't affect other users or changes you make through the Azure portal.

If you're using persisted parameter values, as described in this article, those values take precedence over defaults set in the *config* file.

## Set a resource group lock

As an administrator, you may need to lock a resource group to prevent users from deleting or modifying it. For more information, see [Lock resources to prevent unexpected changes](/azure/azure-resource-manager/management/lock-resources).

In Azure CLI, use the [az group lock](../latest/docs-ref-autogen/group/lock.yml) commands. For instance, the [az account lock create](/cli/azure/account/lock#az-account-lock-create) command can prevent users from deleting a resource group:

```azurecli-interactive
az group lock create --name "Cannot delete resource group" --lock-type CanNotDelete
```

> [!NOTE]
> You need to have `contributor` permissions on a resource group to create or change locks.

To see the current locks on your resource group, use the [az group lock list](/cli/azure/group/lock#az-group-lock-list) command:

```azurecli-interactive
az group lock list --output table
```

## Clean up resources

If you tried any of the commands in this article, you can remove any resources you created by using the [az group delete](/cli/azure/group#az-group-delete) command:

```azurecli
az group delete --name MyResourceGroup
az group delete --name OtherResourceGroup
az group delete --name StorageGroups
```

This command removes the group and all the resources that it contains at once.

## See also

* [Azure CLI configuration](./azure-cli-configuration.md)
* [Manage Azure subscriptions](./manage-azure-subscriptions-azure-cli.md)
