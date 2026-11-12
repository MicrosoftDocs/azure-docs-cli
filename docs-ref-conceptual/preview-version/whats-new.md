---
title: What's new in the next-generation Azure CLI (preview)
description: Discover the latest features in the next-generation Azure CLI, available in preview, including shell-native Tab completion for Azure CLI commands, parameters, and valid values.
ms.date: 11/12/2026
ai-usage: ai-assisted
---

# What's new in the next-generation Azure CLI (preview)

This article highlights new features and capabilities available in the next-generation Azure CLI, now in preview.

## Tab completion

The next-generation Azure CLI provides shell-native Tab completion to help you construct commands and reduce errors during command entry.

When you type part of a command and press <kbd>Tab</kbd>, the next-generation Azure CLI provides contextual suggestions based on the current command. Suggestions can include commands, subcommands, parameter names, and valid parameter values.

### Examples

|             Scenario              |             Example             |                                          Result                                          |
| --------------------------------- | ------------------------------- | ---------------------------------------------------------------------------------------- |
| Complete commands and subcommands | `az vm <Tab>`                   | Displays available operations such as `create`, `list`, and `delete`.                    |
| Complete parameter names          | `az vm create --<Tab>`          | Suggests supported parameters such as `--name`, `--resource-group`, and `--location`.    |
| Complete parameter values         | `az vm create --location <Tab>` | Suggests valid region values based on Azure CLI metadata, such as `eastus` and `westus`. |

### How it works

Tab completion integrates with your existing terminal environment and uses the native completion mechanism of your shell.

The feature:

- Uses the native completion mechanism provided by PowerShell, Bash, and Zsh
- Is triggered by pressing the <kbd>Tab</kbd> key
- Completes commands using local Azure CLI metadata
- Works offline and doesn't require authentication for supported completion types

The next-generation Azure CLI doesn't introduce a new interface or change existing shell behavior. Existing shell features, such as history-based suggestions, continue to work as expected.

### Preview behavior

During the preview:

- Tab completion isn't enabled by default.
- Enable the feature by following the post-installation setup instructions.
- The next-generation Azure CLI doesn't change your shell profile automatically.
- The feature is available only in interactive terminal sessions.
- Scripts, pipelines, and command output in non-interactive scenarios aren't affected.

## Profile-based sign-in

The next-generation Azure CLI supports _profiles_, which let you save named sign-in contexts for different accounts, tenants, and subscriptions. Profiles make it easy to switch between environments without signing in again.

For more information, see [Manage sign-in profiles in Azure CLI (preview)](profile-base-login.md).

## Existing and next-generation Azure CLI

The next-generation Azure CLI is in preview and installs alongside your existing Azure CLI. Both use the `az` command, and the first `az` that your shell finds on `PATH` runs.

### Identify the active version

Run the commands for your shell to see which `az` runs first on `PATH` and which version it is.

# [Bash](#tab/bash)

```bash
which az
az --version
```

# [PowerShell](#tab/powershell)

```powershell
Get-Command az
az --version
```

---

For the next-generation Azure CLI, `which az` or `Get-Command az` returns the path of the preview `az` executable: `~/.local/share/azcli/az` on Linux or macOS, or `%LOCALAPPDATA%\Programs\azcli\az.exe` on Windows, if you installed to the default location. `az --version` prints the preview version, which matches the version in the file name you downloaded.

### Differences from the existing Azure CLI

- **Coverage:** Not all Azure CLI and Azure PowerShell scenarios are available.
- **Commands and output:** The next-generation Azure CLI aims to keep commands close to the existing Azure CLI, but they aren't guaranteed to be identical. Use the [Azure CLI preview command reference](../../docs-ref-autogen/preview-version/latest/reference-index.yml), and compare your results with the expected output in each article.
- **Sign-in:** The next-generation Azure CLI doesn't share sign-in context or tokens with the existing Azure CLI, so you sign in again. It uses [profiles](profile-base-login.md) and opens a browser by default. These sign-in methods aren't available yet:
  - Broker sign-in, such as Web Account Manager on Windows
  - Resource Owner Password Credentials (ROPC), such as `az login --username --password`
  - Service principals that use a certificate. Use a client secret or a federated token instead.

For more information, see [Release notes & updates – Azure CLI](/cli/azure/release-notes-azure-cli?view=azure-cli-latest&preserve-view=true).

### Preview expectations

New capabilities are added frequently. Between preview releases, commands, output, and behavior might change, including changes that might break existing scripts. If something doesn't work as documented, [open an issue in the GitHub repository](https://github.com/Azure/azclips/issues).

To use the existing Azure CLI and the next-generation Azure CLI in the same session, see [Switch between the classic Azure CLI and the preview build](switch-cli-versions.md).
