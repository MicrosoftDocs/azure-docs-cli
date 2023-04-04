---
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/07/2018
ms.topic: include
ms.custom: devx-track-azurecli
---
1. Run the `login` command.

    ```azurecli-interactive
    az login
    ```

    If the CLI can open your default browser, it will initiate [authorization code flow](/azure/active-directory/develop/v2-oauth2-auth-code-flow) and open the default browser to load an Azure sign-in page.

    Otherwise, it will initiate [device code flow](/azure/active-directory/develop/v2-oauth2-device-code) and tell you to open a browser page at [https://aka.ms/devicelogin](https://aka.ms/devicelogin) and enter the code displayed in your terminal.

    If no web browser is available or the web browser fails to open, you may force device code flow with **az login --use-device-code**.

2. Sign in with your account credentials in the browser.
