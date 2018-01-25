---
title: Install the Azure CLI 2.0 with apt
description: How to install the Azure CLI 2.0 with the apt package manager
keywords: Azure CLI,Install Azure CLI,azure apt, azure debian, azure ubuntu
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

# Install Azure CLI 2.0 with apt

If you are running a distirbution that comes with `apt`, such as Ubuntu or Debian, there is an available package
for the Azure CLI that you can install on your system.

[!INCLUDE [linux-install-requirements.md](includes/linux-install-requirements.md)]

## Install

1. Modify your sources list:

   - 32-bit system

     ```bash
     echo "deb https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
          sudo tee /etc/apt/sources.list.d/azure-cli.list
     ```

   - 64-bit system

     ```bash
     echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
          sudo tee /etc/apt/sources.list.d/azure-cli.list
     ```

2. Run the following sudo commands:

   ```bash
   sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
   sudo apt-get install apt-transport-https
   sudo apt-get update && sudo apt-get install azure-cli
   ```

You can run the Azure CLI with the `az` command.

## Troubleshooting

### apt-key fails with "No dirmngr"

When running the `apt-key` command, you may see output similar to the following error.

```output
gpg: failed to start the dirmngr '/usr/bin/dirmngr': No such file or directory
gpg: connecting dirmngr at '/tmp/apt-key-gpghome.kt5zo27tp1/S.dirmngr' failed: No such file or directory
gpg: keyserver receive failed: No dirmngr
```

This is due to a missing component required by `apt-key`. You can resolve this by installing the `dirmngr` package.

```bash
sudo apt-get install dirmngr
```

## Update

Use `apt-get upgrade` to update the CLI package.

   ```bash
   sudo apt-get update && sudo apt-get upgrade
   ```

> [!NOTE]
> This will upgrade all of the installed packages on your system which have not had a dependency change.
> To upgrade only the CLI, use `apt-get install`.
> ```bash
> sudo apt-get update && sudo apt-get install --only-upgrade -y azure-cli
> ```

### Uninstall

If you ever decide to uninstall the Azure CLI, we're sorry to see you go. Before you uninstall, use the `az feedback` command to give us
some reasons why you chose to uninstall and how we could improve the CLI experience. We want to make sure that the Azure
CLI is as bug-free and user-friendly as we can make it. You can also [file a github issue](https://github.com/Azure/azure-cli/issues).

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
