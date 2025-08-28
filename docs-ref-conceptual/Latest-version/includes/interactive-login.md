---
ms.topic: include
ms.custom: devx-track-azurecli
---

1. Run the `az login` command.

   ```azurecli-interactive
   az login
   ```

   If Azure CLI can open your default browser, it initiates [authorization code flow][01] and opens
   the default browser to load an Azure sign-in page.

   Otherwise, it initiates the [device code flow][02] and instructs you to open a browser page at
   [https://aka.ms/devicelogin][03]. Then, enter the code displayed in your terminal.

   If no web browser is available or the web browser fails to open, you can force device code flow
   with `az login --use-device-code`.

1. Sign in with your account credentials in the browser.

<!-- updated link references -->

[01]: /azure/active-directory/develop/v2-oauth2-auth-code-flow
[02]: /azure/active-directory/develop/v2-oauth2-device-code
[03]: https://aka.ms/devicelogin
