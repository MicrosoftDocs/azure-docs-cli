---
title: "Find identities and register a Microsoft Entra application with Azure CLI (preview)"
description: "Look up test identities, register a single-tenant Microsoft Entra application, and remove it with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: how-to
ms.date: 10/27/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Find identities and register a Microsoft Entra application with Azure CLI (preview)

In this article, you look up test identities, register a single-tenant Microsoft Entra application, and remove it with Azure CLI preview.

> [!IMPORTANT]
> These draft examples require end-to-end validation against the release build before use.

## Prerequisites

- Bash on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Azure CLI preview, installed and signed in as described in [Set up and switch sign-in profiles](quickstart-profiles.md).
- A test user and a test group in your tenant, with permission to read them through Microsoft Graph and to create application registrations.

Use a new application registration, not an existing application. Do not share tenant-wide user data from list output.

## Set variables

# [Bash](#tab/bash)

```bash
set -euo pipefail
user_id="<test-user-object-ID>"
group_id="<test-group-object-ID>"
run=$(date +%Y%m%d%H%M%S)
app_name="azclips-app-$run"
```

# [PowerShell](#tab/powershell)

```powershell
$ErrorActionPreference = 'Stop'
$userId = '<test-user-object-ID>'
$groupId = '<test-group-object-ID>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$appName = "azclips-app-$run"
```

---

## Find identities

# [Bash](#tab/bash)

```bash
az msgraph user show --id "$user_id"
az msgraph user list
az msgraph group show --group "$group_id"
az msgraph group list
az msgraph group member list --group "$group_id"
az msgraph group member check --group "$group_id" --member-id "$user_id"
```

# [PowerShell](#tab/powershell)

```powershell
az msgraph user show --id $userId
az msgraph user list
az msgraph group show --group $groupId
az msgraph group list
az msgraph group member list --group $groupId
az msgraph group member check --group $groupId --member-id $userId
```

---

## Register the application

# [Bash](#tab/bash)

```bash
app_object_id=$(az msgraph app create --display-name "$app_name" --sign-in-audience AzureADMyOrg --query id --output tsv)
```

# [PowerShell](#tab/powershell)

```powershell
$app = az msgraph app create --display-name $appName --sign-in-audience AzureADMyOrg --output json | ConvertFrom-Json
$appObjectId = $app.id
```

---

## Inspect the registration

# [Bash](#tab/bash)

```bash
az msgraph app show --id "$app_object_id"
az msgraph app list --display-name "$app_name"
client_id=$(az msgraph app show --id "$app_object_id" --query appId --output tsv)
```

# [PowerShell](#tab/powershell)

```powershell
az msgraph app show --id $appObjectId
az msgraph app list --display-name $appName
$clientId = $app.appId
```

---

## Clean up resources

# [Bash](#tab/bash)

```bash
az msgraph app delete --id "$app_object_id"
az msgraph app show --id "$app_object_id" || echo "Application not found, as expected."
```

# [PowerShell](#tab/powershell)

```powershell
az msgraph app delete --id $appObjectId
az msgraph app show --id $appObjectId
```

The final lookup reports that the application is not found.

---

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Run repeatable deployments from a pipeline](tutorial-pipeline-deployments.md).
