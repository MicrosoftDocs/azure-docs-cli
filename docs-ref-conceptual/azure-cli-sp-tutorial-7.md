---
title: Reset service principal credentials using the Azure CLI | Microsoft Docs
description: Learn how to reset your service principal credentials using the Azure CLI.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 10/10/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Reset service principal credentials

If you lose your service principal credentials, reset the credentials using [az ad sp credential reset](/cli/azure/ad/sp/credential#az-ad-sp-credential-reset). This step details how to reset your service principal password or certificate.

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
> [Cleanup & troubleshoot service principals](./azure-cli-sp-tutorial-8.md)
