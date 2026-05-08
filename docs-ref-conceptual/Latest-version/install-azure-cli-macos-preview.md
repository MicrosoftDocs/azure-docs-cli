---
title: Install Azure CLI on macOS - Preview | Microsoft Docs
description: Learn how to install Azure CLI on macOS using the Homebrew package manager or a Tarball. Includes offline setup, upgrade, uninstall, and migration guidance.
ms.service: azure-cli
ms.custom: devx-track-azurecli
zone_pivot_group_filename: azure/zone-pivot-groups.json
zone_pivot_groups: cli-macos-installation-method
keywords: Install azure cli, azure cli macos, macos cli, install azure cli macos
---

# Install Azure CLI on macOS - Preview

Azure CLI is a cross-platform command-line tool for managing Azure resources interactively or
through scripts.

On macOS, Azure CLI is transitioning away from the Homebrew Core formula to a more maintainable and
flexible installation model. The new model includes:

- Homebrew Cask (recommended for most users)
- Tarball (recommended for offline or air-gapped environments)

This experience is currently in preview and will become the standard installation approach in a
future release.

Why use Homebrew Cask?

- Simplest install and upgrade experience
- Automatically manages dependencies
- Aligns with the future supported installation model

## What is changing

Azure CLI is evolving to support more secure authentication, including broker-based authentication.
These capabilities require a cask-based installation model. As a result, we're transitioning from
Homebrew Core to Homebrew Cask. This change doesn't remove or limit any existing Azure CLI
functionality. Homebrew Cask is fully compatible with all current Azure CLI features and versions.

This change improves consistency across environments and provides better support for scenarios such
as offline installation and controlled deployment environments.

> [!IMPORTANT]
> Azure CLI is currently in a preview phase for the Homebrew Cask installation model. During this
> phase, installation is available only through a custom Homebrew tap.

- Current method: `brew install azure-cli`
- New methods (preview phase):
  - Homebrew Cask via custom tap
    1. `brew tap azure/azure-cli`
    1. `brew install --cask azure-cli-preview`
  - Tarball-based installation

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
- [Homebrew][01] installed

If Azure CLI is already installed using the Homebrew formula, uninstall it before proceeding to
avoid conflicts:

```bash
brew uninstall azure-cli
```

### Install Azure CLI

This installs Azure CLI using the Homebrew Cask from the Azure CLI custom tap. This is the only
supported Homebrew installation method during the preview phase.

```bash
brew tap azure/azure-cli
brew install --cask azure-cli-preview
```

### Verify installation

After installation, confirm Azure CLI is available:

```bash
az --version
```

## Upgrade Azure CLI

To upgrade to the latest version:

```bash
brew update && brew upgrade --cask azure-cli-preview
```

## Uninstall Azure CLI

To remove Azure CLI:

```bash
brew uninstall --cask azure-cli-preview
brew untap azure/azure-cli
```

## After the preview phase

When the Homebrew Cask installation becomes generally available:

- The preview installation method (`azure-cli-preview` via custom tap) will be discontinued.
- Azure CLI will be available from the official Homebrew Cask repository.

Install Azure CLI using:

```bash
brew install --cask azure-cli
# Or
brew install azure-cli
```

Existing installations using the Homebrew Core formula must migrate to the Cask-based installation.
The Homebrew Core formula will no longer be supported after this transition.

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
- Python 3.13 installed via any method (python.org, pyenv, etc.)

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

Reload your shell configuration:

```bash
source ~/.zshrc
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
experience a problem not covered here, [file an issue on GitHub][02].

### Azure CLI not found

Ensure your PATH includes the installation directory:

```bash
echo $PATH
```

### Completion isn't working

The Azure CLI Homebrew installation (whether via formula or cask) provides a completion file named
`az` in Homebrew's managed completions directory. To enable completion, follow
[Homebrew's instructions][03].

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
the [Homebrew proxy configuration instructions][04].

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
> [Get started with the Azure CLI][05]

<!-- link references -->

[01]: https://brew.sh/
[02]: https://github.com/Azure/azure-cli/issues
[03]: https://docs.brew.sh/Shell-Completion
[04]: https://docs.brew.sh/Manpage#using-homebrew-behind-a-proxy
[05]: get-started-with-azure-cli.md
