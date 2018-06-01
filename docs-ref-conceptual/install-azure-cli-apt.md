---
title: Install the Azure CLI 2.0 on Linux with apt
description: How to install the Azure CLI 2.0 with the apt package manager
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 05/24/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Install Azure CLI 2.0 with apt

If you are running a distribution that comes with `apt`, such as Ubuntu or Debian, there is a 64-bit package available
for the Azure CLI. This package has been tested with:

* Ubuntu trusty, xenial, and artful
* Debian wheezy, jessie, and stretch

## Install

1. <a name="install-step-1"/> Modify your sources list:

    ```bash
    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
        sudo tee /etc/apt/sources.list.d/azure-cli.list
    ```

2. <a name="signingKey"></a>Get the Microsoft signing key:

   ```bash
   curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
   ```

3. Install the CLI:

   ```bash
   sudo apt-get install apt-transport-https
   sudo apt-get update && sudo apt-get install azure-cli
   ```

   > [!WARNING]
   > The signing key was updated in May 2018, and has been replaced. If you receive
   > signing key errors, please ensure that you have [acquired the latest signing key](#signingKey).

You can then run the Azure CLI with the `az` command. To log in, run the `az login` command.

```azurecli
az login
```

To learn more about different login methods, see [Log in with Azure CLI 2.0](authenticate-azure-cli.md).

## Troubleshooting

Here are some common problems seen when installing with `apt`. If your issue is not listed here, please [file an issue on github](https://github.com/Azure/azure-cli/issues).

### lsb_release fails with "Command not found"

When running the `lsb_release` command, you may see output similar to the following error:

```output
-bash: lsb_release: command not found
```

The error is due to lsb_release not being installed. You can resolve it by installing the `lsb-release` package.

```bash
sudo apt-get install lsb-release
```

### lsb_release does not return the base distribution version

Some Ubuntu- or Debian-derived distributions such as Linux Mint may not return the correct version name from `lsb_release`. This value is used in the install process to
determine the package to install. If you know the name of the version your distribution is derived from, you can set the `AZ_REPO` value manually in
[install step 1](#install-step-1). Otherwise, look up information for your distribution on how to determine the base distribution name and set `AZ_REPO` to the correct value.

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

### apt-key hangs

When behind a firewall blocking outgoing connections to port 11371, the `apt-key` command might hang indefinitely. Your firewall may require the use of an HTTP proxy for outgoing connections:

```bash
sudo apt-key adv --keyserver-options http-proxy=http://<USER>:<PASSWORD>@<PROXY-HOST>:<PROXY-PORT>/ --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
```

If you do not know if you have a proxy, contact your system administrator. If your proxy does not require a login then leave out the user, password, and `@` token.

## Update

Use `apt-get upgrade` to update the CLI package.

   ```bash
   sudo apt-get update && sudo apt-get upgrade
   ```

> [!WARNING]
> The signing key was updated in May 2018, and has been replaced. If you receive
> signing key errors, please ensure that you have [acquired the latest signing key](#signingKey).
   
> [!NOTE]
> This command upgrades all of the installed packages on your system that have not had a dependency change.
> To upgrade the CLI only, use `apt-get install`.
> ```bash
> sudo apt-get update && sudo apt-get install --only-upgrade -y azure-cli
> ```

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

1. Uninstall with `apt-get remove`.

    ```bash
    sudo apt-get remove -y azure-cli
    ```

2. If you do not plan to reinstall the CLI, remove the Azure CLI repository information.

   ```bash
   sudo rm /etc/apt/sources.list.d/azure-cli.list
   ```

3. Remove any unneeded packages.

   ```bash
   sudo apt autoremove
   ```
