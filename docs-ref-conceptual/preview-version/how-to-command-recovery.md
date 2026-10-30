---
title: "Recover from command failures with AI troubleshooting in Azure CLI (preview)"
description: "Use AI troubleshooting in Azure CLI preview to explain a failed command and recover from it manually, interactively, or automatically."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: how-to
ms.date: 10/30/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Recover from command failures with AI troubleshooting in Azure CLI (preview)

In this article, you use AI troubleshooting in Azure CLI preview to understand why a command failed and how to fix it. You trigger a controlled failure and then recover from it in each of the three ways AI troubleshooting supports: on request, in an interactive session, and automatically after each failure.

When you finish, you've received an explanation and a suggested fix for a failed command in each mode, and you've turned AI troubleshooting off again and removed the test resources.

For more information about how AI troubleshooting works, the AI provider it uses, and the data it collects, see [AI-based error recovery in Azure CLI](ai-based-error-recovery.md).

## Prerequisites

- Bash or zsh on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Azure CLI preview, installed and signed in as described in [Set up and switch sign-in profiles](quickstart-profiles.md). AI troubleshooting requires sign-in and is available only in Azure CLI preview.
- AI troubleshooting is off by default. This article turns it on and turns it off again during cleanup.

## Set variables

# [Bash](#tab/bash)

```bash
sub="<test-subscription-id>"
location="<region>"
run=$(date +%Y%m%d%H%M%S)
rg="azclips-recovery-$run"
```

# [PowerShell](#tab/powershell)

```powershell
$sub = '<test-subscription-id>'
$location = '<region>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$rg = "azclips-recovery-$run"
```

---

## Create a test resource group

# [Bash](#tab/bash)

```bash
az group create --subscription-id "$sub" --name "$rg" --location "$location"
```

# [PowerShell](#tab/powershell)

```powershell
az group create --subscription-id $sub --name $rg --location $location
```

---

The command returns the resource group with `"provisioningState": "Succeeded"`.

## Cause a controlled failure

Turn on AI troubleshooting in manual mode, which saves each failure so that you can troubleshoot it on request. Then request a resource group that doesn't exist.

# [Bash](#tab/bash)

```bash
az config set --key agent.recovery.trigger --value manual
az group show --subscription-id "$sub" --name "$rg-missing"
echo "Exit code: $?"
```

# [PowerShell](#tab/powershell)

```powershell
az config set --key agent.recovery.trigger --value manual
az group show --subscription-id $sub --name "$rg-missing"
"Exit code: $LASTEXITCODE"
```

---

The `az group show` command fails with an error that reports the resource group wasn't found, and the exit code isn't `0`.

## Recover on request

Ask AI troubleshooting to analyze the most recent failure. Without `--id`, `az troubleshoot analyze` selects the latest saved failure in the current terminal.

# [Bash](#tab/bash)

```bash
az troubleshoot analyze
```

# [PowerShell](#tab/powershell)

```powershell
az troubleshoot analyze
```

---

The output explains the cause of the failure, in this case that the resource group doesn't exist, and suggests a fix, such as checking the name or creating the group. Review the suggestion, and apply it only if it's appropriate.

To troubleshoot an earlier failure instead, list the saved failures, read the complete error for one, and analyze it by ID. The `list` and `show` commands run locally and don't use AI.

# [Bash](#tab/bash)

```bash
az troubleshoot list --output table
az troubleshoot show --id "<failure-id>" --output table
az troubleshoot analyze --id "<failure-id>"
```

# [PowerShell](#tab/powershell)

```powershell
az troubleshoot list --output table
az troubleshoot show --id "<failure-id>" --output table
az troubleshoot analyze --id "<failure-id>"
```

---

`az troubleshoot list` returns the `id`, `command`, and `errorDetail` of each saved failure, with the error shortened to 200 characters. `az troubleshoot show` returns the same fields with the complete command and error.

## Recover interactively (optional)

In an interactive session, AI troubleshooting proposes a plan and can run commands for you. The `--style` parameter applies to this analysis only and doesn't change the `agent.recovery.style` setting.

# [Bash](#tab/bash)

```bash
az troubleshoot analyze --style interactive
```

# [PowerShell](#tab/powershell)

```powershell
az troubleshoot analyze --style interactive
```

---

Review the proposed plan, and approve it only if it's appropriate. You then approve each command before it runs.

## Recover automatically (optional)

In automatic mode, AI troubleshooting starts after each failure without a separate command. Turn on automatic mode and repeat the failing command.

# [Bash](#tab/bash)

```bash
az config set --key agent.recovery.trigger --value auto
az group show --subscription-id "$sub" --name "$rg-missing"
```

# [PowerShell](#tab/powershell)

```powershell
az config set --key agent.recovery.trigger --value auto
az group show --subscription-id $sub --name "$rg-missing"
```

---

After the error, AI troubleshooting returns an explanation and a suggested fix, without a separate `az troubleshoot` command.

Now switch to the interactive style and repeat the failing command:

# [Bash](#tab/bash)

```bash
az config set --key agent.recovery.style --value interactive
az group show --subscription-id "$sub" --name "$rg-missing"
```

# [PowerShell](#tab/powershell)

```powershell
az config set --key agent.recovery.style --value interactive
az group show --subscription-id $sub --name "$rg-missing"
```

---

After the error, an interactive session starts. Approve the proposed plan, and then approve each command before it runs.

## Clean up resources

Delete the resource group, restore the default style, and turn AI troubleshooting off.

# [Bash](#tab/bash)

```bash
az group delete --subscription-id "$sub" --name "$rg"
az group exists --subscription-id "$sub" --name "$rg"
az config set --key agent.recovery.style --value oneshot
az config set --key agent.recovery.trigger --value off
```

# [PowerShell](#tab/powershell)

```powershell
az group delete --subscription-id $sub --name $rg
az group exists --subscription-id $sub --name $rg
az config set --key agent.recovery.style --value oneshot
az config set --key agent.recovery.trigger --value off
```

---

`az group exists` returns `false`. Turning AI troubleshooting off also clears the saved failures.

## Related content

- For more information, see [AI-based error recovery in Azure CLI](ai-based-error-recovery.md).
- For more information, see [Discover commands and call Azure REST APIs](how-to-discover-commands-rest.md).
- For more information, see [Get started with the preview](getting-started.md).
