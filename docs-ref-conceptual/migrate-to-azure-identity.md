---
title: Azure CLI beta breaking change
description: How to migrate from accessTokens.json to Azure Identity and MSAL
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 04/19/2021 
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
---
# Migrate to Azure Identity

Azure CLI beta internally replaces Azure Active Directory Authentication Library [(ADAL)](https://github.com/AzureAD/azure-activedirectory-library-for-python) with [Azure Identity](https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/identity/azure-identity) and Microsoft Authentication Library [(MSAL)](https://github.com/AzureAD/microsoft-authentication-library-for-python). Existing ADAL token cache (`~/.azure/accessToken.json`) will be migrated to MSAL encrypted token cache automatically when any command requiring a credential is executed.

This article provides detail about this breaking change and gives examples on how to get an access-token in Azure CLI beta.

## Beta release breaking change

The current Azure CLI saves the ADAL refresh tokens and access tokens to `~/.azure/accessToken.json`. Azure CLI beta uses MSAL and will no longer generate `accessTokens.json` after a successful login.  Tokens will be saved to MSAL's shared token cache called `msal.cache`.  To get an access token, use `az account get-access-token` instead. 

The MSAL token cache will be encrypted on Windows, macOS and Linux with a desktop environment; therefore, directly accessing the MSAL token cache will not work. Any existing workflow depending on `accessTokens.json` will stop working.

## Alternatives to consider

##### Call `az account get-access-token`

You can manually call [az account get-access-token](../latest/docs-ref-autogen/account.yml#az_account_get_access_token) in a terminal or use a subprocess to call it from another programming language. By default, the returned token is for the default subscription/tenant shown in [az account show](../latest/docs-ref-autogen/account.yml#az_account_show).

```azurecli
# get the active subscription
az account show --output table

# get access token for the default subscription
az account get-access-token

# get access toekn for a specific subscription
az account get-access-token --subscription "mySubscriptionName"
```

##### Use `AzureCliCredential`

`AzureCliCredential` is a credential type in all existing language SDKs. It internally uses a subprocess to call `az account get-access-token` to gets an access token from current logged in CLI accounts. 

##### Access shared MSAL cache

First party apps can use `SharedTokenCacheCredential` from Azure Identity SDK to directly access the shared MSAL cache.

## See also
* Azure CLI
  * [Azure CLI beta](./release-notes-azure-cli.md?bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json&tabs=azure-cli-beta&toc=%2fcli%2fazure%2ftoc.json) release notes
  * [Install Azure CLI beta version](./install-azure-cli-beta.md)
* .NET
  * [AzureCliCredential Class](/dotnet/api/azure.identity.azureclicredential?view=azure-dotnet&preserve-view=true) in .NET
  * [SharedTokenCacheCredential Class](/dotnet/api/azure.identity.sharedtokencachecredential?view=azure-dotnet&preserve-view=true) in .NET
* Java
  * [SharedTokenCacheCredential Class](/java/api/com.azure.identity.sharedtokencachecredential?view=azure-java-stable&preserve-view=true) in Java
  * [AzureCliCredential Class](/java/api/com.azure.identity.azureclicredential?view=azure-java-stable&preserve-view=true) in Java
* Python
  * [AzureCliCredential Class](/python/api/azure-identity/azure.identity.azureclicredential?view=azure-python&preserve-view=true) in Python
  * [SharedTokenCacheCredential Class](/python/api/azure-identity/azure.identity.sharedtokencachecredential?view=azure-python&preserve-view=true) in Python
* Azure security
  * [Introduction to Azure security](/azure/security/fundamentals/overview)
  * [Overview of the Microsoft Authentication Library (MSAL)](/azure/active-directory/develop/msal-overview)