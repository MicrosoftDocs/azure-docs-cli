---
title: Install the Azure CLI for Windows
description: How to install the Azure CLI on Windows
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.prod: azure
ms.date: 09/25/2020
ms.topic: conceptual
ms.devlang: azurecli
ms.technology: azure-cli 
ms.custom: devx-track-azurecli
---

# Install Azure CLI on Windows

For Windows, the Azure CLI is installed via a MSI, which gives you access to the CLI through the Windows Command Prompt (CMD) or PowerShell.
When installing for Windows Subsystem for Linux (WSL), packages are available for your Linux distribution. See the [main install page](install-azure-cli.md)
for the list of supported package managers or how to install manually under WSL.

[!INCLUDE [current-version](includes/current-version.md)]

## Install or update

The MSI distributable is used for installing or updating the Azure CLI on Windows. You don't need to uninstall current versions before using the MSI installer because the MSI will update any existing version.

# [Microsoft Installer (MSI)](#tab/azure-cli)

When the installer asks if it can make changes to your computer, click the "Yes" box.

### Azure CLI current version

Download and install the current release of the Azure CLI.  

> [!div class="nextstepaction"]
> [Current release of the Azure CLI](https://aka.ms/installazurecliwindows)

### Azure CLI beta version

The beta version of the Azure CLI supports all CLI commands that you will find in the current released version. The beta version is a migration from the released Azure CLI as the AAD authentication platform (v1.0) is being deprecated.  [Microsoft Identity platform (v2.0)](/azure/active-directory/develop/v2-overview) is the new authentication method and is used by Azure CLI beta.  We recommend that you try the beta version in advance.  

For more information about Azure CLI beta, please see [release notes](./release-notes-azure-cli.md?tabs=azure-cli-beta).

> [!IMPORTANT]
>
> The beta version does not guarantee product level quality so it should not be used in your production environment.

Download and install the beta version of the Azure CLI.

> [!div class="nextstepaction"]
> [Beta release of the Azure CLI](https://aka.ms/installazurecliwindowsbeta)

# [Microsoft Installer (MSI) with Command](#tab/azure-powershell)

### Powershell Command

You can also install the Azure CLI using PowerShell. Start PowerShell as administrator and run the following command:

   ```PowerShell
   Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi
   ```

This will download and install the latest version of the Azure CLI for Windows. If you already have a version installed, the installer will update the existing version. After the installation is complete, you will need to reopen PowerShell to use the Azure CLI.

### Azure CLI Command (for update only)
[!INCLUDE [az-upgrade](includes/az-upgrade.md)]

---

## Run the Azure CLI

You can now run the Azure CLI with the `az` command from either Windows Command Prompt or PowerShell. PowerShell offers some tab completion features
not available from Windows Command Prompt. To sign in, run the [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI](authenticate-azure-cli.md).

## Troubleshooting

Here are some common problems seen when installing on Windows. If you experience a problem not covered here, [file an issue on GitHub](https://github.com/Azure/azure-cli/issues).

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
* `https://azurecliprod.blob.core.windows.net/`

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

You uninstall the Azure CLI from the Windows "Apps and Features" list. To uninstall:

| Platform | Instructions |
|---|---|
| Windows 10 | Start > Settings > Apps |
| Windows 8 and Windows 7 | Start > Control Panel > Programs > Uninstall a program |

Once on this screen type __Azure CLI__ into the program search bar. The program to uninstall is listed as __Microsoft CLI 2.0 for Azure__. Select this application, then click the `Uninstall` button.

## Next Steps

Now that you've installed the Azure CLI, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)