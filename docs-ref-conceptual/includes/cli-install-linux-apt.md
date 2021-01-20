---
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 09/29/2020
ms.topic: include
ms.custom: devx-track-azurecli
---

## Overview

The `apt` package manager contains an x86_64 package for the Azure CLI that has been tested on the following distributions.

| Distribution | Version |
|:-------------|:--------|
| Ubuntu       | 14.04 LTS (Trusty Tahir), 16.04 LTS (Xenial Xerus), 18.04 LTS (Bionic Beaver), 20.04 LTS (Focal Fossa), 20.10 (Groovy Gorilla) |
| Debian       | Debian 8 (Jessie), Debian 9 (Stretch), Debian 10 (Buster) |

> [!WARNING]
> Ubuntu 20.04 (Focal Fossa) and 20.10 (Groovy Gorilla) include an `azure-cli` package with version `2.0.81` provided by the `universe` repository. This package is outdated and not recommended. If this package is installed, remove the package before continuing by running the command `sudo apt remove azure-cli -y && sudo apt autoremove -y`.

## Installation Options

There are two options to install the Azure CLI on your system.  First, you may execute a single command that will download an install script and run the install commands for you.  Or if you prefer, you can execute the install commands yourself in a step-by-step process.  Both methods are provided below.

## Option 1: Install with one command

The Azure CLI team maintains a script to run all installation commands in one step.  This script is downloaded via `curl` and piped directly to `bash` to install the CLI.

If you wish to inspect the contents of the script yourself before executing, simply download the script first using `curl` and inspect it in your favorite text editor.

```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

## Option 2: Step-by-step installation instructions

If you prefer a step-by-step installation process, complete the following steps to install the Azure CLI.

1. Get packages needed for the install process:

    ```bash
    sudo apt-get update
    sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
    ```

2. Download and install the Microsoft signing key:

    ```bash
    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
        gpg --dearmor |
        sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
    ```

3. <div id="set-release"/>Add the Azure CLI software repository (skip this step on ARM64 Linux distributions):

    ```bash
    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
        sudo tee /etc/apt/sources.list.d/azure-cli.list
    ```

4. Update repository information and install the `azure-cli` package:

    ```bash
    sudo apt-get update
    sudo apt-get install azure-cli
    ```

## Sign in to Azure with the Azure CLI

Run the Azure CLI with the `az` command. To sign in, use the [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI](../authenticate-azure-cli.md).

## Troubleshooting

Here are some common problems seen when installing with `apt`. If you experience a problem not covered here, [file an issue on github](https://github.com/Azure/azure-cli/issues).

### No module issue on Ubuntu 20.04 (Focal)/WSL

If you installed `azure-cli` on `Focal` without adding the Azure CLI software repository in [step 3](#set-release) of the manual install instructions or using our [script](#option-1-install-with-one-command), you may encounter issues such as no module named 'decorator' or 'antlr4' as the package you installed is the outdated `azure-cli 2.0.81` from the `focal/universe` repository. Please remove it first by running `sudo apt remove azure-cli -y && sudo apt autoremove -y`, then follow the above [instructions](#install) to install the latest `azure-cli` package.

### lsb_release does not return the correct base distribution version

Some Ubuntu- or Debian-derived distributions such as Linux Mint may not return the correct version name from `lsb_release`. This value is used in the install process to
determine the package to install. If you know the code name of the Ubuntu or Debian version your distribution is derived from, you can set the `AZ_REPO` value manually when
[adding the repository](#set-release). Otherwise, look up information for your distribution on how to determine the base distribution code name and set `AZ_REPO` to the correct value.

### No package for your distribution

Sometimes it may be a while after a distribution is released before there's an Azure CLI package available for it. The Azure CLI designed to be resilient with regards to future
versions of dependencies and rely on as few of them as possible. If there's no package available for your base distribution, try a package for an earlier distribution.

To do this, set the value of `AZ_REPO` manually when [adding the repository](#set-release). For Ubuntu distributions use the `bionic` repository, and for Debian distributions
use `stretch`. Distributions released before Ubuntu Trusty and Debian Wheezy are not supported.

### Elementary OS (EOS) fails to install the Azure CLI

EOS fails to install the Azure cli because `lsb_release` returns `HERA`, which is the EOS release name.  The solution is to fix the file `/etc/apt/sources.list.d/azure-cli.list` and change `hera main` to `bionic main`.

Original file contents:

```
deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ hera main
```

Modified file contents

```
deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ bionic main
```

### Proxy blocks connection

[!INCLUDE[configure-proxy](configure-proxy.md)]

You may also want to explicitly configure `apt` to use this proxy at all times. Make sure that the
following lines appear in an `apt` configuration file in `/etc/apt/apt.conf.d/`. We recommend using
either your existing global configuration file, an existing proxy configuration file, `40proxies`,
or `99local`, but follow your system administration requirements.

```apt.conf
Acquire {
    http::proxy "http://[username]:[password]@[proxy]:[port]";
    https::proxy "https://[username]:[password]@[proxy]:[port]";
}
```

If your proxy does not use basic auth, __remove__ the `[username]:[password]@` portion of the proxy URI. If you require more information for proxy configuration, see the official Ubuntu documentation:

* [apt.conf manpage](http://manpages.ubuntu.com/manpages/bionic/en/man5/apt.conf.5.html)
* [Ubuntu wiki - apt-get howto](https://help.ubuntu.com/community/AptGet/Howto#Setting_up_apt-get_to_use_a_http-proxy)

In order to get the Microsoft signing key and get the package from our repository, your proxy needs to
allow HTTPS connections to the following address:

* `https://packages.microsoft.com`

[!INCLUDE[troubleshoot-wsl.md](troubleshoot-wsl.md)]

## Update
[!INCLUDE [az-upgrade](az-upgrade.md)]

You can also use `apt-get upgrade` to update the CLI package.

   ```bash
   sudo apt-get update && sudo apt-get upgrade
   ```

> [!NOTE]
> This command upgrades all of the installed packages on your system that have not had a dependency change.
> To upgrade the CLI only, use `apt-get install`.
>
> ```bash
> sudo apt-get update && sudo apt-get install --only-upgrade -y azure-cli
> ```

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](uninstall-boilerplate.md)]

1. Uninstall with `apt-get remove`:

    ```bash
    sudo apt-get remove -y azure-cli
    ```

2. If you don't plan to reinstall the CLI, remove the Azure CLI repository information:

   ```bash
   sudo rm /etc/apt/sources.list.d/azure-cli.list
   ```

3. If you use no other packages from Microsoft, remove the signing key:

    ```bash
    sudo rm /etc/apt/trusted.gpg.d/microsoft.gpg
    ```

4. Remove any unneeded packages:

   ```bash
   sudo apt autoremove
   ```
