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

## Reset credentials

> [!WARNING]
> The output you choose can show credentials in your console and be written to your log file.
> [Reset credentials storing output in a variable](#reset-credentials-storing-output-in-a-variable) to avoid writing credentials in your log.

Reset a service principal credential with a password.

```azurecli-interactive
az ad sp credential reset --id myServicePrincipalID
```

Console output:

```output
{
  "appId": "myServicePrincipalID",
  "password": "myServicePrincipalNewPassword",
  "tenant": "myTenantID"
}

Reset a service principal credential with a new self-signed certificate.

```azurecli-interactive
az ad sp credential reset --id myServicePrincipalID --create-cert
```

Console output:

```output
{
  "appId": "myServicePrincipalID",
  "fileWithCertAndPrivateKey": "myLocation/myPemFileName.pem",
  "password": null,
  "tenant": "myTenantID"
}
```

If you don't know the ID associated with your service principal, use the `az ad sp list` command as explained in [Get an existing service principal](./azure-cli-sp-tutorial-4.md).

## Reset credentials storing output in a variable

To avoid storing credentials in your log file, use the `--query` parameter to store output in a variable.
You can chose to return output to your console by using the `echo` command.

Reset a service principal credential with a password

```azurecli-interactive
myNewPassword=$(az ad sp credential reset --id myServicePrincipalID --query password --output tsv)
echo $myNewPassword
```

Reset a service principal credential with a new self-signed certificate.

```azurecli-interactive
myNewCertificateLocation=$(az ad sp credential reset --id myServicePrincipalID --query fileWithCertAndPrivateKey --output tsv)
echo $myNewCertificateLocation
```

## Next Steps

Now that you've learned how to reset your service principal credentials, proceed to the next step to see how to clean up tutorial resources.

> [!div class="nextstepaction"]
> [Cleanup & troubleshoot service principals](./azure-cli-sp-tutorial-8.md)
