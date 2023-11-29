---
title: Sign in with Azure CLI interactively at a command line | Microsoft Docs
description: Learn how to sign into the Azure CIL interactively using az login
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

# Sign in interactively

The Azure CLI's default authentication method for logins uses a web browser and access token to sign in.

[!INCLUDE [interactive_login](includes/interactive-login.md)]

## Sign in with credentials on the command line

Provide your Azure user credentials on the command line. Only use this authentication method for learning Azure CLI commands.
Production-level applications should use a service principal or managed identity.

This approach doesn't work with Microsoft accounts or accounts that have two-factor authentication enabled.
You receive an _interactive authentication is needed_ message.

```azurecli-interactive
az login --user <username> --password <password>
```

> [!IMPORTANT]
> If you want to avoid displaying your password on console and are using `az login` interactively,
> use the `read -s` command under `bash`.
>
> ```bash
> read -sp "Azure password: " AZ_PASS && echo && az login -u <username> -p $AZ_PASS
> ```
>
> Under PowerShell, use the `Get-Credential` cmdlet.
>
> ```powershell
> $AzCred = Get-Credential -UserName <username>
> az login -u $AzCred.UserName -p $AzCred.GetNetworkCredential().Password
> ```

## Refresh tokens

When you sign in with a user account, Azure CLI generates and stores an authentication refresh token. When a access token is granted, it is only valid for a short amount of time. Therefore, a refresh token is also generated at the same time, so that the client application can exchange this refresh token for a new access token when needed. 

Use [az account get-access-token](/cli/azure/account#az-account-get-access-token) to retrieve the access token: 

```azurecli
az account show --output table

# get access token for the active subscription
az account get-access-token

# get access token for a specific subscription
az account get-access-token --subscription "<subscription ID or name>"


az account get-access-token --scope "myScope" --subscription "mySubscriptionName" --name "resourceGroupName"

```

Starting from Azure CLI 2.54.0, `az account get-access-token` returns the `expires_on` property alongside the `expiresOn` property for the token expiration time. `expires_on` represents a Portable Operating System Interface (POSIX) timestamp and `expiresOn` represents a local datetime. We recommend for downstream applications to use the `expires_on` property, because it uses the Universal Time Code (UTC). However, it should be noted that `expiresOn` cannot express "fold" when Daylight Saving Time ends. This can cause problems in countries or regions where Daylight Saving Time is adopted. For more information on "fold", see [PEP 495 – Local Time Disambiguation](https://peps.python.org/pep-0495/).


## Sign in with a different tenant

You can select a tenant to sign in under with the `--tenant` argument. The value of this argument can either be an `.onmicrosoft.com` domain or the Azure object ID for the tenant. Both interactive and command-line sign-in methods work with `--tenant`.

```azurecli-interactive
az login --tenant 00000000-0000-0000-0000-000000000000
```

After signing in, if you want to change your active tenant, see [How-to change your active tenant](manage-azure-subscriptions-azure-cli.md#change-the-active-tenant).

## Troubleshooting

When your default browser is Microsoft Edge, you might encounter the following error when attempting
to sign in to Azure interactively with `az login`: "_The connection for this site is not
secure._" To resolve this issue, visit [edge://net-internals/#hsts](edge://net-internals/#hsts) in
Microsoft Edge. Add `localhost` under "_Delete domain security policy_" and select <kbd>Delete</kbd>.

## See also

* [Azure CLI Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* [Manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md)
* Find Azure CLI [samples](./samples-index.md) and [published docs](./reference-docs-index.md)
