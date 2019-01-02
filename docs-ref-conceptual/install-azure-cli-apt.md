---
title: Install the Azure CLI on Linux with apt
description: How to install the Azure CLI with the apt package manager
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 11/27/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
---

# Install Azure CLI with apt

If you are running a distribution that comes with `apt`, such as Ubuntu or Debian, there's a 64-bit package available
for the Azure CLI. This package has been tested with:

* Ubuntu trusty, xenial, artful, and bionic
* Debian wheezy, jessie, and stretch

## Install

1. Install prerequisite packages:

    ```bash
    sudo apt-get install apt-transport-https lsb-release software-properties-common dirmngr -y
    ```

2. <div id="set-release"/>Modify your sources list:

    ```bash
    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
        sudo tee /etc/apt/sources.list.d/azure-cli.list
    ```

3. <div id="signingKey"/>Get the Microsoft signing key:

   ```bash
   sudo apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
        --keyserver packages.microsoft.com \
        --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF
   ```

4. Install the CLI:

   ```bash
   sudo apt-get update
   sudo apt-get install azure-cli
   ```

   > [!WARNING]
   > The signing key was updated in May 2018, and has been replaced. If you receive
   > signing errors, make sure you have [the latest signing key](#signingKey).

You can then run the Azure CLI with the `az` command. To sign in, use [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI](authenticate-azure-cli.md).

## Troubleshooting

Here are some common problems seen when installing with `apt`. If you experience a problem not covered here, [file an issue on github](https://github.com/Azure/azure-cli/issues).

### lsb_release does not return the correct base distribution version

Some Ubuntu- or Debian-derived distributions such as Linux Mint may not return the correct version name from `lsb_release`. This value is used in the install process to
determine the package to install. If you know the name of the version your distribution is derived from, you can set the `AZ_REPO` value manually in
[install step 2](#set-release). Otherwise, look up information for your distribution on how to determine the base distribution name and set `AZ_REPO` to the correct value.

### No package for your distribution

Sometimes it may be a while after an Ubuntu distribution is released before there's an Azure CLI package made available for it. The Azure CLI designed to be resilient with regards to future versions of dependencies and rely on as few of them as possible. If there's no package available for your base distribution, try a package for an earlier distribution.

To do this, set the value of `AZ_REPO` manually in [install step 1](#install-step-1). For Ubuntu distributions use the `bionic` repository, and for Debian distributions use `stretch`. Distributions released before Ubuntu Trusty and Debian Wheezy are not supported.

### apt-key fails with "No dirmngr"

When running the `apt-key` command, you may see output similar to the following error:

```output
gpg: failed to start the dirmngr '/usr/bin/dirmngr': No such file or directory
gpg: connecting dirmngr at '/tmp/apt-key-gpghome.kt5zo27tp1/S.dirmngr' failed: No such file or directory
gpg: keyserver receive failed: No dirmngr
```

The error is due to a missing component required by `apt-key`. You can resolve it by installing the `dirmngr` package.

```bash
sudo apt-get install dirmngr
```

If you are on Windows Subsystem for Linux (WSL), this error also appears on versions of Windows prior to Windows 10 1809. To resolve the issue,
update your version of Windows.

### apt-key hangs

When behind a firewall blocking outgoing connections to port 11371, the `apt-key` command might hang indefinitely.
Your firewall may require an HTTP proxy for outgoing connections:

```bash
sudo apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
    --keyserver-options http-proxy=http://<USER>:<PASSWORD>@<PROXY-HOST>:<PROXY-PORT>/ \
    --keyserver packages.microsoft.com \
    --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF
```

To determine if you have a proxy, contact your system administrator. If your proxy does not require a login, then leave out the user and password information.

[!INCLUDE[troubleshoot-wsl.md](includes/troubleshoot-wsl.md)]

## Update

Use `apt-get upgrade` to update the CLI package.

   ```bash
   sudo apt-get update && sudo apt-get upgrade
   ```

> [!WARNING]
> The signing key was updated in May 2018, and has been replaced. If you receive
> signing errors, make sure you have [the latest signing key](#signingKey).
>
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
    sudo rm /etc/apt/trusted.gpg.d/Microsoft.gpg
    ```

4. Remove any unneeded packages:

   ```bash
   sudo apt autoremove
   ```

## Next Steps

Now that you've installed the Azure CLI, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)
