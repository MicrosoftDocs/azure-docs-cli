---
title: az account community contributions
description: Learn the different authentication types for your Azure CLI login — sign in with Azure CLI automatically, locally, or interactively using the az login command.
ms.date: 09/02/2024
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
#customer intent: As a new user of the Azure CLI, I want to learn about the different authentication methods I can use to sign into Azure.
---

# az account
Reference

> [!NOTE]
> This command group has commands that are defined in both Azure CLI and at least one extension. Install each extension to benefit from its extended capabilities. Learn more about extensions.

## Commands

|Name|Description|Type|Status
|-|-|-|
|az account accept-ownership-status	| Accept subscription ownership status. | Extension	| GA |
|az account alias | Manage subscription alias. | Extension| GA |
|az account alias create | Create Alias Subscription. | Extension | GA |
|az account alias delete | Delete Alias. | Extension | GA |
|`<additional list items here>`| | | |

### az account accept-ownership-status

Accept subscription ownership status.

```azurecli
az account accept-ownership-status --subscription-id
```

#### Required Parameters

`--subscription-id`
    Subscription Id. Required.

### az account clear

Clear all subscriptions from the CLI's local cache.

To clear the current subscription, use 'az logout'.

```azurecli
az account clear
```

### az account create

Create a subscription.

```azurecli
az account create --enrollment-account-name
                  --offer-type {MS-AZR-0017P, MS-AZR-0148P, MS-AZR-USGOV-0015P, MS-AZR-USGOV-0017P, MS-AZR-USGOV-0148P}
                  [--display-name]
                  [--no-wait {0, 1, f, false, n, no, t, true, y, yes}]
                  [--owner-object-id]
                  [--owner-spn]
                  [--owner-upn]
```

#### Required Parameters

`--enrollment-account-name --enrollment-account-object-id`
The name of the enrollment account to which the subscription will be billed.

`--offer-type`
The offer type of the subscription. For example, MS-AZR-0017P(EnterpriseAgreement) and MS-AZR-0148P(EnterpriseAgreement devTest) are available. Allowed values: MS-AZR-0017P, MS-AZR-0148P, MS-AZR-USGOV-0015P, MS-AZR-USGOV-0017P, MS-AZR-USGOV-0148P.

Accepted values: MS-AZR-0017P, MS-AZR-0148P, MS-AZR-USGOV-0015P, MS-AZR-USGOV-0017P, MS-AZR-USGOV-0148P

#### Optional Parameters

`--display-name`
The display name of the subscription.

`--no-wait`
Do not wait for the long-running operation to finish.

Accepted values: 0, 1, f, false, n, no, t, true, y, yes

`--owner-object-id`
The object id(s) of the owner(s) which should be granted access to the new subscription.

`--owner-spn`
The service principal name(s) of the owner(s) which should be granted access to the new subscription.

`--owner-upn`
The user principal name(s) of owner(s) who should be granted access to the new subscription.

### az account get-access-token

`<az account get-access-token information here>`

### Community contributions for `az account`

#### Parameter `--owner-spn` can be required
From: @GitHub-alias on mm/dd/yyyy

Be aware that the `--owner-spn` parameter is required when you do not supply an `--owner-object-id`.

#### Switch between Azure accounts
From: @GitHub-alias on mm/dd/yyyy

I use this simple script to switch between Azure accounts:

```azurecli
az account clear
az login --tenant TenantID
az account set --subscription "SubscriptionName"
```

#### Find more examples for `az account`
From @dbradish-microsoft on mm/dd/yyyy

|Microsoft articles showing the use of `az account`:
|--|
|  [Authenticate to Azure using Azure CLI](/cli/azure/authenticate-azure-cli)
|  [Get started with Azure CLI](/cli/azure/get-started-with-azure-cli)
|  [Sign in interactively with Azure CLI](/cli/azure/authenticate-azure-cli-interactively)
|  [How to manage Azure subscriptions with the Azure CLI](/cli/azure/manage-azure-subscriptions-azure-cli)
|  [Create an Azure service principal with Azure CLI](/cli/azure/azure-cli-sp-tutorial-1)

#### Stack Overflow questions containing `az account`
From @dbradish-microsoft on mm/dd/yyyy

The following Stack Overflow questions discuss the use of `az account`:

Reference Name | Question ID | Question Title |
|-|-|-|
|az account | 38475104 | [Azure Cli how to change subscription default](https://stackoverflow.com/questions/38475104)
||44143981 | [Is there an API to list all Azure Regions?](https://stackoverflow.com/questions/44143981)
||46710038 | [Access token for Azure Active Directory using azure-cli](https://stackoverflow.com/questions/46710038)
|az account clear | 72601514 | [Terraform - Az Cli - MSAL token error - User does not exist](https://stackoverflow.com/questions/72601514)
|| 76580100| [az cli login using the wrong account](https://stackoverflow.com/questions/76580100)
| az account get-access-token |46710038 | [Access token for Azure Active Directory using azure-cli](https://stackoverflow.com/questions/46710038)
| | 53673516 | [Can't get access token for custom AD Application](https://stackoverflow.com/questions/53673516)
| | 54113938 | [How to obtain bearer token for azure service principal with C#](https://stackoverflow.com/questions/54113938)
| | 58972199 | [Azure active directory - Get access token using Azure CLI](https://stackoverflow.com/questions/58972199)
| | 59878724 | [How to set a lifetime of a bearer token while retrieving through Azure CLI?](https://stackoverflow.com/questions/59878724)

`<POC note: There are 407 Stack Overflow questions that contain the `az account` command group.>`
