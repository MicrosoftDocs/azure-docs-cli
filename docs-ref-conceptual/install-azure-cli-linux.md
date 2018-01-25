---
title: Install the Azure CLI 2.0 for Linux manually
description: How to install the Azure CLI 2.0 on Linux manually
keywords: Azure CLI,Install Azure CLI,azure linux, azure install linux
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 11/01/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Install Azure CLI 2.0 on Linux manually

If you do not have a package for the Azure CLI available on your distribution, you can always install the CLI manualy by
running an installation script. If you do have a package available, that is always the recommended installation method.

## Prerequisites

In order to install the CLI, you will need the following software available on your system:

* [Python 2.7 or Python 3.x](https://www.python.org/downloads/)
* [libffi](https://sourceware.org/libffi/)
* [OpenSSL 1.0.2](https://www.openssl.org/source/)

## Install or update manually

Whether you are installing or updating the CLI, you will need to perform a full installation. Once you have the prerequisites, you can
install the CLI by running `curl`.

```bash
curl -L https://aka.ms/InstallAzureCli | bash
```

If you would prefer, or do not have `curl` on your system, you can download the script and run it locally instead. You may have to restart
your shell in order for changes to take effect. After installation, run the CLI with the `az` command.

## Troubleshooting

### curl "Object Moved" error

If you get an error from `curl` related to the `-L` parameter, or an error message including the text "Object Moved", try using
the full URL instead of the `aka.ms` redirect:

```bash
curl https://azurecliprod.blob.core.windows.net/install | bash
```

### `az` command not found

After installation if you can't run the command, you may need to clear your shell's command hash cache. Run

```bash
hash -r
```

and see if the problem is resolved.

This can also occur if you did not restart your shell after installation. Make sure that the location of the `az` command is in your `$PATH`.

If you ran the installation script, this will be:

```bash
<install path>/bin
```

## Unstinall manually

If you ever decide to uninstall the Azure CLI, we're sorry to see you go. Before you uninstall, use the `az feedback` command to give us
some reasons why you chose to uninstall and how we could improve the CLI experience. We want to make sure that the Azure
CLI is as bug-free and user-friendly as we can make it. You can also [file a github issue](https://github.com/Azure/azure-cli/issues).

You can uninstall the CLI by directly deleting the files from the install location. Your install location should have been chosen at the
time of install, if you installed via the `https://aka.ms/InstallAzureCLI` script. The default installation location is `$HOME`.

First, remove the installed CLI files:

```bash
rm -r <install location>/lib/azure-cli
rm <install location>/bin/az
```

Then modify your `$HOME/.bash_profile` file to remove the line:

```
<install location>/lib/azure-cli/az.completion
```

And finally, reload your shell's command cache if it uses one. `bash` and `zsh` users will need to perform this step:

```bash
hash -r
```
