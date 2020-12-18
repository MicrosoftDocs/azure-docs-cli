---
title: Manage Azure resource groups with the Azure CLI
description: Learn about Azure resource groups. Use the Azure CLI to manage your groups.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 12/22/2020
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
---

# Working with resource groups in the Azure CLI

To create a resource group, use the [az group create](/cli/azure/group#az_group_create) command:

```azurecli
az group create --name MyResourceGroup --location eastus
```

A resource group belongs to a single location. To see all the locations supported in your current subscription, run the [az account list-locations](/cli/azure/account#az_account_list_locations) command:

```azurecli
az account list-locations
```

You can set a default resource group for all the commands that you run from your local Azure CLI or from Azure Cloud Shell. Azure CLI stores this configuration locally in a *config* file. To see your current configuration, run the [az config get](/cli/azure/config#az_config_get) command:

```azurecli
az config get
```

## Set a default resource group

To set a default resource group for your Azure CLI installation, run the [az config set](/cli/azure/config#az_config_set)

```azurecli
az config set defaults.group=MyResourceGroup
```

The command sets a value for a specified key, in this case `defaults.group`. For available configuration options, see [Azure CLI configuration](/cli/azure/azure-cli-configuration).

After you run the command, the following two commands would give you the same result:

```azurecli
az storage account create --resource-group MyResourceGroup --name storage01  --location eastus --sku Standard_LRS
az storage account create --name storage01 --location eastus --sku Standard_LRS
```

You don't have to reset the default to use other resource groups. Instead, specify the resource group:

```azurecli
az group create --name OtherGroup --location eastus
az storage account create --resource-group OtherGroup --name storage03  --location westus --sku Standard_LRS
```

The default value is for your Azure CLI sign in only. It won't affect other users or changes you make through the Azure portal.

## Use persistent parameters

Another way to simplify your commands is to use the [az config param-persist](/cli/azure/config/param-persist) commands to use persistent parameters:

```azurecli
az group create --name StorageGroup --location eastus2
az config param-persist on
az storage account create --resource-group StorageGroup --name storageaccount01 --location eastus2
az storage account create --name storageaccount02 --location eastus2
az config param-persist off
az group delete --name StorageGroup
```

The second [az storage account create](/cli/azure/storage/account#az_storage_account_create) command uses the value for the resource group from the previous command. Any command that requires the **--resource-group** parameter will pick up this value until you change the value, remove the value, or run the [az config param-persist off](/cli/azure/config/param-persist#az_config_param_persist_off) command.

You can see the current persisted parameters by using the [az config param-persist show](/cli/azure/config/param-persist#az_config_param_persist_show) command:

```azurecli
az config param-persist show
```

There's a local context file, which stores these values, in this location on the computer where you run Azure CLI:

- *$HOME/.azure* on Linux and macOS
- *%USERPROFILE%\.azure* on Windows

For more information, see [Tutorial: Use persisted parameters to simplify sequential Azure CLI commands](/cli/azure/param-persist-tutorial)

## Clean up resources

If you tried any of the commands in this article, you can remove any resources you created by using the [az group delete](/cli/azure/group#az_group_delete) command:

```azurecli
az group delete MyResourceGroup
az group delete OtherGroup
az group delete StorageGroup
```

This command removes the group and all the resources that it contains at once.

You can remove the persistent parameters by running the [az config param-persist delete](/cli/azure/config/param-persist#az_config_param_persist_delete) command:

```azurecli
az config param-persist delete --all
```

## See also

[Azure CLI configuration](/cli/azure/azure-cli-configuration)
[Tutorial: Use persisted parameters to simplify sequential Azure CLI commands](/cli/azure/param-persist-tutorial)
