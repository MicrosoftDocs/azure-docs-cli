---
title: Install the Azure CLI for macOS
description: How to install the Azure CLI 2.0 on macOS
keywords: Azure CLI,Install Azure CLI,azure macos, azure install macos
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 01/29/2018
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Install Azure CLI 2.0 on macOS

For the macOS platform, you can install the Azure CLI either through the [homebrew package manager](http://brew.sh). Homebrew makes it easy to keep your
installation of the CLI update to date. The CLI package has been tested on macOS versions 10.9 and later.

## Install

Homebrew is the easiest way to manage your CLI install. It provides convenient ways to install, update, and uninstall.
If you don't have homebrew available on your system, [install homebrew](https://docs.brew.sh/Installation.html) before continuing.

You can install the CLI by updating your brew repository information, and then running the `install` command:

```bash
brew update && brew install azure-cli
```

You can then run the Azure CLI with the `az` command.

## Troubleshooting

If you encounter a problem when installing the CLI through Homebrew, here are some common errors. If your issue is not listed here, please [file an issue on github](https://github.com/Azure/azure-cli/issues).

### Unable to find Python or installed packages

If your install is unable to find Python or installed packages, there may be a minor version mismatch or other issue that occurred during
homebrew installation. Since the CLI does not use a Python virtual environment, it relies on being able to find correct Python version. You may be able to fix these issues by relinking your Python installation.

```bash
brew link --overwrite python3
```

### CLI version 1.x is installed

If an out-of-date version was installed, it could be due to a stale homebrew cache. Follow the [update](#Update) instructions.

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
