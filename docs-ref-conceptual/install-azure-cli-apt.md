---
title: Install the Azure CLI on Linux with apt
description: How to install the Azure CLI with the apt package manager
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 03/19/2019
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
---

# Install Azure CLI with apt

If you are running a distribution that comes with `apt`, such as Ubuntu or Debian, there's an x86_64 package available
for the Azure CLI. This package has been tested with:

* Ubuntu trusty, xenial, artful, and bionic
* Debian wheezy, jessie, and stretch

[!INCLUDE [current-version](includes/current-version.md)]

> [!NOTE]
>
> The package for Azure CLI installs its own Python interpreter, and does not use the
> system Python.

## Install

We offer two ways to install the Azure CLI with distributions that support `apt`: As an all-in-one script that
runs the install commands for you, and instructions that you can run as a step-by-step process on your own.

### Install with one command

We offer and maintain a script which runs all of the installation commands in one step. Run it by using `curl` and pipe directly to `bash`, or download the script to a file and inspect it before running.

> [!IMPORTANT]
> This script is only verified for Ubuntu 16.04+ and Debian 8+. It may not work on other distributions.
> If you're using a derived distribution such as Mint, follow the manual install instructions and perform
> any necessary troubleshooting.

```bash
sudo curl -L https://aka.ms/InstallAzCLIDeb | bash
```

### Manual install instructions

If you don't want to run a script as superuser, follow these manual steps to install the Azure CLI.

1. Get packages needed for the install process:

    ```bash
    sudo apt-get update
    sudo apt-get install curl apt-transport-https lsb-release gnupg
    ```

2. Download and install the Microsoft signing key:

    ```bash
    curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
        gpg --dearmor | \
        sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
    ```

3. <div id="set-release"/>Add the Azure CLI software repository:

    ```bash
    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
        sudo tee /etc/apt/sources.list.d/azure-cli.list
    ```

4. Update repository information and install the `azure-cli` package:

    ```bash
    sudo apt-get update
    sudo apt-get install azure-cli
    ```

Run the Azure CLI with the `az` command. To sign in, use the [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI](authenticate-azure-cli.md).

## Troubleshooting

Here are some common problems seen when installing with `apt`. If you experience a problem not covered here, [file an issue on github](https://github.com/Azure/azure-cli/issues).

### lsb_release does not return the correct base distribution version

Some Ubuntu- or Debian-derived distributions such as Linux Mint may not return the correct version name from `lsb_release`. This value is used in the install process to
determine the package to install. If you know the code name of the Ubuntu or Debian version your distribution is derived from, you can set the `AZ_REPO` value manually when 
[adding the repository](#set-release). Otherwise, look up information for your distribution on how to determine the base distribution code name and set `AZ_REPO` to the correct value.

### No package for your distribution

Sometimes it may be a while after a distribution is released before there's an Azure CLI package available for it. The Azure CLI designed to be resilient with regards to future versions of dependencies and rely on as few of them as possible. If there's no package available for your base distribution, try a package for an earlier distribution.

To do this, set the value of `AZ_REPO` manually when [adding the repository](#set-release). For Ubuntu distributions use the `bionic` repository, and for Debian distributions use `stretch`. Distributions released before Ubuntu Trusty and Debian Wheezy are not supported.

[!INCLUDE[troubleshoot-wsl.md](includes/troubleshoot-wsl.md)]

## Update

Use `apt-get upgrade` to update the CLI package.

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

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

1. Uninstall with `apt-get remove`:

    ```bash
    sudo apt-get remove -y azure-cli
    ```

2. If you don't plan to reinstall the CLI, remove the Azure CLI repository information:

   ```bash
   sudo rm /etc/apt/sources.list.d/azure-cli.list
   ```

3. Remove the signing key:

    ```bash
    sudo rm /etc/apt/trusted.gpg.d/microsoft.asc.gpg
    ```

4. Remove any unneeded packages:

   ```bash
   sudo apt autoremove
   ```

## Next Steps

Now that you've installed the Azure CLI, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)
