---
title: Install the Azure CLI for Windows | Microsoft Docs
description: To install the Azure CLI on Windows, you must use PowerShell, or an MSI installer, which gives you access to the CLI through the Windows Command Prompt (CMD).
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.service: azure-cli
ms.date: 08/2/2023
ms.topic: conceptual
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: Install azure cli, azure cli download, cli for windows, install azure cli on windows, azure cli windows, install azure cli windows
---

# Install Azure CLI on Windows

The Azure Command-Line Interface (CLI) is a cross-platform command-line tool that can be installed locally on Windows computers. You can use the Azure CLI for Windows to connect to Azure and execute administrative commands on Azure resources. The Azure CLI for Windows can also be used from a browser through the Azure Cloud Shell or run from inside a Docker container.

For Windows, the Azure CLI is installed via an MSI, which gives you access to the CLI through the Windows Command Prompt (CMD) or PowerShell.
When you perform an installation for Windows Subsystem for Linux (WSL), packages are available for your Linux distribution. See the [main install page](install-azure-cli.md)
for the list of supported package managers or how to install manually under WSL.

[!INCLUDE [current-version](includes/current-version.md)]

## Install or update

The MSI distributable is used for installing or updating the Azure CLI on Windows. You don't need to uninstall current versions before using the MSI installer because the MSI updates any existing version.

> [!IMPORTANT]
> After the installation is complete, you will need to **close and reopen any active terminal window to use the Azure CLI**.

# [Microsoft Installer (MSI)](#tab/azure-cli)

### Latest version

Download and install the latest release of the Azure CLI. When the installer asks if it can make changes to your computer, select the "Yes" box.

> [!div class="nextstepaction"]
> [Latest release of the Azure CLI (32-bit)](https://aka.ms/installazurecliwindows)
> [Latest release of the Azure CLI (64-bit)](https://aka.ms/installazurecliwindowsx64)

If you have previously installed the Azure CLI, running either the 32-bit or 64-bit MSI will overwrite an existing installation.

### Specific version

[!INCLUDE [specific version](includes/specific-version.md)]

# [Microsoft Installer (MSI) with Command](#tab/powershell)

### PowerShell

Although most Azure CLI documentation is written and tested in a Bash shell, you can also install and run the Azure CLI using PowerShell. There are subtle syntax differences between Bash and PowerShell.  Review these articles to avoid scripting errors:
- [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md)
- [Use quotation marks in Azure CLI parameters](./use-cli-effectively.md#use-quotation-marks-in-parameters)
- Compare syntax of CMD, PowerShell and Bash in [Query command output using JMESPath](./query-azure-cli.md)
- [Error handling for the Azure CLI in PowerShell](./use-cli-effectively.md#error-handling-for-azure-cli-in-powershell)

To install the Azure CLI using PowerShell, start PowerShell **as administrator** and run the following command:

   ```PowerShell
   $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; Remove-Item .\AzureCLI.msi
   ```

This will download and install the latest 32-bit installer of the Azure CLI for Windows. If you prefer a 64-bit install, change URL to `https://aka.ms/installazurecliwindowsx64`. If the Azure CLI is already installed, the installer will overwrite the existing version.

To install a specific version, replace the `-Uri` argument with the URL described in [Specific version](#specific-version-1).  Here is an example of using the 32-bit installer of the Azure CLI version [2.51.0](/cli/azure/release-notes-azure-cli#august-01-2023) in PowerShell:

   ```PowerShell
   $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://azcliprod.blob.core.windows.net/msi/azure-cli-2.51.0.msi -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; Remove-Item .\AzureCLI.msi
   ```

### Specific version

[!INCLUDE [specific version](includes/specific-version.md)]

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

The `-e` option is to ensure the official Azure CLI package is installed. This command installs the latest version by default. To specify a version, add a `-v <version>` with your desired version to the command.

---

## Run the Azure CLI

You can now run the Azure CLI with the `az` command from either Windows Command Prompt or PowerShell.

## Enable Tab Completion on PowerShell

PowerShell provides completion on inputs to provide hints, enable discovery and speed up input entry. Command names, command group names, parameters and certain parameter values can be completed by pressing the <kbd>Tab</kbd> key.

> [!Note]
> Azure CLI version 2.49 or higher is required to enable tab completion for Azure CLI on PowerShell.

To enable tab completion in PowerShell, create or edit the profile stored in the variable `$PROFILE`. The simplest way is to run `notepad $PROFILE` in PowerShell. For more information, see [How to create your profile](/powershell/module/microsoft.powershell.core/about/about_profiles#how-to-create-a-profile) and [Profiles and execution policy](/powershell/module/microsoft.powershell.core/about/about_profiles#profiles-and-execution-policy).

Then add the following code to your PowerShell profile:

```powershell
Register-ArgumentCompleter -Native -CommandName az -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
    $completion_file = New-TemporaryFile
    $env:ARGCOMPLETE_USE_TEMPFILES = 1
    $env:_ARGCOMPLETE_STDOUT_FILENAME = $completion_file
    $env:COMP_LINE = $wordToComplete
    $env:COMP_POINT = $cursorPosition
    $env:_ARGCOMPLETE = 1
    $env:_ARGCOMPLETE_SUPPRESS_SPACE = 0
    $env:_ARGCOMPLETE_IFS = "`n"
    $env:_ARGCOMPLETE_SHELL = 'powershell'
    az 2>&1 | Out-Null
    Get-Content $completion_file | Sort-Object | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, "ParameterValue", $_)
    }
    Remove-Item $completion_file, Env:\_ARGCOMPLETE_STDOUT_FILENAME, Env:\ARGCOMPLETE_USE_TEMPFILES, Env:\COMP_LINE, Env:\COMP_POINT, Env:\_ARGCOMPLETE, Env:\_ARGCOMPLETE_SUPPRESS_SPACE, Env:\_ARGCOMPLETE_IFS, Env:\_ARGCOMPLETE_SHELL
}
```

To display all available options in the  menu, add `Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete` to your PowerShell profile.

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
1. Install extensions by running `az extension add --name <extension> --version <version>`.  If you don't want to reinstall extensions manually, the Azure CLI will prompt you to install an extension on first use. For more information on installing extensions, see [How to install extensions](/cli/azure/azure-cli-extensions-overview#how-to-install-extensions).

If you have issues after migration, you can uninstall the 64-bit and reinstall the 32-bit MSI.  If you have made a backup of your 32-bit extension folder, restore (rename) your extension folder after the change.

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

You uninstall the Azure CLI from the Windows "Apps and Features" list. To uninstall:

| Platform | Instructions |
|---|---|
| Windows 11 | Start > Settings > Apps > Installed apps |
| Windows 10 | Start > Settings > System > Apps & Features |
| Windows 8 and Windows 7 | Start > Control Panel > Programs > Uninstall a program |

Once on this screen type __Azure CLI__ into the program search bar. The program to uninstall is listed as __Microsoft CLI 2.0 for Azure__. Select this application, then select the `Uninstall` button.

## Remove data

If you don't plan to reinstall Azure CLI, remove its data from `C:\Users\<username>\.azure\msal_token_cache.bin` or `C:\Users\<username>\.azure\msal_token_cache.json`.

## Next Steps

Now that you've installed the Azure CLI on Windows, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)
