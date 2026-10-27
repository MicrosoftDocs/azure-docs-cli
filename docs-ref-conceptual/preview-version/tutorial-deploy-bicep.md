---
title: "Tutorial: Deploy and troubleshoot a Bicep template with Azure CLI (preview)"
description: "Preview and deploy a Bicep template, repeat the deployment, investigate an error, and clean up with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: tutorial
ms.date: 10/27/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Tutorial: Deploy and troubleshoot a Bicep template with Azure CLI (preview)

In this tutorial, you preview and deploy a Bicep template, repeat the deployment, investigate an error, and clean up with Azure CLI preview.

In this tutorial, you:

> [!div class="checklist"]
> - Prepare the deployment
> - Preview the change
> - Deploy and inspect
> - Repeat the deployment
> - Diagnose a failure
> - Clean up

> [!IMPORTANT]
> These draft examples require end-to-end validation against the release build before use.

## Prerequisites

- Bash on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Azure CLI preview, installed and signed in as described in [Set up and switch sign-in profiles](quickstart-profiles.md).
- The Bicep CLI, and the sample storage template in [Create the Bicep template](#create-the-bicep-template) saved locally.

Deploy in Incremental mode into a dedicated resource group, not against shared resources.

You need an Azure subscription. If you don't have one, [create a free account](https://azure.microsoft.com/free/).

## Create the Bicep template

Save the following resource-group-scoped template as `sample-storage.bicep`. Set the template path in the next section to this local file. The template disables anonymous blob access and shared-key authorization and requires HTTPS with TLS 1.2 or later.

```bicep
targetScope = 'resourceGroup'

@description('Globally unique storage account name.')
param storageAccountName string

@description('Storage account location.')
param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    allowBlobPublicAccess: false
    allowSharedKeyAccess: false
  }
}

output storageAccountId string = storageAccount.id
```

## Set variables

# [Bash](#tab/bash)

```bash
set -euo pipefail
sub="<test-subscription-id>"
location="<region>"
template="<path-to-sample-storage.bicep>"
run=$(date +%Y%m%d%H%M%S)
rg="azclips-iac-$run"
deployment="deploy-$run"
storage="clips$(openssl rand -hex 9)"
```

# [PowerShell](#tab/powershell)

```powershell
$ErrorActionPreference = 'Stop'
$sub = '<test-subscription-id>'
$location = '<region>'
$template = '<path-to-sample-storage.bicep>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$rg = "azclips-iac-$run"
$deployment = "deploy-$run"
$storage = "clips$([guid]::NewGuid().ToString('N').Substring(0, 18))"
$scope = @('--subscription-id', $sub, '--resource-group', $rg)
```

---

## Prepare the deployment

# [Bash](#tab/bash)

```bash
az group create --subscription-id "$sub" --name "$rg" --location "$location"
az group update --subscription-id "$sub" --resource-group "$rg" --set tags.purpose=iac-review
az group show --subscription-id "$sub" --name "$rg"
```

# [PowerShell](#tab/powershell)

```powershell
az group create --subscription-id $sub --name $rg --location $location
az group update --subscription-id $sub --resource-group $rg --set tags.purpose=iac-review
az group show --subscription-id $sub --name $rg
```

---

## Preview the change

# [Bash](#tab/bash)

```bash
az deployment group what-if --subscription-id "$sub" --resource-group "$rg" --name "$deployment" --template-file "$template" --parameter "storageAccountName=$storage" --mode Incremental
```

# [PowerShell](#tab/powershell)

```powershell
az deployment group what-if @scope --name $deployment --template-file $template --parameter "storageAccountName=$storage" --mode Incremental
```

---

## Deploy and inspect

# [Bash](#tab/bash)

```bash
az deployment group create --subscription-id "$sub" --resource-group "$rg" --name "$deployment" --template-file "$template" --parameter "storageAccountName=$storage" --validation-level Provider --mode Incremental
az deployment group show --subscription-id "$sub" --resource-group "$rg" --name "$deployment"
az deployment group list --subscription-id "$sub" --resource-group "$rg"
```

# [PowerShell](#tab/powershell)

```powershell
az deployment group create @scope --name $deployment --template-file $template --parameter "storageAccountName=$storage" --validation-level Provider --mode Incremental
az deployment group show @scope --name $deployment
az deployment group list @scope
```

---

## Repeat the deployment

# [Bash](#tab/bash)

```bash
az deployment group create --subscription-id "$sub" --resource-group "$rg" --name "$deployment" --template-file "$template" --parameter "storageAccountName=$storage" --validation-level Provider --mode Incremental
```

# [PowerShell](#tab/powershell)

```powershell
az deployment group create @scope --name $deployment --template-file $template --parameter "storageAccountName=$storage" --validation-level Provider --mode Incremental
```

---

## Diagnose a failure

# [Bash](#tab/bash)

```bash
if az deployment group create --subscription-id "$sub" --resource-group "$rg" --name "$deployment-invalid" --template-file "$template" --parameter "storageAccountName=$storage" --mode Foo; then
  echo "The invalid deployment unexpectedly succeeded." >&2
  exit 1
fi
```

Inspect the deployment operations: **Pending engineering confirmation: deployment operations command.**

# [PowerShell](#tab/powershell)

```powershell
az deployment group create @scope --name "$deployment-invalid" --template-file $template --parameter "storageAccountName=$storage" --mode Foo
"Exit code: $LASTEXITCODE"
```

The command fails and reports the allowed values for the mode. Inspect the deployment operations: **Pending engineering confirmation: deployment operations command.**

---

## Clean up resources

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

## Other deployment scopes

Repeat the preview, deploy, inspect and clean-up steps at a broader scope, using a template written for that scope. Use test scopes and uniquely named resources. Deleting the resource group does not remove resources deployed at a higher scope, so remove those resources individually.

- Subscription scope: **Pending engineering confirmation: subscription deployment commands.**
- Management group scope: **Pending engineering confirmation: management group deployment commands.**
- Tenant scope: **Pending engineering confirmation: tenant deployment commands.**

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Store and retrieve application data](tutorial-storage-data.md).
