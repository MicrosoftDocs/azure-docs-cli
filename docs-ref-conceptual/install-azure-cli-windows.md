---
title: Install the Azure CLI for Windows | Microsoft Docs
description: To install the Azure CLI on Windows, you must use PowerShell, or an MSI installer, which gives you access to the CLI through the Windows Command Prompt (CMD).
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.service: azure-cli
ms.date: 09/13/2023
ms.topic: conceptual
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: Install azure cli, azure cli download, cli for windows, install azure cli on windows, azure cli windows, install azure cli windows
---

# Install Azure CLI on Windows

The Azure Command-Line Interface (CLI) is a cross-platform command-line tool that can be installed locally on Windows computers. You can use the Azure CLI for Windows to connect to Azure and execute administrative commands on Azure resources. The Azure CLI for Windows can also be used from a browser through the Azure Cloud Shell or run from inside a Docker container.

For Windows, the Azure CLI is installed via an MSI or a ZIP package, which gives you access to the CLI through the Windows Command Prompt (CMD) or PowerShell.
When you perform an installation for Windows Subsystem for Linux (WSL), packages are available for your Linux distribution. See the [main install page](install-azure-cli.md)
for the list of supported package managers or how to install manually under WSL.

[!INCLUDE [current-version](includes/current-version.md)]

## Install or update

The MSI and ZIP distributable are used for installing or updating the Azure CLI on Windows. You don't need to uninstall current versions before using the MSI installer because the MSI updates any existing version.

> [!IMPORTANT]
> After the installation is complete, you will need to **close and reopen any active terminal window to use the Azure CLI**.

# [Microsoft Installer (MSI)](#tab/azure-cli)

### Latest version

Download and install the latest release of the Azure CLI. When the installer asks if it can make changes to your computer, select the "Yes" box.

> [!div class="nextstepaction"]
> [Latest MSI of the Azure CLI (32-bit)](https://aka.ms/installazurecliwindows)

> [!div class="nextstepaction"]
> [Latest MSI of the Azure CLI (64-bit)](https://aka.ms/installazurecliwindowsx64)

If you have previously installed the Azure CLI, running either the 32-bit or 64-bit MSI will overwrite an existing installation.

### Specific version

If you prefer, you can download a specific version of the Azure CLI by using a URL.

[!INCLUDE [specific version](includes/specific-version.md)]

# [Microsoft Installer (MSI) with PowerShell](#tab/powershell)

### PowerShell

To install the Azure CLI using PowerShell, start PowerShell **as administrator** and run the following command:

   ```PowerShell
   $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; Remove-Item .\AzureCLI.msi
   ```

This will download and install the latest 32-bit installer of the Azure CLI for Windows. If you prefer a 64-bit install, change URL to `https://aka.ms/installazurecliwindowsx64`. If the Azure CLI is already installed, the installer will overwrite the existing version.

To install a specific version, replace the `-Uri` argument with the URL described in [Specific version](#specific-version-1). Here is an example of using the 32-bit installer of the Azure CLI version [2.51.0](/cli/azure/release-notes-azure-cli#august-01-2023) in PowerShell:

   ```PowerShell
   $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://azcliprod.blob.core.windows.net/msi/azure-cli-2.51.0.msi -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; Remove-Item .\AzureCLI.msi
   ```

### Specific version

[!INCLUDE [specific version](includes/specific-version.md)]

### Differences between Bash and PowerShell

Although most Azure CLI documentation is written and tested in a Bash shell, you can also install and run the Azure CLI using PowerShell. There are subtle syntax differences between Bash and PowerShell. Review these articles to avoid scripting errors:
- [Considerations for running the Azure CLI in a PowerShell scripting language](./use-azure-cli-successfully-powershell.md)
- [Use quotation marks in Azure CLI parameters](./use-azure-cli-successfully-quoting.md)
- Compare syntax of Bash, PowerShell and Cmd.exe in [Learn Azure CLI syntax differences in Bash, PowerShell and Cmd](./get-started-tutorial-2-environment-syntax.md)

When running the Azure CLI in PowerShell, there are also error handling differences and the ability to enable tab completion. See these articles for more information:
- [Error handling for the Azure CLI in PowerShell](./use-azure-cli-successfully-powershell.md#error-handling-for-azure-cli-in-powershell)
- [Enable Tab Completion in PowerShell](#enable-tab-completion-in-powershell)

# [Windows Package Manager](#tab/winget)

### winget

You can also use `winget`, Microsoft's Package manager for Windows, to install and manage updates for Azure CLI.

> [!NOTE]
> winget is available by default in Windows 11 and modern versions of Windows 10. However, it may not be installed in older versions of Windows. See the [winget documentation](/windows/package-manager/winget/) for installation instructions.

   ```PowerShell
   winget install -e --id Microsoft.AzureCLI
   ```

The `-e` option is to ensure the official Azure CLI package is installed. This command installs the latest version by default. To specify a version, add a `-v <version>` with your desired version to the command.

# [ZIP Package](#tab/zip)

> [!IMPORTANT]
> This package is currently in preview.

You can use the ZIP package to install the Azure CLI on Windows. This package is useful when you don't have administrative privilege.

Unzip the package to a folder, then using Cmd or PowerShell, call the Azure CLI by running `<unzipped folder path>\bin\az.cmd`.

If you want to run the `az` command directly, follow the steps below to add the Azure CLI to your `PATH` environment variable.
1. Open the Start Menu and search for `environment variables`.  Click `Edit the system environment variables`.
1. Click the `Environment Variables...` button.
1. In the `User varibles for <username>` box, select `Path` and click the `Edit...` button.
1. Click the `New` button and add the `<unzipped folder path>\bin` to the list.
1. **Restart your terminal.**  You should now be able to run `az` commands.

### Latest version

> [!div class="nextstepaction"]
> [Latest ZIP of the Azure CLI (64-bit)](https://aka.ms/installazurecliwindowszipx64)

### Specific version

If you prefer, you can download a specific version of the Azure CLI by using a URL.

To download the ZIP package for a specific version, change the version segment in URL `https://azcliprod.blob.core.windows.net/zip/azure-cli-<version>-x64.zip`.

For example, to install the 64-bit ZIP of Azure CLI version 2.57.0, your URL would be `https://azcliprod.blob.core.windows.net/zip/azure-cli-2.57.0-x64.zip`. 

Available Azure CLI versions can be found at [Azure CLI release notes](./release-notes-azure-cli.md). The ZIP package is available from version 2.57.0. Only 64-bit is available.

---

## Run the Azure CLI

You can now run the Azure CLI with the `az` command from either Windows Command Prompt or PowerShell.

## Enable Tab Completion in PowerShell

[!INCLUDE [tab-completion](includes/tab-completion.md)]

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

### Migrate to 64-bit Azure CLI

Starting from 2.51.0, Azure CLI also provides 64-bit MSI which is recommended for better performance.

Follow these steps to migrate to Azure CLI 64-bit:
1. Check your current CLI version and installed extensions by running `az --version`.
1. Extensions will need to be reinstalled. It is recommended to perform a backup of the current extension folder `%userprofile%\.azure\cliextensions` by renaming it in case you choose to revert back to 32-bit. This folder is created automatically when you reinstall an extension.
1. Download and install latest 64-bit installer as described in [Install or update](#install-or-update). The 32-bit MSI will be automatically uninstalled.
1. Install extensions by running `az extension add --name <extension> --version <version>`. If you don't want to reinstall extensions manually, the Azure CLI will prompt you to install an extension on first use. For more information on installing extensions, see [How to install extensions](/cli/azure/azure-cli-extensions-overview#how-to-install-extensions).

If you have issues after migration, you can uninstall the 64-bit and reinstall the 32-bit MSI. If you have made a backup of your 32-bit extension folder, restore (rename) your extension folder after the change.

## Update the Azure CLI

[!INCLUDE [az upgrade](includes/az-upgrade.md)]

If you are using ZIP distribution, please delete the old installation folder and extract the new version to the _same location_.

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

You uninstall the Azure CLI from the Windows "Apps and Features" list. To uninstall:

| Platform | Instructions |
|---|---|
| Windows 11 | Start > Settings > Apps > Installed apps |
| Windows 10 | Start > Settings > Apps > Apps & Features |
| Windows 8 and Windows 7 | Start > Control Panel > Programs > Uninstall a program |

Once on this screen type __Azure CLI__ into the program search bar. The program to uninstall is listed as __Microsoft CLI 2.0 for Azure__. Select this application, then select the `Uninstall` button.

## Remove data

If you don't plan to reinstall Azure CLI, remove its data from `C:\Users\<username>\.azure\msal_token_cache.bin` or `C:\Users\<username>\.azure\msal_token_cache.json`.

## Next Steps

Now that you've installed the Azure CLI on Windows, learn about the different ways to sign in.

> [!div class="nextstepaction"]
> [Sign in with Azure CLI](authenticate-azure-cli.md)
