---
title: Install the Azure CLI 2.0
description: Reference docs for the installation of Azure CLI 2.0
keywords: Azure CLI,Install Azure CLI,Azure Python CLI,Azure CLI Reference
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 08/17/2017
ms.topic: article
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

On macOS, you are able to install either with [Homebrew](https://brew.sh/) or manually.

### Install with Homebrew

1. If you don't have it already, install Homebrew by following the [Homebrew installation instructions](https://docs.brew.sh/Installation.html).

2. If you have previously installed the CLI manually, follow the [manual uninstall](#UninstallManually) instructions.

3. Update your local Homebrew repositories.

   ```bash
   brew update
   ```

4. Install the `azure-cli` package.

  ```bash
  brew install azure-cli
  ```

> [!NOTE]
> If you previously installed the Azure CLI 1.0 with Homebrew, instead of installing
> the package you can get CLI 2.0 through the regular Homebrew upgrade process.
>
> ```bash
> brew upgrade
> ```

### Install manually

1. Install Azure CLI 2.0 with `curl`.

   ```bash
   curl -L https://aka.ms/InstallAzureCli | bash
   ```

2. You may have to restart your shell for some changes to take effect.

   ```bash
   exec -l $SHELL
   ```
   
3. Run the CLI from the command prompt with the `az` command.

## Install on Windows

### Install with MSI for the Windows command-line 

To install the CLI on Windows and use it in the Windows command-line, download and run the [Azure CLI Installer (MSI)](https://aka.ms/InstallAzureCliWindows).

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

For distributions using the `apt` package manager, you can install Azure CLI 2.0 via `apt-get`.

> [!NOTE]
> Your distribution must have support for Python 2.7.x or Python 3.x in order to use the CLI.

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
   sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
   sudo apt-get install apt-transport-https
   sudo apt-get update && sudo apt-get install azure-cli
   ```

3.  Run the CLI from the command prompt with the `az` command.

## Install on RHEL, Fedora, and CentOS with yum

For distributions which use the `yum` package manager, you can install Azure CLI 2.0 via `yum`.

> [!NOTE]
> Your distribution must have support for Python 2.7.x or Python 3.x in order to use the CLI.

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

4. Run the CLI from the command prompt with the `az` command.

## Install on openSUSE and SLE with zypper

For distributions which use the `zypper` package manager, you can install Azure CLI 2.0 via `zypper`.

> [!NOTE]
> Your distribution must have support for Python 2.7.x or Python 3.x in order to use the CLI.

1. Import the Microsoft repository key:

   ```bash
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   ```

2. Create local `azure-cli` repository information:

   ```bash
   sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/azure-cli.repo'
   ```

3. Update the `zypper` package index and install:

   ```bash
   sudo zypper refresh
   sudo zypper install azure-cli
   ```

4. Run the CLI from the command prompt with the `az` command.

## Install with Docker

We maintain a Docker image preconfigured with the Azure CLI 2.0.

Install the CLI using `docker run`.

   ```bash
   docker run -it azuresdk/azure-cli-python:<version>
   ```

See our [Docker tags](https://hub.docker.com/r/azuresdk/azure-cli-python/tags/) for available versions.

The CLI is installed on the image as the `az` command in `/usr/local/bin`.

> [!NOTE]
> If you want to pick up the SSH keys from your user environment,
> you can use `-v ${HOME}:/root` to mount $HOME as `/root`.

> ```bash
> docker run -it -v ${HOME}:/root azuresdk/azure-cli-python:<version>
> ```

## <a name="Linux"/>Install on Linux without a package manager

It is recommended that you install the CLI with a package manager if you are able to. If you do not want to add Microsoft's repositories, or are working with
a distribution which does not have a provided package, you can manually install the CLI.

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

If your distribution is not listed above, you will need to install [Python 2.7 or later](https://www.python.org/downloads/), [libffi](https://sourceware.org/libffi/), and [OpenSSL](https://www.openssl.org/source/).

2. Install the CLI with  `curl`.

   ```bash
   curl -L https://aka.ms/InstallAzureCli | bash
   ```

3. You may have to restart your shell for some changes to take effect.

   ```bash
   exec -l $SHELL
   ```

4. Run the CLI from the command prompt with the `az` command.

## Troubleshooting

If you encounter an issue during CLI install, check this section to see if your particular case is covered. If your issue is not here, please [file a Github issue](https://github.com/Azure/azure-cli/issues).

### curl "Object Moved" error

If you get an error from `curl` related to the `-L` parameter, or an error message including the text "Object Moved", try using the full URL instead of the `aka.ms` redirect:

```bash
curl https://azurecliprod.blob.core.windows.net/install | bash
```

### `az` command not found

You may need to clear your shell's command hash cache. Run

```bash
hash -r
```

and see if the problem is resolved.

## Uninstall CLI 1.x versions

If you have an earlier CLI 1.x version available on your system, you can uninstall it based upon the type of install used.

### Uninstall with npm

Remove the older CLI with `npm uninstall`.

  ```bash
  npm uninstall -g azure-cli
  ```

### Uninstall with distributable

If you installed via the [Azure CLI Installer (MSI)](http://aka.ms/webpi-azure-cli) or a [macOS package](http://aka.ms/mac-azure-cli), use the same tool to remove your install.

### Uninstall with Docker

If you installed a Docker image to use the earlier CLI version, remove that image and any associated containers. You can then re-create the containers
after installing the new Docker image as described in the install instructions.

  ```bash
  docker rmi -f microsoft/azure-cli
  ```

## Update the CLI

To update the Azure CLI, use the same method that you used to install it.

### Update with Homebrew

1. If you previously installed manually, follow the [install with Homebrew](#macOS) instructions.

2. Update your local Homebrew repository information.

   ```bash
   brew update
   ```

3. Upgrade your installed packages.

   ```bash
   brew upgrade
   ```

### Update with MSI

Run the [Azure CLI Installer (MSI)](https://aka.ms/InstallAzureCliWindows) again.

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

### Uninstall with Homebrew

Uninstall the `azure-cli` package.

   ```bash
   brew uninstall azure-cli
   ```

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

###<a name="UninstallManually"/>Uninstall manually

If you used the script at https://aka.ms/InstallAzureCli to install the CLI, you can uninstall it with these steps.

1. Remove the installed files.

   ```bash
   rm -r <install location>/lib/azure-cli
   rm <install location>/bin/az
   ```

2. Delete the line `<install location>/lib/azure-cli/az.completion` from `<install location>/.bash_profile`.

3. If your shell uses a command cache, reload it.

   ```bash
   hash -r
   ```

> [!Note]
> The default install location is `/Users/<username>`.

## Report CLI issues and feedback

If you encounter any bugs with the tool,
file an issue in the [Issues](https://github.com/Azure/azure-cli/issues) section of our GitHub repository.
To provide feedback from the command line, use the `az feedback` command.
