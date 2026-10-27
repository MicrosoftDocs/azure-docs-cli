---
title: "Tutorial: Run repeatable deployments from a pipeline with Azure CLI (preview)"
description: "Plan federated pipeline authentication, repeat a test deployment, detect a failure, and clean up with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: tutorial
ms.date: 10/27/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Tutorial: Run repeatable deployments from a pipeline with Azure CLI (preview)

In this tutorial, you plan federated pipeline authentication, repeat a test deployment, detect a failure, and clean up with Azure CLI preview.

In this tutorial, you:

> [!div class="checklist"]
> - Sign in without a browser
> - Prepare the job
> - Deploy twice
> - Detect a failure
> - Clean up

> [!IMPORTANT]
> These draft examples require end-to-end validation against the release build before use.

> [!WARNING]
> This scenario requires non-interactive authentication that the [current preview limitations](getting-started.md#current-limitations) list as unsupported. Use these commands for engineering review only. They don't establish supported functionality. Don't run this walkthrough until the product team confirms support for your preview build.

## Prerequisites

- Bash on Linux or macOS, or PowerShell 7.6 or later on Windows.
- A test pipeline agent with the Azure CLI preview, installed as described in [Set up and switch sign-in profiles](quickstart-profiles.md).
- A test service principal with least-privilege access to the test subscription and a federated credential for your pipeline provider. The provider supplies a token file whose path is in `AZURE_FEDERATED_TOKEN_FILE`.
- The sample storage template from [Deploy and troubleshoot a Bicep template](tutorial-deploy-bicep.md).

Never print tokens, secrets, or the process environment in job output.

You need an Azure subscription. If you don't have one, [create a free account](https://azure.microsoft.com/free/).

## Set variables

# [Bash](#tab/bash)

```bash
set -euo pipefail
tenant="<test-tenant-id>"
sub="<test-subscription-id>"
client_id="<application-client-ID>"
location="<region>"
template="<path-to-sample-storage.bicep>"
run=$(date +%Y%m%d%H%M%S)
profile="pipeline-$run"
rg="azclips-ci-$run"
deployment="ci-$run"
storage="clips$(openssl rand -hex 9)"
```

# [PowerShell](#tab/powershell)

```powershell
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $true
$tenant = '<test-tenant-id>'
$sub = '<test-subscription-id>'
$clientId = '<application-client-ID>'
$location = '<region>'
$template = '<path-to-sample-storage.bicep>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$profile = "pipeline-$run"
$rg = "azclips-ci-$run"
$deployment = "ci-$run"
$storage = "clips$([guid]::NewGuid().ToString('N').Substring(0, 18))"
```

---

## Sign in without a browser

# [Bash](#tab/bash)

```bash
federated_token="$(cat "$AZURE_FEDERATED_TOKEN_FILE")"
az login --service-principal --client-id "$client_id" --tenant-id "$tenant" --subscription-id "$sub" --federated-token "$federated_token" --out-profile "$profile"
```

# [PowerShell](#tab/powershell)

```powershell
$federatedToken = (Get-Content -LiteralPath $env:AZURE_FEDERATED_TOKEN_FILE -Raw).Trim()
az login --service-principal --client-id $clientId --tenant-id $tenant --subscription-id $sub --federated-token $federatedToken --out-profile $profile
```

---

## Prepare the job

# [Bash](#tab/bash)

```bash
az profile show "$profile"
az group create --subscription-id "$sub" --name "$rg" --location "$location"
```

# [PowerShell](#tab/powershell)

```powershell
az profile show $profile
az group create --subscription-id $sub --name $rg --location $location
```

---

## Deploy twice

# [Bash](#tab/bash)

```bash
for attempt in 1 2; do
  az deployment group create --subscription-id "$sub" --resource-group "$rg" --name "$deployment" --template-file "$template" --parameter "storageAccountName=$storage" --mode Incremental
done
az deployment group show --subscription-id "$sub" --resource-group "$rg" --name "$deployment"
```

# [PowerShell](#tab/powershell)

```powershell
1..2 | ForEach-Object {
    az deployment group create --subscription-id $sub --resource-group $rg --name $deployment --template-file $template --parameter "storageAccountName=$storage" --mode Incremental
}
az deployment group show --subscription-id $sub --resource-group $rg --name $deployment
```

---

## Detect a failure

# [Bash](#tab/bash)

```bash
if az group show --subscription-id "$sub" --name "$rg-missing" --output json; then
  echo "Missing-resource lookup unexpectedly succeeded." >&2
  exit 1
fi
```

# [PowerShell](#tab/powershell)

```powershell
try {
    az group show --subscription-id $sub --name "$rg-missing" --output json
    throw 'Missing-resource lookup unexpectedly succeeded.'
}
catch {
    if ($_.Exception.Message -like '*unexpectedly succeeded*') { throw }
}
```

---

## Clean up resources

Configure the pipeline to run cleanup even when an earlier step fails. The examples below show the cleanup commands, not a complete pipeline job or failure-handling wrapper.

# [Bash](#tab/bash)

```bash
az group delete --subscription-id "$sub" --name "$rg"
az group exists --subscription-id "$sub" --name "$rg"
az profile set --name "$profile"
az logout
az profile remove --name "$profile"
unset federated_token
```

# [PowerShell](#tab/powershell)

```powershell
az group delete --subscription-id $sub --name $rg
az group exists --subscription-id $sub --name $rg
az profile set --name $profile
az logout
az profile remove --name $profile
Remove-Variable federatedToken
```

---

## Other sign-in methods

Replace the sign-in example with one of the following. Keep secrets and certificates in the pipeline's secret store, never in source or job output.

**Managed identity**, on an agent with an assigned managed identity. Set the client ID to the managed identity's client ID.

- Azure CLI preview in Bash: `az login --identity --client-id "$client_id" --subscription-id "$sub" --out-profile "$profile"`
- Azure CLI preview in PowerShell: `az login --identity --client-id $clientId --subscription-id $sub --out-profile $profile`

**Client secret or certificate**

- Azure CLI preview: **Pending engineering confirmation: client-secret or certificate sign-in command.**

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Discover commands and recover from failures](how-to-command-recovery.md).
