---
title: Sign in with Azure CLI using web account manager (WAM) | Microsoft Docs
description: Learn how to sign into the Azure CLI using web account manager (WAM).
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.date: 04/20/2024
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: az login, authentication types, authentication methods, azure, cli login, az login powershell, cli login, sign in, azure cli 
---

# Sign in with Web Account Manager (WAM) using Azure CLI

As of Azure CLI version [](./release-notes-azure-cli#may-21-2024), WAM is now the default authentication method on Windows. WAM is a Windows 10+ component that acts as an authentication broker. (An authentication broker is an application that runs on a user’s machine that manages the authentication handshakes and token maintenance for connected accounts.)

Using WAM has several benefits:

* Enhanced security. See [Conditional Access: Token protection (preview)](/azure/active-directory/conditional-access/concept-token-protection).
* Support for Windows Hello, conditional access policies, and FIDO keys.
* Streamlined single sign-on.
* Bug fixes and enhancements shipped with Windows.

If you encounter any issue and want to revert to the previous browser-based authentication method, run

```azurecli-interactive
az account clear
az config set core.enable_broker_on_windows=false
az login
```

> [!IMPORTANT]
> WAM is available on Windows 10 and later, and on Windows Server 2019 and later. On Mac, Linux, and earlier versions of Windows, the Azure CLI will continue to automatically default to a browser.  

## See also

* [Learn more about Web Account Manager](/windows/uwp/security/web-account-manager)
* [Authenticate to Azure using Azure CLI](./authenticate-azure-cli.md)
