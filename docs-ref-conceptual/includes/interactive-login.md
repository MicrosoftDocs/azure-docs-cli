---
author: dbradish-microsoft
ms.author: dbradish
ms.date: 12/04/2023
ms.topic: include
ms.custom: devx-track-azurecli
---

1. Authenticate to Azure

Run the `az login` command.

```azurecli-interactive
az login
```

* On Windows 10 and later, and on Windows Server 2019 and later, Azure CLI will use [Web Account Manager](../authenticate-azure-cli-web-account-manager.md) to sign in to Azure with the account selected in the pop-up window.
 
* On other supported platform, if the Azure CLI can open your default browser, it initiates [authorization code flow](/azure/active-directory/develop/v2-oauth2-auth-code-flow) and opens the default browser to load an Azure sign-in page.

  Otherwise, it initiates the [device code flow](/azure/active-directory/develop/v2-oauth2-device-code) and instructs you to open a browser page at [https://aka.ms/devicelogin](https://aka.ms/devicelogin).  Then, enter the code displayed in your terminal.
  If no web browser is available or the web browser fails to open, you may force device code flow with **az login --use-device-code**.

  Sign in with your account credentials in the browser.

2. Select your subscription

After successful login Azure CLI will provide a list of available tenants and subscriptions. Choose to keep the subscription
 and tenant that is selected by default, or type the line number of the subscription you want to use. Here are the details:

* The subscription selector is available by default on Azure CLI 64-bit Windows, Linux, or macOS version 2.61 or superior.
* The subscription selector is only available when using the `az login` command [interactively](./authenticate-azure-cli-interactively.md).

With the current practice, the [az account set](/cli/azure/account#az-account-set) command is required to change your subscription. With the subscription selector at time of interactive login, you skip having to [list](/cli/azure/account#az-account-list) and [set](/cli/azure/account#az-account-set) your default subscription.