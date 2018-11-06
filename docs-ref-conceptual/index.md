---
title: Overview of the Azure CLI 
description: Overview of the Azure CLI.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/07/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Azure CLI

The Azure CLI is Microsoft's cross-platform command-line experience for managing Azure resources.
You can use it in your browser with [Azure Cloud Shell](/azure/cloud-shell/overview),
or [install](install-azure-cli.md) it on macOS, Linux, or Windows and run it from the command line.

The Azure CLI is simple to get started with, and best used for building automation scripts that work against the Azure Resource Manager. Using the Azure CLI, you can create VMs within Azure as easily as typing the following command:

```azurecli-interactive
az vm create -n MyLinuxVM -g MyResourceGroup --image UbuntuLTS
```

> [!NOTE]
>
> In scripts and on the Microsoft documentation site, Azure CLI examples are written for the `bash` shell. One-line examples will
> run on any platform. Longer or more complicated examples which include line continutions (`\`) or variable
> assignment will need to be modified to work on other shells, including PowerShell.

## Run or Install

You can install the CLI locally, run it in the browser with Azure Cloud Shell, or run in a Docker container.

* To run in your browser with Azure Cloud Shell, see [Quickstart for Bash in Azure Cloud Shell](/azure/cloud-shell/quickstart) or [Quickstart for PowerShell in Azure Cloud Shell](/azure/cloud-shell/quickstart-powershell).
* To install the CLI, see [Install the Azure CLI](install-azure-cli.md).
* To run as a Docker container, see [Run Azure CLI in a Docker Container](run-azure-cli-docker.md)

## Build your skills with Microsoft Learn

- [Manage virtual machines with the Azure CLI](/learn/modules/manage-virtual-machines-with-azure-cli/)
- [Control Azure services with the CLI](/learn/modules/control-azure-services-with-cli/)
- [More interactive learning...](/learn/browse/?products=azure-clis)

## Get started

Read the [Get Started](get-started-with-azure-cli.md) article to learn the CLI basics. The following samples demonstrate some common uses cases:

- [Linux Virtual Machines](/azure/virtual-machines/virtual-machines-linux-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- [Windows Virtual Machines](/azure/virtual-machines/virtual-machines-windows-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- [Web Apps](/azure/app-service-web/app-service-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- [SQL Database](/azure/sql-database/sql-database-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)

A detailed [reference](/cli/azure/reference-index) is also available that documents how to use each individual Azure CLI command.

> [!NOTE]
> If you use the previous version of the CLI (Azure classic CLI), you can continue to use it.
> However, we recommend updating to use the latest version of the Azure CLI for the best experience.
> If you use both CLIs, remember that `azure` is the classic CLI and that `az` is the most recent CLI.
