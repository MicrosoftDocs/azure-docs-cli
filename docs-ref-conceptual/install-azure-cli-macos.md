---
title: Install the Azure CLI for macOS
description: How to install the Azure CLI 2.0 on macOS
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/09/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Install Azure CLI 2.0 on macOS

For the macOS platform, you can install the Azure CLI with [homebrew package manager](http://brew.sh). Homebrew makes it easy to keep your
installation of the CLI update to date. The CLI package has been tested on macOS versions 10.9 and later.

## Install

Homebrew is the easiest way to manage your CLI install. It provides convenient ways to install, update, and uninstall.
If you don't have homebrew available on your system, [install homebrew](https://docs.brew.sh/Installation.html) before continuing.

You can install the CLI by updating your brew repository information, and then running the `install` command:

```bash
brew update && brew install azure-cli
```

You can then run the Azure CLI with the `az` command. To sign in, use [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI 2.0](authenticate-azure-cli.md).

## Troubleshooting

If you encounter a problem when installing the CLI through Homebrew, here are some common errors. If you experience a problem not covered here, [file an issue on github](https://github.com/Azure/azure-cli/issues).

### Unable to find Python or installed packages

There may be a minor version mismatch or other issue during homebrew installation. The CLI doesn't use a Python virtual environment, so it relies on finding
the installed Python version. A possible fix is to install and relink the `python3` dependency from Homebrew.

```bash
brew update && brew install python3 && brew upgrade python3
brew link --overwrite python3
```

### CLI version 1.x is installed

If an out-of-date version was installed, it could be because of a stale homebrew cache. Follow the [update](#Update) instructions.

## Update

The CLI is regularly updated with bug fixes, improvements, new features, and preview functionality. A new release is available roughly every
two weeks. Update your local repository information and then upgrade the `azure-cli` package.

```bash
brew update && brew upgrade azure-cli
```

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

Use homebrew to uninstall the `azure-cli` package.

```bash
brew uninstall azure-cli
```
