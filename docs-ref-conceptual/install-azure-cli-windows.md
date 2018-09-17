---
title: Install the Azure CLI for Windows
description: How to install the Azure CLI on Windows
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/09/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Install Azure CLI on Windows

For Windows the Azure CLI is installed via an MSI, which gives you access to the CLI through the Windows Command Prompt (CMD) or PowerShell.
When installing for Windows Subsystem for Linux (WSL), packages are available for your Linux distribution. See the [main install page](install-azure-cli.md)
for the list of supported package managers or how to install manually under WSL.

## Install or update

The MSI distributable is used for installing, updating, and uninstalling the `az` command on Windows.

> [!div class="nextstepaction"]
> [Download the MSI installer](https://aka.ms/installazurecliwindows)

When the installer asks if it can make changes to your computer, click the "Yes" box.

You can now run the Azure CLI with the `az` command from either Windows Command Prompt or PowerShell. PowerShell offers some tab completion features
not available from Windows Command Prompt. To sign in, run the [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI](authenticate-azure-cli.md).

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

Uninstalling can be done by running the MSI again, and choosing the "Uninstall" option.

> [!div class="nextstepaction"]
> [Download the MSI installer](https://aka.ms/installazurecliwindows)
