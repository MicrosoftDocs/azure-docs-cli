---
title: Install the Azure CLI 2.0 with zypper
description: How to install the Azure CLI 2.0 with zypper
keywords: azure cli, azure cli install, azure cli zypper, azure cli opensuse, azure cli sle
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 11/01/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
ROBOTS: NOINDEX,NOFOLLOW
experiment_id: 83e72847-fad8-4c
experimental: false
---

# Install Azure CLI 2.0 with zypper

If you are running a distirbution that comes with `zypper`, such as OpenSUSE or SLE, there is an available package
for the Azure CLI that you can install on your system.

> [!NOTE]
> You must have Python 2.7.x or Python 3.x in order to use the CLI. If your distribution does not have a package
> for either, [install Python](https://www.python.org/downloads/).

## Install 

1. Install `curl`:

   ```bash
   sudo zypper refresh
   sudo zypper install -y curl
   ```

2. Import the Microsoft repository key:

   ```bash
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   ```

3. Create local `azure-cli` repository information:

   ```bash
   sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/azure-cli.repo'
   ```

4. Update the `zypper` package index and install:

   ```bash
   sudo zypper refresh
   sudo zypper install -y azure-cli
   ```

You can run the CLI with the `az` command.

## Update

You can update the package with the `zypper update` command.

```bash
sudo zypper refresh
sudo zypper update azure-cli
```

## Uninstall

If you ever decide to uninstall the Azure CLI, we're sorry to see you go. Before you uninstall, use the `az feedback` command to give us
some reasons why you chose to uninstall and how we could improve the CLI experience. We want to make sure that the Azure
CLI is as bug-free and user-friendly as we can make it. You can also [file a github issue](https://github.com/Azure/azure-cli/issues).

1. Remove the package from your system.

    ```bash
    sudo zypper remove -y azure-cli
    ```

2. If you do not plan to reinstall the CLI, remove the repository information.

  ```bash
  sudo rm /etc/zypp/repos.d/azure-cli.repo
  ```

3. If you removed the repository information, also remove the Microsoft GPG signature key.

  ```bash
  MSFT_KEY=`rpm -qa gpg-pubkey /* --qf "%{version}-%{release} %{summary}\n" | grep Microsoft | awk '{print $1}'`
  sudo rpm -e --allmatches gpg-pubkey-$MSFT_KEY
  ```

