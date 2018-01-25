---
title: Install the Azure CLI for Windows
description: How to install the Azure CLI 2.0 on Windows
keywords: Azure CLI,Install Azure CLI,azure install windows, azure cli windows, azure windows
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 11/01/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Install Azure CLI 2.0 on Windows

On Windows, you can install a native binary from an MSI, which you can use through the Windows Command Prompt or PowerShell. If you are running
Windows Subsystem for Linux (WSL) there are packages available for the distribution you are running. See the [main install page](install-azure-cli.md)
for the list of supported package managers or how to install manually under WSL.

## Install or update with MSI

The MSI distributable is used for installing, updating, and uninstalling the `az` command on Windows. You can
[download the MSI installer](https://aka.ms/InstallAzureCliWindows) and then run it to install or update.

When the installer asks if it can make changes to your computer, click the "Yes" box.

You can now run the Azure CLI with the `az` command from either Windows Command Prompt or PowerShell.

## Uninstall with MSI

If you ever decide to uninstall the Azure CLI, we're sorry to see you go. Before you uninstall, use the `az feedback` command to give us
some reasons why you chose to uninstall and how we could improve the CLI experience. We want to make sure that the Azure
CLI is as bug-free and user-friendly as we can make it. You can also [file a github issue](https://github.com/Azure/azure-cli/issues).

Uninstalling can be done by running the MSI again, and choosing the "Uninstall" option. You can
[download the MSI installer](https://aka.ms/InstallAzureCliWindows) if you no longer have it available.
