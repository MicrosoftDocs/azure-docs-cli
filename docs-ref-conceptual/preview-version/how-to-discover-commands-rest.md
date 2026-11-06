---
title: "Discover commands and call Azure REST APIs with Azure CLI (preview)"
description: "Find Azure CLI preview commands, create a resource with an authenticated REST request when no command exists, and check installed extensions."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: how-to
ms.date: 10/28/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Discover commands and call Azure REST APIs with Azure CLI (preview)

In this article, you find the Azure CLI preview command for a task, and when the preview doesn't include a command for a resource type yet, you manage that resource with an authenticated Azure Resource Manager REST request instead.

When you finish, you've used built-in help to find and run a command, created and inspected a storage account through `az rest` without a dedicated command, confirmed which extensions are installed, and removed everything you created.

## Prerequisites

- Bash or zsh on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Azure CLI preview, installed and signed in as described in [Set up and switch sign-in profiles](quickstart-profiles.md).
- Permission to create resource groups and storage accounts in a test subscription.

## Set variables

# [Bash](#tab/bash)

```bash
sub="<test-subscription-id>"
location="<region>"
run=$(date +%Y%m%d%H%M%S)
rg="azclips-discover-$run"
storage="clips$(openssl rand -hex 9)"
uri="/subscriptions/$sub/resourceGroups/$rg/providers/Microsoft.Storage/storageAccounts/$storage?api-version=2023-05-01"
```

# [PowerShell](#tab/powershell)

```powershell
$sub = '<test-subscription-id>'
$location = '<region>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$rg = "azclips-discover-$run"
$storage = "clips$([guid]::NewGuid().ToString('N').Substring(0, 18))"
$uri = "/subscriptions/$sub/resourceGroups/$rg/providers/Microsoft.Storage/storageAccounts/${storage}?api-version=2023-05-01"
```

---

## Discover commands

Use help to find the command groups and the parameters for a command, and then run the command.

# [Bash](#tab/bash)

```bash
az --help
az group create --help
az group create --subscription-id "$sub" --name "$rg" --location "$location"
```

# [PowerShell](#tab/powershell)

```powershell
az --help
az group create --help
az group create --subscription-id $sub --name $rg --location $location
```

---

`az --help` lists the available command groups. `az group create --help` shows the required parameters, `--name` and `--location`, and the optional parameters. The last command creates the resource group and returns it with `"provisioningState": "Succeeded"`.

## Create a resource with authenticated REST

The preview doesn't include `az storage account` commands. When the preview doesn't have a command for a resource type, use `az rest` to send the Azure Resource Manager REST request yourself. `az rest` signs the request with your current sign-in and returns the raw response.

Create a storage account with a `PUT` request:

# [Bash](#tab/bash)

```bash
az rest --method PUT --uri "$uri" --body "{\"location\": \"$location\", \"sku\": {\"name\": \"Standard_LRS\"}, \"kind\": \"StorageV2\", \"properties\": {\"minimumTlsVersion\": \"TLS1_2\", \"allowBlobPublicAccess\": false}}"
```

# [PowerShell](#tab/powershell)

```powershell
$body = @{
    location   = $location
    sku        = @{ name = 'Standard_LRS' }
    kind       = 'StorageV2'
    properties = @{ minimumTlsVersion = 'TLS1_2'; allowBlobPublicAccess = $false }
} | ConvertTo-Json -Compress
az rest --method PUT --uri $uri --body $body
```

---

Azure Resource Manager accepts the request and creates the storage account asynchronously. `az rest` sends a single request and doesn't wait for the operation to finish, so the response might be empty, with status `202 Accepted`. If the request fails, `az rest` prints the error response body and exits with a nonzero exit code.

Wait a minute, and then read the storage account with a `GET` request:

# [Bash](#tab/bash)

```bash
az rest --method GET --uri "$uri" --query "{name:name, state:properties.provisioningState, tls:properties.minimumTlsVersion}"
```

# [PowerShell](#tab/powershell)

```powershell
az rest --method GET --uri $uri --query '{name:name, state:properties.provisioningState, tls:properties.minimumTlsVersion}'
```

---

The output shows the storage account name, a `state` of `Succeeded`, and `TLS1_2`. If the state is still `Creating`, wait and run the command again.

For the request format and the properties you can set, see the REST API reference for the resource type. For storage accounts, see [Storage Accounts - Create](/rest/api/storagerp/storage-accounts/create).

## Check your extensions (optional)

A full installation includes the `compute` extension. Confirm that it's installed:

# [Bash](#tab/bash)

```bash
az extension list
az extension show --name compute
```

# [PowerShell](#tab/powershell)

```powershell
az extension list
az extension show --name compute
```

---

`az extension list` shows each extension that the CLI can load, with its selected version and location. `az extension show` returns the details of the `compute` extension, including the command groups it contributes. If `compute` isn't listed, install it from the extensions bundle for your installed preview version, as described in [Install Azure CLI preview extensions](install-cli-extensions.md).

## Clean up resources

Delete the resource group, which also deletes the storage account.

# [Bash](#tab/bash)

```bash
az group delete --subscription-id "$sub" --name "$rg"
az group exists --subscription-id "$sub" --name "$rg"
```

# [PowerShell](#tab/powershell)

```powershell
az group delete --subscription-id $sub --name $rg
az group exists --subscription-id $sub --name $rg
```

---

`az group exists` returns `false`. If you added the `compute` extension, remove it with `az extension remove --name compute`.

## Related content

- For more information, see [Recover from command failures with AI troubleshooting](how-to-command-recovery.md).
- For more information, see [Install Azure CLI preview extensions](install-cli-extensions.md).
- For more information, see [Get started with the preview](getting-started.md).
