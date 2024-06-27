---
title: How to use variables in Azure CLI commands | Microsoft Docs
description: Learn about specifying values directly in Azure CLI commands by using shell variables, setting a subscription, creating default values, or using persistent values.
author: dbradish-microsoft
ms.author: dbradish
ms.service: azure-cli
ms.topic: how-to
ms.date: 01/29/2024
ms.tool: azure-cli
ms.custom: template-how-to, devx-track-azurecli, seo-azure-cli
keywords: azure cli variables, azure cli commands, value of variable, shell variables
---

# How to use variables in Azure CLI commands

In addition to specifying values directly in a command, you can provide values in several ways:

* Use shell variables
* Set a subscription for use in multiple commands
* Create default values for some parameters

This article discusses various ways to specify values in Azure CLI commands.

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment.md)]

## Use shell variables

Azure CLI runs in a shell. This article uses Bash. For information about other scripting languages, see [Choose the right Azure command-line tool](./choose-the-right-azure-command-line-tool.md). You can use variables in Bash to pass values for parameters to commands. Using variables with the Azure CLI also allows reuse of commands, either piecemeal or in scripts.

This example creates a new storage disk of the same type as the storage disk on an existing virtual machine.

# [Bash](#tab/bash)

```azurecli
# Bash script
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

# [PowerShell](#tab/powershell)

```azurecli
# PowerShell script
# Assign values to variables
$MyResourceGroup = "ContosoRGforVM"
$MySubscription = "Contoso subscription"
$vmName = "VM01"

# Get a value for a variable based on an existing virtual machine
$osType=$(az vm get-instance-view --resource-group $MyResourceGroup `
   --name $vmName --subscription $MySubscription `
   --query 'storageProfile.osDisk.osType' --output tsv)

# Create a disk of the same type by using the variable value
az disk create --resource-group $MyResourceGroup --name DestinationDisk --size-gb 20 --os-type $osType
```

---
This example shows how to assign values to variables that are reused, like **MyResourceGroup** and **osType**. The command [az vm get-instance-view](/cli/azure/vm#az_vm_get_instance_view) combined with the query `storageProfile.osDisk.osType` returns the disk's OS type. Wrapping the command with `$()` assigns the command's return value to `osType`. To learn more about `--query` and JMESPath queries see [How to query Azure CLI command output using a JMESPath query](./use-azure-cli-successfully-query.md).

When you assign a value to a variable from another command, be sure that the command uses a compatible output format. The [az vm get-instance-view](/cli/azure/vm#az_vm_get_instance_view) command uses the `tsv` output format. This option returns values without extra formatting, keys, or other symbols. Some output formats include structure or characters like quotation marks. For more information, see [Output formats for Azure CLI commands](./format-output-azure-cli.md).

In this example, the **MySubscription** variable must be in quotation marks. The value of the variable contains spaces, which the command can't parse. If you work only with subscription IDs, you don't need to use quotation marks.

## Set a subscription

Many commands require a specific subscription. Azure resources exist in resource groups, which exist in subscriptions. Azure CLI uses a default subscription when you are in a session. To see your current subscription value, run the [az account show](/cli/azure/account#az_account_show) command:

```azurecli
az account show --output table
```

You might have access to only one subscription. For more information, see [Use Azure subscriptions with Azure CLI](./manage-azure-subscriptions-azure-cli.md)
You can use the [az account set](/cli/azure/account#az_account_set) command to set your current subscription:

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

## Clean up resources

If you created resources to try any of the commands in this article, you can remove them by using the [az group delete](/cli/azure/group#az_group_delete) command:

```azurecli
az group delete --name ContosoRGforVM
az group delete --name ContosoStorageRG
```

This command removes the group and all the resources that it contains at once.

## See also

* [Learn to use Bash with the Azure CLI](./use-azure-cli-successfully-bash.md)
* [Tips to use the Azure CLI successfully](./use-azure-cli-successfully-tips.md)
* [How to query Azure CLI command output](./use-azure-cli-successfully-query.md)
