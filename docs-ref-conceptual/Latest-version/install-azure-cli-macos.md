---
title: Install Azure CLI on macOS | Microsoft Docs
description: Learn how to install and run the Azure CLI on macOS using the homebrew package manager. The Azure CLI package requires macOS 13 or higher.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: Install azure cli, azure cli macos, macos cli, install azure cli macos
---

# Install Azure CLI on macOS

The Azure Command-Line Interface (CLI) is a cross-platform command-line tool that can be installed
locally on macOS computers. You can use the Azure CLI to connect to Azure and execute administrative
commands on Azure resources using interactive command-line prompts or a script.

For the macOS platform, install the Azure CLI with [homebrew package manager][03]. Homebrew makes it
easy to keep your installation of the Azure CLI up to date. The Azure CLI package requires macOS
13 or higher.

[!INCLUDE [current-version](includes/current-version.md)]

## Install with Homebrew

Homebrew is the easiest way to manage your Azure CLI install. It provides convenient ways to
install, update, and uninstall. If you don't have homebrew available on your system,
[install homebrew][04] before continuing.

You can install the Azure CLI on macOS by updating your brew repository information, and then
running the `install` command:

```bash
brew update && brew install azure-cli
```

## Troubleshooting

If you encounter a problem when installing the Azure CLI through Homebrew, here are some common
errors. If you experience a problem not covered here, [file an issue on GitHub][07].

### Completion isn't working

The Homebrew formula of Azure CLI installs a completion file named `az` in the Homebrew-managed
completions directory (default location is `/usr/local/etc/bash_completion.d/`). To enable
completion, follow Homebrew's instructions [here][06].

For Zsh, add the following two lines to the bottom of your `.zshrc` file, then save and reload your
Zsh profile.

```bash
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az
```

### Unable to find Python or installed packages

There might be a minor version mismatch or other issue during homebrew installation. The Azure CLI
doesn't use a Python virtual environment, so it relies on finding the installed Python version. A
possible fix is to install and relink the `python@3.10` dependency from Homebrew.

```bash
brew update && brew install python@3.10 && brew upgrade python@3.10
brew link --overwrite python@3.10
```

### Azure CLI version 1.x is installed

If an out-of-date version was installed, it could be because of a stale homebrew cache. Follow the
[update][01] instructions.

### Proxy blocks connection

You might be unable to get resources from Homebrew unless you configure it to use your proxy. Follow
the [Homebrew proxy configuration instructions][05].

> [!IMPORTANT]
> If you are behind a proxy, `HTTP_PROXY` and `HTTPS_PROXY` must be set to connect to Azure services
> with the Azure CLI. If you don't use basic auth, you should export these variables in your
> `.bashrc` file. Always follow your business' security policies and the requirements of your system
> administrator.

To get the bottle resources from Homebrew, your proxy needs to allow HTTPS connections to the
following addresses:

- `https://formulae.brew.sh`
- `https://homebrew.bintray.com`

## Update

The Azure CLI is regularly updated with bug fixes, improvements, new features, and preview
functionality. A new release is available about once a month.

[!INCLUDE [az-upgrade](includes/az-upgrade.md)]

You can also update your local Homebrew repository information and then upgrade the `azure-cli`
package.

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

If you don't plan to reinstall the Azure CLI, remove its data.

```bash
rm -rf ~/.azure
```

## Other installation methods

If you can't use homebrew to install the Azure CLI in your environment, it's possible to use the
manual instructions for Linux. This process isn't officially maintained to be compatible with macOS.
Using a package manager such as Homebrew is recommended. Only use the manual installation method if
you have no other option available.

For the manual installation instructions, see [Install Azure CLI on Linux manually][08].

## Next Steps

Now that you installed the Azure CLI on macOS, take a short tour of its features and common
commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI][02]

<!-- link references -->

[01]: #update
[02]: get-started-with-azure-cli.md
[03]: https://brew.sh
[04]: https://docs.brew.sh/Installation.html
[05]: https://docs.brew.sh/Manpage#using-homebrew-behind-a-proxy
[06]: https://docs.brew.sh/Shell-Completion
[07]: https://github.com/Azure/azure-cli/issues
[08]: install-azure-cli-linux.md
