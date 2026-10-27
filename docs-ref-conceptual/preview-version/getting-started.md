---
title: Get started with Azure CLI (preview)
description: Learn the core concepts, supported environments, authentication model, current limitations, and coexistence guidance for Azure CLI during the preview.
ms.date: 10/27/2026
ai-usage: ai-assisted
---

# Get started with Azure CLI (preview)

This article introduces the Azure CLI preview and explains its core concepts, supported environments, and current limitations.

## What is Azure CLI?

The Azure CLI preview is an AI-enhanced command-line experience for Azure that helps you work more efficiently by reducing the complexity of Azure CLI and Azure PowerShell commands.

Rather than replacing existing tools, the Azure CLI preview builds on them by providing intelligent guidance while continuing to use the same Azure management APIs and authentication model.

## Core concepts

The Azure CLI preview uses the following core concepts:

- **Profile-based authentication**: Save named sign-in contexts for different accounts and subscriptions.
- **AI-assisted workflows**: AI helps explain errors, recommend next steps, and improve
  productivity.
- **Cross-platform**: Runs on supported operating systems using modern shells.
- **Side-by-side installation**: Install the preview alongside existing Azure CLI and Azure PowerShell
  installations.

## Authentication

Sign in to the Azure CLI preview with `az login`.

Azure CLI and Azure PowerShell don't share authenticated sessions during the preview. If you use both tools, sign in separately to each: use `az login` for Azure CLI and `Connect-AzAccount` for Azure PowerShell.

For the best experience, use interactive user authentication.

## Current limitations

The preview primarily supports interactive command-line use. Some automation scenarios and noninteractive authentication methods aren't yet supported.

Authentication support is currently limited to interactive user sign-in.

The following authentication methods are currently **not supported**:

- Resource Owner Password Credentials (ROPC)
- Service principals
- Managed identities

Other preview limitations include:

- Not all Azure CLI and Azure PowerShell scenarios are available.
- Some AI-generated responses may be incomplete or inaccurate.
- Feature availability may change between preview releases.

## Coexistence with Azure CLI and Azure PowerShell

Azure CLI preview is designed to coexist with existing Azure CLI and Azure PowerShell installations.

Installing Azure CLI preview doesn't replace your existing installation. You can continue using Azure CLI and Azure PowerShell exactly as you do today while evaluating Azure CLI preview.

This allows you to:

- Gradually evaluate Azure CLI preview
- Compare workflows
- Continue using existing scripts and automation
- Roll back to your existing workflow at any time

For more information, see [Switch between the classic Azure CLI and the preview build](./switch-cli-versions.md).

## Supported environments

Azure CLI preview supports modern, cross-platform environments.

### Supported operating systems

- Windows
- Linux
- macOS

### Supported shells

- PowerShell 7 or later
- Bash
- Zsh

### Unsupported environments

The following environments aren't supported:

- Windows PowerShell 5.1
- Windows PowerShell Integrated Scripting Environment (ISE)

## Logging issues and providing feedback

To share feedback from the command line, run `az survey`.

If you encounter an issue:

1. Verify that you're using a supported operating system and shell.
1. Reproduce the issue, if possible.
1. Collect any relevant error messages or command output.
1. Open an issue in [the AzCLIPS GitHub repository][01].

When reporting an issue, include:

- Operating system
- Shell (PowerShell, Bash, or Zsh)
- Azure CLI preview version
- Azure CLI or Azure PowerShell version, if applicable
- Steps to reproduce the problem
- Expected behavior
- Actual behavior
- Any relevant error messages

Before sharing commands, logs, or output, remove credentials, access tokens, and sensitive information.

<!-- link references -->

[01]: https://github.com/Azure/azclips/issues
