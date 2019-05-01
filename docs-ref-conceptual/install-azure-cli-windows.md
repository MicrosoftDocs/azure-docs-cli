---
title: Install the Azure CLI for Windows
description: How to install the Azure CLI on Windows
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 05/01/2019
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
---

# Install Azure CLI on Windows

For Windows the Azure CLI is installed via an MSI, which gives you access to the CLI through the Windows Command Prompt (CMD) or PowerShell.
When installing for Windows Subsystem for Linux (WSL), packages are available for your Linux distribution. See the [main install page](install-azure-cli.md)
for the list of supported package managers or how to install manually under WSL.

[!INCLUDE [current-version](includes/current-version.md)]

## Install or update

The MSI distributable is used for installing or updating the Azure CLI on Windows. You don't need to uninstall any current versions
before using the MSI installer.

> [!div class="nextstepaction"]
> [Download the MSI installer](https://aka.ms/installazurecliwindows)

When the installer asks if it can make changes to your computer, click the "Yes" box.

You can now run the Azure CLI with the `az` command from either Windows Command Prompt or PowerShell. PowerShell offers some tab completion features
not available from Windows Command Prompt. To sign in, run the [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI](authenticate-azure-cli.md).

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

You uninstall the Azure CLI from the Windows "Apps and Features" list. To uninstall:

| Platform | Instructions |
|---|---|
| Windows 10 | Start > Settings > Apps |
| Windows 8<br/>Windows 7 | Start > Control Panel > Programs > Uninstall a program |

Once on this screen type __Azure CLI__ into the program search bar. The program to uninstall is listed as __Microsoft CLI 2.0 for Azure__. Select this application, then click the `Uninstall` button.

## Next Steps

Now that you've installed the Azure CLI, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)
