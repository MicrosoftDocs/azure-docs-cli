---
title: How to manage Azure subscriptions – Azure CLI | Microsoft Docs
description: Learn about Azure tenants, users, and subscriptions. Use Azure CLI to manage your subscriptions, create management groups, and lock subscriptions.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 01/12/2024
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: Azure subscriptions, manage azure subscriptions, azure management groups, azure cli set subscription, azure cli select subscription
---

# How to manage Azure subscriptions with the Azure CLI

The Azure CLI helps you manage your Azure subscription, create management groups, and lock subscriptions.You might have multiple subscriptions within Azure. You can be part of more than one organization or your organization might divide access to certain resources across groupings. The Azure CLI supports selecting a subscription both globally and per command.

For detailed information on subscriptions, billing, and cost management, see the [billing and cost management documentation](/azure/billing/).

## Terminology

A _tenant_ is an instance of Microsoft Entra ID in which information about a single organization resides. A _[multi-tenant organization](/azure/active-directory/multi-tenant-organizations/overview)_ is an organization that has more than one instance of Microsoft Entra ID. A tenant has one or more _subscriptions_ and _users_.

Users are those accounts that sign in to Azure to create, manage, and use resources. A user may have access to multiple _tenants_ and _subscriptions_.

_[Subscriptions](/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-subscriptions)_ are the agreements with Microsoft to use cloud services, including Azure. Every resource is associated with a subscription. Subscriptions contain resource groups.

An Azure _resource group_ is a container that holds related resources for an Azure solution. To learn how to manage resource groups within your subscription, see [How to manage Azure resource groups with the Azure CLI](manage-azure-groups-azure-cli.md)

## Get the active tenant

Use [az account tenant list](/cli/azure/account/tenant) or [az account show](/cli/azure/account#az-account-show) to get the active tenant ID.

```azurecli-interactive
az account tenant list

az account show
```

## Change the active tenant

To switch tenants, you have two options.

- [Change the active subscription.](#change-the-active-subscription)

- Sign in as a user within the desired tenant. Use [az login](/cli/azure/reference-index#az-login-examples) to change the active tenant and update the subscription list to which you belong.

    ```azurecli-interactive
    # sign in as a different user
    az login --user <myAlias@myCompany.com> --password <myPassword>
    
    # sign in with a different tenant
    az login --tenant <myTenantID>
    ```

    If your organization requires multi-factor authentication, you may receive this error when using `az login --user`:

    ```output
    Due to a configuration change made by your administrator, or because you moved to a new location, you must use multi-factor authentication to access...
    ```

    Using the alternative `az login --tenant` command prompts you to open an HTTPS page and enter the code provided. You can then use multi-factor authentication and successfully sign in. To learn more about sign in options with the azure CLI, see [Sign in with the Azure CLI](./authenticate-azure-cli.md).

## Get subscription information

Most Azure CLI commands act within a subscription. You can specify which subscription to work in by using the `--subscription` parameter in your command. If you don't specify a subscription, the command uses your current, active subscription.

To see the subscription you're currently using or to get a list of available subscriptions, run the [az account show](/cli/azure/account#az-account-show) or [az account list](/cli/azure/account#az-account-list) command. Go to [Learn to use Bash with the Azure CLI](azure-cli-learn-bash.md#querying-and-formatting-single-values-and-nested-values) to see more examples of ways to use these commands.

Here are examples showing how to get subscription information:

```azurecli-interactive
# get the current default subscription using show
az account show --output table

# get the current default subscription using list
az account list --query "[?isDefault]"

# get a subscription that contains search words or phrases
az account list --query "[?contains(name,'search phrase')].{SubscriptionName:name, SubscriptionID:id, TenantID:tenantId}" --output table
```
You can also store subscription information in a variable for use within a script.

# [Bash](#tab/bash)

```azurecli
# store the default subscription in a variable
subscriptionId="$(az account list --query "[?isDefault].id" --output tsv)"
echo $subscriptionId

# store a subscription of certain name in a variable
subscriptionId="$(az account list --query "[?name=='my case sensitive subscription full name'].id" --output tsv)"
echo $subscriptionId
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# store the default subscription in a variable
$subscriptionId = az account list --query "[?isDefault].id" --output tsv
Write-Host $subscriptionId

# store a subscription of certain name in a variable
$subscriptionId = az account list --query "[?name=='my case sensitive subscription full name'].id" --output tsv
Write-Host $subscriptionId
```

---
> [!TIP]
> The `--output` parameter is a global parameter, available for all commands. The **table** value presents output in a friendly format. For more information, see [Output formats for Azure CLI commands](./format-output-azure-cli.md).

## Change the active subscription

Azure subscriptions have both a name and an ID. You can switch to a different subscription using [az account set](/cli/azure/account#az-account-set) specifying the desired subscription ID or name.

```azurecli-interactive
# change the active subscription using the subscription name
az account set --subscription "My Demos"

# change the active subscription using the subscription ID
az account set --subscription "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
```
You can also change your subscription using a variable. Here is an example:

 # [Bash](#tab/bash)

```azurecli-interactive
# change the active subscription using a variable
subscriptionId="$(az account list --query "[?name=='my case sensitive subscription full name'].id" --output tsv)"
az account set --subscription $subscriptionId
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# change the active subscription using a variable
$subscriptionId = az account list --query "[?name=='my case sensitive subscription full name'].id" -o tsv
az account set --subscription $subscriptionId
```

---

If you change to a subscription that is in a different tenant, you will also be changing the active tenant. To learn how to add a new subscription to your Microsoft Entra tenant, see [Associate or add an Azure subscription to your Microsoft Entra tenant](/azure/active-directory/active-directory-how-subscriptions-associated-directory).

If you received a "The subscription of ... doesn't exist..." error, see [Troubleshooting](#troubleshooting) for possible solutions.

## Create Azure management groups

Azure management groups contain subscriptions. Management groups provide a way to manage access, policies, and compliance for those subscriptions. For more information, see [What are Azure management groups](/azure/governance/management-groups/overview).

Use the [az account management-group](../latest/docs-ref-autogen/account/management-group.yml) commands to create and manage Azure Management Groups.

You can create a management group for several of your subscriptions by using the [az account management-group create](/cli/azure/account/management-group#az-account-management-group-create) command:

```azurecli-interactive
az account management-group create --name Contoso01
```

To see all your management groups, use the [az account management-group list](/cli/azure/account/management-group#az-account-management-group-list) command:

```azurecli-interactive
az account management-group list
```

Add subscriptions to your new group by using the [az account management-group subscription add](/cli/azure/account/management-group/subscription#az-account-management-group-subscription-add) command:

```azurecli-interactive
az account management-group subscription add --name Contoso01 --subscription "My Demos"
az account management-group subscription add --name Contoso01 --subscription "My Second Demos"
```

To remove a subscription, use the [az account management-group subscription remove](/cli/azure/account/management-group/subscription#az-account-management-group-subscription-remove) command:

```azurecli-interactive
az account management-group subscription remove --name Contoso01 --subscription "My Demos"
```

To remove a management group, run the [az account management-group delete](/cli/azure/account/management-group#az-account-management-group-delete) command:

```azurecli-interactive
az account management-group delete --name Contoso01
```

Removing a subscription or deleting a management group doesn't delete or deactivate a subscription.

## Set an Azure subscription lock

As an administrator, you may need to lock a subscription to prevent users from deleting or modifying it. For more information, see [Lock resources to prevent unexpected changes](/azure/azure-resource-manager/management/lock-resources).

In Azure CLI, use the [az account lock](../latest/docs-ref-autogen/account/lock.yml) commands. For instance, the [az account lock create](/cli/azure/account/lock#az-account-lock-create) command can prevent users from deleting a subscription:

```azurecli-interactive
az account lock create --name "Cannot delete subscription" --lock-type CanNotDelete
```

> [!NOTE]
> You need to have `contributor` permissions on a subscription to create or change locks.

To see the current locks on your subscription, use the [az account lock list](/cli/azure/account/lock#az-account-lock-list) command:

```azurecli-interactive
az account lock list --output table
```

If you make an account read-only, the result resembles assigning permissions of the Reader role to all users. To learn about setting permissions for individual users and roles, see [Add or remove Azure role assignments using Azure CLI](/azure/role-based-access-control/role-assignments-cli).

To see details for a lock, use the [az account lock show](/cli/azure/account/lock#az-account-lock-show) command:

```azurecli-interactive
az account lock show --name "Cannot delete subscription"
```

You can remove a lock by using the [az account lock delete](/cli/azure/account/lock#az-account-lock-delete) command:

```azurecli-interactive
az account lock delete --name "Cannot delete subscription"
```

## Troubleshooting

### The subscription doesn't exist

In addition to a typographical error, you can receive this error when there is a permissions timing issue. For example, if you have been given permissions to a new subscriptions _while your current terminal window is open_, this error can occur. The solution is to either close and reopen your terminal window, or use `az logout` then `az login` to refresh your available subscriptions list.

Here is a script to help you find and change a subscription.

```azurecli
# See what subscription you are currently using.
az account show

# Get a list of available subscriptions.
az account list --output table

# If the subscription you are seeking is not in the list
#   close and reopen your terminal window,
#   or logout and then sign in again.
az logout
az login

# Did your available subscription list change?
az account list --output table

# If the subscription you are seeking is still not in the list,
#    contact your system administrator. You cannot change your
#    subscription to an ID that is not in the list.

# If the subscription you are seeking is now in the list,
#   change your subscription.
az account set --subscription 00000000-0000-0000-0000-00000000000
```

## See also

- [Associate or add an Azure subscription to your Microsoft Entra tenant](/azure/active-directory/active-directory-how-subscriptions-associated-directory)
- [Manage Azure resource groups](./manage-azure-groups-azure-cli.md)
