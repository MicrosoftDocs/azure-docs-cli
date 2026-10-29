---
title: What's new in Azure CLI (preview)
description: Discover the latest Azure CLI features available in the preview, including shell-native Tab completion for Azure CLI commands, parameters, and valid values.
ms.date: 10/27/2026
---

# What's new in Azure CLI (preview)

This article highlights new features and capabilities available in the Azure CLI preview.

## Tab completion

The Azure CLI preview provides shell-native Tab completion to help you construct commands and reduce errors during command entry.

When you type part of a command and press <kbd>Tab</kbd>, the Azure CLI preview provides contextual suggestions based on the current command. Suggestions can include commands, subcommands, parameter names, and valid parameter values.

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

The Azure CLI preview doesn't introduce a new interface or change existing shell behavior. Existing shell features, such as history-based suggestions, continue to work as expected.

### Preview behavior

During the preview:

- Tab completion isn't enabled by default.
- Enable the feature by following the post-installation setup instructions.
- The Azure CLI preview doesn't change your shell profile automatically.
- The feature is available only in interactive terminal sessions.
- Scripts, pipelines, and command output in non-interactive scenarios aren't affected.

## Profile-based sign-in

The Azure CLI preview supports _profiles_, which let you save named sign-in contexts for different accounts, tenants, and subscriptions. Profiles make it easy to switch between environments without signing in again.

For more information, see [Manage sign-in profiles in Azure CLI (preview)](profile-base-login.md).
