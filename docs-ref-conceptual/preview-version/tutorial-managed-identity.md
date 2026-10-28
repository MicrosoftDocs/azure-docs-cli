---
title: "Tutorial: Access a Key Vault secret with a managed identity with Azure CLI (preview)"
description: "Create a managed identity, grant access to a test Key Vault secret, verify access, and revoke it with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: tutorial
ms.date: 10/28/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Tutorial: Access a Key Vault secret with a managed identity with Azure CLI (preview)

In this tutorial, you use Azure CLI preview to give a workload access to a Key Vault secret through a user-assigned managed identity instead of a stored credential, confirm the access, and then revoke it.

When you finish, the workload has read the test secret by using its managed identity, the same read has failed after you revoked access, and no test identity or active test secret remains.

You run most steps on your workstation. You run the steps marked **On the host** on the Azure host, such as a VM, that runs the workload.

In this tutorial, you:

> [!div class="checklist"]
> - Create the application's identity
> - Store a test secret
> - Grant access
> - Read the secret as the application
> - Revoke access
> - Clean up

> [!WARNING]
> This scenario requires non-interactive authentication that the [current preview limitations](getting-started.md#current-limitations) list as unsupported. Use these commands for engineering review only. They don't establish supported functionality. Don't run this walkthrough until the product team confirms support for your preview build.

## Prerequisites

- Bash or zsh on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Azure CLI preview, installed and signed in as described in [Set up and switch sign-in profiles](quickstart-profiles.md).
- An Azure host, such as a VM, that can use a user-assigned managed identity and has the Azure CLI preview or modules installed.
- An existing test Key Vault that uses Azure role-based access control and is reachable from that host.
- The role definition ID of a built-in role that grants secret read access, and permission to assign it.

Use only synthetic secret values. Don't print or log secret values.

You need an Azure subscription. If you don't have one, [create a free account](https://azure.microsoft.com/free/).

Allow time for role changes to take effect before you verify a grant or a revocation. The managed-identity sign-in runs on the host, so set the same subscription, vault, secret, client ID, and run values there.

## Set variables

# [Bash](#tab/bash)

```bash
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

The `az identity show` output includes the identity's principal ID and client ID. You use the principal ID to grant access, and the client ID to sign in as the identity on the host.

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

Both commands return the secret's metadata, such as its ID and attributes, but not its value. `az keyvault secret show` returns the value only when you add `--as-plain-text`.

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

The role assignment list includes one assignment for the identity's principal ID, with the role you specified, at the vault's scope.

## Read the secret as the application

# [Bash](#tab/bash)

**On the host:**

```bash
az login --identity --client-id "$client_id" --subscription-id "$sub" --out-profile "workload-$run"
value=$(az keyvault secret show --vault-name "$vault" --name "$secret" --as-plain-text)
if [ "$value" = "azclips-synthetic" ]; then echo "Secret read succeeded"; else echo "Secret value mismatch" >&2; fi
unset value
```

# [PowerShell](#tab/powershell)

**On the host:**

```powershell
az login --identity --client-id $clientId --subscription-id $sub --out-profile "workload-$run"
$value = az keyvault secret show --vault-name $vault --name $secret --as-plain-text
if ($value -ne 'azclips-synthetic') { throw 'Secret value mismatch.' }
'Secret read succeeded'
Remove-Variable value
```

---

The script prints `Secret read succeeded` without printing the secret value. If the read fails with an access-denied error, wait a few minutes for the role assignment to take effect, and then try again.

## Revoke access

# [Bash](#tab/bash)

```bash
az role assignment delete --scope "$vault_id" --name "$assignment"
az role assignment list --scope "$vault_id" --assignee-object-id "$principal_id"
```

The role assignment list is empty. On the host, repeat the read from [Read the secret as the application](#read-the-secret-as-the-application). After the revocation takes effect, the read fails with an access-denied (`Forbidden`) error. If the read still succeeds, wait a few minutes and try again.

# [PowerShell](#tab/powershell)

```powershell
az role assignment delete --scope $vaultId --name $assignment
az role assignment list --scope $vaultId --assignee-object-id $principalId
```

The role assignment list is empty. On the host, repeat the read from [Read the secret as the application](#read-the-secret-as-the-application). After the revocation takes effect, the read fails with an access-denied (`Forbidden`) error. If the read still succeeds, wait a few minutes and try again.

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

`az group exists` returns `false`, and the test secret is deleted. Key Vault keeps the deleted secret in a recoverable state for the vault's retention period.

**On the host:** Sign out and remove the workload profile:

```azurecli
az logout
az profile remove --name "workload-$run"
```

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

`az group exists` returns `false`, and the test secret is deleted. Key Vault keeps the deleted secret in a recoverable state for the vault's retention period.

**On the host:** Sign out and remove the workload profile:

```azurecli
az logout
az profile remove --name "workload-$run"
```

---

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Deploy and troubleshoot a Bicep template](tutorial-deploy-bicep.md).
