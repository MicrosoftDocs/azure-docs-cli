---
title: Install the Azure CLI with pip for macOS
description: How to install the Azure CLI with pip on macOS
author: conradwt
ms.author: n/a
manager: na/a
ms.date: 10/05/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Install Azure CLI with pip on macOS

For the macOS platform, you can install the Azure CLI with [pip package manager](https://pypi.org/project/pip/). Pip makes it easy to keep your
installation of the CLI update to date. The CLI package has been tested on macOS versions 10.13 and later.

## Prerequisites

The CLI requires the following software:

- [Python 3.x](https://www.python.org/downloads/)
- [libffi](https://sourceware.org/libffi/)
- [OpenSSL 1.0.2](https://www.openssl.org/source/)

## Install

Pip is an easy way to manage your CLI install. It provides convenient ways to install, update, and uninstall Python packages.

You can install the CLI by first creating a virtual environment and then running the `install` command:

```bash
pip install virtualenv --upgrade
virtualenv ENV
cd ENV
source bin/activate
pip install azure-cli --upgrade
```

You can then run the Azure CLI with the `az` command. To sign in, use [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI](authenticate-azure-cli.md).

## Troubleshooting

If you encounter a problem when installing the CLI through Pip, here are some common errors. If you experience a problem not covered here, [file an issue on github](https://github.com/Azure/azure-cli/issues).

### CLI version 1.x is installed

If an out-of-date version was installed, follow the [update](#Update) instructions.

## Update

The CLI is regularly updated with bug fixes, improvements, new features, and preview functionality. A new release is available roughly every
two weeks. Update your local repository information and then upgrade the `azure-cli` package.

```bash
pip install pip --upgrade && pip install azure-cli --upgrade
```

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

Use pip to uninstall the `azure-cli` package.

```bash
pip uninstall azure-cli
```

## Next Steps

Now that you've installed the Azure CLI, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
[get started with the azure cli](get-started-with-azure-cli.md)
