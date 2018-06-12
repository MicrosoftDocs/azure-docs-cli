---
title: Manage Azure subscriptions with the Azure CLI 
description: Manage Azure subscriptions with the Azure CLI on Linux, Mac, or Windows.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 06/11/2018
ms.topic: conceptual
ms.technology: azure-cli
ms.devlang: azure-cli
ms.service: active-directory
---
# Manage multiple subscriptions with the Azure CLI

Most Azure users will only ever have a single subscription. However, if you are part of multiple organizations or your organization has
divided up access to certain resources across groupings, you may have multiple subscriptions within Azure. Multiple subscriptions can
be easily managed with the CLI, and operations can be performed by selecting a subscription.

## Tenants, users, and subscriptions

You might have some confusion over the difference between tenants, users, and subscriptions within Azure. In general, a _tenant_ is the Azure Active Directory
entity which encompasses a whole organization. This tenant has at least one _subscription_ and _user_. A user is an individual, and is associated with only
one tenant, the organization that they belong to. Users are those accounts which log in to Azure to provision and use resources. A user may have access to multiple _subscriptions_,
which are the agreements with Microsoft to use cloud services, including Azure. Every resource is associated with a subscription.

To learn more about the differences between tenants, users, and subscriptions, see the [Azure cloud terminology dictionary](/azure/azure-glossary-cloud-terminology).
To learn how to add a new subscription to your Azure Active Directory tenant, see [How to add an Azure subscription to Azure Active Directory](/azure/active-directory/active-directory-how-subscriptions-associated-directory).
When working with multiple tenants, you may need to log into a specific tenant. To do this, see [Log in with Azure CLI](/cli/azure/authenticate-azure-cli).

## Working with multiple subscriptions

To access the resources contained within a subscription, you need to switch your active subscription. All work with subscriptions is done through the `az account` command, which
refers to the service agreement that a subscription represents and not your individual account.

[!INCLUDE [cloud-shell-try-it.md](includes/cloud-shell-try-it.md)]

To start working with your available subscriptions, get a list of those available in your account:

```azurecli-interactive
az account list --output table
```

```Output
Name                                         CloudName    SubscriptionId                        State     IsDefault
-------------------------------------------  -----------  ------------------------------------  --------  -----------
My Production Subscription                   AzureCloud   XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  Enabled
My DevTest Subscription                      AzureCloud   XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  Enabled   True
My Demos                                     AzureCloud   XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  Enabled
```

In order to change the active subscription, you can use `az account set`:

```azurecli-interactive
az account set --subscription "My Demos"
```

You can use either the subscription ID or the subscription name to select the subscription.
