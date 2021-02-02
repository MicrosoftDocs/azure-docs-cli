---
title: Manage Azure subscriptions with the Azure CLI
description: Learn about Azure tenants, users, and subscriptions. Use Azure CLI to manage your subscriptions, create management groups, and lock subscriptions.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 01/29/2021
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
---

# Use Azure subscriptions with Azure CLI

You might have multiple subscriptions within Azure. You can be part of more than one organization or your organization might divide access to certain resources across groupings. The Azure CLI supports selecting a subscription both globally and per command.

For detailed information on subscriptions, billing, and cost management, see the [billing and cost management documentation](/azure/billing/).

## Tenants, users, and subscriptions

A _tenant_ is the Azure Active Directory entity that encompasses a whole organization. A tenant has one or more _subscription_ and _user_. A user is an individual and is associated with only one tenant, the organization that they belong to. Users are those accounts that sign in to Azure to create, manage, and use resources. A user may have access to multiple _subscriptions_, which are the agreements with Microsoft to use cloud services, including Azure. Every resource is associated with a subscription.

* To learn more about the differences between tenants, users, and subscriptions, see the [Azure cloud terminology dictionary](/azure/azure-glossary-cloud-terminology).
* To learn how to add a new subscription to your Azure Active Directory tenant, see [Associate or add an Azure subscription to your Azure Active Directory tenant](/azure/active-directory/active-directory-how-subscriptions-associated-directory).
* To learn how to sign in to a specific tenant, see [Sign in with the Azure CLI](./authenticate-azure-cli.md).

## Commands in a subscription

Many Azure CLI commands act within a subscription. You can always specify which subscription to work in by using the **subscription** parameter in your command. That parameter is optional. If you don't specify a subscription, the command uses your current, active subscription.

To see the subscription you're currently using, run the [az account show](/cli/azure/account#az_account_show) command:

```azurecli
az account show --output table
```

> [!TIP]
> The `--output` parameter is a global parameter, available for all commands. The **table** value presents output in a friendly format. For more information, see [Output formats for Azure CLI commands](/cli/azure/format-output-azure-cli).

Subscriptions contain resource groups. An Azure resource group is a container that holds related resources for an Azure solution. If your command works with resources in your active subscription, you don't need to specify `--subscription`.

This command creates a storage account in the specified resource group:

```azurecli
az storage account create --resource-group StorageGroups --name storage136 \
    --location eastus --sku Standard_LRS
```

If the storage group isn't part of your current active subscription, this command fails.

If necessary, change the active subscription, as described in the next section, or specify the subscription in the command:

```azurecli
az storage account create --resource-group StorageGroups --subscription "My Demos" \
    --name storage136 --location eastus --sku Standard_LRS
```

## Change the active subscription

You can change your active subscription by using the [az account set](/cli/azure/account#az-account-set) command.

Get a list of your subscriptions with the [az account list](/cli/azure/account#az-account-list) command:

```azurecli
az account list --output table
```

This command lists all the subscriptions you can access. Your active subscription is marked as `True` in the `IsDefault` column. If you don't see a subscription you expect, add the `--refresh` parameter to get the most current list of subscriptions.

To switch to a different subscription, use [az account set](/cli/azure/account#az-account-set) with the subscription ID or name you want to switch to.

```azurecli
az account set --subscription "My Demos"
```

Your subscriptions have both a name and an ID, which is a GUID. You can use either for these commands. If you use a name that includes spaces, use quotation marks.

If you run the [az account list](/cli/azure/account#az-account-list) command again, the `IsDefault` column shows your current active subscription.

## Create management groups

Azure management groups contain subscriptions. Management groups provide a way to manage access, policies, and compliance for those subscriptions. For more information, see [What are Azure management groups](/azure/governance/management-groups/overview).

Use the [az account management-group](/cli/azure/account/management-group) commands to create and manage Azure Management Groups.

You can create a management group for several of your subscriptions by using the [az account management-group create](/cli/azure/account/management-group#az_account_management_group_create) command:

```azurecli
az account management-group create --name Contoso01
```

To see all your management groups, use the [az account management-group list](/cli/azure/account/management-group#az_account_management_group_list) command:

```azurecli
az account management-group list
```

Add subscriptions to your new group by using the [az account management-group subscription add](/cli/azure/account/management-group/subscription#az_account_management_group_subscription_add) command:

```azurecli
az account management-group subscription add --name Contoso01 --subscription "My Demos"
az account management-group subscription add --name Contoso01 --subscription "My Second Demos"
```

To remove a subscription, use the [az account management-group subscription remove](/cli/azure/account/management-group/subscription#az_account_management_group_subscription_remove) command:

```azurecli
az account management-group subscription remove --name Contoso01 --subscription "My Demos"
```

To remove a management group, run the [az account management-group delete](/cli/azure/account/management-group#az_account_management_group_delete) command:

```azurecli
az account management-group delete --name Contoso01
```

Removing a subscription or deleting a management group doesn't delete or deactivate a subscription.

## Set a subscription lock

As an administrator, you may need to lock a subscription to prevent users from deleting or modifying it. For more information, see [Lock resources to prevent unexpected changes](/azure/azure-resource-manager/management/lock-resources).

In Azure CLI, use the [az account lock](/cli/azure/account/lock) commands. For instance, the [az account lock create](/cli/azure/account/lock#az_account_lock_create) command can prevent users from deleting a subscription:

```azurecli
az account lock create --name "Cannot delete subscription" --lock-type CanNotDelete
```

> [!NOTE]
> You need to have appropriate permissions to create or change locks.

To see the current locks on your subscription, use the [az account lock list](/cli/azure/account/lock#az_account_lock_list) command:

```azurecli
az account lock list --output table
```

If you make an account read-only, the result resembles assigning permissions of the Reader role to all users. To learn about setting permissions for individual users and roles, see [Add or remove Azure role assignments using Azure CLI](/azure/role-based-access-control/role-assignments-cli).

To see details for a lock, use the [az account lock show](/cli/azure/account/lock#az_account_lock_show) command:

```azurecli
az account lock show --name "Cannot delete subscription"
```

You can remove a lock by using the [az account lock delete](/cli/azure/account/lock#az_account_lock_delete) command:

```azurecli
az account lock delete --name "Cannot delete subscription"
```

## See also

* [Azure cloud terminology dictionary](/azure/azure-glossary-cloud-terminology)
* [Associate or add an Azure subscription to your Azure Active Directory tenant](/azure/active-directory/active-directory-how-subscriptions-associated-directory)
* [Sign in with Azure CLI](./authenticate-azure-cli.md)
