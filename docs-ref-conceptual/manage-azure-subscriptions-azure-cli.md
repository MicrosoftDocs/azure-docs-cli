---
title: How to manage Azure subscriptions – Azure CLI | Microsoft Docs
description: Learn about Azure tenants, users, and subscriptions. Use Azure CLI to manage your subscriptions, create management groups, and lock subscriptions.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 08/19/2021
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azurecli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: Azure subscriptions, manage azure subscriptions, azure management groups, azure cli set subscription, azure cli select subscription
---

# How to manage Azure subscriptions with the Azure CLI

The Azure CLI helps you manage your Azure subscription, create management groups, and lock subscriptions.  You might have multiple subscriptions within Azure. You can be part of more than one organization or your organization might divide access to certain resources across groupings. The Azure CLI supports selecting a subscription both globally and per command.

For detailed information on subscriptions, billing, and cost management, see the [billing and cost management documentation](/azure/billing/).

## Tenants, users, and subscriptions

A _tenant_ is the Azure Active Directory entity that encompasses a whole organization. A tenant has one or more _subscription_ and _user_. A user is an individual and is associated with only one tenant, the organization that they belong to. Users are those accounts that sign in to Azure to create, manage, and use resources. A user may have access to multiple _subscriptions_, which are the agreements with Microsoft to use cloud services, including Azure. Every resource is associated with a subscription.

* To learn more about the differences between tenants, users, and subscriptions, see the [Azure cloud terminology dictionary](/azure/azure-glossary-cloud-terminology).
* To learn how to add a new subscription to your Azure Active Directory tenant, see [Associate or add an Azure subscription to your Azure Active Directory tenant](/azure/active-directory/active-directory-how-subscriptions-associated-directory).
* To learn how to sign in to a specific tenant, see [Sign in with the Azure CLI](./authenticate-azure-cli.md).

## Get the active subscription

Most Azure CLI commands act within a subscription.  For optimum security, most Azure CLI commands no longer default the subscription to your current, active subscription.  You must now specify the subscription to work in by using the `--subscription` or `--scope` parameter in your command.

To see the subscription you're currently using or to get a list of available subscriptions, run the [az account show](/cli/azure/account#az-account-show) or [az account list](/cli/azure/account#az-account-list) command.  See [Learn to use Bash with the Azure CLI](azure-cli-learn-bash.md#querying-and-formatting-single-values-and-nested-values) to learn how to work with multiple subscription values.

```azurecli
# get the current default subscription using show
az account show --output table

# get the current default subscription using list
az account list --query "[?isDefault]"

# store the default subscription  in a variable
subscriptionId="$(az account list --query "[?isDefault].id" -o tsv)"
echo $subscriptionId
```

Use [az account tenant list](/cli/azure/account/tenant) to get the active tenant ID.

> [!TIP]
> The `--output` parameter is a global parameter, available for all commands. The **table** value presents output in a friendly format. For more information, see [Output formats for Azure CLI commands](./format-output-azure-cli.md).

Subscriptions contain resource groups. An Azure resource group is a container that holds related resources for an Azure solution. To learn how to manage resource groups within your subscription, see [How to manage Azure resource groups with the Azure CLI](manage-azure-groups-azure-cli.md)

## Change the active subscription

Azure subscriptions have both a name and an ID.  You can switch to a different subscription using [az account set](/cli/azure/account#az-account-set) specifying the subscription ID or name you want to switch to.

```azurecli
# change the active subscription using the subscription name
az account set --subscription "My Demos"

# change the active subscription using the subscription ID
az account set --subscription "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

# change the active subscription using a variable
subscriptionId="$(az account list --query "[?isDefault].id" -o tsv)"
az account set --subscription $subscriptionId
```

If you change your active subscription to a subscription within another tenant, you have also just changed your active tenant.  See [Sign in with Azure CLI](authenticate-azure-cli#sign-in-with-a-different-tenant) to learn how to switch the active tenant directly using `az login`.  You can see the tenant ID associated with the active subscription by using the `az account show` or [az account tenant list](/cli/azure/account/tenant) commands.

## Create Azure management groups

Azure management groups contain subscriptions. Management groups provide a way to manage access, policies, and compliance for those subscriptions. For more information, see [What are Azure management groups](/azure/governance/management-groups/overview).

Use the [az account management-group](../latest/docs-ref-autogen/account/management-group.yml) commands to create and manage Azure Management Groups.

You can create a management group for several of your subscriptions by using the [az account management-group create](/cli/azure/account/management-group#az-account-management-group-create) command:

```azurecli
az account management-group create --name Contoso01
```

To see all your management groups, use the [az account management-group list](/cli/azure/account/management-group#az-account-management-group-list) command:

```azurecli
az account management-group list
```

Add subscriptions to your new group by using the [az account management-group subscription add](/cli/azure/account/management-group/subscription#az-account-management-group-subscription-add) command:

```azurecli
az account management-group subscription add --name Contoso01 --subscription "My Demos"
az account management-group subscription add --name Contoso01 --subscription "My Second Demos"
```

To remove a subscription, use the [az account management-group subscription remove](/cli/azure/account/management-group/subscription#az-account-management-group-subscription-remove) command:

```azurecli
az account management-group subscription remove --name Contoso01 --subscription "My Demos"
```

To remove a management group, run the [az account management-group delete](/cli/azure/account/management-group#az-account-management-group-delete) command:

```azurecli
az account management-group delete --name Contoso01
```

Removing a subscription or deleting a management group doesn't delete or deactivate a subscription.

## Set an Azure subscription lock

As an administrator, you may need to lock a subscription to prevent users from deleting or modifying it. For more information, see [Lock resources to prevent unexpected changes](/azure/azure-resource-manager/management/lock-resources).

In Azure CLI, use the [az account lock](../latest/docs-ref-autogen/account/lock.yml) commands. For instance, the [az account lock create](/cli/azure/account/lock#az-account-lock-create) command can prevent users from deleting a subscription:

```azurecli
az account lock create --name "Cannot delete subscription" --lock-type CanNotDelete
```

> [!NOTE]
> You need to have appropriate permissions to create or change locks.

To see the current locks on your subscription, use the [az account lock list](/cli/azure/account/lock#az-account-lock-list) command:

```azurecli
az account lock list --output table
```

If you make an account read-only, the result resembles assigning permissions of the Reader role to all users. To learn about setting permissions for individual users and roles, see [Add or remove Azure role assignments using Azure CLI](/azure/role-based-access-control/role-assignments-cli).

To see details for a lock, use the [az account lock show](/cli/azure/account/lock#az-account-lock-show) command:

```azurecli
az account lock show --name "Cannot delete subscription"
```

You can remove a lock by using the [az account lock delete](/cli/azure/account/lock#az-account-lock-delete) command:

```azurecli
az account lock delete --name "Cannot delete subscription"
```

## See also

* [Azure cloud terminology dictionary](/azure/azure-glossary-cloud-terminology)
* [Associate or add an Azure subscription to your Azure Active Directory tenant](/azure/active-directory/active-directory-how-subscriptions-associated-directory)
* [Manage Azure resource groups](./manage-azure-groups-azure-cli.md)
