---
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 05/28/2019
ms.topic: include
ms.service: azure-cli
---
If you're unable to connect to an external resource due to a proxy, make sure that you've correctly set the `HTTP_PROXY` and `HTTPS_PROXY` variables in your shell. You will need to contact your system administrator
to know what host(s) and port(s) to use for these proxies.

These values are respected by many Linux programs, including those which are used in the install
process. To set these values:

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
