---
title: Install the Azure CLI 2.0 with yum
description: How to install the Azure CLI 2.0 with yum
keywords: Azure CLI,Install Azure CLI,azure yum,azure rhel, azure fedora, azure centos
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 11/01/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Install Azure CLI 2.0 with yum

If you are running a distirbution that comes with `yum`, such as RHEL, Fedora, or CentOS, there is an available package
for the Azure CLI that you can install on your system.

[!INCLUDE [linux-install-requirements.md](includes/linux-install-requirements.md)]

## Install

1. Import the Microsoft repository key:

   ```bash
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   ```

2. Create local `azure-cli` repository information:

   ```bash
   sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
   ```

3. Update the `yum` package index and install:

   ```bash
   yum check-update
   sudo yum install azure-cli
   ```

Run the Azure CLI with the `az` command.

## Update

Update the Azure CLI with the `yum update` command.

```bash
yum check-update
sudo yum update azure-cli
```

## Uninstall

If you ever decide to uninstall the Azure CLI, we're sorry to see you go. Before you uninstall, use the `az feedback` command to give us
some reasons why you chose to uninstall and how we could improve the CLI experience. We want to make sure that the Azure
CLI is as bug-free and user-friendly as we can make it. You can also [file a github issue](https://github.com/Azure/azure-cli/issues).

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
