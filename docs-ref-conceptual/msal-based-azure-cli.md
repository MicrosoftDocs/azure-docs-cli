---
title: MSAL-based Azure CLI | Microsoft Docs
description: Learn about the MSAL-based Azure CLI.
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.date: 08/1/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: msal, msal-based azure cli
---

# MSAL-based Azure CLI

Starting in version 2.30.0, Azure CLI uses Microsoft Authentication Library [(MSAL)](https://github.com/AzureAD/microsoft-authentication-library-for-python) as the underlying authentication library. MSAL uses Azure Active Directory v2.0 authentication flow to provide more functionality and increases security for token cache.

> [!WARNING]
> BREAKING CHANGES are introduced in Azure CLI 2.30.0. Carefully read document prior to installation.

## `accessTokens.json` deprecation

Previous versions of Azure CLI saved Azure AD Authentication Library (ADAL) tokens and service principal entries to `~/.azure/accessToken.json`. The latest versions of the Azure CLI use MSAL and no longer generate `accessTokens.json`. Any existing workflow depending on `accessTokens.json` no longer works.

The MSAL token cache and service principal entries are saved as encrypted files on Windows, and plaintext files on Linux and macOS.

> [!IMPORTANT]
> When using Azure CLI in a pipeline like Azure DevOps, ensure all tasks and stages are using versions of Azure CLI above v2.30.0 for MSAL-based Azure CLI. Azure CLI 2.30.0 is not backwards compatible with prior versions and throws an error when working with versions prior to 2.30.0.

## Alternatives to consider

Alternatives you may consider for stability:

### Calling `az account get-access-token`

You can manually call [`az account get-access-token`](/cli/azure/account#az_account_get_access_token) in a terminal or use subprocess to call it from another programming language. By default, the returned access token is for Azure Resource Manager (ARM) and the default subscription/tenant shown in [`az account show`](/cli/azure/account#az_account_show).

```azurecli
# get the active subscription
az account show --output table

# get access token for the active subscription
az account get-access-token

# get access token for a specific subscription
az account get-access-token --subscription "<subscription ID or name>"
```

Starting from Azure CLI 2.54.0, `az account get-access-token` returns the `expires_on` property alongside the `expiresOn` property for the token expiration time. `expires_on` represents a Portable Operating System Interface (POSIX) timestamp and `expiresOn` represents a local datetime. We recommend for downstream applications to use the `expires_on` property, because it uses the Universal Time Code (UTC). However, tt should be noted that `expiresOn` cannot express "fold" when Daylight Saving Time ends. This can cause problems in countries or regions where Daylight Saving Time is adopted. For more information on "fold", see [PEP 495 – Local Time Disambiguation](https://peps.python.org/pep-0495/).

```azurecli

# Before:

{
  "accessToken": "...",
  "expiresOn": "2023-10-31 21:59:10.000000",
  "subscription": "...",
  "tenant": "...",
  "tokenType": "Bearer"
}
# After:

{
  "accessToken": "...",
  "expiresOn": "2023-10-31 21:59:10.000000",
  "expires_on": 1698760750,
  "subscription": "...",
  "tenant": "...",
  "tokenType": "Bearer"
}
```

### Using `AzureCliCredential`

`AzureCliCredential` is a credential type in all existing language SDKs. It uses subprocess to call `az account get-access-token` to get an access token for the current logged-in account.

## See also

- MSAL
  - [Overview of the Microsoft Authentication Library (MSAL)](/azure/active-directory/develop/msal-overview)
  - [Migrate applications to the Microsoft Authentication Library (MSAL)](/azure/active-directory/develop/msal-migration)
- Python
  - [AzureCliCredential Class](/python/api/azure-identity/azure.identity.azureclicredential) in Python
- .NET
  - [AzureCliCredential Class](/dotnet/api/azure.identity.azureclicredential) in .NET
- Java
  - [AzureCliCredential Class](/java/api/com.azure.identity.azureclicredential) in Java
