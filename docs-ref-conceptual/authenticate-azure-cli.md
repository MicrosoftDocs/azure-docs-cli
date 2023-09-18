---
title: Sign in with Azure CLI—Login and Authentication | Microsoft Docs
description: Learn the different authentication types for your Azure CLI login — sign in with Azure CLI automatically, locally, or interactively using the az login command.
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.date: 09/22/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: az login, authentication types , authentication methods, azure, cli login, az login powershell, cli login, sign in 
---

# Sign in with Azure CLI

The Azure CLI supports several authentication methods. Restrict sign-in permissions for your use case to keep your Azure resources secure.

## Authentication methods

There are five authentication options when working with the Azure CIL:

- The easiest way to get started is with [Azure Cloud Shell](/azure/cloud-shell/overview), which automatically logs you in.

- Locally, you can [sign in interactively](./authenticate-azure-cli-interactively.md) through your browser with the [az login](/cli/azure/reference-index#az-login) command. When you're learning to use Azure CIL commands, using `az login` is a good option.
- When you write scripts, the recommended approach is to [sign in using a service principal](./authenticate-azure-cli-service-principal.md). By granting just the appropriate permissions needed to a service principal, you can keep your automation secure.
- A common challenge for developers is the management of secrets, credentials, certificates, and keys used to secure communication between services. Choosing to [sign in with a managed identity](./authenticate-azure-cli-managed-identity.md) eliminates the need for you to manage these credentials.
- You can also [sign in using Web Account Manager (WAM)](./authenticate-azure-cli-web-account-manager.md), a Windows 10+ component that acts as an authentication broker.

## Refresh tokens

When you sign in with a user account, Azure CLI generates and stores an authentication refresh token. Because access tokens are valid for only a short period of time, a refresh token is issued at the same time the access token is issued. The client application can then exchange this refresh token for a new access token when needed.  For more information on token lifetime and expiration, see [Refresh tokens in the Microsoft identity platform](/azure/active-directory/develop/refresh-tokens).

> [!NOTE]
> Depending on your sign in method, your tenant may have Conditional Access policies that restrict your access to certain resources.

## Next step

After you sign in, CLI commands are run against your default subscription. If you have multiple subscriptions, you can change your default subscription using `az account set --subscription`.  To learn more about managing Azure subscriptions, see [How to manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md).
