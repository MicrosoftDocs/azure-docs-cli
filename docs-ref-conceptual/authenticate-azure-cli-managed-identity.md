---
title: Sign in with Azure CLI using a managed identity | Microsoft Docs
description: Learn how to sign into the Azure CLI with managed identity.
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

# Sign in with a managed identity using Azure CLI 

On resources configured for managed identities for Azure resources, you can sign in using the managed identity.
Here are some of the benefits of using managed identities:

* You don't need to manage credentials. Credentials aren’t even accessible to you.
* You can use managed identities to authenticate to any resource that supports Microsoft Entra authentication, including your own applications.
* Managed identities can be used at no extra cost.

Signing in with the resource's identity is done through the `--identity` flag.

```azurecli-interactive
az login --identity
```

If the resource has multiple user assigned managed identities and no system assigned identity, you must specify the client ID or object ID or resource ID of the user assigned managed identity with `--username` for login.

```azurecli-interactive
az login --identity --username <client_id|object_id|resource_id>
```

To learn more about managed identities for Azure resources, see [Configure managed identities for Azure resources](/azure/active-directory/managed-identities-azure-resources/qs-configure-cli-windows-vm). Here are more articles showing the use of the `--identity` parameter.

* [How to use managed identities for Azure resources on an Azure VM for sign-in](/azure/active-directory/managed-identities-azure-resources/how-to-use-vm-sign-in).
* [Use an Azure managed identity to authenticate to an Azure container registry](/azure/container-registry/container-registry-authentication-managed-identity?tabs=azure-cli)

## See also

* [Azure CLI Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* [Manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md)
* [How to use Azure managed identities for Azure Service and Azure functions](/azure/app-service/overview-managed-identity?tabs=portal%2Chttp)
* Find Azure CLI [samples](./samples-index.md) and [published docs](./reference-docs-index.md)
