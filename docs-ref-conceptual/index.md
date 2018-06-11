---
title: Azure CLI
description: Overview of the Azure CLI.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 06/11/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Azure CLI

The Azure CLI is Microsoft's cross-platform command line experience for managing Azure resources.
You can use it in your browser with [Azure Cloud Shell](/azure/cloud-shell/overview),
or [install](install-azure-cli.md) it on macOS, Linux, or Windows and run it from the command line.

The Azure CLI is optimized for managing and administering Azure resources from the command line, and for building automation scripts that work against the Azure Resource Manager. Using the CLI, you can create VMs within Azure as easily as typing the following command:

```azurecli-interactive
az vm create -n MyLinuxVM -g MyResourceGroup --image UbuntuLTS
```

Use the [Cloud Shell](/azure/cloud-shell/overview) to run the CLI in your browser,
or [install](install-azure-cli.md) it on macOS, Linux, or Windows.
Read the [Get Started](get-started-with-azure-cli.md) article to begin using the CLI.
For information about the latest release, see the [release notes](release-notes-azure-cli.md).

The following samples help you get started with common tasks in the CLI:
- [Linux Virtual Machines](/azure/virtual-machines/virtual-machines-linux-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- Interactive: [Create Linux Virtual Machines](https://docs.microsoft.com/learn/azure-cli-2-0/index)
- [Windows Virtual Machines](/azure/virtual-machines/virtual-machines-windows-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- [Web Apps](/azure/app-service-web/app-service-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- [SQL Database](/azure/sql-database/sql-database-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)

A detailed [reference](/cli/azure/reference-index) is also available that documents how to use each individual Azure CLI command.

[Get started](get-started-with-azure-cli.md) with Azure CLI now!