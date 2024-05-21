---
title: Sign in with Azure CLI using web account manager (WAM) | Microsoft Docs
description: Learn how to sign into the Azure CLI using web account manager (WAM).
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.date: 09/22/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: az login, authentication types, authentication methods, azure, cli login, az login powershell, cli login, sign in, azure cli 
---

# Sign in with Web Account Manager (WAM) using Azure CLI

The authentication with Azure CLI is now based on Web Account Manager (WAM) by default on Windows, the default authentication on Linux and MacOs is using the browser-based flow.
WAM is a Windows 10+ component that acts as an authentication broker. (An authentication broker is an application that runs on a user’s machine that manages the authentication handshakes and token maintenance for connected accounts.)

Using WAM has several benefits:

* Enhanced security. See [Conditional Access: Token protection (preview)](/azure/active-directory/conditional-access/concept-token-protection).
* Support for Windows Hello, conditional access policies, and FIDO keys.
* Streamlined single sign-on.
* Bug fixes and enhancements shipped with Windows.

You may disable WAM and switch to the browser-based flow using the following commands.

```azurecli-interactive
az account clear
az confir set core.enable_broker_on_windows=false
az login
```

Currently there are a few known limitations to WAM:

* WAM is available on Windows 10 and later, and on Windows Server 2019 and later. On Mac, Linux, and earlier versions of Windows, the Azure CLI automatically defaults to a browser based flow.  
* Microsoft Accounts (for example @outlook.com or @live.com) aren't currently supported. We're working with the Microsoft Identity team to bring the support later.

## See also

* [Azure CLI Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* [Manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md)
* [Learn more about Web Account Manager](/windows/uwp/security/web-account-manager)
* Find Azure CLI [samples](./samples-index.md) and [published docs](./reference-docs-index.md)
