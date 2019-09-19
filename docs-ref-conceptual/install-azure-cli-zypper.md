---
title: Install the Azure CLI on Linux with zypper
description: How to install the Azure CLI with zypper
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/09/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
---

# Install Azure CLI with zypper

For Linux distributions with `zypper`, such as openSUSE or SLES, there's a package available
for the Azure CLI. This package has been tested with openSUSE 42.2 and later, and SLES 12 SP 2 and later.

[!INCLUDE [current-version](includes/current-version.md)]

[!INCLUDE [rpm-warning](includes/rpm-warning.md)]

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
   sudo zypper install --from azure-cli -y azure-cli
   ```

You can then run the Azure CLI with the `az` command. To sign in, use [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI](authenticate-azure-cli.md).

## Troubleshooting

Here are some common problems seen when installing with `zypper`. If you experience a problem not covered here, [file an issue on github](https://github.com/Azure/azure-cli/issues).

### Proxy blocks connection

[!INCLUDE[configure-proxy](includes/configure-proxy.md)]

You may also want to explicitly configure `zypper` (via `yast2`) to use this proxy at all times. To do so,
run the `yast2 proxy` command as superuser, and fill in the information presented in the form. If you have a window
manager available on your system, you can also use the `Network Services > Proxy` pane in the `YaST Control Center`.

For advanced configuration or more information, see the
[OpenSUSE Proxy configuration documentation](https://www.suse.com/documentation/slms1/book_slms/data/sec_wy_config_updates_proxy.html)

In order to get the Microsoft signing key and get the package from our repository, your proxy needs to
allow HTTPS connections to the following addresses:

* `https://packages.microsoft.com`
* `https://download.opensuse.org`

[!INCLUDE[troubleshoot-wsl.md](includes/troubleshoot-wsl.md)]

## Update

You can update the package with the `zypper update` command.

```bash
sudo zypper refresh
sudo zypper update azure-cli
```

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

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

## Next Steps

Now that you've installed the Azure CLI, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)
