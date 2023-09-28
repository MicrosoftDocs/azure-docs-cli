---
title: Sign in with Azure CLI — Login and Authentication | Microsoft Docs
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

| Authentication method | Advantage |
|-|-|
| [Azure Cloud Shell](/azure/cloud-shell/overview) | Azure Cloud Shell automatically logs you in, so this is the easiest way to get started.
| [Sign in interactively](./authenticate-azure-cli-interactively.md) | This is a good option when learning Azure CLI commands and running the Azure CLI locally.  Log in through your browser with the [az login](/cli/azure/reference-index#az-login) command.
| [Sign in using a service principal](./authenticate-azure-cli-service-principal.md) | When you write scripts, using a service principal is the recommended approach. You grant just the appropriate permissions needed to a service principal keeping your automation secure.
| [Sign in with a managed identity](./authenticate-azure-cli-managed-identity.md) | A common challenge for developers is the management of secrets, credentials, certificates, and keys used to secure communication between services. Using a managed identity eliminates the need for you to manage these credentials.
| [Sign in using Web Account Manager (WAM)](./authenticate-azure-cli-web-account-manager.md) | WAM is a Windows 10+ component that acts as an authentication broker. WAM provides enhanced security and enhancements are shipped with Windows.

## Find or change your current subscription

After you sign in, CLI commands are run against your default subscription. If you have multiple subscriptions, you can change your default subscription using `az account set --subscription`. To learn more about managing Azure subscriptions, see [How to manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md).

## Refresh tokens

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
about service principals, see [Working with Azure service principals using the Azure CLI](./azure-cli-sp-tutorial-1.md).

To sign in with a service principal, you need:

* The URL or name associated with the service principal
* The service principal password, or the X509 certificate used to create the service principal in PEM format
* The tenant associated with the service principal, as either an `.onmicrosoft.com` domain or Azure object ID

> [!NOTE]
> A **CERTIFICATE** must be appended to the **PRIVATE KEY** within a PEM file. For an example of a PEM file format, see [Certificate-based authentication](./azure-cli-sp-tutorial-5.md).

> [!IMPORTANT]
>
> If your service principal uses a certificate that is stored in Key Vault, that certificate's private key must be available without signing in to Azure. To retrieve the certificate for `az login`, see [Retrieve certificate from Key Vault](./azure-cli-sp-tutorial-5.md).

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

See [Working with service principals](./azure-cli-sp-tutorial-1.md) for more information on PEM file formats.

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

If the resource has multiple user assigned managed identities and no system assigned identity, you must specify the client ID or object ID or resource ID of the user assigned managed identity with `--username` for login.
```azurecli-interactive
az login --identity --username <client_id|object_id|resource_id>
```

To learn more about managed identities for Azure resources, see [Configure managed identities for Azure resources](/azure/active-directory/managed-identities-azure-resources/qs-configure-cli-windows-vm) and [Use managed identities for Azure resources for sign in](/azure/active-directory/managed-identities-azure-resources/how-to-use-vm-sign-in).

## Sign in with Web Account Manager (WAM)

The Azure CLI now offers preview support for Web Account Manager (WAM).  WAM is a Windows 10+ component that acts as an authentication broker.  (An authentication broker is an application that runs on a user’s machine that manages the authentication handshakes and token maintenance for connected accounts.) 

Using WAM has several benefits:

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

When you sign in with a user account, Azure CLI generates and stores an authentication refresh token. Because access tokens are valid for only a short period of time, a refresh token is issued at the same time the access token is issued. The client application can then exchange this refresh token for a new access token when needed. For more information on token lifetime and expiration, see [Refresh tokens in the Microsoft identity platform](/azure/active-directory/develop/refresh-tokens).

> [!NOTE]
> Depending on your sign in method, your tenant may have Conditional Access policies that restrict your access to certain resources.


## See also

* [Azure CLI Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* [Manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md)
* Find Azure CLI [samples](./samples-index.md) and [published docs](./reference-docs-index.md)
