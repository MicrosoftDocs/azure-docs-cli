---
title: Get started with Azure CLI (Private preview)
description: Learn the core concepts, supported environments, authentication model, current limitations, and coexistence guidance for Azure CLI during the private preview.
---

# Get started with Azure CLI (Private preview)

This article introduces the core concepts of Azure CLI and explains what you need to know before you
begin using the private preview.

## What is Azure CLI?

Azure CLI is an AI-enhanced command-line experience for Azure that helps you work more efficiently
by reducing the complexity of Azure CLI and Azure PowerShell commands.

Rather than replacing existing tools, Azure CLI builds on them by providing intelligent assistance
while continuing to use the same Azure management APIs and authentication model.

## Core concepts

Azure CLI is designed around a few key concepts:

- **Shared authentication** - Azure CLI and Azure PowerShell share a common sign-in experience.
- **AI-assisted workflows** - AI helps explain errors, recommend next steps, and improve
  productivity.
- **Cross-platform** - Runs on supported operating systems using modern shells.
- **Side-by-side installation** - Can be installed alongside existing Azure CLI and Azure PowerShell
  installations.

## Authentication

Azure CLI uses a shared authentication experience across Azure CLI and Azure PowerShell.

After you sign in, your authenticated session is available to both products. You don't need to sign
in separately when switching between Azure CLI and Azure PowerShell.

For the best experience, use interactive user authentication.

## Current limitations

The private preview focuses on interactive user scenarios. Some authentication methods aren't yet
supported.

The following authentication methods are currently **not supported**:

- Resource Owner Password Credentials (ROPC)
- Service principals
- Managed identities

Additional authentication scenarios may be added in future releases.

## Coexistence with Azure CLI and Azure PowerShell

Azure CLI private preview is designed to coexist with existing Azure CLI and Azure PowerShell
installations.

Installing Azure CLI private preview doesn't replace your existing installation. You can continue
using Azure CLI and Azure PowerShell exactly as you do today while evaluating Azure CLI private
preview.

This allows you to:

- Gradually evaluate Azure CLI private preview
- Compare workflows
- Continue using existing scripts and automation
- Roll back to your existing workflow at any time

To switch between the classic Azure CLI and the preview build within the same session, see
[Switch between the classic Azure CLI and the preview build](./switch-cli-versions.md).

## Supported environments

Azure CLI private preview supports modern, cross-platform environments.

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

## Automation support

The private preview is primarily intended for interactive command-line use.

Some automation scenarios and non-interactive authentication methods aren't yet supported. For the
latest information, see the current limitations section of this article.

## Logging issues and providing feedback

Your feedback is essential during the private preview.

If you encounter an issue:

1. Verify that you're using a supported operating system and shell.
1. Reproduce the issue, if possible.
1. Collect any relevant error messages or command output.
1. Open an issue in [the AzCLIPS GitHub repository][01].

When reporting an issue, include:

- Operating system
- Shell (PowerShell, Bash, or Zsh)
- Azure CLI private preview version
- Azure CLI or Azure PowerShell version, if applicable
- Steps to reproduce the problem
- Expected behavior
- Actual behavior
- Any relevant error messages

## Known preview limitations

During the private preview, you should expect some limitations:

- Not all Azure CLI and Azure PowerShell scenarios are available.
- Some AI-generated responses may be incomplete or inaccurate.
- Authentication support is currently limited to interactive user sign-in.
- Feature availability may change between preview releases.

<!-- link references -->

[01]: https://github.com/Azure/azclips/issues
