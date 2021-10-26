---
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/07/2018
ms.topic: include
---
## Sign in to Azure with the Azure CLI

You can then run the Azure CLI with the `az` command. To sign in, use [`az login`](/cli/azure/reference-index#az_login) command.

1. Run the `login` command.

    ```azurecli-interactive
    az login
    ```

    If the CLI can open your default browser, it will do so and load an Azure sign-in page.

    Otherwise, open a browser page at [https://aka.ms/devicelogin](https://aka.ms/devicelogin) and enter the
    authorization code displayed in your terminal.

    If no web browser is available or the web browser fails to open, use device code flow with **az login --use-device-code**.

2. Sign in with your account credentials in the browser.

To learn more about different authentication methods, see [Sign in with Azure CLI](../authenticate-azure-cli.md).
