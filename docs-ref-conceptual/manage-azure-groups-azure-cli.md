---
title: Manage Azure resource groups with Azure CLI
description: Learn about Azure resource groups and using Azure CLI to manage your resrouce groups. Learn about persisted and default resource groups.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 01/15/2021
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
---

# Working with resource groups in Azure CLI

An Azure resource group is a container that holds related resources for an Azure solution. A resource group might contain storage, virtual machines, apps, dashboards, services, or almost anything you deal with in Azure.

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
> The `--output` parameter is a global parameter, available for all commands. The **table** value presents output in a friendly format. For more information, see [Output formats for Azure CLI commands](/cli/azure/format-output-azure-cli).

When you create a resource, you create it in a resource group. The following example shows a storage account created by using the [az storage account create](/cli/azure/storage/account#az_storage_account_create) command:

```azurecli
az storage account create --resource-group MyResourceGroup --name storage134 --location eastus --sku Standard_LRS
```

To remove a resource group, run the [az group delete](/cli/azure/group#az_group_delete) command:

```azurecli
az group delete --name MyResourceGroup
```

When you remove a resource group, you delete all the resources that belong to it. There's no option to undelete resources. If you try any of the commands in this article, deleting the resource groups you create cleans up your account.

## Persist a resource group

Parameter persistence allows you to reuse values for certain parameters, including resource groups.

First, turn on the persistence feature by using the [az config param-persist on](/cli/azure/config/param-persist#az_config_param_persist_on) command:

```azurecli
az config param-persist on
```

After turning on persistence, create another resource group:

 ```azurecli
az group create --name OtherResourceGroup --location eastus
```

As long as persistence is on, your can leave the `--resource-group` parameter out of future commands. The following command creates a storage account in the **OtherResourceGroup** group:

```azurecli
az storage account create --name storage135 --location eastus --sku Standard_LRS
```

If you specify a resource group in the command, that takes precedence. The following command creates a storage group in a resource group called **StorageGroups**:

```azurecli
az storage account create --resource-group StorageGroups --name storage136 --location eastus --sku Standard_LRS
```

Once you specify another resource group as a value, however, Azure CLI resets the persisted value. New commands use **StorageGroups** as the resource group. You can see the persisted values by using the [az config param-persist show](/cli/azure/config/param-persist#az_config_param_persist_show) command:

```azurecli
az config param-persist show
```

This command shows you the current persisted values. These values are stored in a file called *local_context_\<username>* in a hidden directory called *.azure*. Azure CLI creates the directory in your current location when you first create a persistent value.

When you're done using persisted parameters, run the [az config param-persist off](/cli/azure/config/param-persist#az_config_param_persist_off) command:

```azurecli
az config param-persist off
```

Azure CLI saves your persisted values. You can see them in the local context file. If you turn on parameter persistence again, those values are already set.

For more information about using the [az config param-persist](/cli/azure/config/param-persist) commands, see [Use persisted parameters to simplify sequential Azure CLI commands](/cli/azure/param-persist-tutorial).

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

The command sets a value for a specified key, in this case `defaults.group`. For available configuration options, see [Azure CLI configuration](/cli/azure/azure-cli-configuration).

> [!NOTE]
> The [az config set](/cli/azure/config#az_config_set) command does not validate the existence of the resource group you enter. The command simply stores the key-value pair.

After you run the command, the following two commands would give you the same result:

```azurecli
az storage account create --resource-group MyResourceGroup --name storage01  --location eastus --sku Standard_LRS
az storage account create --name storage01 --location eastus --sku Standard_LRS
```

A resource group belongs to a subscription. If your organization has more than one subscription, you need to set that subscription before working with a resource group in the subscription. If the default value of a resource group does not belong to your current subscription, an error results. For more information about multiple subscriptions, see [Use multiple Azure subscriptions](manage-azure-subscriptions-azure-cli.md).

You don't have to reset the default to use other resource groups. Instead, specify the resource group:

```azurecli
az group create --name OtherResourceGroup --location eastus
az storage account create --resource-group StorageGroups --name storage03  --location westus --sku Standard_LRS
```

The default value is for you only. It won't affect other users or changes you make through the Azure portal.

If you are using persisted parameter values, as described in this article, those values take precedence over defaults set in the *config* file.

## Clean up resources

If you tried any of the commands in this article, you can remove any resources you created by using the [az group delete](/cli/azure/group#az_group_delete) command:

```azurecli
az group delete --name MyResourceGroup
az group delete --name OtherResourceGroup
az group delete --name StorageGroups
```

This command removes the group and all the resources that it contains at once.

You can remove the persistent parameters by running the [az config param-persist delete](/cli/azure/config/param-persist#az_config_param_persist_delete) command:

```azurecli
az config param-persist delete --all
```

## See also

[Azure CLI configuration](/cli/azure/azure-cli-configuration)

[Tutorial: Use persisted parameters to simplify sequential Azure CLI commands](/cli/azure/param-persist-tutorial)

[Use multiple Azure subscriptions](manage-azure-subscriptions-azure-cli.md)
