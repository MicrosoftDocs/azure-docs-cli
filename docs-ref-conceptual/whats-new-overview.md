---
title: What's new in Azure Command-Line Interface (CLI) | Microsoft Docs
description: Learn what's new in the Azure CLI
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 09/29/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli 
ms.custom: devx-track-azurecli
keywords: Azure CLI, new articles, new references, new samples, announcements
---
# What's new in the Azure CLI

This page highlights new features, articles and learning paths for the Azure CLI.

## Azure Copilot for Azure CLI

[Microsoft Copilot for Azure](https://aka.ms/MicrosoftCopilotforAzureDocs) (preview) is published! Copilot is an AI-powered tool to help you do more with Azure. It unifies knowledge and data across hundreds of Azure services to increase productivity, reduce costs, and provide deep insights. Microsoft Copilot for Azure (preview) helps you learn about Azure by answering questions, and it provides information tailored to your own Azure resources and environment. By letting you express your goals in natural language, Copilot simplifies your Azure management experience. This benefits Azure CLI users because the knowledge of Azure CLI is built into Copilot!

Access Microsoft Copilot for Azure (preview) in the Azure portal, and tell Copilot what you would like to do using Azure CLI. For example:

- I want to create a virtual machine using Azure CLI.
- I want to update service principal credentials using Azure CLI.
- I want to create a web app using Azure CLI.

To enable access to Microsoft Copilot for Azure (preview) for your organization, [complete the registration form](https://aka.ms/MSCopilotforAzurePreviewRequest). The application process only needs to be completed once per tenant. Check with your administrator if you have questions about joining the preview.

## Reduced Docker image size

With the release of Azure CLI version 2.54.0, the size of the Docker image of `azure-cli` is reduced from 1.1 GB to 700 MB! This reduction is a 36.3% decrease resulting in improved download speed and faster startup. For more information, see "Trim Azure CLI’s docker image size" in [Azure Command-line Tools Ignite 2023 Announcement](https://techcommunity.microsoft.com/t5/azure-tools-blog/azure-command-line-tools-ignite-2023-announcement/ba-p/3984502).

## 64-bit Windows install

You can now [install the Azure CLI on Windows](install-azure-cli-windows.md) with a 64-bit MSI. The 32-bit MSI, PowerShell command and Windows Package Manager are still available, but the 64-bit MSI is new! Anytime you install the Azure CLI, previously installed versions are updated automatically. This behavior allows you to try out the 64-bit install but reinstall the 32-bit MSI if you choose.

## Tab completion in PowerShell

If you run the Azure CLI in PowerShell, tab completion is now available! Follow the instructions in [enable tab completion on PowerShell](/cli/azure/install-azure-cli-windows#enable-tab-completion-on-powershell). The parameter values needed for PowerShell's `Register-ArgumentCompleter` command are provided in the article.

Tab completion is also available in [Azure Cloud Shell](/azure/cloud-shell/quickstart?toc=%2Fcli%2Fazure%2Ftoc.json&bc=%2Fcli%2Fazure%2Fbreadcrumb%2Ftoc.json&tabs=azurecli) and in most Linux distributions.

## Sign in with Web Account Manager (WAM)

The Azure CLI now offers preview support for sign in with Web Account Manager (WAM). Read about the benefits of WAM and how to enable the feature in [Sign in with Web Account Manager](/cli/azure/authenticate-azure-cli#sign-in-with-web-account-manager-wam)

## Reference type and status

Reference type and status information is now available in Azure CLI reference content. Why is this important? Reference command status determines the support level.

You see this information in three places:

- **New "type" and "status" columns in reference list tables.**
  
  ![status table](./media/status-table.png)

  For a live example, see the [reference index](/cli/azure/reference-index) or drill down to [az account](/cli/azure/account).

- **New status indicators under command names.**

  ![status badges](./media/status-badges.png)

  If there's no status indicator, the command group or reference command is GA (Generally Available). For a live example, see [az account subscription](/cli/azure/account/subscription).

- **New status indicator for parameters.** Only deprecated parameters show a status. All other parameters inherit the status of the reference command.

For more information on Azure CLI statuses, see [Azure CLI terminology and support levels](./reference-types-and-status.md#what-is-reference-status).

## New onboarding tools

Are you knew to the Azure CLI?  Check out the new Onboarding Cheat Sheet to jump-start your journey, and find code examples in the A to Z indexes.

- [Onboarding cheat sheet](cheat-sheet-onboarding.md)
- [Azure CLI conceptual article index](reference-docs-index.md)
- [Azure CLI sample index](samples-index.md)
