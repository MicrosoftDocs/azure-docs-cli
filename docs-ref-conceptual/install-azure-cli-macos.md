---
title: Install the Azure CLI on macOS | Microsoft Docs
description: Learn how to install and run the Azure CLI on macOS using the homebrew package manager. The Azure CLI has been tested on macOS versions 10.9 and later.
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.date: 06/19/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: Install azure cli, azure cli macos, macos cli, install azure cli macos
---

# Install Azure CLI on macOS

The Azure Command-Line Interface (CLI) allows the execution of commands through a terminal using interactive command-line prompts or a script. You can install the Azure CLI locally on macOS computers. The Azure CLI on macOS allows the execution of various commands through a terminal using interactive command-line prompts or a script.

For the macOS platform, you can install the Azure CLI with [homebrew package manager](https://brew.sh). Homebrew makes it easy to keep your
installation of the CLI update to date. The CLI package has been tested on macOS versions 10.9 and later.

[!INCLUDE [current-version](includes/current-version.md)]

## Install with Homebrew

Homebrew is the easiest way to manage your CLI install. It provides convenient ways to install, update, and uninstall.
If you don't have homebrew available on your system, [install homebrew](https://docs.brew.sh/Installation.html) before continuing.

You can install the Azure CLI on macOS by updating your brew repository information, and then running the `install` command:

```bash
brew update && brew install azure-cli
```

## Troubleshooting

If you encounter a problem when installing the CLI through Homebrew, here are some common errors. If you experience a problem not covered here, [file an issue on GitHub](https://github.com/Azure/azure-cli/issues).

### Completion isn't working

The Homebrew formula of Azure CLI installs a completion file named `az` in the Homebrew-managed completions directory (default location is `/usr/local/etc/bash_completion.d/`). To enable completion, follow Homebrew's instructions [here](https://docs.brew.sh/Shell-Completion).

For Zsh, add the following two lines to the bottom of your `.zshrc` file, then save and reload your Zsh profile.

```
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az
```

### Unable to find Python or installed packages

There may be a minor version mismatch or other issue during homebrew installation. The CLI doesn't use a Python virtual environment, so it relies on finding
the installed Python version. A possible fix is to install and relink the `python@3.10` dependency from Homebrew.

```bash
brew update && brew install python@3.10 && brew upgrade python@3.10
brew link --overwrite python@3.10
```

### CLI version 1.x is installed

If an out-of-date version was installed, it could be because of a stale homebrew cache. Follow the [update](#update) instructions.

### Proxy blocks connection

You may be unable to get resources from Homebrew unless you have correctly configured it to
use your proxy. Follow the [Homebrew proxy configuration instructions](https://docs.brew.sh/Manpage#using-homebrew-behind-a-proxy).

> [!IMPORTANT]
> If you are behind a proxy, `HTTP_PROXY` and `HTTPS_PROXY` must be set to connect to Azure services with the CLI.
> If you are not using basic auth, it's recommended to export these variables in your `.bashrc` file.
> Always follow your business' security policies and the requirements of your system administrator.

In order to get the bottle resources from Homebrew, your proxy needs to allow HTTPS connections to
the following addresses:

* `https://formulae.brew.sh`
* `https://homebrew.bintray.com`

## Update

The CLI is regularly updated with bug fixes, improvements, new features, and preview functionality. A new release is available roughly every
three weeks.

[!INCLUDE [az-upgrade](includes/az-upgrade.md)]

You can also update your local Homebrew repository information and then upgrade the `azure-cli` package.

```bash
brew update && brew upgrade azure-cli
```

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

Use homebrew to uninstall the `azure-cli` package.

```bash
brew uninstall azure-cli
```

## Remove data

If you don't plan to reinstall Azure CLI, remove its data.

```bash
rm -rf ~/.azure
```

## Other installation methods

If you can't use homebrew to install the Azure CLI in your environment, it's possible to use the manual instructions for Linux. This process isn't officially maintained to be compatible with macOS. Using a package manager such as Homebrew is always recommended. Only use the manual
installation method if you have no other option available.

For the manual installation instructions, see [Install Azure CLI on Linux manually](install-azure-cli-linux.md).

## Next Steps

Now that you've installed the Azure CLI on macOS, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)
