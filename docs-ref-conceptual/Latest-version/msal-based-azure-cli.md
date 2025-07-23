---
title: MSAL-based Azure CLI | Microsoft Docs
description: Learn about MSAL-based Azure CLI, the deprecation of accessTokens.json, and how to securely authenticate using MSAL and AzureCliCredential.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: msal, msal-based azure cli
---

# MSAL-based Azure CLI

Starting with version 2.30.0, Azure CLI uses Microsoft Authentication Library [(MSAL)][09] as its
underlying authentication library. MSAL uses the Azure Active Directory v2.0 authentication flow to
provide enhanced functionality and increase security for token cache.

> [!WARNING]
> Breaking Changes are introduced in Azure CLI 2.30.0. Carefully read this document before
> installation.

## `accessTokens.json` deprecation

Previous versions of Azure CLI saved Azure AD Authentication Library (ADAL) tokens and service
principal entries to `~/.azure/accessToken.json`. The latest versions of the Azure CLI use MSAL and
no longer generate `accessTokens.json`. Existing workflow depending on `accessTokens.json` no longer
work.

The MSAL token cache and service principal entries are saved as encrypted files on Windows, and
plaintext files on Linux and macOS.

> [!IMPORTANT]
> When using Azure CLI in a pipeline, such as Azure DevOps, ensure all tasks and stages are using
> versions of Azure CLI v2.30.0 or higher for MSAL-based Azure CLI. Azure CLI 2.30.0 isn't backward
> compatible with prior versions and throws an error when working with versions earlier than 2.30.0.

## Alternatives to consider

Alternatives to consider for stability:

### Calling `az account get-access-token`

You can manually call [`az account get-access-token`][04] in a terminal or use a subprocess to call
it from another programming language. By default, the returned access token is for Azure Resource
Manager (ARM) and the default subscription/tenant shown in [`az account show`][05].

```azurecli
# get the active subscription
az account show --output table

# get access token for the active subscription
az account get-access-token

# get access token for a specific subscription
az account get-access-token --subscription "<subscription ID or name>"
```

To learn more about access tokens, see [Sign in with Azure CLI][01].

### Using AzureCliCredential

`AzureCliCredential` is a credential type in all existing language SDKs. It uses a subprocess to
call `az account get-access-token` to retrieve an access token for the current logged-in account.

## See also

- MSAL
  - [Overview of the Microsoft Authentication Library (MSAL)][03]
  - [Migrate applications to the Microsoft Authentication Library (MSAL)][02]
- Python
  - [AzureCliCredential Class][08] in Python
- .NET
  - [AzureCliCredential Class][06] in .NET
- Java
  - [AzureCliCredential Class][07] in Java

<!-- link references -->

[01]: ./authenticate-azure-cli-interactively.md#refresh-tokens
[02]: /azure/active-directory/develop/msal-migration
[03]: /azure/active-directory/develop/msal-overview
[04]: /cli/azure/account#az_account_get_access_token
[05]: /cli/azure/account#az_account_show
[06]: /dotnet/api/azure.identity.azureclicredential
[07]: /java/api/com.azure.identity.azureclicredential
[08]: /python/api/azure-identity/azure.identity.azureclicredential
[09]: https://github.com/AzureAD/microsoft-authentication-library-for-python
