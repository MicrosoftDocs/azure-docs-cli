---
title: Get started with the next-generation Azure CLI (preview)
description: Learn the core concepts, supported environments, authentication model, current limitations, and coexistence guidance for the next-generation Azure CLI, available in preview.
ms.date: 10/27/2026
ai-usage: ai-assisted
---

# Get started with the next-generation Azure CLI (preview)

This article introduces the next-generation Azure CLI, now in preview, and explains its core concepts, supported environments, and current limitations.

## What is the next-generation Azure CLI?

The next-generation Azure CLI is an AI-enhanced command-line experience for Azure that helps you work more efficiently by reducing the complexity of Azure CLI and Azure PowerShell commands.

Rather than replacing existing tools, the next-generation Azure CLI builds on them by providing intelligent guidance while continuing to use the same Azure management APIs and authentication model.

## Core concepts

The next-generation Azure CLI uses the following core concepts:

- **Profile-based authentication**: Save named sign-in contexts for different accounts and subscriptions.
- **AI-assisted workflows**: AI helps explain errors, recommend next steps, and improve
  productivity.
- **Cross-platform**: Runs on supported operating systems using modern shells.
- **Side-by-side installation**: Install the preview alongside existing Azure CLI and Azure PowerShell
  installations.

## Authentication

Sign in to the next-generation Azure CLI with `az login`. It supports these sign-in methods:

- **Interactive user sign-in**: `az login`. This method gives the best experience during the preview.
- **Device code**: `az login --use-device-code`, for environments without a browser.
- **Managed identity**: `az login --identity` for a system-assigned identity. For a user-assigned identity, add `--client-id`, `--object-id`, or `--resource-id`.
- **Service principal with a federated token**: `az login --service-principal --client-id <app-id> --tenant-id <tenant-id> --federated-token <token>`, for workload identity federation (OIDC) in pipelines.
- **Service principal with a client secret**: `az login --service-principal --client-id <app-id> --tenant-id <tenant-id> --client-secret <secret>`.

For all parameters, see [az login](/cli/azure/reference-index#az-login).

Azure CLI and Azure PowerShell don't share authenticated sessions during the preview. If you use both tools, sign in separately to each: use `az login` for Azure CLI and `Connect-AzAccount` for Azure PowerShell.

## Current limitations

The preview is designed primarily for interactive command-line use. Support for managed identities and service principals is available but might not cover every automation scenario yet.

The following authentication methods are currently **not supported**:

- Resource Owner Password Credentials (ROPC), or signing in with a username and password
- Service principals that use a certificate

Other preview limitations include:

- Not all Azure CLI and Azure PowerShell scenarios are available.
- Some AI-generated responses may be incomplete or inaccurate.
- Feature availability may change between preview releases.

## Coexistence with Azure CLI and Azure PowerShell

The next-generation Azure CLI is designed to coexist with existing Azure CLI and Azure PowerShell installations.

Installing the next-generation Azure CLI doesn't replace your existing installation. You can continue using Azure CLI and Azure PowerShell exactly as you do today while you evaluate the next-generation Azure CLI.

This allows you to:

- Gradually evaluate the next-generation Azure CLI
- Compare workflows
- Continue using existing scripts and automation
- Roll back to your existing workflow at any time

For more information, see [Switch between the classic Azure CLI and the preview build](./switch-cli-versions.md).

## Supported environments

The next-generation Azure CLI supports modern, cross-platform environments.

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
- Next-generation Azure CLI version (`az --version`)
- Azure CLI or Azure PowerShell version, if applicable
- Steps to reproduce the problem
- Expected behavior
- Actual behavior
- Any relevant error messages

Before sharing commands, logs, or output, remove credentials, access tokens, and sensitive information.

<!-- link references -->

[01]: https://github.com/Azure/azclips/issues
