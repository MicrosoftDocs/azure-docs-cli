---
title: Overview of the Azure CLI 
description: Overview of the Azure command-line interface (CLI).
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 04/24/2019
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
---

# Azure Command-Line Interface (CLI)

| ![Windows Logo](./media/Windows_logo_-_2012.svg) | ![Ubuntu Logo](./media/cof_orange_hex.svg) | ![Debian logo](./media/debian-logo.svg) | ![macOS Logo](./media/Apple_logo_black.svg) | ![Azure Cloud Shell logo](./media/cloud-check.svg) |
| Windows 10 | Ubuntu 16.04+ | Debian 8+ | macOS | Azure Cloud Shell |
| [!div class="nextstepaction"] [Install for Windows](https://aka.ms/installazurecliwindows) | Install on Ubuntu and Debian `sudo curl -L https://aka.ms/InstallAzCLIDeb | bash` | `brew update && brew install azure-cli` | ![div class="nextstepaction"] [Launch in Azure Cloud Shell](...) |
| [Full Windows install instructions](install-azure-cli-windows.md) | [Full Ubuntu install instructions](install-azure-cli-apt.md) | [Full macOS install instructions](install-azure-cli-macos.md) | [About Azure Cloud Shell](...) |

[Install instructions for all supported platforms](install-azure-cli.md)

> [!NOTE]
>
> In scripts and on the Microsoft documentation site, Azure CLI examples are written for the `bash` shell. One-line examples will
> run on any platform. Longer examples which include line continuations (`\`) or variable assignment need to be modified to work
> on other shells, including PowerShell.

## Azure CLI resources

- [Get Started with the Azure CLI](get-started-with-azure-cli.md)
- [Deploy a web application from GitHub](/azure/app-service/scripts/cli-deploy-github?toc=%2fcli%2fazure%2ftoc.json)
- [Create a Postgres database](/azure/postgresql/quickstart-create-server-up-azure-cli?toc=%2fcli%2fazure%2ftoc.json)
- [Create a Kubernetes cluster](/azure/aks/kubernetes-walkthrough?toc=%2fcli%2fazure%2ftoc.json)
- [Create a virtual machine](/cli/azure/azure-cli-vm-tutorial)

## Build your skills with Microsoft Learn

- [Manage virtual machines with the Azure CLI](/learn/modules/manage-virtual-machines-with-azure-cli/)
- [Control Azure services with the CLI](/learn/modules/control-azure-services-with-cli/)
- [More interactive learning...](/learn/browse/?products=azure-clis)

## Contact us

- [Request features](https://github.com/Azure/azure-cli/issues/new?template=Feature_request.md)
- [Get help on StackOverflow](https://stackoverflow.com/questions/tagged/azure-cli)
- [Report issues](https://github.com/Azure/azure-cli/issues/new?template=Bug_report.md)

> [!NOTE]
> If you use version 1.x of the Azure CLI (Azure classic CLI), please upgrade to the latest
> version of 2.x. Only use the Azure classic CLI when working with classic deployments.
> If you use both CLIs, remember that `azure` is the classic CLI and that `az` is the most
> recent CLI.
