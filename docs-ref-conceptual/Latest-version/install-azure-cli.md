---
title: How to install the Azure CLI | Microsoft Docs
description: The Azure CLI is available to install in Windows, Linux, and macOS environments. It can also be run in a Docker container and Azure Cloud Shell.
ms.service: azure-cli
ms.custom: devx-track-azurecli, linux-related-content
keywords: azure cli, install azure cli, azure cli download, download azure cli
---

# How to install the Azure CLI

The Azure CLI is available to install in Windows, Linux, and macOS environments. It can also be run
in a Docker container and Azure Cloud Shell.

## Install

[!INCLUDE [current-version](includes/current-version.md)]

- [Install on Windows][19]
  - [Install on Windows using WinGet (Windows Package Manager)][11]
  - [Install on Windows using Microsoft Installer (MSI)][09]
  - [Install on Windows using Microsoft Installer (MSI) with PowerShell][10]
  - [Install on Windows using a ZIP package][12]

- Install on Linux or Windows Subsystem for Linux (WSL) ([What is WSL?][17])

  - [Install on RHEL/CentOS Stream with dnf][05]
  - [Install on SLES/OpenSUSE with zypper][08]
  - [Install on Ubuntu/Debian with apt][04]
  - [Install on Azure Linux with tdnf][07]
  - [Install from script][06]

- [Install on macOS][18]

- [Run in Docker container][20]

- [Run in Azure Cloud Shell][16]

## FAQ

### Where is the Azure CLI installed?

When installing the Azure CLI, you can't select an install location. In Windows, the 32-bit Azure
CLI installs in `C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2` and the 64-bit in
`C:\Program Files\Microsoft SDKs\Azure\CLI2`. In Linux, the Azure CLI is installed in `/opt/az/` on
Ubuntu and Debian, and in `/lib64/az/` on CentOS Stream, RHEL, and Azure Linux.

User-specific configuration files are located in `$HOME/.azure` on Linux and macOS, and
`%USERPROFILE%\.azure` on Windows. These locations are known as the `AZURE_CONFIG_DIR`.

### What version of the Azure CLI is installed?

Type `az version` in a terminal window to determine what version of the Azure CLI is installed. Your
output looks like this:

```output
{
  "azure-cli": "x.xx.x",
  "azure-cli-core": "x.xx.x",
  "azure-cli-telemetry": "x.x.x",
  "extensions": {}
}
```

### What extensions are installed?

Use the `az extension list` command to see installed extensions. You can also use `az version`, but
`az extension list` provides more information including the installation path and status. For
information on managing extensions, see [Use and manage extensions with the Azure CLI][02].

## See also

- [Sign in with the Azure CLI][01]
- [Azure CLI Onboarding cheat sheet][03]
- Find Azure CLI [samples][14] and [published docs][13]
- [Tips to use the Azure CLI successfully][15]

<!-- link references -->

[01]: ./authenticate-azure-cli.md
[02]: ./azure-cli-extensions-overview.md
[03]: ./cheat-sheet-onboarding.md
[04]: ./install-azure-cli-linux.md?pivots=apt
[05]: ./install-azure-cli-linux.md?pivots=dnf
[06]: ./install-azure-cli-linux.md?pivots=script
[07]: ./install-azure-cli-linux.md?pivots=tdnf
[08]: ./install-azure-cli-linux.md?pivots=zypper
[09]: ./install-azure-cli-windows.md?pivots=msi
[10]: ./install-azure-cli-windows.md?pivots=msi-powershell
[11]: ./install-azure-cli-windows.md?pivots=winget
[12]: ./install-azure-cli-windows.md?pivots=zip
[13]: ./reference-docs-index.md
[14]: ./samples-index.md
[15]: ./use-azure-cli-successfully-tips.md
[16]: /azure/cloud-shell/quickstart
[17]: /windows/wsl/about
[18]: install-azure-cli-macos.md
[19]: install-azure-cli-windows.md
[20]: run-azure-cli-docker.md
