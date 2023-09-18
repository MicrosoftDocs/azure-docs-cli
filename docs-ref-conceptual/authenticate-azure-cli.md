---
title: Sign in with Azure CLI — Login and Authentication | Microsoft Docs
description: Learn the different authentication types for your Azure CLI login — sign in with Azure CLI automatically, locally, or interactively using the az login command.
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.date: 08/1/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: az login, authentication types , authentication methods, azure, cli login, az login powershell, cli login, sign in 
---

# Sign in with Azure CLI

There are several authentication types for the Azure Command-Line Interface (CLI), so how do you sign in?  The easiest way to get started is with [Azure Cloud Shell](/azure/cloud-shell/overview), which automatically logs you in.
Locally, you can sign in interactively through your browser with the [az login](/cli/azure/reference-index#az-login) command. When you write scripts, the recommended approach is
to use service principals. By granting just the appropriate permissions needed to a service principal, you can keep your automation secure.

When signing in with a user account, Azure CLI generates and stores an [authentication refresh token](/azure/active-directory/develop/v1-id-and-access-tokens#refresh-tokens). For more information on refresh and session token configuration, see [Refresh and session token lifetime policy properties](/azure/active-directory/develop/configurable-token-lifetimes#refresh-and-session-token-lifetime-policy-properties).

After you sign in, CLI commands are run against your default subscription. If you have multiple subscriptions, you can [change your default subscription](manage-azure-subscriptions-azure-cli.md).

> [!NOTE]
> Depending on your signing in method, your tenant may have Conditional Access policies that restrict your access to certain resources.

## Troubleshooting

When your default browser is Microsoft Edge, you might encounter the following error when attempting
to login to Azure interactively with `az login`: "_The connection for this site is not
secure._" To resolve this issue, visit [edge://net-internals/#hsts](edge://net-internals/#hsts) in
Microsoft Edge. Add `localhost` under "_Delete domain security policy_" and click <kbd>Delete</kbd>.

## See also

* [How-to change your active subscription](manage-azure-subscriptions-azure-cli.md#change-the-active-subscription)
