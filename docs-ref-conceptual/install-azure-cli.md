---
title: How to install the Azure CLI | Microsoft Docs
description: The Azure CLI is available to install in Windows, macOS and Linux environments. It can also be run in a Docker container and Azure Cloud Shell.
author: chasecrum
ms.author: chasecrum
manager: mamccrea
ms.date: 06/19/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli, install azure cli, azure cli download, download azure cli
---

# How to install the Azure CLI

The Azure CLI is available to install in Windows, macOS and Linux environments.  It can also be run in a Docker container and Azure Cloud Shell.

## Install

[!INCLUDE [current-version](includes/current-version.md)]

* [Install on Windows](install-azure-cli-windows.md)
* [Install on macOS](install-azure-cli-macos.md)
* Install on Linux or Windows Subsystem for Linux (WSL) ([What is WSL?](/windows/wsl/about))
  
  * [Install on RHEL/CentOS with dnf](./install-azure-cli-linux.md?pivots=dnf)
  * [Install on SLES/OpenSUSE with zypper](./install-azure-cli-linux.md?pivots=zypper)
  * [Install on Ubuntu/Debian with apt](./install-azure-cli-linux.md?pivots=apt)
  * [Install on Azure Linux with tdnf](./install-azure-cli-linux.md?pivots=tdnf)
  * [Install from script](./install-azure-cli-linux.md?pivots=script)
* [Run in Docker container](run-azure-cli-docker.md)
* [Run in Azure Cloud Shell](/azure/cloud-shell/quickstart)

> [!NOTE]
> If you're using the Azure classic deployment model, [install the Azure classic CLI](install-classic-cli.md).

## FAQ

### Where is the Azure CLI installed?

When installing the Azure CLI, you cannot select an install location.  In Windows, use `where az` at a Cmd prompt to see where the Azure CLI is installed.  The 32-bit Azure CLI installs in `C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2` and the 64-bit in `C:\Program Files\Microsoft SDKs\Azure\CLI2`. In Linux, programs are more distributed.  Most binaries are in `/bin` or `/sbin` and most libraries are in `/lib`.

User-specific configuration files are located in `$HOME/.azure` on macOS and Linux, and `%USERPROFILE%\.azure` on Windows.  These locations are known as the `AZURE_CONFIG_DIR`.

## See also

* [Sign in with the Azure CLI](./authenticate-azure-cli.md)
* [Azure CLI Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* Find Azure CLI [samples](./samples-index.md) and [published docs](./reference-docs-index.md)
* [How to use the Azure CLI successfully](use-cli-effectively.md)
