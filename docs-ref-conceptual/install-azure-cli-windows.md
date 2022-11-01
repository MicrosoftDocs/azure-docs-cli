---
title: Install the Azure CLI for Windows | Microsoft Docs
description: To install the Azure CLI on Windows, you must use Powershell, or an MSI installer, which gives you access to the CLI through the Windows Command Prompt (CMD).
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.service: azure-cli
ms.date: 08/19/2021
ms.topic: conceptual
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: Install azure cli, azure cli download, cli for windows, install azure cli on windows, azure cli windows, install azure cli windows
---

# Install Azure CLI on Windows

The Azure Command-Line Interface (CLI) is a cross-platform command-line tool that can be installed locally on Windows computers. You can use the Azure CLI for Windows to connect to Azure and execute administrative commands on Azure resources. The Azure CLI for Windows can also be used from a browser through the Azure Cloud Shell or run from inside a Docker container.

For Windows, the Azure CLI is installed via a MSI, which gives you access to the CLI through the Windows Command Prompt (CMD) or PowerShell.
When installing for Windows Subsystem for Linux (WSL), packages are available for your Linux distribution. See the [main install page](install-azure-cli.md)
for the list of supported package managers or how to install manually under WSL.

[!INCLUDE [current-version](includes/current-version.md)]

## Install or update

The MSI distributable is used for installing or updating the Azure CLI on Windows. You don't need to uninstall current versions before using the MSI installer because the MSI will update any existing version.

> [!Note]
> After the installation is complete, you will need to close and reopen any active terminal window to use the Azure CLI.

# [Microsoft Installer (MSI)](#tab/azure-cli)

### Latest version

Download and install the latest release of the Azure CLI. When the installer asks if it can make changes to your computer, click the "Yes" box.

> [!div class="nextstepaction"]
> [Latest release of the Azure CLI](https://aka.ms/installazurecliwindows)

### Specific version

To download the MSI installer for specific version, change the version segment in URL `https://azcliprod.blob.core.windows.net/msi/azure-cli-<version>.msi` and download it. Available versions can be found at [Azure CLI release notes](./release-notes-azure-cli.md).

# [Microsoft Installer (MSI) with Command](#tab/powershell)

### Powershell

You can also install the Azure CLI using PowerShell. Start PowerShell as administrator and run the following command:

> [!Note]
> PowerShell must be run as administrator.

Start PowerShell as administrator and run the following command:

   ```PowerShell
   $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi
   ```

This will download and install the latest version of the Azure CLI for Windows. If you already have a version installed, the installer will update the existing version.

To install specific version, replace the `-Uri` argument with `https://azcliprod.blob.core.windows.net/msi/azure-cli-<version>.msi` with version segment changed. Available versions can be found at [Azure CLI release notes](./release-notes-azure-cli.md).

### Azure CLI Command (for update only)

[!INCLUDE [az upgrade](includes/az-upgrade.md)]

# [Windows Package Manager](#tab/winget)

### winget

You can also use `winget`, Microsoft's Package manager for Windows, to install and manage updates for Azure CLI.

> [!NOTE]
> winget is available by default in Windows 11 and modern versions of Windows 10. However, it may not be installed in older versions of Windows. See the [winget documentation](/windows/package-manager/winget/) for installation instructions.

   ```PowerShell
   winget install -e --id Microsoft.AzureCLI
   ```

The `-e` option is to ensure the official Azure CLI package is installed. This command installs the latest version by default. To specify a version, simply add a `-v <version>` with your desired version to the command.

---

## Run the Azure CLI

You can now run the Azure CLI with the `az` command from either Windows Command Prompt or PowerShell.

## Troubleshooting

Here are some common problems seen when installing the Azure CLI on Windows. If you experience a problem not covered here, [file an issue on GitHub](https://github.com/Azure/azure-cli/issues).

### Proxy blocks connection

If you can't download the MSI installer because your proxy is blocking the connection, make sure that
you have your proxy properly configured. For Windows 10, these settings are managed in the
`Settings > Network & Internet > Proxy` pane. Contact your system administrator for the required settings,
or for situations where your machine may be configuration-managed or require advanced setup.

> [!IMPORTANT]
> These settings are also required to be able to access Azure services with the CLI, from both
> PowerShell or the Command Prompt. In PowerShell, you do this with the following command:
>
> ```powershell
> (New-Object System.Net.WebClient).Proxy.Credentials = `
>   [System.Net.CredentialCache]::DefaultNetworkCredentials
> ```

In order to get the MSI, your proxy needs to allow HTTPS connections to the following addresses:

* `https://aka.ms/`
* `https://azcliprod.blob.core.windows.net/`

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

You uninstall the Azure CLI from the Windows "Apps and Features" list. To uninstall:

| Platform | Instructions |
|---|---|
| Windows 10 | Start > Settings > Apps |
| Windows 8 and Windows 7 | Start > Control Panel > Programs > Uninstall a program |

Once on this screen type __Azure CLI__ into the program search bar. The program to uninstall is listed as __Microsoft CLI 2.0 for Azure__. Select this application, then click the `Uninstall` button.

## Remove data

If you don't plan to reinstall Azure CLI, remove its data from `C:\Users\<username>\.azure\msal_token_cache.bin` or `C:\Users\<username>\.azure\msal_token_cache.json`.

## Next Steps

Now that you've installed the Azure CLI on Windows, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)
