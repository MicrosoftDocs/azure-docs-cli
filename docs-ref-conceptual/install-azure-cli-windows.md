---
title: Install the Azure CLI for Windows
description: How to install the Azure CLI 2.0 on Windows
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 01/29/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Install Azure CLI 2.0 on Windows

On Windows the Azure CLI binary is installed via an MSI, which gives you access to the CLI through the Windows Command Prompt (CMD) or PowerShell.
If you are running the Windows Subsystem for Linux (WSL), packages are available for your Linux distribution. See the [main install page](install-azure-cli.md)
for the list of supported package managers or how to install manually under WSL.

## Install or update

The MSI distributable is used for installing, updating, and uninstalling the `az` command on Windows.

> [!div class="nextstepaction"]
> [Download the MSI installer](https://aka.ms/installazurecliwindows)

When the installer asks if it can make changes to your computer, click the "Yes" box.

You can now run the Azure CLI with the `az` command from either Windows Command Prompt or PowerShell. PowerShell offers some tab completion features
not available from Windows Command Prompt. To log in, run the `az login` command.

```azurecli
az login
```

To learn more about different login methods, see [Log in with Azure CLI 2.0](authenticate-azure-cli.md).

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

Uninstalling can be done by running the MSI again, and choosing the "Uninstall" option.

> [!div class="nextstepaction"]
> [Download the MSI installer](https://aka.ms/installazurecliwindows)
