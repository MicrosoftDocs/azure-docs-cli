---
title: Sign in with Azure CLI interactively at a command line | Microsoft Docs
description: Learn how to sign into the Azure CLI interactively using az login.
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

# Sign in interactively with Azure CLI 

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

## Sign in with a different tenant

You can select a tenant to sign in under with the `--tenant` argument. The value of this argument can either be an `.onmicrosoft.com` domain or the Azure object ID for the tenant. Both interactive and command-line sign-in methods work with `--tenant`.

```azurecli-interactive
az login --tenant 00000000-0000-0000-0000-000000000000
```

After signing in, if you want to change your active tenant, see [How-to change your active tenant](manage-azure-subscriptions-azure-cli.md#change-the-active-tenant).

## Refresh tokens

[!INCLUDE [refresh-token](includes/refresh-token.md)]

## Troubleshooting

When your default browser is Microsoft Edge, you might encounter the following error when attempting
to sign in to Azure interactively with `az login`: "_The connection for this site is not
secure._" To resolve this issue, visit [edge://net-internals/#hsts](edge://net-internals/#hsts) in
Microsoft Edge. Add `localhost` under "_Delete domain security policy_" and select <kbd>Delete</kbd>.

## See also

* [Azure CLI Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* [Manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md)
* Find Azure CLI [samples](./samples-index.md) and [published docs](./reference-docs-index.md)
