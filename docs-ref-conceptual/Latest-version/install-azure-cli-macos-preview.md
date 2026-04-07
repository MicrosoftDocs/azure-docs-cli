---
title: Install Azure CLI on macOS using Homebrew Cask or Tarball preview
description: Install Azure CLI on macOS using Homebrew Cask or Tarball. Includes offline setup, upgrade, uninstall, and migration guidance.
ms.service: azure-cli
ms.custom: devx-track-azurecli
zone_pivot_group_filename: azure/zone-pivot-groups.json
zone_pivot_groups: cli-macos-installation-method
keywords: Install azure cli, azure cli macos, macos cli, install azure cli macos
---

# Install Azure CLI on macOS using Homebrew Cask or Tarball preview

Azure CLI is a cross-platform command-line tool for managing Azure resources interactively or
through scripts.

On macOS, Azure CLI is transitioning to a new installation model that provides greater flexibility
across environments. This model includes:

- Homebrew Cask (recommended for most users)
- Tarball (recommended for offline, restricted, or custom environments)

This experience is currently in preview and will become the standard installation approach in a
future release.

> [!NOTE]
> For the current stable installation guidance, see [Install Azure CLI on macOS][01].

Why use Homebrew Cask?

- Simplest install and upgrade experience
- Automatically manages dependencies
- Aligns with the future supported installation model

## What is changing

Azure CLI installation on macOS is moving away from the Homebrew formula to a more maintainable and
flexible model.

- Current method: `brew install azure-cli`
- New methods:
  - `brew install --cask azure-cli`
  - Tarball-based installation

During the transition period, both installation methods are supported. The Homebrew formula will be
deprecated in our June release.

On macOS, Azure CLI is evolving to support more secure authentication experiences, including
broker-based authentication. These capabilities require a cask-based installation model. As a
result, we're transitioning from Homebrew Core to Homebrew Cask. This change doesn't remove or limit
any existing Azure CLI functionality. Homebrew Cask remains fully compatible with all current Azure
CLI features and versions.

This change improves consistency across environments and provides better support for scenarios such
as offline installation and controlled deployment environments.

## Choose an installation method

Use the following guidance to select the installation method that best fits your scenario:

|             Scenario             | Recommended method |
| -------------------------------- | ------------------ |
| Most users                       | Homebrew Cask      |
| Offline or air-gapped systems    | Tarball            |
| Custom install location required | Tarball            |

::: zone pivot="cask"

## Install Azure CLI using Homebrew Cask

Homebrew provides the simplest and most maintainable installation experience for Azure CLI on macOS.
It handles installation, upgrades, and removal using standard package management workflows.

### Prerequisites

- macOS (Apple Silicon or Intel)
- [Homebrew][02] installed

If Azure CLI is already installed using the Homebrew `brew install azure-cli` formula, uninstall it
before proceeding to avoid conflicts:

```bash
brew uninstall azure-cli
```

### Install Azure CLI

```bash
brew update && brew install --cask azure-cli
```

This installs Azure CLI using the Homebrew Cask, which is the preferred installation method going
forward.

### Verify installation

After installation, confirm Azure CLI is available:

```bash
az --version
```

## Upgrade Azure CLI

To upgrade to the latest version:

```bash
brew upgrade --cask azure-cli
```

## Uninstall Azure CLI

To remove Azure CLI:

```bash
brew uninstall --cask azure-cli
```

::: zone-end

::: zone pivot="tarball"

## Install Azure CLI using a Tarball

Use this method if:

- Homebrew isn't available
- Internet access is restricted
- You need full control over the installation location

This method is commonly used in enterprise, regulated, or air-gapped environments.

### Prerequisites

- macOS (Apple Silicon or Intel)
- Python 3.13 installed using your preferred method (for example, `python.org` or `pyenv`)

### Download the tarball

On a machine with internet access, you can automatically download the latest Azure CLI tarball for
your architecture:

```bash
ARCH=$(uname -m)
VER=$(curl -s https://api.github.com/repos/Azure/azure-cli/releases/latest | grep tag_name | cut -d '"' -f4 | sed 's/azure-cli-//')
curl -L -o az.tar.gz "https://github.com/Azure/azure-cli/releases/download/azure-cli-$VER/azure-cli-$VER-macos-$ARCH.tar.gz"
```

This script detects your architecture and downloads the latest Azure CLI tarball from the Azure CLI
releases page.

- `arm64` indicates Apple Silicon
- `x86_64` indicates Intel

Selecting the correct architecture ensures compatibility and optimal performance.

> [!TIP]
> For offline environments, run this command on a machine with internet access, then transfer the
> downloaded tarball to the target system.

### Extract to installation directory

Choose a directory where Azure CLI should be installed:

  ```bash
  mkdir -p $HOME/lib/azure-cli
  tar -xzf az.tar.gz -C $HOME/lib/azure-cli
  ```

### Configure environment variables

Azure CLI requires access to a Python runtime. Configure your environment to point to Python and the
Azure CLI binaries.

Add the following to your shell profile (`~/.zshrc` or `~/.bashrc`):

```bash
export AZ_PYTHON="/path_to_python"
export PATH="/target_directory_path/bin:$PATH"
```

Reload the shell configuration file you updated:

```

### Verify installation

```bash
az --version
```

## Upgrade Azure CLI

To upgrade Azure CLI in an offline environment, download a newer Tarball and extract it over the
existing installation:

```bash
sudo tar -xzf az.tar.gz -C /target_directory_path
```

## Uninstall Azure CLI

Remove the installation directory:

```bash
sudo rm -rf /target_directory_path
```

Then remove the `AZ_PYTHON` and `PATH` entries from your shell profile.

::: zone-end

## Troubleshooting

If you encounter a problem when installing or using the Azure CLI with either Homebrew Cask or the
Tarball method, here are some common errors (many of which are specific to Homebrew). If you
experience a problem not covered here, [file an issue on GitHub][03].

### Azure CLI not found

Ensure your PATH includes the installation directory:

```bash
echo $PATH
```

### Completion isn't working

The Azure CLI Homebrew installation (whether via formula or cask) provides a completion file named
`az` in Homebrew's managed completions directory. To enable completion, follow
[Homebrew's instructions][04].

For Zsh, add the following two lines to the bottom of your `.zshrc` file, then save and reload your
Zsh profile.

```bash
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az
```

### Unable to find Python or installed packages

There might be a minor version mismatch or other issue during homebrew installation. Azure CLI
doesn't use a Python virtual environment, so it relies on finding the installed Python version. A
possible fix is to install and relink the `python@3.13` dependency from Homebrew.

```bash
brew update && brew install python@3.13 && brew upgrade python@3.13
brew link --overwrite python@3.13
```

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

## Next Steps

Now that you installed the Azure CLI on macOS, take a short tour of its features and common
commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI][06]

<!-- link references -->

[01]: install-azure-cli-macos.md
[02]: https://brew.sh/
[03]: https://github.com/Azure/azure-cli/issues
[04]: https://docs.brew.sh/Shell-Completion
[05]: https://docs.brew.sh/Manpage#using-homebrew-behind-a-proxy
[06]: get-started-with-azure-cli.md
