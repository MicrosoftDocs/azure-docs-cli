---
ms.topic: include
ms.custom: devx-track-azurecli, linux-related-content
---

## Before you begin

- The `apt` package manager contains x86_64 and ARM64 packages for the Azure CLI that has been
  tested on the following distributions.

    | Distribution | Version                                                                |
    |:-------------|:-----------------------------------------------------------------------|
    | Debian       | 11 (Bullseye), 12 (Bookworm)                                           |
    | Ubuntu       | 22.04 (Jammy Jellyfish), 24.04 (Noble Numbat) |

## Install Azure CLI

There are two options to install the Azure CLI on your system. You can download an install script
that runs the install commands for you, or you can execute the install commands yourself in a
step-by-step process. Both methods are provided here:

### Option 1: Install with one command

The easiest way to install the Azure CLI is through a script maintained by the Azure CLI team. This
script runs all installation commands in one step. This script is downloaded via `curl` and piped
directly to `bash` to install the CLI.

If you wish to inspect the contents of the script yourself before executing, download the script
first using `curl` and inspect it in your favorite text editor.

```bash
curl -fsSL 'https://azurecliprod.blob.core.windows.net/$root/deb_install.sh' | sudo bash
```

### Option 2: Step-by-step installation instructions

If you prefer a step-by-step installation process, complete the following steps to install the Azure
CLI.

1. Get packages needed for the installation process:

    ```bash
    sudo apt-get update
    sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
    ```

1. Download and install the Microsoft signing key:

    ```bash
    sudo mkdir -p /etc/apt/keyrings
    curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
      gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
    sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
    ```

1. <div id="set-release"/>Add the Azure CLI software repository:

    ```bash
    AZ_DIST=$(lsb_release -cs)
    echo "Types: deb
    URIs: https://packages.microsoft.com/repos/azure-cli/
    Suites: ${AZ_DIST}
    Components: main
    Architectures: $(dpkg --print-architecture)
    Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources
    ```

1. Update repository information and install the `azure-cli` package:

    ```bash
    sudo apt-get update
    sudo apt-get install azure-cli
    ```

## Install specific version

Configure the `azure-cli` repository information as shown previously. Available versions can be
found at [Azure CLI release notes][01].

1. View available versions of the Azure CLI.

    ```bash
    apt-cache policy azure-cli
    ```

1. Install a specific version.

    ```bash
    # Obtain the currently installed distribution
    AZ_DIST=$(lsb_release -cs)

    # Store an Azure CLI version of choice
    AZ_VER=2.51.0

    # Install a specific version
    sudo apt-get install azure-cli=${AZ_VER}-1~${AZ_DIST}
    ```

    To install a specific version without variables, replace the Azure CLI version and Linux
    distribution name shown:

    ```bash
    sudo apt-get install azure-cli=2.51.0-1~bullseye
    ```

If you receive error message _Unable to locate package azure-cli_, the `azure-cli` repository
information is not configured. Follow the steps given in
[Option 2: Step-by-step installation instructions][03].

If you receive error message _Version x.xx.x-1~distributionName for azure-cli was not found_, use
`lsb_release -cs` to find the distribution you're running.

## Update Azure CLI

[!INCLUDE [az-upgrade](az-upgrade.md)]

You can also use `apt-get upgrade` to update the CLI package. This command upgrades all of the
installed packages on your system that haven't had a dependency change.

   ```bash
   sudo apt-get update && sudo apt-get upgrade
   ```

 To upgrade the CLI only, use `apt-get install`.

   ```bash
   sudo apt-get update && sudo apt-get install --only-upgrade -y azure-cli
   ```

## Uninstall Azure CLI

[!INCLUDE [uninstall-boilerplate.md](uninstall-boilerplate.md)]

1. Uninstall with `apt-get remove`:

    ```bash
    sudo apt-get remove -y azure-cli
    ```

1. If you don't plan to reinstall the CLI, remove the Azure CLI repository information:

   ```bash
   sudo rm /etc/apt/sources.list.d/azure-cli.sources
   ```

1. If you aren't using other packages from Microsoft, remove the signing key:

    ```bash
    sudo rm /etc/apt/keyrings/microsoft.gpg
    ```

1. Remove any unneeded packages:

   ```bash
   sudo apt autoremove
   ```

### Remove data

[!INCLUDE [remove-data-boilerplate.md](remove-data-boilerplate.md)]

## Troubleshooting

Here are some common problems seen when installing with `apt`. If you experience a problem not
covered here, [file an issue on GitHub][05].

The `azure-cli` package supports ARM64 architecture from CLI version [2.46.0][02].

### lsb_release doesn't return the correct base distribution version

Some Ubuntu or other Debian-derived distributions (such as Linux Mint) may not return the correct
version name from `lsb_release`. This value is used in the install process to determine the package
to install. If you know the code name of the Ubuntu or Debian version that your distribution is
derived from, you can set the `AZ_REPO` value manually when [adding the repository][04]. Otherwise,
look up information for your distribution on how to determine the base distribution code name and
set `AZ_REPO` to the correct value.

### No package for your distribution

Sometimes, an updated Azure CLI package isn't immediately available following a distribution version
release. The Azure CLI is designed to be resilient to future versions of dependencies and relies on
as few of them as possible. If there's no package available for your base distribution, try a
package for an earlier distribution.

To try a package for an earlier distribution, set the value of `AZ_REPO` manually when
[adding the repository][04]. For Ubuntu distributions, use the latest `jammy` repository:

```bash
AZ_REPO="jammy"
```

For Debian distributions, use the latest `bookworm` repository:

```bash
AZ_REPO="bookworm"
```

> [!IMPORTANT]
>
> Distributions released before Ubuntu Bionic and Debian Buster are not supported.

### Elementary OS (EOS) fails to install the Azure CLI

EOS fails to install the Azure CLI because `lsb_release` returns `HERA`, which is the EOS release
name. The solution is to fix the file `/etc/apt/sources.list.d/azure-cli.sources` and change
`Suites: hera` to `Suites: bionic`.

Original file contents:

```
Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: hera
Components: main
Architectures: amd64
Signed-by: /etc/apt/keyrings/microsoft.gpg
```

Modified file contents

```
Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: bionic
Components: main
Architectures: amd64
Signed-by: /etc/apt/keyrings/microsoft.gpg
```

### Proxy blocks connection

[!INCLUDE[configure-proxy](configure-proxy.md)]

You may also want to explicitly configure `apt` to always use this proxy. Make sure that the
following lines appear in an `apt` configuration file in `/etc/apt/apt.conf.d/`. We recommend using
either your existing global configuration file, an existing proxy configuration file, `40proxies`,
or `99local`, but follow your system administration requirements.

```apt.conf
Acquire {
    http::proxy "http://[username]:[password]@[proxy]:[port]";
    https::proxy "https://[username]:[password]@[proxy]:[port]";
}
```

If your proxy doesn't use basic auth, __remove__ the `[username]:[password]@` portion of the proxy
URI. If you require more information for proxy configuration, see the official Ubuntu documentation:

- [apt.conf man page][07]
- [Ubuntu wiki - apt-get howto][06]

In order to get the Microsoft signing key and get the package from our repository, your proxy needs
to allow HTTPS connections to the following address: `https://packages.microsoft.com.

[!INCLUDE[troubleshoot-wsl.md](troubleshoot-wsl.md)]

<!-- link references -->

[01]: ../release-notes-azure-cli.md
[02]: /cli/azure/release-notes-azure-cli#march-07-2023
[03]: #option-2-step-by-step-installation-instructions
[04]: #set-release
[05]: https://github.com/Azure/azure-cli/issues
[06]: https://help.ubuntu.com/community/AptGet/Howto#Setting_up_apt-get_to_use_a_http-proxy
[07]: https://manpages.ubuntu.com/manpages/lunar/en/man5/apt.conf.5.html
