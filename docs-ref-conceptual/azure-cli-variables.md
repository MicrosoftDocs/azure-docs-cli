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

This article discusses various ways to specify values in Azure CLI commands.

[!INCLUDE [azure-cli-prepare-your-environment.md](includes/azure-cli-prepare-your-environment.md)]

## Use shell variables

Azure CLI runs in a shell. This article uses Bash. For information about other shells, see [Use Azure CLI effectively](/cli/azure/use-cli-effectively). You can use variables in Bash to pass values for parameters to commands. Using variables also allows reuse of commands, either piecemeal or in scripts.

This example creates a new storage disk of the same type as the storage disk on an existing virtual machine.

```azurecli
# Assign values to variables
MyResourceGroup=ContosoRGforVM
MySubscription="Contoso subscription"
vmName=VM01

# Get a value for a variable based on an existing virtual machine
osType=$(az vm get-instance-view --resource-group $MyResourceGroup \
   --name $vmName --subscription "$MySubscription" \
   --query 'storageProfile.osDisk.osType' --output tsv)

# Create a disk of the same type by using the variable value
az disk create --resource-group $MyResourceGroup --name DestinationDisk --size-gb 20 --os-type $osType
```

This example assigns values to variables that are reused, like **MyResourceGroup**. A command gets a value to assign to **osType**.

When you assign a value to a variable from another command, be sure that the command uses a compatible output format. The [az vm get-instance-view](/cli/azure/vm#az_vm_get_instance_view) command uses the `tsv` output format. This option returns values without extra formatting, keys, or other symbols. Some output formats include structure or characters like quotation marks. For more information, see [Output formats for Azure CLI commands](/cli/azure/format-output-azure-cli).

In this example, the **MySubscription** variable must be in quotation marks. Its value contains spaces, which the command can't parse. If you work only with subscription IDs, you don't need to use quotation marks.

## Set a subscription

Many commands require a specific subscription. Azure resources exist in resource groups, which exist in subscriptions. Azure CLI uses a default subscription when you are in a session. To see your current subscription value, run the [az account show](/cli/azure/account#az_account_show) command:

```azurecli
az account show --output table
```

You might have access to only one subscription. For more information, see [Use Azure subscriptions with Azure CLI](/cli/azure/manage-azure-subscriptions-azure-cli)
You can use the [az account set](/cli/azure/account#az-account-set) command to set your current subscription:

```azurecli
az account set --subscription "My Demos"
```

After you set your subscription, you can omit `--Subscription` parameter. For more information, see [Use Azure subscriptions with Azure CLI](manage-azure-subscriptions-azure-cli.md).

## Create default values

You can set values for some parameters by using the [az config set](/cli/azure/config#az_config_set) command. This example sets a default resource group:

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

You can specify values for several parameters this way. For more information, see [Azure CLI configuration](azure-cli-configuration.md).

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

As long as persistence is on, your can leave the `--resource-group` parameter out of future commands. The following command creates a storage account in the ContosoStorageRG resource group:

```azurecli
az storage account create --name storage135 --location eastus --sku Standard_LRS
```

For more information, see [Azure CLI persisted parameter](/cli/azure/param-persist-howto).

## Clean up resources

If you created resources to try any of the commands in this article, you can remove them by using the [az group delete](/cli/azure/group#az_group_delete) command:

```azurecli
az group delete --name ContosoRGforVM
az group delete --name ContosoStorageRG
```

This command removes the group and all the resources that it contains at once.

You can remove the persistent parameters by running the [az config param-persist delete](/cli/azure/config/param-persist#az_config_param_persist_delete) command:

```azurecli
az config param-persist delete --all
```

## Next steps

* [Azure CLI persisted parameter](param-persist-howto.md)
* [Working with resource groups in Azure CLI](manage-azure-groups-azure-cli.md)
* [Create an Azure support request in Azure CLI](azure-cli-support-request.md)
