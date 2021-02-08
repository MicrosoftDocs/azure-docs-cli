---
title: Install the Azure CLI beta version
description: Reference for the installation of Azure CLI beta version
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 02/09/2021
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli 
ms.custom: devx-track-azurecli
---

# Install Azure CLI beta version

A new beta version of the Azure CLI has been released that offers increased security for token cache, access tokens and SSL certificates.  This beta vesion can be installed in Windows, macOS and Linux environments.

> [!NOTE]
>
>  BREAKING CHANGES are introduced in this release.  Thoroghly read all [release notes](/cli/azure/release-notes-azure-cli?tabs=azure-cli#tabs=azure-cli-beta) prior to installation.
>
> The beta version does not guarantee product level quality so it should not be used in your production environment.

## Understand beta changes

### `accessTokens.json` deprecation

The current Azure CLI saves the ADAL refresh tokens and access tokens to `~/.azure/accessToken.json`. Starting from Azure CLI beta which uses MSAL, it will no longer generate `accessTokens.json` and will save tokens to MSAL's shared token cache called `msal.cache`. 

The MSAL token cache will be encrypted on Windows, macOS and Linux with a desktop environment; therefore, directly accessing the MSAL token cache will not work. Any existing workflow depending on `accessTokens.json` will stop working.

Below are several alternatives you may consider: 

#### Calling `az account get-access-token`

You can either manually call `az account get-access-token` in a terminal or use subprocess to call it from any programming language. By default, the returned token is for the default subscription/tenant shown in `az account show`.

#### Using `AzureCliCredential`

`AzureCliCredential` is a credential type in all existing language SDKs. It internally uses subprocess to call `az account get-access-token` to gets an access token from current logged in CLI accounts. 

#### Accessing shared MSAL cache

First party apps can use `SharedTokenCacheCredential` from Azure Identity SDK to directly access the shared MSAL cache.

## Install Azure CLI beta

Azure CLI is built on [Python](https://www.python.org/). The supported Python versions are 3.6, 3.7, 3.8. On Windows, you will need to [install Python](https://www.python.org/downloads/windows/) first.

Currently Azure CLI beta can only be installed with `pip` from a Microsoft repository.

We recommend creating a [virtual environment](https://docs.python.org/3/tutorial/venv.html) and activating it before installing Azure CLI beta so that it won't overwrite the installed stable release of Azure CLI.

1. Create a virtual environment

   Navigate to the folder where you want to create the virtual environment, then run:

   ```sh
   python -m venv <env_name>
   ```

1. Activate the virtual environment

   The same step can also be used to activate the virtual environment again after Azure CLI beta is installed.

   ### [Windows PowerShell](#tab/powershell)

   ```powershell
   . .\$env\Scripts\Activate.ps1
   ```

   ### [Linux/macOS Bash](#tab/bash)

   ```sh
   . $env/bin/activate
   ```
   ---

1. Install Azure CLI beta

   ```sh
   pip install --pre --extra-index-url https://azurecliprod.blob.core.windows.net/beta/simple/ azure-cli
   ```

1. Deactivate the virtual environment

   After finishing using Azure CLI beta, you may simple close the terminal windows, or run:

   ```sh
   deactivate
   ```

## Uninstall Azure CLI beta

To uninstall Azure CLI beta, simple delete the virtual environment folder:

### [Windows PowerShell](#tab/powershell)

```powershell
Remove-Item -Force -Recurse <env_name>
```

### [Linux/macOS Bash](#tab/bash)

```sh
rm -rf <env_name>
```

---
