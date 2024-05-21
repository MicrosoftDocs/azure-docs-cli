---
title: Use the subscription selector when logging into Azure.
description: Learn how to select a subscription from the new subscription selector available with the `az login` command.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 04/09/2024
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: az login, authentication types, authentication methods, azure, cli login, az login powershell, cli login, sign in, azure cli  
---

# Choose your subscription when logging into Azure using Azure CLI

With the release of Azure CLI [2.61.0](./release-notes-azure-cli.md#may-21-2024), there's a new login feature that provides a list of available tenants and subscriptions. Choose to keep the subscription and tenant that is selected by default, or type the line number of the subscription you want to use. Here are the details:

* The subscription selector is available by default on Azure CLI 64-bit Windows, Linux, or macOS version 2.61 or superior and can be disabled.
* The subscription selector is only available when using the `az login` command [interactively](./authenticate-azure-cli-interactively.md).

With the current practice, the [az account set](/cli/azure/account#az-account-set) command is required to change your subscription. With the subscription selector at time of interactive login, you skip having to [list](/cli/azure/account#az-account-list) and [set](/cli/azure/account#az-account-set) your default subscription.


## Choose your subscription

1. Note the subscription and tenant currently selected are indicated with an asterisk (`*`).
1. Tap `Enter` to bypass the subscription selector and accept the default subscription.
1. Type a line number from the numbered list to change the default subscription.

Here's a screen print of what you can expect from the authentication preview:

:::image type="content" source="./media/authenticate-azure-cli-preview/subscription-selector.png" alt-text="Subscription selector":::


## Disabling the new login experience

If you want to disable the new loging experience for Azure CLI, follow those steps:

```azurecli-interactive
az config set core.login_experience_v2=off
az login
```



## See also

* [Install the Azure CLI](./install-azure-cli.md)
* [Authenticate to Azure using Azure CLI](./authenticate-azure-cli.md)
