---
title: Install the Azure CLI 2.0
description: Reference docs for the installation of Azure CLI 2.0
keywords: Azure CLI 2.0, Azure CLI 2.0 Reference, Install Azure CLI 2.0, Azure Python CLI, Uninstall Azure CLI 2.0, Azure CLI, Install Azure CLI, Azure CLI Reference
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 08/17/2017
ms.topic: articleå
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
ms.assetid: ea5c0ee1-c530-4a1e-a83f-e1be71f6d416
---

# Install Azure CLI 2.0

Install the new version of the Azure CLI today!
We've improved and updated it to provide a great native command-line experience for managing Azure resources.
It can be used on macOS, Linux, and Windows.
For information about the latest release, see the [release notes](release-notes-azure-cli.md).

> [!NOTE]
> If you need the previous version of the Azure CLI, here's how to [install Azure CLI 1.0](/azure/cli-install-nodejs).

## <a name="macOS"/>Install on macOS

1. Install Azure CLI 2.0 with `curl`.

   ```bash
   curl -L https://aka.ms/InstallAzureCli | bash
   ```

2. You may have to restart your shell for some changes to take effect.

   ```bash
   exec -l $SHELL
   ```
   
3. Run the CLI from the command prompt with the `az` command.

> [!WARNING]
> The Homebrew formula for the Azure CLI, `azure-cli`, is currently out of date and will install a previous version.

## Install on Windows

You can install Azure CLI 2.0 with the MSI and use it in the Windows command-line, or you can install the CLI with `apt-get` on Bash on Ubuntu on Windows.

### Install with MSI for the Windows command-line 

To install the CLI on Windows and use it in the Windows command-line, download and run the [MSI](https://aka.ms/InstallAzureCliWindows).

### Install with apt-get for Bash on Ubuntu on Windows

1. If you don't have Bash on Windows, [install it](https://msdn.microsoft.com/commandline/wsl/install_guide).

2. Open the Bash shell.

3. Modify your sources list.

   ```bash
   echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
        sudo tee /etc/apt/sources.list.d/azure-cli.list
   ```

4. Run the following sudo commands:

   ```bash
   sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
   sudo apt-get install apt-transport-https
   sudo apt-get update && sudo apt-get install azure-cli
   ```

5.  Run the CLI from the command prompt with the `az` command.

## Install on Debian/Ubuntu with apt-get

For Debian/Ubuntu based systems, you can install Azure CLI 2.0 via `apt-get`.

1. Modify your sources list.
 
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
   sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
   sudo apt-get install apt-transport-https
   sudo apt-get update && sudo apt-get install azure-cli
   ```

3.  Run the CLI from the command prompt with the `az` command.

## Install with Docker

We maintain a Docker image preconfigured with the Azure CLI 2.0.

Install the CLI using `docker run`.

  ```bash
  docker run azuresdk/azure-cli-python:<version>
  ```

See our [Docker tags](https://hub.docker.com/r/azuresdk/azure-cli-python/tags/) for available versions.

The CLI is installed on the image as the `az` command in `/usr/local/bin`.

> [!NOTE]
> If you want to pick up the SSH keys from your user environment,
> you can use `-v ${HOME}:/root` to mount $HOME as `/root`.

> ```bash
> docker run -v ${HOME}:/root azuresdk/azure-cli-python:<version>
> ```

## <a name="Linux"/>Install on Linux without apt-get

It is recommended that you install the CLI with `apt-get` if you are able to. For distributions which do not use the `apt` package manager, you can manually install.

1. Install the prerequisites based on your Linux distribution.

   ```
   Platform              | Prerequisites
   ----------------------|---------------------------------------------
   Ubuntu 15.10 or 16.04 | sudo apt-get update && sudo apt-get install -y python libssl-dev libffi-dev python-dev build-essential
   Ubuntu 12.04 or 14.04 | sudo apt-get update && sudo apt-get install -y python libssl-dev libffi-dev python-dev
   Debian 8              | sudo apt-get update && sudo apt-get install -y python libssl-dev libffi-dev python-dev build-essential
   Debian 7              | sudo apt-get update && sudo apt-get install -y python libssl-dev libffi-dev python-dev
   CentOS 7.1 or 7.2     | sudo yum check-update; sudo yum install -y gcc python libffi-devel python-devel openssl-devel
   RedHat 7.2            | sudo yum check-update; sudo yum install -y gcc python libffi-devel python-devel openssl-devel
   SUSE OpenSUSE 13.2    | sudo zypper refresh && sudo zypper --non-interactive install curl gcc python python-xml libffi-devel python-devel openssl-devel
   ```

If your distribution is not listed above, you will need to install [Python](https://www.python.org/downloads/), [libffi](https://sourceware.org/libffi/), and [OpenSSL](https://www.openssl.org/source/).

2. Install the CLI with  `curl`.

   ```bash
   curl -L https://aka.ms/InstallAzureCli | bash
   ```

> [!NOTE]
> If you get an error from `curl`  regarding the `-L` parameter, or an error saying "Object Moved", try using the full url instead of the aka.ms url:
>
>  ```bash
>  curl https://azurecliprod.blob.core.windows.net/install | bash
>  ```

3. You may have to restart your shell for some changes to take effect.

   ```bash
   exec -l $SHELL
   ```

4. Run the CLI from the command prompt with the `az` command.

## Uninstall CLI 1.x versions

If you have an earlier CLI 1.x version available on your system, you can uninstall it based upon the type of install used.

### Uninstall with npm

Remove the older CLI with `npm uninstall`.

  ```bash
  npm uninstall -g azure-cli
  ```

### Uninstall with distributable

If you installed via [MSI](http://aka.ms/webpi-azure-cli) or a [macOS package](http://aka.ms/mac-azure-cli), use the same tool to remove your install.

### Uninstall with Docker

If you installed a Docker image to use the earlier CLI version, remove that image and any associated containers. You can then re-create the containers
after installing the new Docker image as described in the install instructions.

  ```bash
  docker rmi -f microsoft/azure-cli
  ```

## Update the CLI

To update the Azure CLI, use the same method that you used to install it.

### Update with MSI

Run the [MSI](https://aka.ms/InstallAzureCliWindows) again.

### Update with apt-get

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

### Update with Docker

1. Update your local image with `docker pull`.

   ```bash
   docker pull azuresdk/azure-cli-python
   ```

2. Get the containers currently using the CLI image.

   ```bash
   docker container ls -a --filter 'ancestor=azuresdk/azure-cli-python'
   ```

   ```output
   CONTAINER ID        IMAGE                              COMMAND             CREATED             STATUS                        PORTS               NAMES
   34a868beb2ab        azuresdk/azure-cli-python:latest      "/bin/sh -c bash"   8 minutes ago       Exited (0) 8 minutes ago                       inspiring_benz
   ```

> [!NOTE]
> If you installed a specific version of the image, you will need to add `:<version>` to the end of the image name.

3. Halt and recreate the containers.

   ```bash
   docker stop inspiring_benz
   docker rm inspiring_benz
   docker run azuresdk/azure-cli-python
   ```

### Update manually

Follow the manual installation instructions for [macOS](#macOS) or [Linux](#Linux) to update.

## Uninstall

If you decide to uninstall the CLI, we're sorry to see you go. You should uninstall using the same method that you used to install the CLI.

### Uninstall with MSI

Run the [MSI](https://aka.ms/InstallAzureCliWindows) again and choose uninstall.

### Uninstall with apt-get

Uninstall via `apt-get remove`:

  ```bash
  sudo apt-get remove -y azure-cli
  ```

### Uninstall with Docker

If you installed a docker image, you will need to remove any containers running it, and then delete the local image.

1. Get the containers which are running the azure-cli image.

  ```bash
  docker container ls -a --filter 'ancestor=azuresdk/azure-cli-python'
  ```

  ```output
  CONTAINER ID        IMAGE                              COMMAND             CREATED             STATUS                        PORTS               NAMES
  34a868beb2ab        azuresdk/azure-cli-python:latest      "/bin/sh -c bash"   8 minutes ago       Exited (0) 8 minutes ago                       inspiring_benz
  ```

2. Delete any containers with the CLI image.

  ```bash
  docker rm 34a868beb2ab
  ```

3. Remove the locally installed CLI image.

  ```bash
  docker rmi azuresdk/azure-cli-python
  ```

> [!NOTE]
> If you installed a specific version of the image, you will need to add `:<version>` to the end of the image name.

### Uninstall manually

If you used the script at https://aka.ms/InstallAzureCli to install the CLI, you can uninstall it with these steps.

1. Remove the installed files.

   ```bash
   rm -r <install location>/lib/azure-cli
   rm <install location>/bin/az
   ```

2. Delete the line `<install location>/lib/azure-cli/az.completion` from `<install location>/.bash_profile`.

> [!Note]
> The default install location is `/Users/<username>`.

## Report CLI issues and feedback

If you encounter any bugs with the tool,
file an issue in the [Issues](https://github.com/Azure/azure-cli/issues) section of our GitHub repository.
To provide feedback from the command line, use the `az feedback` command.
