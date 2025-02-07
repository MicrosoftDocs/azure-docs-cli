---
title: az account community contributions
description: `az account community contribution include file`
ms.date: 02/07/2025
ms.topic: reference
ms.service: azure-cli
---

## Community contributions for `az account`

### Parameter `--owner-spn` can be required

From: @GitHub-alias on 01/17/2025 (Azure CLI version 2.68.0)

Be aware that the `--owner-spn` parameter is required when you do not supply an `--owner-object-id`.

*********************************************************

### Switch between Azure accounts

From: @GitHub-alias on 10/05/2024 (Azure CLI version 2.65.0)

I use this simple script to switch between Azure accounts:

```azurecli
az account clear
az login --tenant TenantID
az account set --subscription "SubscriptionName"
```

*********************************************************

### Find more examples for `az account`

From @dbradish-microsoft on 12/05/2024 (Azure CLI version 2.67.0)

Microsoft articles showing the use of `az account`:

[Authenticate to Azure using Azure CLI](/cli/azure/authenticate-azure-cli)
[Get started with Azure CLI](/cli/azure/get-started-with-azure-cli)
[Sign in interactively with Azure CLI](/cli/azure/authenticate-azure-cli-interactively)
[How to manage Azure subscriptions with the Azure CLI](/cli/azure/manage-azure-subscriptions-azure-cli)
[Create an Azure service principal with Azure CLI](/cli/azure/azure-cli-sp-tutorial-1)

********************************************************

### Stack Overflow questions containing `az account`

From @dbradish-microsoft on 12/07/2024 (Azure CLI version 2.67.0)

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
