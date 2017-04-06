---
title: Install the Azure CLI 2.0
description: Reference docs for Azure CLI 2.0
keywords: Azure CLI 2.0, Azure CLI 2.0 Reference, Install Azure CLI 2.0, Azure Python CLI
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 02/27/2017
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
> To uninstall, see the [manual uninstall instructions](#uninstall).

## Windows

Get Azure CLI 2.0 on Windows using `pip`. 

1. Visit the Python site and [download Python](https://www.python.org/downloads/) for Windows.
   Be sure to install the Pip component when you install Python.
   After the install completes, add Python to your PATH environment variable (the installer will prompt you).

2. Check your Python installation from a command prompt.

   ```bash
   python --version
   ```

3. Install Azure CLI 2.0 using `pip`.

   ```bash
   pip install --user azure-cli
   ```

   > [!NOTE]
   > The CLI `az.bat` may be installed in `%USERPROFILE%\AppData\Roaming\Python\Scripts`
   > or `%USERPROFILE%\AppData\Roaming\Python\PythonXY\Scripts`
   > where `XY` is your Python version (for example, `%USERPROFILE%\AppData\Roaming\Python\Python27\Scripts`).
   > Add the folder that contains `az.bat` to your path.
   
4. Run Azure CLI 2.0 from the command prompt with the 'az' command.

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
> To uninstall, see the [manual uninstall instructions](#uninstall).

## Docker

We maintain a Docker image preconfigured with the Azure CLI.

Install the Azure CLI using `docker run`.

```bash
docker run azuresdk/azure-cli-python:<version>
```

See our [Docker tags](https://hub.docker.com/r/azuresdk/azure-cli-python/tags/) for available versions.

> [!NOTE]
> If you want to pick up the SSH keys from your user environment,
> you can use `-v ${HOME}:/root` to mount $HOME as `/root`.
>
> ```bash
> docker run -v ${HOME}:/root azuresdk/azure-cli-python:<version>
> ```

The Docker image does not support the [`component` feature](/cli/azure/component).
To update the Azure CLI 2.0, use `docker run` to install the latest image, or the specific image that you want.

## apt-get

For Debian/Ubuntu based systems, you can install Azure CLI 2.0 via `apt-get`.

1. Modify your sources list.

   - 32-bit system

     ```bash
     echo "deb https://apt-mo.trafficmanager.net/repos/azure-cli/ wheezy main" | \
          sudo tee /etc/apt/sources.list.d/azure-cli.list
     ```

   - 64-bit system

     ```bash
     echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/azure-cli/ wheezy main" | \
          sudo tee /etc/apt/sources.list.d/azure-cli.list
     ```

2. Run the following sudo commands:

   ```bash
   sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
   sudo apt-get install apt-transport-https
   sudo apt-get update && sudo apt-get install azure-cli
   ```

When you install with apt-get, `az component` isn't supported.
To update the CLI use the following commands:

```bash
sudo apt-get update && sudo apt-get install azure-cli
```

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
-------------------------------

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


### Errors on install with `cffi` or cryptography

If you get errors on install on OS X, upgrade `pip`.

```bash
pip install --upgrade --force-reinstall pip
```

If you get errors on install on **Debian** or **Ubuntu**, like these examples,
install `libssl-dev` and `libffi-dev`.

```bash
sudo apt-get update
sudo apt-get install -y libssl-dev libffi-dev
```

Also install Python Dev for your version of Python.

Python 2:

```bash
sudo apt-get install -y python-dev
```

Python 3:

```bash
sudo apt-get install -y python3-dev
```

Ubuntu 15 may require `build-essential` also:

```bash
sudo apt-get install -y build-essential
```

### Example Errors

```
Downloading cffi-1.5.2.tar.gz (388kB)
    100% |################################| 389kB 3.9MB/s
    Complete output from command python setup.py egg_info:

        No working compiler found, or bogus compiler options
        passed to the compiler from Python's distutils module.
        See the error messages above.
        (If they are about -mno-fused-madd and you are on OS/X 10.8,
        see http://stackoverflow.com/questions/22313407/ .)

    ----------------------------------------
Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-77i2fido/cffi/
```

```
#include <openssl/e_os2.h>
                            ^
compilation terminated.
error: command 'x86_64-linux-gnu-gcc' failed with exit status 1

Failed building wheel for cryptography
```

See Stack Overflow question - [Failed to install Python Cryptography package with PIP and setup.py](http://stackoverflow.com/questions/22073516/failed-to-install-python-cryptography-package-with-pip-and-setup-py)

## Uninstall

If you used pip, apt-get, or Docker to install the CLI, use the same tool to uninstall it.

If you used the script at https://aka.ms/InstallAzureCli to install the CLI, you can uninstall it with these steps.

1. Remove the installed files.

   ```bash
   rm -r <install location>/lib/azure-cli
   rm <install location>/bin/az
   ```

2. Delete the line `<install location>/lib/azure-cli/az.completion` from <install location>/.bash_profile.

> [!Note]
> The default install location is /Users/<username>.

## Reporting issues and feedback

If you encounter any bugs with the tool,
file an issue in the [Issues](https://github.com/Azure/azure-cli/issues) section of our GitHub repo.
To provide feedback from the command line, try the `az feedback` command.
