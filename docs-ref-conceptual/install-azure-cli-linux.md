---
title: Install the Azure CLI for Linux manually
description: How to install the Azure CLI on Linux manually
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 01/29/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Install Azure CLI on Linux manually

If you do not have a package for the Azure CLI available on your distribution, you can always install the CLI manually by
running an installation script.

> [!NOTE]
> It's strongly recommend that you use a package manager for the CLI. A package manager makes sure you always get the latest updates,
> and guarantees the stability of CLI components. Check and see if there is a package for your distribution before
> installing manually.

## Prerequisites

In order to install the CLI, you need the following software available on your system:

* [Python 2.7 or Python 3.x](https://www.python.org/downloads/)
* [libffi](https://sourceware.org/libffi/)
* [OpenSSL 1.0.2](https://www.openssl.org/source/)

## Install or update

Whether you are installing or updating the CLI, you need to perform a full installation. Once you have the prerequisites, you can
install the CLI by running `curl`.

```bash
curl -L https://aka.ms/InstallAzureCli | bash
```

You can also download the script and run it locally instead. You may have to restart
your shell in order for changes to take effect. 

You can then run the Azure CLI with the `az` command. To log in, run the `az login` command.

```azurecli
az login
```

To learn more about different login methods, see [Log in with Azure CLI](authenticate-azure-cli.md).

## Troubleshooting

Here are some common problems seen during a manual installation. If your issue is not listed here, please [file an issue on github](https://github.com/Azure/azure-cli/issues).
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

The issue can also occur if you did not restart your shell after installation. Make sure that the location of the `az` command is in your `$PATH`. The location
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
