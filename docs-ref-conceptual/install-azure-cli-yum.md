---
title: Install the Azure CLI 2.0 on Linux with yum
description: How to install the Azure CLI 2.0 with yum
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 01/29/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Install Azure CLI 2.0 with yum

If you are running a distribution that comes with `yum`, such as RHEL, Fedora, or CentOS, there is a package available
for the Azure CLI. This package has been tested with RHEL 7, Fedora 19 and higher, and CentOS 7.

[!INCLUDE [linux-install-requirements.md](includes/linux-install-requirements.md)]

## Install

1. Import the Microsoft repository key.

   ```bash
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   ```

2. Create local `azure-cli` repository information.

   ```bash
   sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
   ```

3. Install with the `yum install` command.

   ```bash
   sudo yum install azure-cli
   ```

You can then run the Azure CLI with the `az` command. To sign in, use [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI 2.0](authenticate-azure-cli.md).

## Update

Update the Azure CLI with the `yum update` command.

```bash
sudo yum update azure-cli
```

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

1. Remove the package from your system.

   ```bash
   sudo yum remove azure-cli
   ```

2. If you do not plan to reinstall the CLI, remove the repository information.

   ```bash
   sudo rm /etc/yum.repos.d/azure-cli.repo
   ```

3. If you removed the repository information, also remove the Microsoft GPG signature key.

  ```bash
  MSFT_KEY=`rpm -qa gpg-pubkey /* --qf "%{version}-%{release} %{summary}\n" | grep Microsoft | awk '{print $1}'`
  sudo rpm -e --allmatches gpg-pubkey-$MSFT_KEY
  ```
