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

Azure CLI doesn't store any of your login information. Instead, Azure CLI generates and stores an [authentication refresh token](/azure/active-directory/develop/v1-id-and-access-tokens#refresh-tokens). As of August 2018 this token is revoked after 90 days of inactivity. Contact your Microsoft or tenant administrator to change this value. Once the token is revoked, you get a message from the CLI saying you need to sign in again.

After you sign in, CLI commands are run against your default subscription. If you have multiple subscriptions, you can [change your default subscription](manage-azure-subscriptions-azure-cli.md).

> [!Note]
> Depending on your signing in method, your tenant may have Conditional Access policies that restrict your access to certain resources.

## Sign in interactively

The Azure CLI's default authentication method for logins uses a web browser and access token to sign in.

[!INCLUDE [interactive_login](includes/interactive-login.md)]

## Sign in with credentials on the command line

Provide your Azure user credentials on the command line.

> [!Note]
> This approach doesn't work with Microsoft accounts or accounts that have two-factor authentication enabled.

```azurecli-interactive
az login -u <username> -p <password>
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

## Sign in with a service principal

Service principals are accounts not tied to any particular user, which can have permissions on them assigned through
predefined roles. Authenticating with a service principal is the best way to write secure scripts or programs,
allowing you to apply both permissions restrictions and locally stored static credential information. To learn more
about service principals, see [Working with Azure service principals using the Azure CLI](./create-an-azure-service-principal-azure-cli.md#4-sign-in-using-a-service-principal).

To sign in with a service principal, you need:

* The URL or name associated with the service principal
* The service principal password, or the X509 certificate used to create the service principal in PEM format
* The tenant associated with the service principal, as either an `.onmicrosoft.com` domain or Azure object ID

> [!NOTE]
> A **CERTIFICATE** must be appended to the **PRIVATE KEY** within a PEM file. For an example of a PEM file format, see [Certificate-based authentication](./create-an-azure-service-principal-azure-cli.md#certificate-based-authentication).

> [!IMPORTANT]
>
> If your service principal uses a certificate that is stored in Key Vault, that certificate's private key must be available without signing in to Azure. To retrieve the certificate for `az login`, see [Retrieve certificate from Key Vault](create-an-azure-service-principal-azure-cli.md#retrieve-certificate-from-key-vault).

```azurecli-interactive
az login --service-principal -u <app-id> -p <password-or-cert> --tenant <tenant>
```

> [!IMPORTANT]
> If you want to avoid displaying your password on console and are using `az login` interactively,
> use the `read -s` command under `bash`.
>
> ```bash
> read -sp "Azure password: " AZ_PASS && echo && az login --service-principal -u <app-id> -p $AZ_PASS --tenant <tenant>
> ```
>
> Under PowerShell, use the `Get-Credential` cmdlet.
>
> ```powershell
> $AzCred = Get-Credential -UserName <app-id>
> az login --service-principal -u $AzCred.UserName -p $AzCred.GetNetworkCredential().Password --tenant <tenant>
> ```

See [Working with service principals](./create-an-azure-service-principal-azure-cli.md#certificate-based-authentication) for more information on PEM file formats.

## Sign in with a different tenant

You can select a tenant to sign in under with the `--tenant` argument. The value of this argument can either be an `.onmicrosoft.com` domain or the Azure object ID for the tenant. Both
interactive and command-line sign in methods work with `--tenant`.

```azurecli-interactive
az login --tenant <tenant>
```

## Sign in with a managed identity

On resources configured for managed identities for Azure resources, you can sign in using the managed identity. Signing in with the resource's identity is done through the `--identity` flag.

```azurecli-interactive
az login --identity
```

If the resource has multiple user assigned managed identities and no system assigned identity, you must specify the client id or object id or resource id of the user assigned managed identity with `--username` for login.
```azurecli-interactive
az login --identity --username <client_id|object_id|resource_id>
```

To learn more about managed identities for Azure resources, see [Configure managed identities for Azure resources](/azure/active-directory/managed-identities-azure-resources/qs-configure-cli-windows-vm) and [Use managed identities for Azure resources for sign in](/azure/active-directory/managed-identities-azure-resources/how-to-use-vm-sign-in).

## Sign in with Web Account Manager (WAM)

The Azure CLI now offers preview support for Web Account Manager (WAM).  WAM is a Windows 10+ component that acts as an authentication broker.  Using WAM has several benefits:

- Enhanced security. See [Conditional Access: Token protection (preview)](/azure/active-directory/conditional-access/concept-token-protection).
- Support for Windows Hello, conditional access policies, and FIDO keys.
- Streamlined single sign-on.
- Bug fixes and enhancements shipped with Windows.

Signing in with WAM is a preview, opt-in feature. Once enabled, the previous browser-based user interface is replaced.

```azurecli-interactive
az config set core.allow_broker=true
az account clear
az login
```

At the current stage of development, there are a few known limitations to WAM:
- WAM is available on Windows 10   and later, and on Windows Server 2019 and later. On Mac, Linux, and earlier versions of Windows, we automatically fall back to a browser.  
- Microsoft Accounts (for example @outlook.com or @live.com) aren't supported for the time being. We're working with the Microsoft Identity team to bring the support later.

## See also

* [How-to change your active tenant](manage-azure-subscriptions-azure-cli.md#change-the-active-tenant)
* [How-to change your active subscription](manage-azure-subscriptions-azure-cli.md#change-the-active-subscription)
* [Learn to use Bash with the Azure CLI](azure-cli-learn-bash.md)
