---
title: Use the subscription selector when logging into Azure.
description: Learn how to select a subscription from the new subscription selector available with the `az login` command.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 04-09-2025
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: az login, authentication types, authentication methods, azure, cli login, az login powershell, cli login, sign in, azure cli  
---

# Choose your subscription when logging into Azure using Azure CLI

With the release of Azure CLI [x.xx.xx](), there is a new login feature that provides a list of available subscriptions. Choose to keep the default subscription, or simply type the line number of the subscription you want to use. Here are the details:

* The subscription selector is a preview feature available in 64-bit Windows and macOS.
* The subscription selector is only available when using the `az login` command.
* Azure CLI [x.xx.xx]() must be installed to use the subscription selector. For information on installing the Azure CLI, see [How to install the Azure CLI](./install-azure-cli.md).
* Installing the preview will over-write your current Azure CLI installation.
* You will not be prompted to select a subscription when logging in with a service principal, managed identity or Web Account Manager (WAM).

## Prerequisite for macOS

If you are installing the preview in a macOS environment, Python runtime must be installed.

```bash
mkdir azure-cli-edge-build 
cd azure-cli-edge-build 
git clone https://github.com/jiasli/azure-cli --branch login --depth 1 
python3 -m venv env 
. env/bin/activate 
pip install azdev 
azdev setup -c 
az login 
```

## Install

To install Azure CLI x.xx.x, follow these instructions:

1. Download [Microsoft Azure CLI.zip](https://artprodwus21.artifacts.visualstudio.com/A7b238909-6802-4b65-b90d-184bca47f458/5147fa83-336e-44ef-bbe0-c86b8ae86cbb/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL2F6Y2xpdG9vbHMvcHJvamVjdElkLzUxNDdmYTgzLTMzNmUtNDRlZi1iYmUwLWM4NmI4YWU4NmNiYi9idWlsZElkLzE0NTY3MC9hcnRpZmFjdE5hbWUvemlwLXg2NA2/content?format=file&subPath=%2FMicrosoft%20Azure%20CLI.zip ).
1. Unzip the package to a folder.
1. Using Cmd.exe or PowerShell, call the Azure CLI by running <unzipped folder path>\bin\az.cmd.
1. **Close and reopen any active terminal window to use the newly installed preview.**

### Log into Azure

The Azure CLI's default authentication method for logins uses a web browser and access token to sign in.

[!INCLUDE [interactive_login](includes/interactive-login.md)]

### Choose your subscription

1. Note your default subscription indicated by an asterisk (`*`).

1. Tap `Enter` to bypass the subscription selector and accept the default subscription.
1. Type a line number from the auto-incremented list to change the default subscription.
   
   **put screen print here**

## See also

* [Install the Azure CLI](./install-azure-cli.md)
* [Authenticate to Azure using Azure CLI](./authenticate-azure-cli.md)

