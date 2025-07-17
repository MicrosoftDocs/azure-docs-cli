---
title: How to manage Azure resource groups with the Azure CLI
description: Learn how to manage Azure resource groups in the Azure CLI, a cross-platform tool to connect to Azure and execute administrative commands on Azure resources.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: Azure resource groups, resource group in azure
---

# How to manage Azure resource groups with the Azure CLI

An Azure resource group is a container that holds related resources for an Azure solution. A
resource group might contain storage, virtual machines, apps, dashboards, services, or anything you
deal with in Azure.

The Azure Command-Line Interface (CLI) allows you to create, persist, and set default Azure resource
groups. The Azure CLI also enables you to clean up resources after they're created.

## Azure Region Identification

Azure customers can choose to deploy resources in several different regions. Sometimes, customers
can reduce costs by selecting nearby regions that offer the same services. If a nearby region is
identified, a message displays the region for selection in future deployments.

In the following example, the `az config` command is used to turn off the region recommendation
message:

```azurecli
az config set core.display_region_identified=no
```

For more information about Azure regions, see [Choose the right Azure region for you][16].

## Create a resource group

To create a resource group, use the [az group create][11] command:

```azurecli
az group create --name MyResourceGroup --location eastus
```

A resource group is associated with a single location. To see all the locations supported in your
current subscription, run the [az account list-locations][07] command:

```azurecli
az account list-locations
```

To see all the resource groups for your current subscription, use the [az group list][13] command:

```azurecli
az group list --output table
```

> [!TIP]
> The `--output` parameter is a global parameter, available for all commands. The `table` value
> presents output in a friendly format. For more information, see
> [Output formats for Azure CLI commands][03].

When you create a resource, it resides within a resource group. The following example shows a
storage account created using the [az storage account create][15] command:

```azurecli
az storage account create --resource-group MyResourceGroup --name storage134 --location eastus --sku Standard_LRS
```

To remove a resource group, run the [az group delete][12] command:

```azurecli
az group delete --name MyResourceGroup
```

When you remove a resource group, you delete all the resources that are contained within it. You
can't undo this action. If you try any of the commands in this article, deleting the resource groups
you create cleans up your account.

## Set a default resource group

You can set a default resource group for all the commands that you run from your local Azure CLI or
Azure Cloud Shell. Azure CLI stores this configuration locally in a _config_ file. To see your
current configuration, run the [az config get][08] command:

```azurecli
az config get
```

The result shows default resource groups and other default values. If you're using Azure CLI for the
first time, the results might be empty.

To set a default resource group for your Azure CLI installation, run the [az config set][09]
command:

```azurecli
az config set defaults.group=MyResourceGroup
```

The command sets a value for a specified key, in this case, `defaults.group`. For available
configuration options, see [Azure CLI configuration][02].

> [!NOTE]
> The [az config set][09] command doesn't verify the existence of the resource group you enter. The
> command simply stores the key-value pair.

After you run the command, the following two commands give you the same result:

```azurecli
az storage account create --resource-group MyResourceGroup --name storage01  --location eastus --sku Standard_LRS
az storage account create --name storage01 --location eastus --sku Standard_LRS
```

A resource group is associated with a subscription. If your organization has more than one
subscription, you must change to the desired subscription before working with a resource group in
that subscription. If the default value of a resource group doesn't belong to your current
subscription, an error results. For more information about multiple subscriptions, see
[Use multiple Azure subscriptions][04].

You don't have to reset the default to use other resource groups. Instead, specify the resource
group:

```azurecli
az group create --name OtherResourceGroup --location eastus
az storage account create --resource-group StorageGroups --name storage03  --location westus --sku Standard_LRS
```

The default value is for you only. It doesn't affect other users or changes you make through the
Azure portal.

If you're using persisted parameter values, as described in this article, those values take
precedence over defaults set in the _config_ file.

## Set a resource group lock

As an administrator, you might need to lock a resource group to prevent users from deleting or
modifying it. For more information, see [Lock resources to prevent unexpected changes][05].

In Azure CLI, use the [az group lock][01] commands. For instance, the [az account lock create][06]
command can prevent users from deleting a resource group:

```azurecli-interactive
az group lock create --name "Cannot delete resource group" --lock-type CanNotDelete
```

> [!NOTE]
> You need to have `contributor` permissions on a resource group to create or change locks.

To see the current locks on your resource group, use the [az group lock list][10] command:

```azurecli-interactive
az group lock list --output table
```

## Clean up resources

If you tried any of the commands in this article, you can remove the resources you created using the
[az group delete][14] command:

```azurecli
az group delete --name MyResourceGroup
az group delete --name OtherResourceGroup
az group delete --name StorageGroups
```

This command removes the group and all its associated resources.

## See also

- [Azure CLI configuration][02]
- [Manage Azure subscriptions][04]

<!-- updated link references -->

[01]: ../../docs-ref-autogen/Latest-version/latest/group/lock.yml
[02]: ./azure-cli-configuration.md
[03]: ./format-output-azure-cli.md
[04]: ./manage-azure-subscriptions-azure-cli.md
[05]: /azure/azure-resource-manager/management/lock-resources
[06]: /cli/azure/account/lock#az-account-lock-create
[07]: /cli/azure/account#az_account_list_locations
[08]: /cli/azure/config#az_config_get
[09]: /cli/azure/config#az_config_set
[10]: /cli/azure/group/lock#az-group-lock-list
[11]: /cli/azure/group#az_group_create
[12]: /cli/azure/group#az_group_delete
[13]: /cli/azure/group#az_group_list
[14]: /cli/azure/group#az-group-delete
[15]: /cli/azure/storage/account#az_storage_account_create
[16]: https://azure.microsoft.com/explore/global-infrastructure/geographies/#overview
