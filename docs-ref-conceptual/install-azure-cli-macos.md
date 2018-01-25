---
title: Install the Azure CLI for macOS
description: How to install the Azure CLI 2.0 on macOS
keywords: Azure CLI,Install Azure CLI,azure macos, azure install macos
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 10/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Install Azure CLI 2.0 on macOS

For the macOS platform, you can install the Azure CLI either through the [homebrew package manager](http://brew.sh) or manually. The preferred installation method is through
homebrew, so that it's easier to install, get updates, and uninstall if you need to.

## Use homebrew to install

Homebrew is the easiest way to manage your CLI install. It provides convenient ways to install, update, and uninstall. It's similar to other package managers such as `apt` or `yum`.
If you don't have homebrew available on your system, [install homebrew](https://docs.brew.sh/Installation.html) before continuing.

### Install with homebrew

You can install the CLI by updating your brew repository information, and then running the `install` command:

```bash
brew update && brew install azure-cli
```

You can then run the Azure CLI with the `az` command.

### Update with homebrew

The CLI is regularly updated with bug fixes, improvements, new features, and preview functionality. A new release is available roughly every
two weeks. You will need to update your local repository information, and then update the CLI package.

```bash
brew update && brew upgrade azure-cli
```

### Troubleshooting

Did you encounter a problem when installing or updating the CLI with homebrew? Here are some common errors that might occur, and ways to diagnose and resolve them.

#### Unable to find Python or installed packages

If your install is unable to find Python or installed packages, there may be a minor version mismatch or other issue which occurred during
homebrew installation. Since the CLI does not use a virtualenv, it relies on being able to find correct versions of Python installed
by homebrew. You may be able to fix these issues by re-linking your Python installation:

```bash
brew link --overwrite python3
```

#### The CLI version is out of date

If you think that your installed CLI version might be out of date, you will need to run a `brew update` command, followed by `brew upgrade azure-cli`. If this does
not update the CLI, be aware that homebrew packages may roll out more slowly than general releases. If you require bleeding-edge installs of the CLI, then you
should [install manually](#manage-the-cli-manually).

### Uninstall with homebrew

If you ever decide to uninstall the Azure CLI, we're sorry to see you go. Before you uninstall, use the `az feedback` command to give us
some reasons why you chose to uninstall and how we could improve the CLI experience. We want to make sure that the Azure
CLI is as bug-free and user-friendly as we can make it. You can also [file a github issue](https://github.com/Azure/azure-cli/issues).

If you installed with homebrew, you should also use it to uninstall.

```bash
brew uninstall azure-cli
```

## Install the CLI manually

If you can't or don't want to rely on homebrew to manage the CLI install for you, then you can manually install.

Follow the [manual Linux installation instructions](install-azure-cli-linux.md) to install manually on macOS. macOS versions 10.9 and later should
include all of the required dependencies.
