---
title: Install the Azure CLI for Windows | Microsoft Docs
description: To install the Azure CLI on Windows, you must use PowerShell, or an MSI installer, which gives you access to the CLI through the Windows Command Prompt (CMD).
ms.service: azure-cli
ms.custom: devx-track-azurecli
zone_pivot_group_filename: azure/zone-pivot-groups.json
zone_pivot_groups: cli-windows-installation-method
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

::: zone pivot="winget"

[!INCLUDE [cli-install-windows-winget](includes/cli-install-windows-winget.md)]

::: zone-end

::: zone pivot="msi"

[!INCLUDE [cli-install-windows-msi](includes/cli-install-windows-msi.md)]

::: zone-end

::: zone pivot="msi-powershell"

[!INCLUDE [cli-install-windows-msi-powershell](includes/cli-install-windows-msi-powershell.md)]

::: zone-end

::: zone pivot="zip"

[!INCLUDE [cli-install-windows-zip](includes/cli-install-windows-zip.md)]

::: zone-end

## Run the Azure CLI

**After installation, close and reopen any active terminal window.** Run the Azure CLI with the `az` command from either Windows Command Prompt or PowerShell.

Before you can execute Azure CLI commands, you need to sign into Azure. To sign in interactively, use `az login`. For information on authentication, see [Sign into Azure with Azure CLI](authenticate-azure-cli.md).

```azurecli
az login
```
A common first step is to check your active subscription.

```azurecli
az account show
```

## Troubleshooting installation

Here are some common problems seen when installing the Azure CLI on Windows. If you experience a problem not covered here, [file an issue on GitHub](https://github.com/Azure/azure-cli/issues).

### PATH variable not set

The most common cause of this problem is that the active terminal window has not been restarted after installation. Close and reopen any active terminal window.

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

For more information, see [Work behind a proxy](./use-azure-cli-successfully-troubleshooting.md#work-behind-a-proxy) in the Azure CLI troubleshooting guide.

### Slow response times

See [Migrate to 64-bit Azure CLI](#migrate-to-64-bit-azure-cli)

## Enable Tab Completion in PowerShell

[!INCLUDE [tab-completion](includes/tab-completion.md)]

## Update the Azure CLI

[!INCLUDE [az upgrade](includes/az-upgrade.md)]

If you are using ZIP distribution, please delete the old installation folder and extract the new version to the _same location_.

## Migrate to 64-bit Azure CLI

Starting from 2.51.0, Azure CLI also provides 64-bit MSI which is recommended for better performance.

Follow these steps to migrate to Azure CLI 64-bit:
1. Check your current CLI version and installed extensions by running `az --version`.
1. Extensions will need to be reinstalled. It is recommended to perform a backup of the current extension folder `%userprofile%\.azure\cliextensions` by renaming it in case you choose to revert back to 32-bit. This folder is created automatically when you reinstall an extension.
1. Download and install latest 64-bit installer as described in [Install or update](#install-or-update). The 32-bit MSI will be automatically uninstalled.
1. Install extensions by running `az extension add --name <extension> --version <version>`. If you don't want to reinstall extensions manually, the Azure CLI will prompt you to install an extension on first use. For more information on installing extensions, see [How to install extensions](/cli/azure/azure-cli-extensions-overview#how-to-install-extensions).

If you have issues after migration, you can uninstall the 64-bit and reinstall the 32-bit MSI. If you have made a backup of your 32-bit extension folder, restore (rename) your extension folder after the change.

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
