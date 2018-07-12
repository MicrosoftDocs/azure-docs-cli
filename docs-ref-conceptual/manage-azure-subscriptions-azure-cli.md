---
title: Manage Azure subscriptions with the Azure CLI
description: Manage Azure subscriptions with the Azure CLI.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 06/15/2018
ms.topic: conceptual
ms.produdct: azure
ms.technology: azure-cli
ms.devlang: azure-cli
ms.service: active-directory
---
# Manage multiple subscriptions with the Azure CLI

Most Azure users will only ever have a single subscription. However, if you are part of multiple organizations or your organization has
divided up access to certain resources across groupings, you may have multiple subscriptions within Azure. Multiple subscriptions can
be easily managed with the CLI either by setting a global subscription for all commands, or selecting a subscription on a per-command basis.

## Tenants, users, and subscriptions

You might have some confusion over the difference between tenants, users, and subscriptions within Azure. A _tenant_ is the Azure Active Directory
entity which encompasses a whole organization. This tenant has at least one _subscription_ and _user_. A user is an individual and is associated
with only one tenant, the organization that they belong to. Users are those accounts which sign in to Azure to provision and use resources.
A user may have access to multiple _subscriptions_, which are the agreements with Microsoft to use cloud services, including Azure. Every resource
is associated with a subscription.

To learn more about the differences between tenants, users, and subscriptions, see the
[Azure cloud terminology dictionary](/azure/azure-glossary-cloud-terminology).  To learn how to add a new subscription to your Azure Active
Directory tenant, see
[How to add an Azure subscription to Azure Active Directory](/azure/active-directory/active-directory-how-subscriptions-associated-directory).
When working with multiple tenants, you may need to sign in to a specific tenant. To do this, see
[Sign in with Azure CLI](/cli/azure/authenticate-azure-cli).

## Work with multiple subscriptions

To access the resources contained within a subscription, you need to switch your active subscription. Switching your subscription can be done for all
Azure CLI commands with [az account set](/cli/azure/account#az-account-set), or done on a per-command basis by using the `--subscription` argument.

To start, you will need a list of your available subscriptions. To get it, use the [az account list](/cli/azure/account#az-account-list) command:

```azurecli-interactive
az account list --output table
```

To change the active subscription globally, use `az account set` along with either the subscription ID or subscription name:

```azurecli-interactive
az account set --subscription "My Demos"
```

To use a specific subscription for a command, just use the `--subscription` argument. This argument takes either a subscription ID or subscription name:

```azurecli-interactive
az vm create --subscription "My Demos" --resource-group MyGroup --name NewVM --image Ubuntu
```
