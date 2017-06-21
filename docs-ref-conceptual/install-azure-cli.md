---
title: Install the Azure CLI 2.0
description: Reference docs for Azure CLI 2.0
keywords: Azure CLI 2.0, Azure CLI 2.0 Reference, Install Azure CLI 2.0, Azure Python CLI, Uninstall Azure CLI 2.0
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 04/06/2017
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
> If you need the previous version of the Azure CLI, here's how to [install Azure 1.0](/azure/cli-install-nodejs).

## macOS

1. Install Azure CLI 2.0 with one `curl` command.

   ```bash
   curl -L https://aka.ms/InstallAzureCli | bash
   ```

2. You may have to restart your command shell for some changes to take effect.

   ```bash
   exec -l $SHELL
   ```
   
3. Run Azure CLI 2.0 from the command prompt with the `az` command.

> [!Note]
> When you install with InstallAzureCli, `az component update` isn't supported.
> To update to the latest CLI, run `curl -L https://aka.ms/InstallAzureCli | bash` again.
> 
> To uninstall, see the [manual uninstall instructions](#uninstall).

## Windows

You can install the CLI with the MSI and use it in the Windows command-line,
or you can install the CLI with apt-get on Bash on Ubuntu on Windows.

### MSI for the Windows command-line 

To install the CLI on Windows and use it in the Windows command-line, download and run the [msi](https://aka.ms/InstallAzureCliWindows).

> [!NOTE]
> When you install with the msi, `az component` isn't supported.
> To update to the latest CLI, run the [msi](https://aka.ms/InstallAzureCliWindows) again.
> 
> To uninstall the CLI, run the [msi](https://aka.ms/InstallAzureCliWindows) again and choose uninstall.

### apt-get for Bash on Ubuntu on Windows

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

> [!NOTE]
> When you install with apt-get, `az component` isn't supported.
> To update the CLI, run `sudo apt-get update && sudo apt-get install azure-cli` again.
> 
> To uninstall, run `sudo apt-get remove azure-cli`.

## Linux

1. On Linux, you may need to install specific [prerequisites](#linux-prerequisites).

2. Install Azure CLI 2.0 with one `curl` command.

   ```bash
   curl -L https://aka.ms/InstallAzureCli | bash
   ```

3. You may have to restart your command shell for some changes to take effect.

   ```bash
   exec -l $SHELL
   ```

4. Run Azure CLI 2.0 from the command prompt with the `az` command.

> [!Note]
> When you install with InstallAzureCli, `az component update` isn't supported.
> To update to the latest CLI, run `curl -L https://aka.ms/InstallAzureCli | bash` again.
> 
> To uninstall, see the [manual uninstall instructions](#uninstall).

## Docker

We maintain a Docker image preconfigured with the Azure CLI.

Install the Azure CLI using `docker run`.

```bash
docker run -it azuresdk/azure-cli-python:<version>
```

See our [Docker tags](https://hub.docker.com/r/azuresdk/azure-cli-python/tags/) for available versions.

> [!NOTE]
> If you want to pick up the SSH keys from your user environment,
> you can use `-v ${HOME}:/root` to mount $HOME as `/root`.
>
> ```bash
> docker run -it -v ${HOME}:/root azuresdk/azure-cli-python:<version>
> ```

> [!NOTE]
> The Docker image does not support the [`component` feature](/cli/azure/component).
> To update the Azure CLI 2.0, use `docker run` to install the latest image, or the specific image that you want.

## apt-get

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

> [!NOTE]
> When you install with apt-get, `az component` isn't supported.
> To update the CLI, run `sudo apt-get update && sudo apt-get install azure-cli` again.
> 
> To uninstall, run `sudo apt-get remove azure-cli`.

## Linux Prerequisites

1. If you don't have it, install [Python](https://www.python.org/downloads).

2. Depending on your Linux distribution, install the prerequisites.

   ```
   Platform              | Prerequisites
   ----------------------|---------------------------------------------
   Ubuntu 15.10 or 16.04 | sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
   Ubuntu 12.04 or 14.04 | sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev
   Debian 8              | sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
   Debian 7              | sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev
   CentOS 7.1 or 7.2     | sudo yum check-update; sudo yum install -y gcc libffi-devel python-devel openssl-devel
   RedHat 7.2            | sudo yum check-update; sudo yum install -y gcc libffi-devel python-devel openssl-devel
   SUSE OpenSUSE 13.2    | sudo zypper refresh && sudo zypper --non-interactive install gcc libffi-devel python-devel openssl-devel
   ```

## Troubleshooting

### Errors with curl redirection

If you get an error from the `curl` command regarding the `-L` parameter, or an error saying "Object Moved", try using the full url instead of the aka.ms url:

```
# If you see this:
curl -L https://aka.ms/InstallAzureCli | bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   175  100   175    0     0    562      0 --:--:-- --:--:-- --:--:--   560
bash: line 1: syntax error near unexpected token `<'
'ash: line 1: `<html><head><title>Object moved</title></head><body>

#### Try this instead:
curl https://azurecliprod.blob.core.windows.net/install | bash
```

## Uninstall

If you used the script at https://aka.ms/InstallAzureCli to install the CLI, you can uninstall it with these steps.

1. Remove the installed files.

   ```bash
   rm -r <install location>/lib/azure-cli
   rm <install location>/bin/az
   ```

2. Delete the line `<install location>/lib/azure-cli/az.completion` from `<install location>/.bash_profile`.

> [!Note]
> The default install location is `/Users/<username>`.

If you used apt-get, Docker, or the msi to install the CLI, use the same tool to uninstall it.

## Reporting issues and feedback

If you encounter any bugs with the tool,
file an issue in the [Issues](https://github.com/Azure/azure-cli/issues) section of our GitHub repo.
To provide feedback from the command line, try the `az feedback` command.
