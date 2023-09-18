---
title: Sign in with Azure CLI with a managed identity | Microsoft Docs
description: Learn how to sign into the Azure CIL with managed identity
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

# Sign in with a managed identity

On resources configured for managed identities for Azure resources, you can sign in using the managed identity. Signing in with the resource's identity is done through the `--identity` flag.

```azurecli-interactive
az login --identity
```

If the resource has multiple user assigned managed identities and no system assigned identity, you must specify the client ID or object ID or resource ID of the user assigned managed identity with `--username` for login.

```azurecli-interactive
az login --identity --username <client_id|object_id|resource_id>
```

To learn more about managed identities for Azure resources, see [Configure managed identities for Azure resources](/azure/active-directory/managed-identities-azure-resources/qs-configure-cli-windows-vm) and [Use managed identities for Azure resources for sign in](/azure/active-directory/managed-identities-azure-resources/how-to-use-vm-sign-in).
