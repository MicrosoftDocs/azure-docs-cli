---
title: Reset service principal credentials – Azure CLI | Microsoft Docs
description: Learn how to reset your service principal credentials using Azure CLI.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 09/29/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Reset service principal credentials

If you ever lose your service principal credentials, the best and most secure option is to reset the credentials.
This step details how to reset your service principal credentials.

If you lose the credentials for a service principal, use [az ad sp credential reset](/cli/azure/ad/sp/credential#az-ad-sp-credential-reset). The reset command takes the same parameters
as `az ad sp create-for-rbac`.

```azurecli-interactive
# reset a service principal credential with a password
az ad sp credential reset --id myServicePrincipalID
```

```azurecli-interactive
# reset a service principal credential with a new self-signed certificate
az ad sp credential reset --id myServicePrincipalID --create-cert
```

If you don't know the ID associated with your service principal, use the `az ad sp list` command as explained in [Get an existing service principal](./azure-cli-sp-tutorial-4.md).

## Next Steps

Now that you've learned how to reset your service principal credentials, proceed to the next step to see how to clean up tutorial resources.

> [!div class="nextstepaction"]
> [Cleanup & troubleshooting](./azure-cli-sp-tutorial-8.md)
