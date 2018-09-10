---
title: Install the Azure CLI 2.0 for Linux manually
description: How to install the Azure CLI 2.0 on Linux manually
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/09/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Install Azure CLI 2.0 on Linux manually

If there's no package for the Azure CLI for you your distribution, install the CLI manually by running a script.

> [!NOTE]
> It's strongly recommend to install the CLI with a package manager. A package manager makes sure you always get the latest updates,
> and guarantees the stability of CLI components. Check and see if there is a package for your distribution before
> installing manually.

## Prerequisites

The CLI requires the following software:

* [Python 2.7 or Python 3.x](https://www.python.org/downloads/)
* [libffi](https://sourceware.org/libffi/)
* [OpenSSL 1.0.2](https://www.openssl.org/source/)

## Install or update

Both installing and updating the CLI requires re-running the install script. Install the CLI by running `curl`.

```bash
curl -L https://aka.ms/InstallAzureCli | bash
```

The script can also be downloaded and run locally. You may have to restart your shell in order for changes to take effect.

You can then run the Azure CLI with the `az` command. To sign in, use [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI 2.0](authenticate-azure-cli.md).

## Troubleshooting

Here are some common problems seen during a manual installation. If you experience a problem not covered here, [file an issue on github](https://github.com/Azure/azure-cli/issues).

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

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

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
