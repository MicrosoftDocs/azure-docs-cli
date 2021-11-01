---
title: MSAL-based Azure CLI | Microsoft Docs
description: Learn about the MSAL-based Azure CLI.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 10/28/2021
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: msal, msal-based azure cli
---

# MSAL-based Azure CLI

Starting in version 2.30.0, Azure CLI uses [MSAL](https://github.com/AzureAD/microsoft-authentication-library-for-python) as the underlying authentication library. MSAL uses AAD v2.0 authentication flow to provide more functionality and increases security for token cache.

> [!WARNING]
> BREAKING CHANGES are introduced in Azure CLI 2.30.0. Carefully read document prior to installation.

## `accessTokens.json` deprecation

Previous versions of Azure CLI save ADAL tokens and service principal entries to `~/.azure/accessToken.json`. Latest versions of Azure CLI use MSAL and no longer generate `accessTokens.json`. Any existing workflow depending on `accessTokens.json` no longer work.

The MSAL token cache and service principal entries are saved as encrypted files on Windows, and plaintext files on Linux and MacOS.

Below are several alternatives you may consider:

### Calling `az account get-access-token`

You can manually call [`az account get-access-token`](/cli/azure/account#az_account_get_access_token) in a terminal or use subprocess to call it from another programming language. By default, the returned access token is for Azure Resource Manager (ARM) and the default subscription/tenant shown in `az account show`.

### Using `AzureCliCredential`

`AzureCliCredential` is a credential type in all existing language SDKs. It uses subprocess to call `az account get-access-token` to get an access token for the current logged-in account.
