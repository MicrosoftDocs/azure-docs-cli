---
title: Azure CLI reference links to concpetual content | Microsoft Docs
description: Follow the links provided to see Azure CLI reference content in use!
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 03/15/2022
ms.topic: reference
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
keywords: reference
---

# az account alias
Reference
 
!NoteThis reference is part of the account extension for the Azure CLI (version 2.3.1 or higher). The extension will automatically install the first time you run an az account alias command. Learn more about extensions.

Manage subscription alias.

## Commands

|||
|-|-|
|[az account alias create]()| Create Alias Subscription.
|[az account alias delete]()| Delete Alias.
|[az account alias list]()| List Alias Subscriptions.
|[az account alias show]()|Get Alias Subscription.
|[az account alias wait]()|Place the CLI in a waiting state until a condition of the account alias is met.

## az account alias create
Create Alias Subscription.

```azurecli
az account alias create --name
                        [--billing-scope]
                        [--display-name]
                        [--no-wait]
                        [--reseller-id]
                        [--subscription-id]
                        [--workload {DevTest, Production}]
```

### Examples

CreateAlias

```azurecli-interactive
az account alias create --name "aliasForNewSub" --billing-scope "/providers/Microsoft.Billing/billingAccounts/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx:024cabf4-7321-4cf9-be59-df0c77ca51de_2019-05-31/billingProfiles/PE2Q-NOIT-BG7-TGB/invoiceSections/MTT4-OBS7-PJA-TGB" --display-name "Contoso MCA subscription" --workload "Production"
```

### Required Parameters
`--name -n`
Alias Name.

Optional Parameters
`--billing-scope`
Billing scope. It determines whether the subscription is Field-Led, Partner-Led or LegacyEA.

`--display-name`
The friendly name of the subscription.

`--no-wait`
Do not wait for the long-running operation to finish.

`--reseller-id`
Reseller ID, basically MPN Id.

`--subscription-id`
This parameter can be used to create alias for existing subscription ID.

`--workload`
The workload type of the subscription. It can be either Production or DevTest.
accepted values: DevTest, Production

### Global Parameters

### Learn

||
|-|
|[Programmatically create Azure subscriptions for a Microsoft Customer Agreement with the latest APIs](/azure/cost-management-billing/manage/programmatically-create-subscription-microsoft-customer-agreement?tabs=azure-cli)
|[Programmatically create Azure Enterprise Agreement subscriptions with the latest APIs](/azure/cost-management-billing/manage/programmatically-create-subscription-enterprise-agreement?tabs=azure-cli)
|[Programmatically create Azure subscriptions for a Microsoft Partner Agreement with the latest APIs](/azure/cost-management-billing/manage/programmatically-create-subscription-microsoft-partner-agreement?tabs=azure-cli)

## az account alias delete

### Example

### Required Parameters

### Global Parameters

### Learn


