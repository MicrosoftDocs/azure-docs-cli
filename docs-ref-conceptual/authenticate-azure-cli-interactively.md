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

Interactive logins to Azure offer a more intuitive and flexible user experience. Interactive login with Azure CLI allows users to authenticate to Azure directly through the [az login](/cli/azure/reference-index#az-login) command, which is useful for ad-hoc management tasks and for environments that require manual sign-in, such as those customers with multi-factor authentication (MFA). This method simplifies access for script testing, learning, and on-the-fly management without needing to preconfigure service principals or other noninteractive authentication methods.

## Sign in with Web Account Manager (WAM) on Windows

As of Azure CLI version [2.61.0](./release-notes-azure-cli.md#may-21-2024), WAM is now the default authentication method on Windows. WAM is a Windows 10+ component that acts as an authentication broker. (An authentication broker is an application that runs on a user’s machine that manages the authentication handshakes and token maintenance for connected accounts.)

Using WAM has several benefits:

* Enhanced security. See [Conditional Access: Token protection (preview)](/azure/active-directory/conditional-access/concept-token-protection).
* Support for Windows Hello, conditional access policies, and FIDO keys.
* Streamlined single sign-on.
* Bug fixes and enhancements shipped with Windows.

If you encounter any issue and want to revert to the previous browser-based authentication method, run the following script:

```azurecli-interactive
az account clear
az config set core.enable_broker_on_windows=false
az login
```

WAM is available on Windows 10 and later, and on Windows Server 2019 and later.

## Sign in with a browser

On Mac, Linux, and earlier versions of Windows, the Azure CLI defaults to a browser.

[!INCLUDE [interactive_login](includes/interactive-login.md)]

## Sign in with credentials on the command line

Provide your Azure user credentials on the command line. Only use this authentication method for learning Azure CLI commands. Production-level applications should use a service principal or managed identity.

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
to sign in to Azure interactively with `az login`: "_The connection for this site isn't
secure._" To resolve this issue, visit [edge://net-internals/#hsts](edge://net-internals/#hsts) in
Microsoft Edge. Add `localhost` under "_Delete domain security policy_" and select <kbd>Delete</kbd>.

## See also

* [Azure CLI Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* Find Azure CLI [samples](./samples-index.md) and [published docs](./reference-docs-index.md)
