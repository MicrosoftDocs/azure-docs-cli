---
title: "Tutorial: Access a Key Vault secret with a managed identity with Azure CLI (preview)"
description: "Create a managed identity, grant access to a test Key Vault secret, verify access, and revoke it with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: tutorial
ms.date: 10/27/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Tutorial: Access a Key Vault secret with a managed identity with Azure CLI (preview)

In this tutorial, you create a managed identity, grant access to a test Key Vault secret, verify access, and revoke it with Azure CLI preview.

In this tutorial, you:

> [!div class="checklist"]
> - Create the application's identity
> - Store a test secret
> - Grant access
> - Read the secret as the application
> - Revoke access
> - Clean up

> [!IMPORTANT]
> These draft examples require end-to-end validation against the release build before use.

> [!WARNING]
> This scenario requires non-interactive authentication that the [current preview limitations](getting-started.md#current-limitations) list as unsupported. Use these commands for engineering review only. They don't establish supported functionality. Don't run this walkthrough until the product team confirms support for your preview build.

## Prerequisites

- Bash on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Azure CLI preview, installed and signed in as described in [Set up and switch sign-in profiles](quickstart-profiles.md).
- An Azure host, such as a VM, that can use a user-assigned managed identity and has the Azure CLI preview or modules installed.
- An existing test Key Vault that uses Azure role-based access control and is reachable from that host.
- The role definition ID of a built-in role that grants secret read access, and permission to assign it.

Use only synthetic secret values. Do not print or log secret values.

You need an Azure subscription. If you don't have one, [create a free account](https://azure.microsoft.com/free/).

Allow time for role changes to take effect before verifying a grant or a revocation. The managed-identity sign-in runs on the host, so set the same subscription, vault, secret, client ID and run values there.

## Set variables

# [Bash](#tab/bash)

```bash
set -euo pipefail
sub="<test-subscription-id>"
location="<region>"
vault="<existing-test-vault-name>"
vault_id="<existing-test-vault-resource-ID>"
role="<secret-read-role-definition-ID>"
run=$(date +%Y%m%d%H%M%S)
rg="azclips-access-$run"
identity="app-identity-$run"
secret="app-secret-$run"
assignment=$(uuidgen)
identity_id="/subscriptions/$sub/resourceGroups/$rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/$identity"
fixture="/tmp/$secret.txt"
```

# [PowerShell](#tab/powershell)

```powershell
$ErrorActionPreference = 'Stop'
$sub = '<test-subscription-id>'
$location = '<region>'
$vault = '<existing-test-vault-name>'
$vaultId = '<existing-test-vault-resource-ID>'
$role = '<secret-read-role-definition-ID>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$rg = "azclips-access-$run"
$identity = "app-identity-$run"
$secret = "app-secret-$run"
$assignment = [guid]::NewGuid().ToString()
$identityId = "/subscriptions/$sub/resourceGroups/$rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/$identity"
$fixture = Join-Path ([IO.Path]::GetTempPath()) "$secret.txt"
```

---

## Create the application's identity

# [Bash](#tab/bash)

```bash
az group create --subscription-id "$sub" --name "$rg" --location "$location"
az identity create --subscription "$sub" --resource-group "$rg" --name "$identity" --location "$location"
az identity show --ids "$identity_id"
principal_id=$(az identity show --ids "$identity_id" --query properties.principalId --output tsv)
client_id=$(az identity show --ids "$identity_id" --query properties.clientId --output tsv)
```

# [PowerShell](#tab/powershell)

```powershell
az group create --subscription-id $sub --name $rg --location $location
az identity create --subscription $sub --resource-group $rg --name $identity --location $location
az identity show --ids $identityId
$principalId = az identity show --ids $identityId --query properties.principalId --output tsv
$clientId = az identity show --ids $identityId --query properties.clientId --output tsv
```

---

## Store a test secret

# [Bash](#tab/bash)

```bash
printf 'azclips-synthetic' > "$fixture"
az keyvault secret set --vault-name "$vault" --name "$secret" --file "$fixture"
az keyvault secret show --vault-name "$vault" --name "$secret"
```

# [PowerShell](#tab/powershell)

```powershell
Set-Content -LiteralPath $fixture -Value 'azclips-synthetic' -NoNewline
az keyvault secret set --vault-name $vault --name $secret --file $fixture
az keyvault secret show --vault-name $vault --name $secret
```

---

## Grant access

# [Bash](#tab/bash)

```bash
az role assignment create --scope "$vault_id" --assignee-object-id "$principal_id" --assignee-principal-type ServicePrincipal --role "$role" --name "$assignment"
az role assignment list --scope "$vault_id" --assignee-object-id "$principal_id"
```

Attach the identity to the host: **Pending engineering confirmation: command to attach the identity to the host.**

# [PowerShell](#tab/powershell)

```powershell
az role assignment create --scope $vaultId --assignee-object-id $principalId --assignee-principal-type ServicePrincipal --role $role --name $assignment
az role assignment list --scope $vaultId --assignee-object-id $principalId
```

Attach the identity to the host: **Pending engineering confirmation: command to attach the identity to the host.**

---

## Read the secret as the application

# [Bash](#tab/bash)

On the host:

```bash
az login --identity --client-id "$client_id" --subscription-id "$sub" --out-profile "workload-$run"
value=$(az keyvault secret show --vault-name "$vault" --name "$secret" --as-plain-text)
test "$value" = "azclips-synthetic"
```

# [PowerShell](#tab/powershell)

On the host:

```powershell
az login --identity --client-id $clientId --subscription-id $sub --out-profile "workload-$run"
$value = az keyvault secret show --vault-name $vault --name $secret --as-plain-text
if ($value -ne 'azclips-synthetic') { throw 'Secret value mismatch.' }
```

---

## Revoke access

# [Bash](#tab/bash)

```bash
az role assignment delete --scope "$vault_id" --name "$assignment"
az role assignment list --scope "$vault_id" --assignee-object-id "$principal_id"
```

On the host, repeat the read from [Read the secret as the application](#read-the-secret-as-the-application). Confirm that the read now fails with an access-denied error.

# [PowerShell](#tab/powershell)

```powershell
az role assignment delete --scope $vaultId --name $assignment
az role assignment list --scope $vaultId --assignee-object-id $principalId
```

On the host, repeat the read from [Read the secret as the application](#read-the-secret-as-the-application). Confirm that the read now fails with an access-denied error.

---

## Clean up resources

# [Bash](#tab/bash)

Detach the identity from the host: **Pending engineering confirmation: command to detach the identity from the host.**

```bash
az identity delete --ids "$identity_id"
az group delete --subscription-id "$sub" --name "$rg"
az group exists --subscription-id "$sub" --name "$rg"
az keyvault secret delete --vault-name "$vault" --name "$secret" --yes
rm -f "$fixture"
```

On the host, sign out and remove the workload profile. In Bash, use `az logout` and `az profile remove --name "workload-$run"`. In PowerShell, use `az logout` and `az profile remove --name "workload-$run"`.

# [PowerShell](#tab/powershell)

Detach the identity from the host: **Pending engineering confirmation: command to detach the identity from the host.**

```powershell
az identity delete --ids $identityId
az group delete --subscription-id $sub --name $rg
az group exists --subscription-id $sub --name $rg
az keyvault secret delete --vault-name $vault --name $secret --yes
Remove-Item -LiteralPath $fixture -ErrorAction SilentlyContinue
Remove-Variable value -ErrorAction SilentlyContinue
```

On the host, sign out and remove the workload profile. In Bash, use `az logout` and `az profile remove --name "workload-$run"`. In PowerShell, use `az logout` and `az profile remove --name "workload-$run"`.

---

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Deploy and troubleshoot a Bicep template](tutorial-deploy-bicep.md).
