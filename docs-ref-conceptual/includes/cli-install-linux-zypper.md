---
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 11/24/2020
ms.topic: include
ms.service: azure-cli
ms.devlang: azurecli 
ms.custom: devx-track-azurecli
---

## Overview

For Linux distributions with `zypper`, such as openSUSE or SLES, there's a package available
for the Azure CLI. This package has been tested with openSUSE Leap 15.1, and SLES 15.

[!INCLUDE [current-version](current-version.md)]

[!INCLUDE [rpm-warning](rpm-warning.md)]

## Install

1. Install `curl`:

   ```bash
   sudo zypper install -y curl
   ```

2. Import the Microsoft repository key:

   ```bash
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   ```

3. Create local `azure-cli` repository information:

   ```bash
   sudo zypper addrepo --name 'Azure CLI' --check https://packages.microsoft.com/yumrepos/azure-cli azure-cli
   ```

4. Update the `zypper` package index and install:

   ```bash
   sudo zypper install --from azure-cli azure-cli
   ```

   Input 2 to continue install by ignoring some of its dependencies.

You can then run the Azure CLI with the `az` command. To sign in, use [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI](../authenticate-azure-cli.md).

## Troubleshooting

Here are some common problems seen when installing with `zypper`. If you experience a problem not covered here, [file an issue on GitHub](https://github.com/Azure/azure-cli/issues).

### NotImplementedError on OpenSUSE 15 VM
The OpenSUSE 15 VM has a pre-installed Azure CLI with version `2.0.45`, it's outdated and has issues with `az login`. Please remove it along with its dependencies before following the [Install](#install) instruction to add the latest Azure CLI:

```bash
sudo zypper rm -y --clean-deps azure-cli
```

If you updated Azure CLI without removing the dependencies of version `2.0.45`, its old dependencies may affect the latest version of Azure CLI. You need to add back the old version to link to its dependencies and then remove `azure-cli` along with its dependencies:

```bash
# The package name may vary on different system version, run 'zypper --no-refresh info azure-cli' to check the source package format
sudo zypper install --oldpackage azure-cli-2.0.45-4.22.noarch

sudo zypper rm -y --clean-deps azure-cli
```

### Install on SLES 12 or other systems without Python 3.6

On SLES 12, the default `python3` package is `3.4` and not supported by Azure CLI. You can first follow step 1-3 of the [install instruction](#install) to add the `azure-cli` repository. Then build a higher version `python3` from source. Finally, you can download the Azure CLI package and install it without dependency.

You can use the following one command to install Azure CLI (be aware that your existing Python 3 version will be overridden by Python 3.6):

```bash
curl -sL https://azurecliprod.blob.core.windows.net/sles12_install.sh | sudo bash
```

Or you can do it step by step:

```bash
# !Please add azure-cli repository first following step 1-3 of the install instruction before running below commands
$ sudo zypper refresh
$ sudo zypper install -y gcc gcc-c++ make ncurses patch wget tar zlib-devel zlib openssl-devel
# Download Python source code
$ PYTHON_VERSION="3.6.9"
$ PYTHON_SRC_DIR=$(mktemp -d)
$ wget -qO- https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz | tar -xz -C "$PYTHON_SRC_DIR"
# Build Python
# Please be aware that with --prefix=/usr, the command will override the existing Python 3 version
$ $PYTHON_SRC_DIR/*/configure --prefix=/usr
$ make
$ sudo make install
# Download azure-cli package 
$ AZ_VERSION=$(zypper --no-refresh info azure-cli |grep Version | awk -F': ' '{print $2}' | awk '{$1=$1;print}')
$ wget https://packages.microsoft.com/yumrepos/azure-cli/azure-cli-$AZ_VERSION.x86_64.rpm
# Install without dependency
$ sudo rpm -ivh --nodeps azure-cli-$AZ_VERSION.x86_64.rpm
```

### Proxy blocks connection

[!INCLUDE[configure-proxy](configure-proxy.md)]

You may also want to explicitly configure `zypper` (via `yast2`) to use this proxy at all times. To do so,
run the `yast2 proxy` command as superuser, and fill in the information presented in the form. If you have a window
manager available on your system, you can also use the `Network Services > Proxy` pane in the `YaST Control Center`.

For advanced configuration or more information, see the
[OpenSUSE Proxy configuration documentation](https://www.suse.com/documentation/slms1/book_slms/data/sec_wy_config_updates_proxy.html)

In order to get the Microsoft signing key and get the package from our repository, your proxy needs to
allow HTTPS connections to the following addresses:

* `https://packages.microsoft.com`
* `https://download.opensuse.org`

[!INCLUDE[troubleshoot-wsl.md](troubleshoot-wsl.md)]

### SSL certificate problem

When a certificate is broken or outdated on a machine, you may receive an error indicating that curl failed to verify the legitimacy of the server and therefore could not establish a secure connection.  Update your certificate to correct the problem.  

```bach
sudo zypper update-ca-certificates
```

## Update

[!INCLUDE [az-upgrade](az-upgrade.md)]

You can also update the package with the `zypper update` command.

```bash
sudo zypper refresh
sudo zypper update azure-cli
```

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](uninstall-boilerplate.md)]

1. Remove the package from your system.

    ```bash
    sudo zypper remove -y azure-cli
    ```

2. If you don't plan to reinstall the CLI, remove the repository information.

   ```bash
   sudo zypper removerepo azure-cli
   ```

3. If you don't use other Microsoft packages, remove the Microsoft signing key.

   ```bash
   MSFT_KEY=`rpm -qa gpg-pubkey /* --qf "%{version}-%{release} %{summary}\n" | grep Microsoft | awk '{print $1}'`
   sudo rpm -e --allmatches gpg-pubkey-$MSFT_KEY
   ```
