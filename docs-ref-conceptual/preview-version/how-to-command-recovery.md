---
title: "Discover commands and recover from failures with Azure CLI (preview)"
description: "Find commands, use authenticated REST requests, and investigate command failures with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: how-to
ms.date: 10/27/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Discover commands and recover from failures with Azure CLI (preview)

In this article, you find commands, use authenticated REST requests, and investigate command failures with Azure CLI preview.

> [!IMPORTANT]
> These draft examples require end-to-end validation against the release build before use.

## Prerequisites

- Bash on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Azure CLI preview, installed as described in [Set up and switch sign-in profiles](quickstart-profiles.md).
- Sign in before starting. AI troubleshooting requires sign-in and is available from the Azure CLI preview only.
- AI troubleshooting is off by default.

## Set variables

# [Bash](#tab/bash)

```bash
sub="<test-subscription-id>"
location="<region>"
run=$(date +%Y%m%d%H%M%S)
rg="azclips-recovery-$run"
uri="/subscriptions/$sub/resourceGroups/$rg?api-version=2021-04-01"
```

# [PowerShell](#tab/powershell)

```powershell
$sub = '<test-subscription-id>'
$location = '<region>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$rg = "azclips-recovery-$run"
$uri = "/subscriptions/$sub/resourceGroups/${rg}?api-version=2021-04-01"
```

---

## Discover commands

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

## Use authenticated REST

# [Bash](#tab/bash)

```bash
az rest --method GET --uri "$uri"
az group show --subscription-id "$sub" --name "$rg"
```

# [PowerShell](#tab/powershell)

```powershell
az rest --method GET --uri $uri
az group show --subscription-id $sub --name $rg
```

---

## Understand a failure

# [Bash](#tab/bash)

Turn on AI troubleshooting in manual mode to save the failure, then request a group that does not exist.

```bash
az config set --key agent.recovery.trigger --value manual
az group show --subscription-id "$sub" --name "$rg-missing"
echo "Exit code: $?"
```

# [PowerShell](#tab/powershell)

Turn on AI troubleshooting in manual mode to save the failure, then request a group that does not exist.

```powershell
az config set --key agent.recovery.trigger --value manual
az group show --subscription-id $sub --name "$rg-missing"
"Exit code: $LASTEXITCODE"
```

---

## Recover with AI troubleshooting

# [Bash](#tab/bash)

```bash
az troubleshoot recover
```

To choose an older failure instead, list the saved failures and recover from one by ID:

```bash
az troubleshoot list --output table
az troubleshoot recover --id "<failure-id>"
```

Review the explanation and suggested fix, and apply a suggestion only if it's appropriate.

# [PowerShell](#tab/powershell)

```powershell
az troubleshoot recover
```

To choose an older failure instead, list the saved failures and recover from one by ID:

```powershell
az troubleshoot list --output table
az troubleshoot recover --id "<failure-id>"
```

Review the explanation and suggested fix, and apply a suggestion only if it's appropriate.

---

## Try interactive recovery (optional)

# [Bash](#tab/bash)

```bash
az troubleshoot recover --style interactive
```

Approve the proposed plan, then approve each command before it runs.

# [PowerShell](#tab/powershell)

```powershell
az troubleshoot recover --style interactive
```

Approve the proposed plan, then approve each command before it runs.

---

## Check your extensions (optional)

Check for the `compute` extension. If it's missing, follow [Install extensions](install-cli-extensions.md) using the bundle for your installed preview version.

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

## Clean up resources

# [Bash](#tab/bash)

```bash
az group delete --subscription-id "$sub" --name "$rg"
az group exists --subscription-id "$sub" --name "$rg"
az config set --key agent.recovery.trigger --value off
```

Turning AI troubleshooting off also clears the saved failures. If you added `compute` in the extension check, remove it with `az extension remove --name compute`.

# [PowerShell](#tab/powershell)

```powershell
az group delete --subscription-id $sub --name $rg
az group exists --subscription-id $sub --name $rg
az config set --key agent.recovery.trigger --value off
```

Turning AI troubleshooting off also clears the saved failures. If you added `compute` in the extension check, remove it with `az extension remove --name compute`.

---

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Set up and switch sign-in profiles](quickstart-profiles.md).
