---
title: Sign in with Azure CLI using a service principal
description: Learn how to sign into Azure using a service principal and the Azure CLI. Find an example for appending a certification to a private key
ms.date: 09/02/2024
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
#customer intent: As an app developer, I need to security automate authentication to Azure using a service principal. 
---

# Sign into Azure with a service principal using the Azure CLI 

Service principals are accounts not tied to any particular user, which can have permissions on them assigned through
predefined roles. Authenticating with a service principal is the best way to write secure scripts or programs,
allowing you to apply both permissions restrictions and locally stored static credential information. To learn more
about service principals, see [Work with Azure service principals using the Azure CLI](./azure-cli-sp-tutorial-1.md).

To sign in with a service principal, you need:

* The URL or name associated with the service principal
* The service principal password, or the X509 certificate used to create the service principal in PEM format
* The tenant associated with the service principal, as either an `.onmicrosoft.com` domain or Azure object ID

Note two important facts when working with service principals and the Azure CLI:

* A **CERTIFICATE** must be appended to the **PRIVATE KEY** within a PEM file. For an example of a PEM file format, see [Certificate-based authentication](./azure-cli-sp-tutorial-3.md).

* If your service principal uses a certificate that is stored in Key Vault, that certificate's private key must be available without signing in to Azure. To retrieve the certificate for `az login`, see [Retrieve certificate from Key Vault](./azure-cli-sp-tutorial-3.md#work-with-azure-key-vault).

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

## See also

* [Azure CLI Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* [Manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md)
* [Create an Azure service principal using Azure CLI](./azure-cli-sp-tutorial-1.md)
* Find Azure CLI [samples](./samples-index.md) and [published docs](./reference-docs-index.md)
