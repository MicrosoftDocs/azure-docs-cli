---
title: Specifying values in Azure CLI commands
description: Learn about the ways you can pass values to Azure CLI commands, including variables and ways to reuse common values.
author: dbradish-microsoft
ms.author: dbradish
ms.service: azure-cli
ms.topic: how-to
ms.date: 03/01/2021
ms.custom: template-how-to
---

# Specifying values in Azure CLI commands

In addition to specifying values directly in a command, you can provide values in several ways:

* Use shell variables
* Set a subscription for use in multiple commands
* Create default values for some parameters
* Use persistent values for some parameters

This article discusses various ways that you provide values to commands.

[!INCLUDE [azure-cli-prepare-your-environment.md](includes/azure-cli-prepare-your-environment.md)]

## Use shell variables

Azure CLI runs in a shell. This article uses Bash. For information about other shells, see [Use Azure CLI effectively](/cli/azure/use-cli-effectively). You can use variables in Bash to pass values for parameters to commands. Using variables also allows reuse of commands, either piecemeal or in scripts.

This example assigns values to several variables, using standard Bash syntax:

```azurecli
MyResourceGroup=ContosoRGforVM
MySubscription="Contoso subscription"
vmName=VM01
```

This command uses those variables in a command to get another value to assign to a variable:

```azurecli
osType=$(az vm get-instance-view --resource-group $MyResourceGroup \
   --name $vmName --subscription $MySubscription \
   --query 'storageProfile.osDisk.osType' --output tsv)
```

This command uses the `tsv` output format, which returns values without extra formatting, keys, or other symbols. Some output formats include structure or characters like quotation marks. For more information, see [Output formats for Azure CLI commands](/cli/azure/format-output-azure-cli).

You can use the variable in a later command:

```azurecli
az disk create --resource-group $MyResourceGroup --name DestinationDisk \
   --source "/subscriptions/$MySubscription/resourceGroups/$MyResourceGroup/providers/Microsoft.Compute/snapshots/MigrationSnapshot" \
   --os-type $osType
```

## Set a subscription

Many commands require the **Subscription** parameter. Azure resources exist in resource groups, which exist in subscriptions. Azure CLI uses a default subscription when you are in a session. To see your current subscription value, run the [az account show](/cli/azure/account#az_account_show) command:

```azurecli
az account show --output table
```

You might have access to only one subscription. For more information, see [Use Azure subscriptions with Azure CLI](/cli/azure/manage-azure-subscriptions-azure-cli)
You can use the [az account set](/cli/azure/account#az-account-set) command to set your current subscription:

```azurecli
az account set --subscription "My Demos"
```

After you set your subscription, you can omit the **Subscription** parameter. For more information, see [Use Azure subscriptions with Azure CLI](manage-azure-subscriptions-azure-cli.md).

## Create default values

You can set values for some parameters by using the [az config set](/cli/azure/config#az_config_set) command:

```azurecli
az config set defaults.group=ContosoRGforVM
```

After running this command, you can run the following command to create a storage account in the ContosoRGforVM resource group:

```azurecli
az storage account create --name storage135 --location eastus --sku Standard_LRS
```

Notice that there's no resource group specified in the command. For more information, see [Set a default resource group](manage-azure-groups-azure-cli.md#set-a-default-resource-group).

> [!TIP]
> Commands getting values for parameters in different ways can be confusing. If a command gives an unexpected result, such as not being able to find a resource group, there may be a default value.
>
> If you encounter an error, run the command again with the parameter and value specified. An explicit value for a parameter always takes precedence over other options.

You can specify values for several parameters this way. For more information, seed [Azure CLI configuration](azure-cli-configuration.md).

## Use persistent values

Persisted parameter values allow you to specify a value only once. If you're doing several related actions in a resource group, you don't have to specify that group repeatedly.

Run this command to persist a parameter value:

```azurecli
az config param-persist on
```

After turning on persistence, create a resource group:

 ```azurecli
az group create --name ContosoStorageRG --location eastus
```

As long as persistence is on, your can leave the `--resource-group` parameter out of future commands. The following command creates a storage account in the **ContosoStorageRG** group:

```azurecli
az storage account create --name storage135 --location eastus --sku Standard_LRS
```

For more information, see [Azure CLI persisted parameter](/cli/azure/param-persist-howto).

## Next steps

* [Azure CLI persisted parameter](param-persist-howto.md)
* [Working with resource groups in Azure CLI](manage-azure-groups-azure-cli.md)
* [Create an Azure support request in Azure CLI](azure-cli-support-request.md)
