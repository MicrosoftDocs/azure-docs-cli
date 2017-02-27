---
title: Install the Azure CLI 2.0
description: Reference docs for Azure CLI 2.0
keywords: Azure CLI 2.0, Azure CLI 2.0 Reference, Install Azure CLI 2.0, Azure Python CLI
author: allclark
manager: douge
ms.author: allclark
ms.date: 02/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azure-cli
ms.assetid: ea5c0ee1-c530-4a1e-a83f-e1be71f6d416
---

# Install Azure CLI 2.0

Install the new version of the Azure CLI today!
We've improved and updated it to provide a great native command line experience for managing Azure resources.
It can be used on macOS, Linux, and Windows.
For information about the latest release, see the [release notes](release-notes-azure-cli.md).

## macOS Install

Install Azure CLI 2.0 with one `curl` command.

```bash
curl -L https://aka.ms/InstallAzureCli | bash
```
You may have to restart your command shell for some changes to take effect.

```bash
exec -l $SHELL
```
Run Azure CLI 2.0 from the command prompt with the `az` command.

```AzureCLI
az
```

## Windows

Get Azure CLI 2.0 on Windows using `pip`. 

If you don't already have Python 2.7, 3.4 or 3.5 installed, we recommend you install version 3.5.x.

Visit the Python site and [download Python 3.5](https://www.python.org/downloads/release/python-352/) for Windows.
Be sure to install the Pip component when you install Python.
After the install completes, add Python 3.5 to your PATH environment variable (the installer will prompt you).

Check your Python installation from a command prompt.

```python
python --version
```

Install Azure CLI 2.0 using `pip`.

```bash
pip install azure-cli
```

Run Azure CLI 2.0 from the command prompt with the 'az' command.

```AzureCLI
az
```

## Linux Install

If you don't have it, install [Python](https://www.python.org/downloads).

> [!NOTE]
> We recommend Python 3.5.

You may need to install specific prerequisite libraries. On Debian/Ubuntu systems, use `apt-get` to get them.

```bash
sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev
```
```

Platform                   | Prerequisites
---------------------------|---------------------------------------------
OS X                       |
Ubuntu 16.06 LTS or 15.10  | libssl-dev libffi-dev python-dev build-essential
Ubuntu (other)             | libssl-dev libffi-dev python-dev
Debian 8                   | libssl-dev libffi-dev python-dev build-essential
Debian 7                   | libssl-dev libffi-dev python-dev
CentOS                     | gcc ibffi-devel python-devel openssl-devel
RedHat                     | gcc libffi-devel python-devel openssl-devel
SUSE                       | gcc libffi-devel python-devel openssl-dev
```

Install Azure CLI 2.0.

```bash
curl -L https://aka.ms/InstallAzureCli | bash
```

Restart your shell.

```bash
exec -l $SHELL
```

Run Azure CLI 2.0 from the command prompt with the `az` command.

```AzureCLI
az
```

## Troubleshooting
-------------------------------

### Errors with curl redirection

If you get an error from the `curl` command regarding the `-L` parameter, or an error saying "Object Moved", try using the full url instead of the aka.ms url:
```
# If you see this:
$ curl -L https://aka.ms/InstallAzureCli | bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   175  100   175    0     0    562      0 --:--:-- --:--:-- --:--:--   560
bash: line 1: syntax error near unexpected token `<'
'ash: line 1: `<html><head><title>Object moved</title></head><body>

#### Try this instead:
$ curl https://azurecliprod.blob.core.windows.net/install | bash
```


### Errors on install with `cffi` or cryptography

If you get errors on install on OS X, upgrade `pip`.

```bash
pip install --upgrade --force-reinstall pip
```

If you get errors on install on **Debian** or **Ubuntu**, such as those seen in the examples below,
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

## Reporting issues and feedback
If you encounter any bugs with the tool,
file an issue in the [Issues](https://github.com/Azure/azure-cli/issues) section of our GitHub repo.
To provide feedback from the command line, try the `az feedback` command.
