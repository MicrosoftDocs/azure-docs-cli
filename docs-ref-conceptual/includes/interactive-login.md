---
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/1/2023
ms.topic: include
ms.custom: devx-track-azurecli
---
1. Run the `login` command.

    ```azurecli-interactive
    az login
    ```

    If the CLI can open your default browser, it initiates [authorization code flow](/azure/active-directory/develop/v2-oauth2-auth-code-flow) and open the default browser to load an Azure sign-in page.

    Otherwise, it initiates the [device code flow](/azure/active-directory/develop/v2-oauth2-device-code) and tell you to open a browser page at [https://aka.ms/devicelogin](https://aka.ms/devicelogin) and enter the code displayed in your terminal.

    If no web browser is available or the web browser fails to open, you may force device code flow with **az login --use-device-code**.

2. Sign in with your account credentials in the browser.
