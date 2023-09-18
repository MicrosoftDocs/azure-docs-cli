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

# Sign in with a service principal

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
