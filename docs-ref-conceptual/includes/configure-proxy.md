---
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/1/2023
ms.topic: include
ms.custom: devx-track-azurecli
---
If you're unable to connect to an external resource due to a proxy, make sure that you've correctly set the `HTTP_PROXY` and `HTTPS_PROXY` variables in your shell. You need to contact your system administrator
to know what host(s) and port(s) to use for these proxies.

Linux programs utilize these values, including ones that are used in the install process. 
To set these values:

```bash
# No auth
export HTTP_PROXY=http://[proxy]:[port]
export HTTPS_PROXY=https://[proxy]:[port]

# Basic auth
export HTTP_PROXY=http://[username]:[password]@[proxy]:[port]
export HTTPS_PROXY=https://[username]:[password]@[proxy]:[port]
```

> [!IMPORTANT]
> If you are behind a proxy, these shell variables must be set to connect to Azure services with the CLI.
> If you are not using basic auth, it's recommended to export these variables in your `.bashrc` file.
> Always follow your business' security policies and the requirements of your system administrator.
