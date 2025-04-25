---
title: Sign in with Azure CLI at a command line | Microsoft Docs
description: Learn how to sign into the Azure CLI interactively using az login, WAM, a web browser, and a subscription selector.
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
#customer intent: As an app developer, I want a simple way to log into Azure while developing a script.
---

# Sign into Azure interactively using the Azure CLI

Interactive logins to Azure offer a more intuitive and flexible user experience. With Azure CLI, you
can authenticate to Azure directly through the [az login][12] command. This command is useful for
ad-hoc management tasks and for environments that require manual sign-in, such as scenarios with
multifactor authentication (MFA). This method simplifies access for script testing, learning, and
on-the-fly management without needing to preconfigure service principals or other noninteractive
authentication methods.

> [!IMPORTANT]
> [!INCLUDE [MFA](includes/multifactor-authentication.md)]

## Prerequisites

- [Install the Azure CLI][05]

## Interactive login

To sign in interactively, use the [az login][12] command. Beginning with Azure CLI version
[2.61.0][08], Azure CLI uses Web Account Manager (WAM) on Windows and a browser-based login on Linux
and macOS by default.

```azurecli-interactive
az login
```

## Subscription selector

Beginning with Azure CLI version [2.61.0][08], if you have access to multiple subscriptions, you're
prompted to select an Azure subscription at the time of login, as shown in the following example.

```Output
Retrieving subscriptions for the selection...

[Tenant and subscription selection]

No    Subscription name                     Subscription ID                           Tenant name
----  ------------------------------------  ----------------------------------------  --------------
[1]   Facility Services Subscription        00000000-0000-0000-0000-000000000000      Contoso
[2]   Finance Department Subscription       00000000-0000-0000-0000-000000000000      Contoso
[3]   Human Resources Subscription          00000000-0000-0000-0000-000000000000      Contoso
[4] * Information Technology Subscription   00000000-0000-0000-0000-000000000000      Contoso

The default is marked with an *; the default tenant is 'Contoso' and subscription is
'Information Technology Subscription' (00000000-0000-0000-0000-000000000000).

Select a subscription and tenant (Type a number or Enter for no changes): 2

Tenant: Contoso
Subscription: Finance Department Subscription (00000000-0000-0000-0000-000000000000)

[Announcements] With the new Azure CLI login experience, you can select the subscription you want to
use more easily. Learn more about it and its configuration at
https://go.microsoft.com/fwlink/?linkid=2271236

If you encounter any problems, open an issue at https://aka.ms/azclibug
```

The next time you sign in, the previously selected tenant and subscription is marked as the default
with an asterisk (`*`) next to its number. This marking allows you to press <kbd>Enter</kbd> to
select the default subscription.

By default, commands run against the selected subscription. Use `az account set` to change your
subscription from a command line at any time. For more information, see
[How to manage Azure subscriptions with the Azure CLI][06].

Here are some guidelines about the subscription selector to keep in mind:

- The subscription selector is only available in 64-bit Windows, Linux, or macOS.
- The subscription selector is only available when using the `az login` command.
- You aren't prompted to select a subscription when you're logging in with a service principal or
  managed identity.

If you want to disable the subscription selector feature, set the [core.login_experience_v2][03]
configuration property to `off`.

```azurecli-interactive
az config set core.login_experience_v2=off
az login
```

## Sign in with Web Account Manager (WAM) on Windows

Beginning with Azure CLI version [2.61.0][08], Web Account Manager (WAM) is the default
authentication method on Windows. WAM is a Windows 10+ component that acts as an authentication
broker. An authentication broker is an application that runs on a user's machine. It manages the
authentication handshakes and token maintenance for connected accounts.

Using WAM has several benefits:

- Enhanced security. See [Conditional Access: Token protection (preview)][10].
- Support for Windows Hello, conditional access policies, and FIDO keys.
- Streamlined single sign-on.
- Bug fixes and enhancements shipped with Windows.

If you encounter an issue and want to revert to the previous browser-based authentication method,
Set the [core.enable_broker_on_windows][03] configuration property to `false`.

```azurecli-interactive
az account clear
az config set core.enable_broker_on_windows=false
az login
```

WAM is available on Windows 10 and later, and on Windows Server 2019 and later.

## Sign in with a browser

Azure CLI defaults to a browser-based authentication method when one of the following conditions is
true:

- The operating system (OS) is Linux, macOS, or the Windows OS is earlier than Windows 10 or Windows
  Server 2019.
- The `core.enable_broker_on_windows` configuration property is set to `false`.

To sign in with a browser, follow these steps:

[!INCLUDE [interactive_login](includes/interactive-login.md)]

## Sign in with credentials on the command line

Provide your Azure user credentials on the command line. You should only use this authentication
method when working with the Azure CLI interactively. For production-level applications, use a
service principal or managed identity.

This approach doesn't work with Microsoft accounts or accounts that have multifactor authentication
(MFA) enabled. You receive an _interactive authentication is needed_ message.

```azurecli-interactive
az login --user <username> --password <password>
```

> [!IMPORTANT]
> To avoid displaying your password in the terminal when using `az login` interactively, use the
> `read -s` command in Bash.
>
> ```bash
> read -sp "Azure password: " AZ_PASS && echo && az login -u <username> -p $AZ_PASS
> ```
>
> In PowerShell, use the `Get-Credential` cmdlet.
>
> ```powershell
> $AzCred = Get-Credential -UserName <username>
> az login -u $AzCred.UserName -p $AzCred.GetNetworkCredential().Password
> ```

## Sign in with a different tenant

You can select a tenant to sign in with the `--tenant` argument. The value of this argument can
either be a `.onmicrosoft.com` domain or the Azure object ID for the tenant. Both interactive and
command-line sign-in methods work with `--tenant`.

In select environments and beginning in Azure CLI version [2.61.0][08], you must disable the
subscription selector first by setting the `core.login_experience_v2` configuration property to
`off`.

```azurecli-interactive
# disable the subscription selector (v. 2.61.0 and up)
az config set core.login_experience_v2=off

# login with a tenant ID
az login --tenant 00000000-0000-0000-0000-000000000000
```

To reenable the subscription selector, run `az config set core.login_experience_v2=on`. For more
information on the subscription selector, see [Interactive login][15].

After signing in, if you want to change your active tenant, see
[How to change your active tenant][18].

## Sign in using --scope

```azurecli-interactive
az login --scope https://management.core.windows.net//.default
```

## Sign out

To sign out of Azure, use the [az logout][13] command.

```azurecli-interactive
az logout
```

## Clear your subscription cache

To update your subscription list, use the [az account clear][11] command. You must sign in again to
see an updated list.

```azurecli-interactive
az account clear

az login
```

Clearing your subscription cache isn't technically the same process as logging out of Azure.
However, when you clear your subscription cache, you can't run Azure CLI commands, including
`az account set`, until you sign in again.

## Refresh tokens

[!INCLUDE [refresh-token](includes/refresh-token.md)]

## Troubleshooting

### The connection for this site isn't secure

When your default browser is Microsoft Edge, you might encounter the following error when attempting
to sign in to Azure interactively with `az login`: "_The connection for this site isn't secure._" To
resolve this issue, visit [edge://net-internals/#hsts][17] in Microsoft Edge. Add `localhost` under
"_Delete domain security policy_" and select <kbd>Delete</kbd>.

### Interactive authentication is needed

You receive this message when using a user identity to authenticate to Azure, and multifactor
authentication is required. The solution is to use a [workload identity][14] like a
[service principal][01] or [managed identity][02] to authenticate to Azure.

### Authentication failed against tenant

This error occurs when a single Entra user identity belongs to multiple Azure tenants. Azure CLI
loops through the tenants you have access to and tries to authenticate. To log in with your tenant
of choice, use the `--tenant` parameter. For more information, see
[Sign in with a different tenant][16].

## Next steps

- [Tutorial: Learn to use the Azure CLI][04]
- Find Azure CLI [samples][09] and [published docs][07]

<!-- link references -->

[01]: ./authenticate-azure-cli-interactively.md
[02]: ./authenticate-azure-cli-managed-identity.md
[03]: ./azure-cli-configuration.md#cli-configuration-values-and-environment-variables
[04]: ./get-started-tutorial-0-before-you-begin.md
[05]: ./install-azure-cli.md
[06]: ./manage-azure-subscriptions-azure-cli.md
[07]: ./reference-docs-index.md
[08]: ./release-notes-azure-cli.md#may-21-2024
[09]: ./samples-index.md
[10]: /azure/active-directory/conditional-access/concept-token-protection
[11]: /cli/azure/account#az-account-clear
[12]: /cli/azure/reference-index#az-login
[13]: /cli/azure/reference-index#az-logout
[14]: /entra/workload-id/workload-identities-overview
[15]: #interactive-login
[16]: #sign-in-with-a-different-tenant
[17]: edge://net-internals/#hsts
[18]: manage-azure-subscriptions-azure-cli.md#change-the-active-tenant
