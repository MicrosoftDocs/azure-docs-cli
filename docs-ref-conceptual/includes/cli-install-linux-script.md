---
author: dbradish-microsoft
ms.author: dbradish
ms.date: 06/17/2024
ms.topic: include
ms.service: azure-cli
ms.custom: devx-track-azurecli, linux-related-content
---

## Before you begin

It's strongly recommend to install the CLI with a package manager. A package manager makes sure you always get the latest updates, and guarantees the stability of CLI components. Check and see if there's a package for your distribution before installing manually.

The install script for the Azure CLI requires the following software:

* [Python 3.8.x, 3.9.x, 3.10.x](https://www.python.org/downloads/) - For more information, see [Support lifecycle - Python dependency](../azure-cli-support-lifecycle.md#python-dependency).
* [libffi](https://sourceware.org/libffi/)
* [OpenSSL 1.0.2](https://www.openssl.org/source/)

## Install or update Azure CLI

> [!IMPORTANT]
> The install script only works on Python 3.8.x, 3.9.x, or 3.10.x. This install script does not work on Python 3.11.x or later versions.

Both installing and updating the Azure CLI requires rerunning the install script:

```bash
curl -L https://aka.ms/InstallAzureCli | bash
```

The script can also be downloaded and run locally. You may have to restart your shell for the changes to take effect.

## Uninstall Azure CLI

[!INCLUDE [uninstall-boilerplate.md](uninstall-boilerplate.md)]

Uninstall the CLI by directly deleting the files from the location chosen at the time of installation. The default install location is the user's home directory ($HOME).

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

### Remove data

[!INCLUDE [remove-data-boilerplate.md](remove-data-boilerplate.md)]

## Troubleshooting

Here are some common problems seen during a manual installation. If you experience a problem not covered here, [file an issue on GitHub](https://github.com/Azure/azure-cli/issues).

### Install without Python 3

The Azure CLI has dropped support for Python 2.7 since version [2.1.0](/cli/azure/release-notes-azure-cli#february-18-2020).
On your system, there may be a Python version that predates the requirement of Python 3.6.x.
Find a replacement `python3` package.

### curl "Object Moved" error

If you get an error from `curl` related to the `-L` parameter, or an error message including the text "Object Moved", try using
the full URL instead of the `aka.ms` redirect:

```bash
curl https://azurecliprod.blob.core.windows.net/install | bash
```

### `az` command not found

If you can't run the command after installation using `bash` or `zsh`, try clearing your shell's command hash cache and check if the problem is resolved.

```bash
hash -r
```

The issue can also occur if you didn't restart your shell after installation. Make sure that the location of the `az` command is in your `$PATH`. The location
of the `az` command is ...

```
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
