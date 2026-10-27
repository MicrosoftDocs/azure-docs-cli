---
title: "Tutorial: Store and retrieve application data with Azure CLI (preview)"
description: "Plan a blob and file-share round trip, compare downloaded data, and clean up test storage with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: tutorial
ms.date: 10/27/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Tutorial: Store and retrieve application data with Azure CLI (preview)

In this tutorial, you plan a blob and file-share round trip, compare downloaded data, and clean up test storage with Azure CLI preview.

In this tutorial, you:

> [!div class="checklist"]
> - Create the storage environment
> - Upload data
> - Retrieve data
> - Share a file (optional)
> - Clean up

> [!IMPORTANT]
> These draft examples require end-to-end validation against the release build before use.

> [!IMPORTANT]
> This walkthrough is incomplete. The source doesn't yet provide the data-plane commands or authentication steps for the blob and file-share operations. Don't run the resource-creation steps until those operations are available and validated.

## Prerequisites

- Bash on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Azure CLI preview, installed and signed in as described in [Set up and switch sign-in profiles](quickstart-profiles.md).
- Permission to upload and download data in the test storage account.

Use only synthetic test data.

You need an Azure subscription. If you don't have one, [create a free account](https://azure.microsoft.com/free/).

## Set variables

# [Bash](#tab/bash)

```bash
set -euo pipefail
sub="<test-subscription-id>"
location="<region>"
run=$(date +%Y%m%d%H%M%S)
rg="azclips-data-$run"
account="clips$(openssl rand -hex 9)"
container="data-$run"
share="files-$run"
source_file="/tmp/$rg-source.txt"
blob_download="/tmp/$rg-blob.txt"
file_download="/tmp/$rg-file.txt"
```

# [PowerShell](#tab/powershell)

```powershell
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $true
$sub = '<test-subscription-id>'
$location = '<region>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$rg = "azclips-data-$run"
$account = "clips$([guid]::NewGuid().ToString('N').Substring(0, 18))"
$container = "data-$run"
$share = "files-$run"
$temp = [IO.Path]::GetTempPath()
$source = Join-Path $temp "$rg-source.txt"
$blobDownload = Join-Path $temp "$rg-blob.txt"
$fileDownload = Join-Path $temp "$rg-file.txt"
```

---

## Create the storage environment

# [Bash](#tab/bash)

```bash
az group create --subscription-id "$sub" --name "$rg" --location "$location"
az storage account create --resource-group "$rg" --name "$account" --location "$location" --sku Standard_LRS --kind StorageV2
az storage account show --resource-group "$rg" --name "$account"
```

Create a private blob container named `$container` in `$account`: **Pending engineering confirmation: blob container create command.**

# [PowerShell](#tab/powershell)

```powershell
az group create --subscription-id $sub --name $rg --location $location
az storage account create --resource-group $rg --name $account --location $location --sku Standard_LRS --kind StorageV2
az storage account show --resource-group $rg --name $account
```

Create a private blob container named `$container` in `$account`: **Pending engineering confirmation: blob container create command.**

---

## Upload data

# [Bash](#tab/bash)

```bash
printf 'AzCLIPS data round trip %s' "$run" > "$source_file"
```

- Upload `$source_file` as the blob `payload.txt`: **Pending engineering confirmation: blob upload command.**
- List the blobs in `$container`: **Pending engineering confirmation: blob list command.**

# [PowerShell](#tab/powershell)

```powershell
Set-Content -LiteralPath $source -Value "AzCLIPS data round trip $run" -NoNewline
```

- Upload `$source` as the blob `payload.txt`: **Pending engineering confirmation: blob upload command.**
- List the blobs in `$container`: **Pending engineering confirmation: blob list command.**

---

## Retrieve data

# [Bash](#tab/bash)

- Download `payload.txt` to `$blob_download`: **Pending engineering confirmation: blob download command.**

```bash
cmp "$source_file" "$blob_download"
```

# [PowerShell](#tab/powershell)

- Download `payload.txt` to `$blobDownload`: **Pending engineering confirmation: blob download command.**

```powershell
if ((Get-FileHash -LiteralPath $source).Hash -ne (Get-FileHash -LiteralPath $blobDownload).Hash) { throw 'Blob content mismatch.' }
```

---

## Share a file (optional)

# [Bash](#tab/bash)

- Create the file share `$share` in `$account`: **Pending engineering confirmation: file share create command.**
- Upload `$source_file` to the share: **Pending engineering confirmation: file upload command.**
- List the files in the share: **Pending engineering confirmation: file list command.**
- Download the file to `$file_download`: **Pending engineering confirmation: file download command.**

```bash
cmp "$source_file" "$file_download"
```

# [PowerShell](#tab/powershell)

- Create the file share `$share` in `$account`: **Pending engineering confirmation: file share create command.**
- Upload `$source` to the share: **Pending engineering confirmation: file upload command.**
- List the files in the share: **Pending engineering confirmation: file list command.**
- Download the file to `$fileDownload`: **Pending engineering confirmation: file download command.**

```powershell
if ((Get-FileHash -LiteralPath $source).Hash -ne (Get-FileHash -LiteralPath $fileDownload).Hash) { throw 'File-share content mismatch.' }
```

---

## Clean up resources

# [Bash](#tab/bash)

```bash
az group delete --subscription-id "$sub" --name "$rg"
az group exists --subscription-id "$sub" --name "$rg"
rm -f "$source_file" "$blob_download" "$file_download"
```

# [PowerShell](#tab/powershell)

```powershell
az group delete --subscription-id $sub --name $rg
az group exists --subscription-id $sub --name $rg
Remove-Item -LiteralPath $source, $blobDownload, $fileDownload -ErrorAction SilentlyContinue
```

---

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Find identities and register a Microsoft Entra application](how-to-entra-applications.md).
