---
author: chasecrum
ms.author: chasecrum
manager: rayoflores
ms.date: 02/8/2024
ms.topic: include
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli, linux-related-content
---

## Before you begin

- Azure CLI [2.38.1](/cli/azure/release-notes-azure-cli#september-01-2023) (released on September 01, 2023)  is the latest version supported on SUSE Linux Enterprise Server (SLES) and OpenSUSE (Leap) and will continue to receive security fixes until the end of June 2024. Microsoft isn't providing other updates or bug fixes for these distributions.

- Microsoft continues to develop and support the Azure CLI and the Linux [Install script](/cli/azure/install-azure-cli-linux?pivots=script). SUSE maintains and supports packages provided by SUSE/OpenSUSE repositories.

- In Azure, SUSE and OpenSUSE virtual machines (VMs) based on Azure Marketplace images already have the Azure CLI installed.

## Install Azure CLI

To install Azure CLI on SUSE/OpenSUSE, choose one of the following methods:

1. [Use the Enterprise package provided by SUSE](#install-from-suse-or-opensuse-repositories) in the SUSE/OpenSUSE repositories.

1. [Use the installation method described in the “Install script (any)” tab](#install-from-microsoft-repositories).

1. [Install from Microsoft repositories](#install-from-microsoft-repositories)

### Install from SUSE or OpenSUSE repositories

The RPM package of the Azure CLI depends on the `python3` package.

   ```bash
   sudo zypper install -y azure-cli
   ```

### Install with the install script

You can manually install the Azure CLI on any version of Linux by using the [Install script](/cli/azure/install-azure-cli-linux?pivots=script) option.

If you're *updating* to the most recent version using this method, be sure to uninstall the previous version first, and any repositories you may have added for that version.

### Install from Microsoft repositories

To install the most recent historical version of the Azure CLI using Microsoft repositories, follow these steps.

(This package has been tested with **SLES 15** and **OpenSUSE Leap 15.1**)

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

### Install specific version

You must first configure `azure-cli` repository information as shown previously. Available versions can be found in the [Azure CLI release notes](../release-notes-azure-cli.md).

1. View the available versions using this command:

   ```bash
   zypper search --details --match-exact azure-cli
   ```

2. To install a specific version:

   ```bash
   sudo zypper install --from azure-cli azure-cli=<version>-1.el7
   ```

## Update Azure CLI

[!INCLUDE [az-upgrade](az-upgrade.md)]

You can also update the package with the `zypper update` command.

```bash
sudo zypper refresh
sudo zypper update azure-cli
```

## Uninstall Azure CLI

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

### Remove data

[!INCLUDE [remove-data-boilerplate.md](remove-data-boilerplate.md)]

## Troubleshooting

Here are some common problems seen when installing with `zypper`. If you experience a problem not covered here, [file an issue on GitHub](https://github.com/Azure/azure-cli/issues).

### Install without Python 3

[!INCLUDE [rpm-warning](rpm-warning.md)]

### NotImplementedError on OpenSUSE 15 VM

The OpenSUSE 15 VM has a preinstalled Azure CLI with version 2.0.45, which is outdated and has issues with `az login`. Remove this version along with its dependencies before following the [Install](#install-azure-cli) instruction to add the latest Azure CLI:

```bash
sudo zypper rm -y --clean-deps azure-cli
```

If you updated the Azure CLI without removing the dependencies of version 2.0.45, its old dependencies may affect the latest version of the Azure CLI. You need to add back the old version to link to its dependencies and then remove `azure-cli` along with its dependencies:

```bash
# The package name may vary on different system version, run 'zypper --no-refresh info azure-cli' to check the source package format
sudo zypper install --oldpackage azure-cli-2.0.45-4.22.noarch

sudo zypper rm -y --clean-deps azure-cli
```

### Install on SLES 12 or other systems without Python 3.6

On SLES 12, the default `python3` package is 3.4 and not supported by Azure CLI. You can first follow step 1-3 of the [install instruction](#install-azure-cli) to add the `azure-cli` repository. Then build a higher version `python3` from source. Finally, you can download the Azure CLI package and install it without dependency.

You can use the following one command to install or update Azure CLI based on above steps. The script installs Python 3.8 under `/usr/local/azcli` and makes Azure CLI use it by setting an alias of `az` to `PATH=/usr/local/azcli/bin:$PATH az`. You can also download the script and modify it according to your needs. For instance, you can change the Python version or install location.

```bash
curl -sL https://azurecliprod.blob.core.windows.net/sles12_install_v2.sh | sudo bash
```
For the first time install, remember to run the following command to activate the alias:

```bash
source ~/.bashrc
```

### Proxy blocks connection

[!INCLUDE[configure-proxy](configure-proxy.md)]

You may also want to explicitly configure `zypper` (via `yast2`) to always use this proxy. To do so,
run the `yast2 proxy` command as superuser, and fill in the information presented in the form. If you have a window
manager available on your system, you can also use the `Network Services > Proxy` pane in the `YaST Control Center`.

For advanced configuration or more information, see the
[OpenSUSE Proxy configuration documentation](https://www.suse.com/documentation/slms1/book_slms/data/sec_wy_config_updates_proxy.html)

To get the Microsoft signing key and get the package from our repository, your proxy needs to
allow HTTPS connections to the following addresses:

* `https://packages.microsoft.com`
* `https://download.opensuse.org`

[!INCLUDE[troubleshoot-wsl.md](troubleshoot-wsl.md)]

### SSL certificate problem

When a certificate is broken or outdated on a machine, you might receive an error indicating that curl failed to verify the legitimacy of the server, and therefore couldn't establish a secure connection.  Update your certificate to correct the problem.

```bach
sudo zypper update-ca-certificates
```
