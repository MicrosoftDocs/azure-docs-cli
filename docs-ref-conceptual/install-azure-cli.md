---
title: How to install the Azure CLI | Microsoft Docs
description: The Azure CLI is available to install in Windows, macOS and Linux environments. It can also be run in a Docker container and Azure Cloud Shell.
author: dbradish-microsoft
ms.author: dbradish
manager: mamccrea
ms.date: 09/28/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli, linux-related-content
keywords: azure cli, install azure cli, azure cli download, download azure cli
---

# How to install the Azure CLI

> [!CAUTION]
> This article references CentOS, a Linux distribution that is nearing End Of Life (EOL) status. Please consider your use and plan accordingly. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).

The Azure CLI is available to install in Windows, macOS and Linux environments. It can also be run in a Docker container and Azure Cloud Shell.


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

When installing the Azure CLI, you can't select an install location. In Windows, the 32-bit Azure CLI installs in `C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2` and the 64-bit in `C:\Program Files\Microsoft SDKs\Azure\CLI2`. In Linux, the Azure CLI is installed in `/opt/az/` on Ubuntu and Debian, and in `/lib64/az/` on CentOS, RHEL and Azure Linux.

User-specific configuration files are located in `$HOME/.azure` on macOS and Linux, and `%USERPROFILE%\.azure` on Windows. These locations are known as the `AZURE_CONFIG_DIR`.

### What version of the Azure CLI is installed?

Type `az version` in a terminal window to know what version of the Azure CLI is installed. Your output looks like this:

```output
{
  "azure-cli": "x.xx.0x",
  "azure-cli-core": "x.xx.x",
  "azure-cli-telemetry": "x.x.x",
  "extensions": {}
}
```

### What extensions are installed?

Use the `az extension list` command to see installed extension. You can also use `az version`, but `az extension list` provides additional information including the installation path and status. For information on managing extensions, see [Use and manage extensions with the Azure CLI](./azure-cli-extensions-overview.md).

## See also

* [Sign in with the Azure CLI](./authenticate-azure-cli.md)
* [Azure CLI Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* Find Azure CLI [samples](./samples-index.md) and [published docs](./reference-docs-index.md)
* [How to use the Azure CLI successfully](use-azure-cli-successfully.md)
