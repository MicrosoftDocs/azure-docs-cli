---
title: Reset service principal credentials using the Azure CLI | Microsoft Docs
description: Learn how to reset your service principal credentials using the Azure CLI.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 10/18/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Reset service principal credentials

If you lose your service principal credentials, reset the credentials using [az ad sp credential reset](/cli/azure/ad/sp/credential#az-ad-sp-credential-reset). This step details how to reset your service principal password or certificate.

> [!WARNING]
> While learning to manage Azure service principals, returning passwords and credential locations in your terminal, and consequently in your log file, is common. However, when outside of a testing environment, [store credential output in a variable](#reset-credentials-storing-output-in-a-variable).

## Reset credentials returning output to the console and log file

Use [az ad sp credential reset](/cli/azure/ad/sp/credential#az-ad-sp-credential-reset) command to create a new password or certificate for your service principal. If you don't know the ID associated with your service principal, use the `az ad sp list` command as explained in [Get an existing service principal](./azure-cli-sp-tutorial-4.md).

Reset a service principal password.

```azurecli-interactive
az ad sp credential reset --id myServicePrincipalID
```

Console output showing the new password in the console. This information is also written in the log.

```output
{
  "appId": "myServicePrincipalID",
  "password": "myServicePrincipalNewPassword",
  "tenant": "myTenantID"
}
```

Reset a service principal credential with a new self-signed certificate.

```azurecli-interactive
az ad sp credential reset --id myServicePrincipalID --create-cert
```

Console output showing the new certificate location in the console. This information is also written in the log.

```output
{
  "appId": "myServicePrincipalID",
  "fileWithCertAndPrivateKey": "myLocation/myPemFileName.pem",
  "password": null,
  "tenant": "myTenantID"
}
```

## Reset credentials storing output in a variable

To avoid storing credentials in your log file, use the `--query` parameter to store output in a variable. When testing, use the `echo` command to see the value of your variable, but understand that `echo` writes to the log.

Reset a service principal credential with a password.

# [Bash](#tab/bash)

```azurecli-interactive
# Bash script
myNewPassword=$(az ad sp credential reset --id myServicePrincipalID --query password --output tsv)

# the echo command writes to the log file
# only use it when testing
echo $myNewPassword
```
# [PowerShell](#tab/powershell)

```azurecli
# PowerShell script
$myNewPassword = az ad sp credential reset --id myServicePrincipalID --query password --output tsv

# The Write-Host cmdlet can be used for displaying the value when testing.
# Comment it out or remove it in production if you don't want to display the password.
Write-Host $myNewPassword
```

For more information on the `tsv` output type, see [Output formats for Azure CLI commands](./format-output-azure-cli.md#tsv-output-format).

---
## Next Steps

Now that you've learned how to reset your service principal credentials, proceed to the next step to see how to clean up tutorial resources.

> [!div class="nextstepaction"]
> [Cleanup & troubleshoot service principals](./azure-cli-sp-tutorial-8.md)
