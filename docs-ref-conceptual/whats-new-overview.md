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

## 64-bit Azure CLI for Windows install

You can now install the Azure CLI in Windows with _either_ a 32-bit or 64-bit MSI.  Previously installed versions are updated automatically.  You can reinstall your extensions by using `az extension add --name <extension> --version <version>`, or the Azure CLI prompts you to reinstall an extension on first use.

## Tab completion in PowerShell

If you run the Azure CLI in PowerShell, tab completion is now available!  Follow the instructions in [enable tab completion on PowerShell](/cli/azure/install-azure-cli-windows#enable-tab-completion-on-powershell).  The parameter values needed for PowerShell's `Register-ArgumentCompleter` command are provided in the article.

Tab completion is also available in [Azure Cloud Shell](/azure/cloud-shell/quickstart?toc=%2Fcli%2Fazure%2Ftoc.json&bc=%2Fcli%2Fazure%2Fbreadcrumb%2Ftoc.json&tabs=azurecli) and in most Linux distributions.

## Sign in with Web Account Manager (WAM)

The Azure CLI now offers preview support for Web Account Manager (WAM). Read about the benefits of WAM in [Sign in with Web Account Manager](/cli/azure/authenticate-azure-cli#sign-in-with-web-account-manager-wam)

## New search tools

### Onboarding cheat sheet

If you're new to the Azure CLI, there's now a one-page [onboarding cheat sheet](cheat-sheet-onboarding.md) to help you get started. The cheat sheet answers common questions, like "How do I change my subscription?" and "Does the Azure CLI have tab completion?".  Also find links to help you learn to use the Azure CLI using step-by-step interactive prompts.

### Conceptual index A-Z

It's often helpful to see how different Azure services use the same reference command.  The [Azure CLI conceptual article list](reference-docs-index.md) is an A to Z list of published reference content for the Azure CLI.  Use your keyboard shortcut (Ctrl + F in Windows) to quickly jump to a reference group.

### Samples index A-Z

Are you looking for a tested script that completes a common job to be done?  The [Azure CLI sample scripts](samples-index.md) index is an A to Z list of tested samples.  

## See also

- For new Azure CLI reference commands, see [Release notes](release-notes-azure-cli.md)
