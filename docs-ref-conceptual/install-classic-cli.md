---
title: Install the Azure classic CLI
description: Install the Azure classic CLI for Mac, Linux, and Windows to start using Azure services
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 06/11/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---
# Install the Azure classic CLI

> [!IMPORTANT]
> This topic describes how to install the Azure classic CLI. The classic CLI is deprecated and should only be used with the classic deployment model.
> For all other deployments, use [the Azure CLI](/cli/azure).

Quickly install the Azure classic CLI to use a set of open-source shell-based commands for creating and managing resources in Microsoft Azure. You have several options to install these cross-platform tools on your computer:

* **npm package** - Run npm (the package manager for JavaScript) to install the Azure classic CLI package on your Linux distribution or OS. Requires node.js and npm.
* **Installer** - Download an installer for easy installation on macOS or Windows.
* **Docker container** - Start using the classic CLI in a ready-to-run Docker container. Requires a Docker host.

For more options and background, see the project repository on [GitHub](https://github.com/azure/azure-xplat-cli).

Once the Azure classic CLI is installed, connect with `azure login` and run the `azure` commands from your command-line interface (Bash, Terminal, Command prompt, and so on) to work with your Azure resources.

## Option 1: Install an npm package

To install the classic CLI from an npm package, make sure you have downloaded and installed the [latest Node.js and npm](https://nodejs.org/en/download/package-manager/). Then, run `npm install` to install the azure-cli package:

```bash
npm install -g azure-cli
```

On Linux distributions, you might need to use `sudo` to successfully run the `npm` command, as follows:

```bash
sudo npm install -g azure-cli
```

> [!NOTE]
> If you need to install or update Node.js and npm on your OS, we recommend that you install Node.js LTS version 4.x or later. If you use an older version, you might get installation errors.

If you prefer, you may also download a tar file from the [GitHub releases](https://github.com/Azure/azure-xplat-cli/releases). Then, install the downloaded npm package as follows (on Linux distributions you might need to use `sudo`):

```bash
npm install -g <path to downloaded tar file>
```

## Option 2: Use an installer

If you use a Mac or Windows computer, DMG and MSI installers are available from [GitHub releases](https://github.com/Azure/azure-xplat-cli/releases).

> [!TIP]
> On Windows, you can also download the [Web Platform Installer](https://go.microsoft.com/?linkid=9828653) to install the classic CLI. This installer gives you the option to install additional Azure SDK and command-line tools.

## Option 3: Use a Docker container

If you have set up your computer as a [Docker](https://docs.docker.com/engine/understanding-docker/) host, you can run the Azure classic CLI in a Docker container. Run the following command (on Linux distributions you might need to use `sudo`):

```bash
docker run -it microsoft/azure-cli:0.10.17
```

## Run Azure classic CLI commands

After the classic CLI is installed, run the `azure` command from your command-line user interface (Bash, Terminal, Command prompt, and so on). For example, to run the help command, type the following:

```azurecli-interactive
azure help
```

> [!NOTE]
> On some Linux distributions, you may receive an error similar to `/usr/bin/env: ‘node’: No such file or directory`. This error comes from recent installations of Node.js being installed at /usr/bin/nodejs. To fix it, create a symbolic link to /usr/bin/node by running this command:

```bash
sudo ln -s /usr/bin/nodejs /usr/bin/node
```

To see the version of the Azure classic CLI installed, type the following:

```azurecli-interactive
azure --version
```

> [!NOTE]
> When you first use Azure classic CLI, you see a message asking if you want to allow Microsoft to collect usage information. Participation is voluntary. If you choose to participate, you can stop at any time by running `azure telemetry --disable`. To enable participation at any time, run `azure telemetry --enable`.

## Update the classic CLI

Microsoft may release updated versions of the Azure classic CLI. Reinstall the classic CLI using the installer for your operating system, or run the latest Docker container. Or, if you have the latest Node.js and npm installed, update by typing the following (on Linux distributions you might need to use `sudo`).

```bash
npm update -g azure-cli
```

## Enable tab completion

Tab completion of classic CLI commands is supported for Mac and Linux.

To enable it in zsh, run:

```bash
echo '. <(azure --completion)' >> .zshrc
```

To enable it in bash, run:

```bash
azure --completion >> ~/azure.completion.sh
echo 'source ~/azure.completion.sh' >> ~/.bash_profile
```

## Next steps

* To learn more about the Azure classic CLI, download source code, report problems, or contribute to the project, visit the [GitHub repository for the Azure classic CLI](https://github.com/azure/azure-xplat-cli).
