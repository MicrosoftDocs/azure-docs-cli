---
title: Use the subscription selector when logging into Azure.
description: Learn how to select a subscription from the new subscription selector available with the `az login` command.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 04-03-2025
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: az login, authentication types, authentication methods, azure, cli login, az login powershell, cli login, sign in, azure cli  
---

# Choose your subscription when logging into Azure using Azure CLI

With the release of Azure CLI [x.xx.xx](), there is a new login feature that provides a list of available subscriptions. Choose to keep the default subscription, or simply type the line number of the subscription you want to use. Here are the details:

* The subscription selector is a preview feature available in 64-bit Windows and macOS.
* The subscription selector is only available when using the `az login` command.
* Azure CLI version x.xx.xx must be installed to use the subscription selector. For information on installing the Azure CLI, see [How to install the Azure CLI](./install-azure-cli.md).
* You will not be prompted to select a subscription when logging in with a service principal, managed identity or Web Account Manager (WAM).

## New subscription selector (in preview)

To use the new subscription selector, run Azure CLI x.xx.x or higher, then log into Azure and pick your subscription.

### Log into Azure

The Azure CLI's default authentication method for logins uses a web browser and access token to sign in.

[!INCLUDE [interactive_login](includes/interactive-login.md)]

### Choose your subscription

1. Note your default subscription indicated by an asterisk (`*`).

1. Tap `Enter` to bypass the subscription selector and accept the default subscription, or type a line number from the auto-incremented list to change the default subscription.
   
   **put screen print here**

## See also

* [Install the Azure CLI](./install-azure-cli.md)
* [Authenticate to Azure using Azure CLI](./authenticate-azure-cli.md)

