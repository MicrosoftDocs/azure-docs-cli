---
title: Use the subscription selector when logging into Azure.
description: Learn how to select a subscription from the new subscription selector available with the `az login` command.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 04/09/2024
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: az login, authentication types, authentication methods, azure, cli login, az login powershell, cli login, sign in, azure cli  
---

# Choose your subscription when logging into Azure using Azure CLI

With the preview release of Azure CLI [2.59.0](./release-notes-azure-cli.md#april-02-2024), there's a new login feature that provides a list of available tenants and subscriptions. Choose to keep the subscription and tenant that is selected by default, or type the line number of the subscription you want to use. Here are the details:

* The subscription selector is available in a preview version of Azure CLI 64-bit Windows, Linux, or macOS.
* The subscription selector is only available when using the `az login` command [interactively](./authenticate-azure-cli-interactively.md).
* The authentication preview must be installed to use the subscription selector.
* The preview is installed in the directory you specify, and coexists with your current Azure CLI installation.
* The authentication preview doesn't prompt you to select a subscription when you're logging in with a service principal, managed identity, or Web Account Manager (WAM).

With the current practice, the [az account set](/cli/azure/account#az-account-set) command is required to change your subscription. With the subscription selector at time of interactive login, you skip having to [list](/cli/azure/account#az-account-list), [set](/cli/azure/account#az-account-set) and [show](/cli/azure/account#az-account-show) your default subscription.

## Prerequisite for macOS

If you're installing the preview in a macOS environment, Python runtime must be installed.

```bash
mkdir azure-cli-edge-build 
cd azure-cli-edge-build 
git clone https://github.com/Azure/azure-cli --branch login --depth 1 
python3 -m venv env 
. env/bin/activate 
pip install azdev 
azdev setup -c 
az login 
```

## Install

Install Azure CLI authentication preview by following these steps:

1. Download [Microsoft Azure CLI.zip](https://aka.ms/AApydwn).
1. Unzip the package to a folder.
1. Using Cmd.exe or PowerShell, call the Azure CLI by running `<unzipped folder path\>\bin\az.cmd`.
1. **Close and reopen any active terminal window to use the newly installed preview.**

> [!NOTE]
> You must execute Azure CLI commands from the location where you installed the preview, or update your PATH environment variable to include the location. This article takes the approach of changing the working directory.

## Log into Azure

To use the new subscription selector, first change your directory to where you installed the authentication preview, then use `./az.cmd login`.

```azurecli
cd <unzipped folder path>
./az.cmd login
```

If you installed the authentication preview in `C:\myPath\Azure CLI preview`, your syntax would look like this:

```azurecli
cd C:\myPath\Azure CLI preview\bin
C:\myPath\Azure CLI preview\bin> ./az.cmd login
```

## Choose your subscription

1. Note your default subscription indicated with an asterisk (`*`).
1. Tap `Enter` to bypass the subscription selector and accept the default subscription.
1. Type a line number from the numbered list to change the default subscription.

:::image type="content" source="./media/authenticate-azure-cli-preview/subscription-selector.png" alt-text="Subscription selector":::

## Verify results

To verify your selected default subscription, use `./az.cmd account show`. If you installed the authentication preview in `C:\myPath\Azure CLI preview`, your syntax would look like this:

```azurecli
C:\myPath\Azure CLI preview\bin> ./az.cmd account show
```

## Check your version

Check the Azure CLI version of the authentication preview using `./az.cmd --version`.

```azurecli
C:\myPath\Azure CLI preview\bin> ./az.cmd --version
```

## See also

* [Install the Azure CLI](./install-azure-cli.md)
* [Authenticate to Azure using Azure CLI](./authenticate-azure-cli.md)