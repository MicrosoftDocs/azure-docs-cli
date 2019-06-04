---
title: Manage Azure subscriptions with the Azure CLI
description: Manage Azure subscriptions with the Azure CLI.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/09/2018
ms.topic: conceptual
ms.product: azure
ms.technology: azure-cli
ms.devlang: azurecli
---

# Use multiple Azure subscriptions

Most Azure users will only ever have a single subscription. However, if you are part of more than one organization or your organization has
divided up access to certain resources across groupings, you may have multiple subscriptions within Azure. The CLI supports selecting a subscription
both globally and per command.

For detailed information on subscriptions, billing, and cost management, see the [billing and cost management documentation](/azure/billing/).

## Tenants, users, and subscriptions

You might have some confusion over the difference between tenants, users, and subscriptions within Azure. A _tenant_ is the Azure Active Directory
entity that encompasses a whole organization. This tenant has at least one _subscription_ and _user_. A user is an individual and is associated
with only one tenant, the organization that they belong to. Users are those accounts that sign in to Azure to create, manage, and use resources.
A user may have access to multiple _subscriptions_, which are the agreements with Microsoft to use cloud services, including Azure. Every resource
is associated with a subscription.

To learn more about the differences between tenants, users, and subscriptions, see the
[Azure cloud terminology dictionary](/azure/azure-glossary-cloud-terminology).  To learn how to add a new subscription to your Azure Active
Directory tenant, see
[How to add an Azure subscription to Azure Active Directory](/azure/active-directory/active-directory-how-subscriptions-associated-directory).
To learn how to sign in to a specific tenant, see [Sign in with Azure CLI](/cli/azure/authenticate-azure-cli).

## Change the active subscription

To access the resources for a subscription, switch your active subscription or use the `--subscription` argument. Switching your subscription
for all commands is done with [az account set](/cli/azure/account#az-account-set).

To switch your active subscription:

1. Get a list of your subscriptions with the [az account list](/cli/azure/account#az-account-list) command:

    ```azurecli-interactive
    az account list --output table
    ```
2. Use `az account set` with the subscription ID or name you want to switch to.

    ```azurecli-interactive
    az account set --subscription "My Demos"
    ```

To run only a single command with a different subscription, use the `--subscription` argument. This argument takes either a subscription ID or subscription name:

```azurecli-interactive
az vm create --subscription "My Demos" --resource-group MyGroup --name NewVM --image Ubuntu
```
