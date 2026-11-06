---
title: "Tutorial: Deploy and troubleshoot a Bicep template with Azure CLI (preview)"
description: "Preview and deploy a Bicep template, repeat the deployment, investigate an error, and clean up with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: tutorial
ms.date: 10/28/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Tutorial: Deploy and troubleshoot a Bicep template with Azure CLI (preview)

In this tutorial, you use Azure CLI preview to deploy infrastructure as code safely: you preview what a Bicep template changes before you deploy it, confirm that deploying it again doesn't create duplicate resources, and get actionable diagnostics when a deployment fails.

When you finish, the template has created exactly one storage account with the intended settings, a repeat deployment has left that storage account unchanged, a controlled failure has produced a clear error, and no test resources remain.

In this tutorial, you:

> [!div class="checklist"]
> - Prepare the deployment
> - Preview the change
> - Deploy and inspect
> - Repeat the deployment
> - Diagnose a failure
> - Clean up

## Prerequisites

- Bash or zsh on Linux or macOS, or PowerShell 7.6 or later on Windows.
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
az group update --subscription-id "$sub" --name "$rg" --tags purpose=iac-review
az group show --subscription-id "$sub" --name "$rg"
```

# [PowerShell](#tab/powershell)

```powershell
az group create --subscription-id $sub --name $rg --location $location
az group update --subscription-id $sub --name $rg --tags purpose=iac-review
az group show --subscription-id $sub --name $rg
```

---

`az group create` doesn't accept tags, so `az group update` adds the `purpose` tag after the group exists. The `az group show` output includes `"provisioningState": "Succeeded"` and the tag `"purpose": "iac-review"`.

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

What-if doesn't change any resources. Its output lists one change, a **Create** for the storage account, with the properties from the template. If the output lists other changes, review them before you deploy.

## Deploy and inspect

# [Bash](#tab/bash)

```bash
first_id=$(az deployment group create --subscription-id "$sub" --resource-group "$rg" --name "$deployment" --template-file "$template" --parameter "storageAccountName=$storage" --validation-level Provider --mode Incremental --query properties.outputs.storageAccountId.value --output tsv)
echo "$first_id"
az deployment group show --subscription-id "$sub" --resource-group "$rg" --name "$deployment" --query properties.provisioningState --output tsv
az deployment group list --subscription-id "$sub" --resource-group "$rg" --output table
```

# [PowerShell](#tab/powershell)

```powershell
$firstId = az deployment group create @scope --name $deployment --template-file $template --parameter "storageAccountName=$storage" --validation-level Provider --mode Incremental --query properties.outputs.storageAccountId.value --output tsv
$firstId
az deployment group show @scope --name $deployment --query properties.provisioningState --output tsv
az deployment group list @scope --output table
```

---

`az deployment group create` waits for the deployment to finish. The first command prints the resource ID of the new storage account, the deployment's provisioning state is `Succeeded`, and the deployment list shows one deployment.

## Repeat the deployment

In practice, you redeploy the same template whenever you rerun a pipeline, retry after a transient failure, or apply a change to the template. Incremental deployments are idempotent: deploying the same template with the same parameters updates the existing resources to match the template instead of creating new ones. Deploy again and confirm that the storage account is the same one.

# [Bash](#tab/bash)

```bash
second_id=$(az deployment group create --subscription-id "$sub" --resource-group "$rg" --name "$deployment" --template-file "$template" --parameter "storageAccountName=$storage" --validation-level Provider --mode Incremental --query properties.outputs.storageAccountId.value --output tsv)
if [ "$first_id" = "$second_id" ]; then echo "Same storage account"; else echo "Storage account changed" >&2; fi
```

# [PowerShell](#tab/powershell)

```powershell
$secondId = az deployment group create @scope --name $deployment --template-file $template --parameter "storageAccountName=$storage" --validation-level Provider --mode Incremental --query properties.outputs.storageAccountId.value --output tsv
if ($firstId -eq $secondId) { 'Same storage account' } else { Write-Error 'Storage account changed' }
```

---

The output is `Same storage account`. The second deployment succeeds and returns the same resource ID, so no second storage account was created.

## Diagnose a failure

Submit a deployment with an invalid mode to see how the CLI reports an error.

# [Bash](#tab/bash)

```bash
if az deployment group create --subscription-id "$sub" --resource-group "$rg" --name "$deployment-invalid" --template-file "$template" --parameter "storageAccountName=$storage" --mode Foo; then
  echo "The invalid deployment unexpectedly succeeded." >&2
fi
```

# [PowerShell](#tab/powershell)

```powershell
az deployment group create @scope --name "$deployment-invalid" --template-file $template --parameter "storageAccountName=$storage" --mode Foo
"Exit code: $LASTEXITCODE"
```

---

The command fails with a nonzero exit code and an error that lists the allowed values for `--mode`, `Incremental` and `Complete`. Because the CLI rejects the value before it submits the deployment, no deployment named `<deployment>-invalid` is created.

When a deployment that Azure accepts fails later, list the failed deployments and show the error details:

# [Bash](#tab/bash)

```bash
az deployment group list --subscription-id "$sub" --resource-group "$rg" --filter "provisioningState eq 'Failed'" --output table
az deployment group show --subscription-id "$sub" --resource-group "$rg" --name "<failed-deployment-name>" --query properties.error
```

# [PowerShell](#tab/powershell)

```powershell
az deployment group list @scope --filter "provisioningState eq 'Failed'" --output table
az deployment group show @scope --name '<failed-deployment-name>' --query properties.error
```

---

The error object contains the error code and message that Azure Resource Manager returned. To inspect the individual deployment operations: **Pending engineering confirmation: deployment operations command.**

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

`az group delete` waits until the resource group and the storage account are deleted. `az group exists` then returns `false`.

## Other deployment scopes

Repeat the preview, deploy, inspect and clean-up steps at a broader scope, using a template written for that scope. Use test scopes and uniquely named resources. Deleting the resource group doesn't remove resources deployed at a higher scope, so remove those resources individually.

- Subscription scope: **Pending engineering confirmation: subscription deployment commands.**
- Management group scope: **Pending engineering confirmation: management group deployment commands.**
- Tenant scope: **Pending engineering confirmation: tenant deployment commands.**

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Run repeatable deployments from a pipeline](tutorial-pipeline-deployments.md).
