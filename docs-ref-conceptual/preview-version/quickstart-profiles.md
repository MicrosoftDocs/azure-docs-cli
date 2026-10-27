---
title: "Quickstart: Set up and switch sign-in profiles with Azure CLI (preview)"
description: "Set up named sign-in profiles, switch tenants and subscriptions, and remove test profiles with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: quickstart
ms.date: 10/27/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Quickstart: Set up and switch sign-in profiles with Azure CLI (preview)

In this quickstart, you set up named sign-in profiles, switch tenants and subscriptions, and remove test profiles with Azure CLI preview.

> [!IMPORTANT]
> These draft examples require end-to-end validation against the release build before use.

## Prerequisites

- Azure CLI preview, installed by following [Install Azure CLI preview](install-overview.md).
- Bash on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Two Azure subscriptions or accounts you can sign in to. They can belong to the same tenant.

Find each subscription ID and its directory (tenant) ID in **Azure portal > Subscriptions > select the subscription > Overview**. Use the same tenant ID twice if both subscriptions are in one directory.

You need an Azure subscription. If you don't have one, [create a free account](https://azure.microsoft.com/free/).

Before saving the sign-in contexts, note your active profile with `az profile show --active`, and do not overwrite existing profiles.

## Set variables

# [Bash](#tab/bash)

```bash
set -euo pipefail
tenant_a="<tenant-A-id>"
sub_a="<subscription-A-id>"
tenant_b="<tenant-B-id>"
sub_b="<subscription-B-id>"
run=$(date +%Y%m%d%H%M%S)
profile_a="review-a-$run"
profile_b="review-b-$run"
```

# [PowerShell](#tab/powershell)

```powershell
$ErrorActionPreference = 'Stop'
$tenantA = '<tenant-A-id>'
$subA = '<subscription-A-id>'
$tenantB = '<tenant-B-id>'
$subB = '<subscription-B-id>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$profileA = "review-a-$run"
$profileB = "review-b-$run"
```

---

## Verify the installation

# [Bash](#tab/bash)

```bash
command -v az
az --version
az --help
```

# [PowerShell](#tab/powershell)

```powershell
Get-Command az
az --version
az --help
```

---

## Save two sign-in contexts

# [Bash](#tab/bash)

```bash
az login --tenant-id "$tenant_a" --subscription-id "$sub_a" --out-profile "$profile_a"
az login --use-device-code --tenant-id "$tenant_b" --subscription-id "$sub_b" --out-profile "$profile_b"
```

# [PowerShell](#tab/powershell)

```powershell
az login --tenant-id $tenantA --subscription-id $subA --out-profile $profileA
az login --use-device-code --tenant-id $tenantB --subscription-id $subB --out-profile $profileB
```

---

## Switch work environments

# [Bash](#tab/bash)

```bash
az profile list
az profile show "$profile_a"
az profile set --name "$profile_a"
az group list
az group list --profile "$profile_b"
az profile show --active
```

# [PowerShell](#tab/powershell)

```powershell
az profile list
az profile show $profileA
az profile set --name $profileA
az group list
az group list --profile $profileB
az profile show --active
```

---

## Refresh and retrieve a token (optional)

# [Bash](#tab/bash)

```bash
az login --profile "$profile_a"
token_response=$(az account get-access-token --resource-type arm)
test -n "$token_response"
unset token_response
```

# [PowerShell](#tab/powershell)

```powershell
az login --profile $profileA
$tokenResponse = az account get-access-token --resource-type arm
if (-not $tokenResponse) { throw 'No token response returned.' }
Remove-Variable tokenResponse
```

---

Don't print, log, or share access tokens.

## Clean up resources

# [Bash](#tab/bash)

```bash
for p in "$profile_a" "$profile_b"; do
  az profile set --name "$p"
  az logout
  az profile remove --name "$p"
done
```

Restore your previous profile with `az profile set --name <previous-profile>`.

# [PowerShell](#tab/powershell)

```powershell
foreach ($p in $profileA, $profileB) {
    az profile set --name $p
    az logout
    az profile remove --name $p
}
```

Restore your previous profile with `az profile set --name <previous-profile>`.

---

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Deploy and manage a virtual machine application](tutorial-vm-application.md).
