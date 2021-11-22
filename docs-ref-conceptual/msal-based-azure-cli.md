---
title: MSAL-based Azure CLI | Microsoft Docs
description: Learn about the MSAL-based Azure CLI.
author: jiasli
ms.author: jiasli
manager: yonzhan
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

Previous versions of Azure CLI save ADAL tokens and service principal entries to `~/.azure/accessToken.json`. Latest versions of Azure CLI use MSAL and no longer generate `accessTokens.json`. Any existing workflow depending on `accessTokens.json` no longer works.

The MSAL token cache and service principal entries are saved as encrypted files on Windows, and plaintext files on Linux and MacOS.

> [!IMPORTANT]
> When using Azure CLI in a pipeline, like as Azure DevOps, ensure all tasks/stages are using versions of Azure CLI above v2.30.0 for MSAL-based azure CLI. Azure CLI 2.30.0 is not backwards compatible with Prior versions and throws and error when using incompatible errors.

## Alternatives to consider

Below are a couple alternatives you may consider for backwards compatibility:

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
