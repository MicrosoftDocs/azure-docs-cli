---
title: Install the Azure CLI for Windows
description: How to install the Azure CLI 2.0 on Windows
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 01/29/2018
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Install Azure CLI 2.0 on Windows

On Windows the Azure CLI binary is installed via an MSI, which gives you access to the CLI through the Windows Command Prompt (CMD) or PowerShell.
If you are running Windows Subsystem for Linux (WSL), there are packages available for your Linux distribution. See the [main install page](install-azure-cli.md)
for the list of supported package managers or how to install manually under WSL.

## Install or update

The MSI distributable is used for installing, updating, and uninstalling the `az` command on Windows.

> [!div class="nextstepaction"]
> [Download the MSI installer](https://azurecliprod.blob.core.windows.net/msi/azure-cli-latest.msi)

When the installer asks if it can make changes to your computer, click the "Yes" box.

You can now run the Azure CLI with the `az` command from either Windows Command Prompt or PowerShell. PowerShell offers some tab completion features
not available from CMD.

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

Uninstalling can be done by running the MSI again, and choosing the "Uninstall" option.

> [!div class="nextstepaction"]
> [Download the MSI installer](https://azurecliprod.blob.core.windows.net/msi/azure-cli-latest.msi)
