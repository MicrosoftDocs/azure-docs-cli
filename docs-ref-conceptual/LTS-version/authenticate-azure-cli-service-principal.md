---
title: Sign in with Azure CLI using a service principal
description: Learn how to sign into Azure using a service principal and the Azure CLI. Find an example for appending a certification to a private key.
ms.service: azure-cli
ms.custom: devx-track-azurecli
#customer intent: As an app developer, I need to security automate authentication to Azure using a service principal.
---

# Sign into Azure with a service principal using the Azure CLI

Service principals are accounts not tied to any particular user, which you can assign permissions
through predefined roles. Authenticating with a service principal is the best way to write secure
scripts or programs. It lets you apply both permissions restrictions and locally stored static
credential information. To learn more about service principals, see
[Work with Azure service principals using the Azure CLI][01].

To sign in with a service principal, you need:

- The URL or name associated with the service principal.
- The service principal client secret, or the X509 certificate used to create the service principal
  in PEM format.
- The tenant associated with the service principal, as either an `.onmicrosoft.com` domain or
  Microsoft Entra tenant ID.

Note two important facts when working with service principals and the Azure CLI:

- A **CERTIFICATE** must be appended to the **PRIVATE KEY** within a PEM file. For an example of a
  PEM file format, see [Certificate-based authentication][02].

- If your service principal uses a certificate stored in Key Vault, that certificate's private key
  must be available without signing in to Azure. To retrieve the certificate for `az login`, see
  [Retrieve certificate from Key Vault][03].

To log in with a client secret, use the following command:

```azurecli-interactive
az login --service-principal --username APP_ID --password CLIENT_SECRET --tenant TENANT_ID
```

To log in with a certificate, use the following command:

```azurecli-interactive
az login --service-principal --username APP_ID --certificate /path/to/cert.pem --tenant TENANT_ID
```

> [!IMPORTANT]
> To avoid displaying your password in the console when using `az login` interactively, use the
> `read -s` command under `bash`.
>
> ```bash
> read -sp "Azure password: " AZ_PASS && echo && az login --service-principal --username <app-id> --password $AZ_PASS --tenant <tenant>
> ```
>
> Under PowerShell, use the `Get-Credential` cmdlet.
>
> ```powershell
> $AzCred = Get-Credential -UserName <app-id>
> az login --service-principal --username $AzCred.UserName --password $AzCred.GetNetworkCredential().Password --tenant <tenant>
> ```

## See also

- [Azure CLI Onboarding cheat sheet][04]
- [Manage Azure subscriptions with the Azure CLI][05]
- [Create an Azure service principal using Azure CLI][01]
- Find Azure CLI [samples][07] and [published docs][06]

<!-- link references -->

[01]: ./azure-cli-sp-tutorial-1.md
[02]: ./azure-cli-sp-tutorial-3.md
[03]: ./azure-cli-sp-tutorial-3.md#work-with-azure-key-vault
[04]: ./cheat-sheet-onboarding.md
[05]: ./manage-azure-subscriptions-azure-cli.md
[06]: ./reference-docs-index.md
[07]: ./samples-index.md
