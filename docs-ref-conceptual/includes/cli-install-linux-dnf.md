---
author: chasecrum
ms.author: chasecrum
manager: mamccrea
ms.date: 12/19/2022
ms.topic: include
ms.custom: devx-track-azurecli
---

## Overview

For Linux distributions with `dnf` such as RHEL 8/9 or CentOS Stream 8/9, there are RPM packages for Azure CLI.

> [!WARNING]
> Starting from Azure CLI 2.39.0 (released on 08/02/2022), no RPM packages will be released for RHEL 7 and CentOS 7. You may continue to use historical versions of Azure CLI on these systems, but there will be no updates or bugfixes. Consider upgrading to newer versions of RHEL or CentOS to use the latest Azure CLI.

[!INCLUDE [current-version](current-version.md)]

[!INCLUDE [rpm-warning](rpm-warning.md)]

> [!NOTE]
>
> Use `yum` package manager if you are using Linux systems that don't support `dnf` package manager.

## Install

1. Import the Microsoft repository key.

   ```bash
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   ```

2. For RHEL 9 or CentOS Stream 9, add `packages-microsoft-com-prod` repository:

   ```bash
   sudo dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
   ```

   For RHEL 8 or CentOS Stream 8, add `packages-microsoft-com-prod` repository:

   ```bash
   sudo dnf install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
   ```

   For RHEL 7 or CentOS 7, add `azure-cli` repository:

   ```bash
   echo -e "[azure-cli]
   name=Azure CLI
   baseurl=https://packages.microsoft.com/yumrepos/azure-cli
   enabled=1
   gpgcheck=1
   gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
   ```

3. Install with the `dnf install` command.

   ```bash
   sudo dnf install azure-cli
   ```

## Install specific version

You must first configure `azure-cli` repository information as shown above. Available versions can be found at [Azure CLI release notes](../release-notes-azure-cli.md).

1. To view available versions with command:

   ```bash
   dnf list --showduplicates azure-cli
   ```

2. To install specific version:

   ```bash
   sudo dnf install azure-cli-<version>-1.el7
   ```

## Troubleshooting

Here are some common problems seen when installing with `dnf`. If you experience a problem not covered here, [file an issue on GitHub](https://github.com/Azure/azure-cli/issues).

### Install on RHEL 7.6 or other systems without Python 3

If you can, please upgrade your system to a version with official support for `python 3.6+` package. Otherwise, you need to first install a `python3` package then install Azure CLI without dependency.

You can use the following one command to install Azure CLI with `python 3.6` built from source:

```bash
curl -sL https://azurecliprod.blob.core.windows.net/rhel7_6_install.sh | sudo bash
```

You can also do it step by step:

First, Azure CLI requires `SSL 1.1+` and you need to build `openssl 1.1` from source before building `python3`:

```bash
sudo dnf install gcc gcc-c++ make ncurses patch wget tar zlib zlib-devel -y
# build openssl from source
cd ~
wget https://www.openssl.org/source/openssl-1.1.1d.tar.gz
tar -xzf openssl-1.1.1d.tar.gz
cd openssl-1.1.1d
./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl
make
sudo make install
# configure shared object lookup directory so that libssl.so.1.1 can be found
echo "/usr/local/ssl/lib" | sudo tee /etc/ld.so.conf.d/openssl-1.1.1d.conf
# reload config
sudo ldconfig -v
```

Then build Python 3 from source:

```bash
PYTHON_VERSION="3.6.9"
PYTHON_SRC_DIR=$(mktemp -d)
wget -qO- https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz | tar -xz -C "$PYTHON_SRC_DIR"
cd $PYTHON_SRC_DIR/Python-$PYTHON_VERSION
./configure --prefix=/usr --with-openssl=/usr/local/ssl
make
sudo make install
```

Finally, follow step 1 and 2 of the [install instruction](#install) to add Azure CLI repository. You can now download the package and install it without dependency.

> [!NOTE]
>
> In case you don't have the dnf download plugin installed, you will encounter command not found error on executing the below code. Use `dnf install 'dnf-command(download)'` to   install the dnf download plugin.

```bash
sudo dnf download azure-cli
sudo rpm -ivh --nodeps azure-cli-*.rpm
```

As an alternative, you can also install Python 3 through some [additional repo](https://developers.redhat.com/blog/2018/08/13/install-python3-rhel/). Following this way, if you have set up `python3` but are still getting an error `python3: command not found` when trying to run the cli, you need to add it to your path.

```bash
scl enable rh-python36 bash
```

### Proxy blocks connection

[!INCLUDE[configure-proxy](configure-proxy.md)]

You may also want to explicitly configure `dnf` to use this proxy at all times. Make sure that the following
lines appear under the `[main]` section of `/etc/dnf/dnf.conf`:

```dnf.conf
[main]
# ...
proxy=http://[proxy]:[port] # If your proxy requires https, change http->https
proxy_username=[username] # Only required for basic auth
proxy_password=[password] # Only required for basic auth
```

In order to get the Microsoft signing key and get the package from our repository, your proxy needs to
allow HTTPS connections to the following address:

* `https://packages.microsoft.com`

[!INCLUDE[troubleshoot-wsl.md](troubleshoot-wsl.md)]

## Update

[!INCLUDE [az-upgrade](az-upgrade.md)]

You can also update the Azure CLI with the `dnf update` command.

```bash
sudo dnf update azure-cli
```

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](uninstall-boilerplate.md)]

1. Remove the package from your system.

   ```bash
   sudo dnf remove azure-cli
   ```

2. If you don't plan to reinstall the CLI, remove the repository information.

   ```bash
   sudo rm /etc/yum.repos.d/azure-cli.repo
   ```

3. If you don't use any other Microsoft packages, remove the signing key.

   ```bash
   MSFT_KEY=`rpm -qa gpg-pubkey /* --qf "%{version}-%{release} %{summary}\n" | grep Microsoft | awk '{print $1}'`
   sudo rpm -e --allmatches gpg-pubkey-$MSFT_KEY
   ```