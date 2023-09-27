---
title: What's new in Azure Command-Line Interface (CLI) | Microsoft Docs
description: Learn what's new in the Azure CLI
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/11/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli 
ms.custom: devx-track-azurecli
keywords: Azure CLI, new articles, new references, new samples, announcements
---
# What's new in the Azure CLI

This page highlights new features, articles and learning paths for the Azure CLI. Use these quick links to jump straight to the article containing detailed information:

- [Reference type and status](#reference-type-and-status)
- [64-bit install](/cli/azure/install-azure-cli-windows#latest-version)
- [Tab completion](/cli/azure/install-azure-cli-windows#enable-tab-completion-on-powershell)
- [WAM sign in](/cli/azure/authenticate-azure-cli#sign-in-with-web-account-manager-wam)
- [Cheat sheet](cheat-sheet-onboarding.md)
- [Article index](reference-docs-index.md)
- [Sample index](samples-index.md)

## Reference type and status

Reference type and status information has been added to the Azure CLI reference content. You can see this information in three places:

- **In reference list tables.** See an example in [az account](/cli/azure/account).
- **Under each command name.** For an example, see [az account tenant](/cli/azure/account/tenant) which has a status of _experimental_.
- **Next to each parameter name.** If a parameter status is not given it is because the parameter status matches the reference command status, or the parameter is in general acceptance (GA).

Why is this important? Reference command status determines the support level. For more information see [Azure CLI terminology and support levels](./reference-types-and-status.md#what-is-reference-status).


## 64-bit Windows install

You can now [install the Azure CLI on Windows](install-azure-cli-windows.md) with a 64-bit MSI. The 32-bit MSI, PowerShell command and Windows Package Manager are still available, but the 64-bit MSI is new! Anytime you install the Azure CLI, previously installed versions are updated automatically. This behavior allows you to try out the 64-bit install but reinstall the 32-bit MSI if you choose.

## Tab completion in PowerShell

If you run the Azure CLI in PowerShell, tab completion is now available! Follow the instructions in [enable tab completion on PowerShell](/cli/azure/install-azure-cli-windows#enable-tab-completion-on-powershell). The parameter values needed for PowerShell's `Register-ArgumentCompleter` command are provided in the article.

Tab completion is also available in [Azure Cloud Shell](/azure/cloud-shell/quickstart?toc=%2Fcli%2Fazure%2Ftoc.json&bc=%2Fcli%2Fazure%2Fbreadcrumb%2Ftoc.json&tabs=azurecli) and in most Linux distributions.

## Sign in with Web Account Manager (WAM)

The Azure CLI now offers preview support for sign in with Web Account Manager (WAM). Read about the benefits of WAM and how to enable the feature in [Sign in with Web Account Manager](/cli/azure/authenticate-azure-cli#sign-in-with-web-account-manager-wam)

## New search tools

#### Onboarding cheat sheet

If you're new to the Azure CLI, there's now a one-page [onboarding cheat sheet](cheat-sheet-onboarding.md) to help you get started. The cheat sheet answers common questions, like "How do I change my subscription?" and "What is the Azure CLI syntax pattern?". Also find links to help you learn to use the Azure CLI with step-by-step interactive prompts.

#### Conceptual article index A-Z

It's often helpful to see how different Azure services use the same reference command. The [Azure CLI conceptual article list](reference-docs-index.md) is an A to Z index of popular Quickstarts, How-to guides and Tutorials that use Azure CLI commands. Use your keyboard shortcut (Ctrl + F in Windows) to quickly jump to a reference group.

#### Samples index A-Z

Are you looking for a tested script that completes a common job to be done? The [Azure CLI sample's list](samples-index.md) is an A to Z index of tested sample scripts.

> [!NOTE]
> The [Reference index A-Z](/cli/azure/reference-index) is a list of all Azure CLI reference commands. For new Azure CLI reference commands, see [Release notes](release-notes-azure-cli.md).
