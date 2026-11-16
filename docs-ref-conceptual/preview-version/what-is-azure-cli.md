---
title: Azure CLI overview and features (preview)
description: Explore the Azure CLI preview and its key capabilities. Find guidance to get started.
ms.topic: overview
ms.service: azure-cli
ms.custom: devx-track-azurecli
ms.date: 11/10/2026
ai-usage: ai-generated
---

# What is the Azure CLI (preview)?

The Azure Command-Line Interface (CLI) is a cross-platform command-line tool that connects to Azure and runs administrative commands on Azure resources. Use it interactively at a shell prompt or run commands in a script.

The next-generation Azure CLI, available in preview, builds on this experience with profile-based authentication, shell-native tab completion, and optional AI-based error recovery. This article introduces the next-generation preview and explains how it differs from the generally available Azure CLI.

> [!NOTE]
> The next-generation Azure CLI is in preview. Not all Azure CLI and Azure PowerShell scenarios are available, and features might change between releases. For supported environments and current limitations, see [Get started with the next-generation Azure CLI (preview)][01].

## Azure CLI versions

The Azure CLI preview documentation covers the next-generation Azure CLI, including preview-specific installation, authentication, and configuration guidance.

The next-generation Azure CLI preview can coexist with your existing Azure CLI installation, so you can evaluate it without replacing your current tools. For coexistence guidance, see [Switch between the classic Azure CLI and the preview build][04].

## Preview capabilities

The next-generation Azure CLI preview includes these capabilities:

- **Profile-based authentication** saves authentication contexts for different accounts, tenants, and subscriptions. For details, see [Manage sign-in profiles in Azure CLI (preview)][07].
- **Shell-native tab completion** suggests commands, parameters, and values as you type. For setup instructions, see [Enable Azure CLI preview tab completion][09].
- **Optional AI-based error recovery** analyzes failed commands and suggests corrective actions. AI-generated suggestions might be inaccurate and require review before use. For details, see [AI-based error recovery in Azure CLI (preview)][11].
- **Structured output** uses JSON by default, with other formats available for readability and scripting. For available commands and output options, see the [Azure CLI preview command reference][08].

## Using the preview

The next-generation Azure CLI preview has its own installation, authentication, and configuration guidance. Start with [Get started with the next-generation Azure CLI (preview)][01] for supported environments, sign-in guidance, and current limitations. For setup and settings, see [Install the Azure CLI preview][05] and [Configuration management][10].

## Data collection

The next-generation Azure CLI preview sends usage telemetry by default. For telemetry controls, including those for AI-based error recovery, see [Configuration management][10]. For privacy information, see the [Microsoft privacy statement][12].

## Next steps

- [Get started with the next-generation Azure CLI (preview)][01]
- [Install the Azure CLI (preview)][05]
- [What's new in the next-generation Azure CLI (preview)][06]
- [Troubleshoot Azure CLI issues (preview)][13]

<!-- link references -->

[01]: ./get-started-with-azure-cli.md
[04]: ./switch-cli-versions.md
[05]: ./install-overview.md
[06]: ./whats-new.md
[07]: ./profile-base-login.md
[08]: ../../docs-ref-autogen/preview-version/latest/reference-index.yml
[09]: ./install-cli-completions.md
[10]: ./azure-cli-configuration.md
[11]: ./ai-based-error-recovery.md
[12]: https://privacy.microsoft.com/privacystatement
[13]: ./troubleshooting.md