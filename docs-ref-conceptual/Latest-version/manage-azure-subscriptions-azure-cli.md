---
title: How to manage Azure subscriptions with the Azure CLI
description: Learn about Azure tenants, users, and subscriptions. Use Azure CLI to manage your subscriptions, create management groups, and lock subscriptions.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: Azure subscriptions, manage azure subscriptions, azure management groups, azure cli set subscription, azure cli select subscription
---

# How to manage Azure subscriptions with the Azure CLI

The Azure CLI helps you manage your Azure subscription, create management groups, and lock
subscriptions. You might have several subscriptions within Azure. You can be part of more than one
organization, or your organization might divide access to specific resources across groupings. The
Azure CLI supports selecting a subscription both globally and per command.

For detailed information on subscriptions, billing, and cost management, see the
[billing and cost management documentation][09].

## Terminology

A _tenant_ is an instance of Microsoft Entra ID in which information about a single organization
resides. A _[multitenant organization][07]_ is an organization that has more than one instance of
Microsoft Entra ID. A tenant has one or more _subscriptions_ and _users_.

Users are those accounts that sign in to Azure to create, manage, and use resources. A user might
have access to several _tenants_ and _subscriptions_.

_[Subscriptions][10]_ are agreements with Microsoft to use cloud services, including Azure. Every
resource is associated with a subscription. Subscriptions contain resource groups.

An Azure _resource group_ is a container that holds related resources for an Azure solution. To
learn how to manage resource groups within your subscription, see
[How to manage Azure resource groups with the Azure CLI][30]

## Get the active tenant

Use [az account tenant list][22] or [az account show][26] to get the active tenant ID.

```azurecli-interactive
az account tenant list

az account show
```

## Change the active tenant

To switch tenants, you have two options.

- [Change the active subscription.][28]

- Sign in as a user within the desired tenant. Use [az login][27] to change the active tenant and
  update the subscription list to which you belong.

    ```azurecli-interactive
    # sign in as a different user
    az login --user <myAlias@myCompany.com> --password <myPassword>
    
    # sign in with a different tenant
    az login --tenant <myTenantID>
    ```

    If your organization requires multifactor authentication, you might receive this error when
    using `az login --user`:

    ```Output
    Due to a configuration change made by your administrator, or because you moved to a new
    location, you must use multi-factor authentication to access...
    ```

    Using the alternative `az login --tenant` command prompts you to open an HTTPS page and enter
    the code provided. You can then use multifactor authentication and successfully sign in. To
    learn more about sign in options with the Azure CLI, see [Sign in with the Azure CLI][03].

## Get subscription information

Most Azure CLI commands act within a subscription. You can specify which subscription to work in
using the `--subscription` parameter in your command. If you don't specify a subscription, the
command uses your current, active subscription.

To see the subscription you're currently using or to get a list of available subscriptions, run the
[az account show][26] or [az account list][24] command. For more examples of ways to use these
commands, see [Learn to use Bash with the Azure CLI][31].

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
> The `--output` parameter is a global parameter, available for all commands. The `table` value
> presents output in a friendly format. For more information, see
> [Output formats for Azure CLI commands][04].

## Change the active subscription

Azure subscriptions have both a name and an ID. You can switch to a different subscription using
[az account set][25], specifying the desired subscription ID or name.

```azurecli-interactive
# change the active subscription using the subscription name
az account set --subscription "My Demos"

# change the active subscription using the subscription ID
az account set --subscription "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
```

You can also change your subscription using a variable. Here's an example:

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

If you change to a subscription that's in a different tenant, you also change the active tenant. To
learn how to add a new subscription to your Microsoft Entra tenant, see
[Associate or add an Azure subscription to your Microsoft Entra tenant][06].

If you receive a "The subscription of ... doesn't exist..." error, see [Troubleshooting][29] for
possible solutions.

## Clear your subscription cache

To update your subscription list, use the [az account clear][23] command. You must sign in again to
see the updated list.

```Azure CLI
az account clear

az login
```

Clearing your subscription cache isn't technically the same process as logging out of Azure.
However, when you clear your subscription cache, you can't run Azure CLI commands, including
`az account set`, until you sign in again.

## Create Azure management groups

Azure management groups contain subscriptions. Management groups provide a way to manage access,
policies, and compliance for those subscriptions. For more information, see
[What are Azure management groups][11].

Use the [az account management-group][02] commands to create and manage Azure Management Groups.

You can create a management group for several of your subscriptions using the
[az account management-group create][19] command:

```azurecli-interactive
az account management-group create --name Contoso01
```

To see all your management groups, use the [az account management-group list][21] command:

```azurecli-interactive
az account management-group list
```

Add subscriptions to your new group using the [az account management-group subscription add][17]
command:

```azurecli-interactive
az account management-group subscription add --name Contoso01 --subscription "My Demos"
az account management-group subscription add --name Contoso01 --subscription "My Second Demos"
```

To remove a subscription, use the [az account management-group subscription remove][18] command:

```azurecli-interactive
az account management-group subscription remove --name Contoso01 --subscription "My Demos"
```

To remove a management group, run the [az account management-group delete][20] command:

```azurecli-interactive
az account management-group delete --name Contoso01
```

Removing a subscription or deleting a management group doesn't delete or deactivate a subscription.

## Set an Azure subscription lock

As an administrator, you might need to lock a subscription to prevent users from deleting or
modifying it.

In Azure CLI, use the [az account lock][01] commands. For instance, the
[az account lock create][13] command can prevent users from deleting a subscription:

```azurecli-interactive
az account lock create --name "Cannot delete subscription" --lock-type CanNotDelete
```

> [!NOTE]
> You need to have `contributor` permissions on a subscription to create or change locks.

To see the current locks on your subscription, use the [az account lock list][15] command:

```azurecli-interactive
az account lock list --output table
```

If you make an account read-only, the result resembles assigning permissions of the _Reader_ role to
all users. To learn about setting permissions for individual users and roles, see
[Add or remove Azure role assignments using Azure CLI][12].

To see details for a lock, use the [az account lock show][16] command:

```azurecli-interactive
az account lock show --name "Cannot delete subscription"
```

You can remove a lock using the [az account lock delete][14] command:

```azurecli-interactive
az account lock delete --name "Cannot delete subscription"
```

For more information, see [Lock resources to prevent unexpected changes][08].

## Troubleshooting

### The subscription doesn't exist

In addition to a typographical error, you can receive this error when there's a permissions timing
issue. For example, if you're granted permissions to a new subscription _while your current terminal
window is open_, this error can occur. The solution is to either close and reopen your terminal
window or use `az logout` and then `az login` to refresh your available subscriptions list.

Here's a script to help you find and change a subscription.

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

# You can also clear your cache to refresh the
#    available subscription list
az account clear
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

- [Associate or add an Azure subscription to your Microsoft Entra tenant][06]
- [Manage Azure resource groups][05]

<!-- link references -->

[01]: ../../docs-ref-autogen/Latest-version/latest/account/lock.yml
[02]: ../../docs-ref-autogen/Latest-version/latest/account/management-group.yml
[03]: ./authenticate-azure-cli.md
[04]: ./format-output-azure-cli.md
[05]: ./manage-azure-groups-azure-cli.md
[06]: /azure/active-directory/active-directory-how-subscriptions-associated-directory
[07]: /azure/active-directory/multi-tenant-organizations/overview
[08]: /azure/azure-resource-manager/management/lock-resources
[09]: /azure/billing/
[10]: /azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-subscriptions
[11]: /azure/governance/management-groups/overview
[12]: /azure/role-based-access-control/role-assignments-cli
[13]: /cli/azure/account/lock#az-account-lock-create
[14]: /cli/azure/account/lock#az-account-lock-delete
[15]: /cli/azure/account/lock#az-account-lock-list
[16]: /cli/azure/account/lock#az-account-lock-show
[17]: /cli/azure/account/management-group/subscription#az-account-management-group-subscription-add
[18]: /cli/azure/account/management-group/subscription#az-account-management-group-subscription-remove
[19]: /cli/azure/account/management-group#az-account-management-group-create
[20]: /cli/azure/account/management-group#az-account-management-group-delete
[21]: /cli/azure/account/management-group#az-account-management-group-list
[22]: /cli/azure/account/tenant
[23]: /cli/azure/account#az-account-clear
[24]: /cli/azure/account#az-account-list
[25]: /cli/azure/account#az-account-set
[26]: /cli/azure/account#az-account-show
[27]: /cli/azure/reference-index#az-login-examples
[28]: #change-the-active-subscription
[29]: #troubleshooting
[30]: manage-azure-groups-azure-cli.md
[31]: use-azure-cli-successfully-bash.md#querying-and-formatting-single-values-and-nested-values
