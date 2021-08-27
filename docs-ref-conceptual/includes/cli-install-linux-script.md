---
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 12/15/2020
ms.topic: include
ms.service: azure-cli
ms.devlang: azurecli 
ms.custom: devx-track-azurecli
---

## Overview

> [!NOTE]
> It's strongly recommend to install the CLI with a package manager. A package manager makes sure you always get the latest updates,
> and guarantees the stability of CLI components. Check and see if there is a package for your distribution before
> installing manually.

The CLI requires the following software:

* [Python 3.6.x, 3.7.x or 3.8.x](https://www.python.org/downloads/).
* [libffi](https://sourceware.org/libffi/)
* [OpenSSL 1.0.2](https://www.openssl.org/source/)

> [!IMPORTANT]
>
> The CLI has dropped support for Python 2.7 since version `2.1.0`. New versions no longer
> guarantee to run with Python 2.7 correctly.

## Install or update

Both installing and updating the CLI requires re-running the install script. Install the CLI by running `curl`.

```bash
curl -L https://aka.ms/InstallAzureCli | bash
```

The script can also be downloaded and run locally. You may have to restart your shell in order for changes to take effect.

You can then run the Azure CLI with the `az` command. To sign in, use [az login](/cli/azure/reference-index#az_login) command.

[!INCLUDE [interactive-login](interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI](../authenticate-azure-cli.md).

## Troubleshooting

Here are some common problems seen during a manual installation. If you experience a problem not covered here, [file an issue on GitHub](https://github.com/Azure/azure-cli/issues).

### curl "Object Moved" error

If you get an error from `curl` related to the `-L` parameter, or an error message including the text "Object Moved", try using
the full URL instead of the `aka.ms` redirect:

```bash
curl https://azurecliprod.blob.core.windows.net/install | bash
```

### `az` command not found

If you can't run the command after installation and using `bash` or `zsh`, clear your shell's command hash cache. Run

```bash
hash -r
```

and check if the problem is resolved.

The issue can also occur if you didn't restart your shell after installation. Make sure that the location of the `az` command is in your `$PATH`. The location
of the `az` command is

```bash
<install path>/bin
```

### Proxy blocks connection

[!INCLUDE[configure-proxy](configure-proxy.md)]

In order to get the installation scripts, your proxy needs to allow HTTPS connections to the
following addresses:

* `https://aka.ms/`
* `https://azurecliprod.blob.core.windows.net/`
* `https://pypi.python.org`
* Endpoints used by your distribution's package manager (if any) for core packages

[!INCLUDE[troubleshoot-wsl.md](troubleshoot-wsl.md)]

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](uninstall-boilerplate.md)]

Uninstall the CLI by directly deleting the files from the location chosen at the time of installation. The default install location is `$HOME`.

1. Remove the installed CLI files.

   ```bash
   rm -r <install location>/lib/azure-cli
   rm <install location>/bin/az
   ```

2. Modify your `$HOME/.bash_profile` file to remove the following line:

   ```text
   <install location>/lib/azure-cli/az.completion
   ```

3. If using `bash` or `zsh`, reload your shell's command cache.

   ```bash
   hash -r
   ```
