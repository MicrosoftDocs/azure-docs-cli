---
title: Azure CLI 2.0
description: Overview of the Azure CLI 2.0.
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 02/27/2017
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Azure CLI 2.0

The Azure CLI 2.0 is Azure's new command-line experience for managing Azure resources.
You can use it in your browser with [Azure Cloud Shell](/azure/cloud-shell/overview),
or you can [install](install-azure-cli.md) it on macOS, Linux, and Windows and run it from the command line.

Azure CLI 2.0 is optimized for managing and administering Azure resources from the command line, and for building automation scripts that work against the Azure Resource Manager. Using the Azure CLI 2.0, you can create VMs within Azure as easily as typing the following command:

```azurecli-interactive
az vm create -n MyLinuxVM -g MyResourceGroup --image UbuntuLTS
```

Use the [Cloud Shell](/azure/cloud-shell/overview) to run the CLI in your browser,
or [install](install-azure-cli.md) it on macOS, Linux, or Windows.
Read the [Get Started](get-started-with-azure-cli.md) article to begin using the CLI.
For information about the latest release, see the [release notes](release-notes-azure-cli.md).

The following samples can help you learn how to perform common scenarios with Azure CLI 2.0:
- [Linux Virtual Machines](/azure/virtual-machines/virtual-machines-linux-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- Interactive: [Create Linux Virtual Machines](https://docs.microsoft.com/learn/azure-cli-2-0/index)
- [Windows Virtual Machines](/azure/virtual-machines/virtual-machines-windows-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- [Web Apps](/azure/app-service-web/app-service-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- [SQL Database](/azure/sql-database/sql-database-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)

A detailed [reference](/cli/azure/reference-index) is also available that documents how to use each individual Azure CLI 2.0 command.

[Get started](get-started-with-azure-cli.md) with Azure CLI 2.0 now.


> [!NOTE]
> If you use the previous version of the CLI (Azure CLI), you can continue to use it.
> If you use both CLIs, remember that `azure` is the old CLI - Azure CLI, and that `az` is the new CLI - Azure CLI 2.0.
