---
title: Azure CLI 2.0
description: Overview of the Azure CLI 2.0.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 02/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
ms.assetid: 80ae9f6c-adb7-483c-bfb4-fbb958e075ba
---

# Azure CLI 2.0

The Azure CLI 2.0 is Azure's new command-line experience for managing Azure resources.  It can be used on macOS, Linux, and Windows. 

Azure CLI 2.0 is optimized for managing and administering Azure resources from the command line, and for building automation scripts that work against the Azure Resource Manager. Using the Azure CLI 2.0, you can create VMs within Azure as easily as typing the following command:

```azurecli
az vm create -n MyLinuxVM -g MyResourceGroup --image UbuntuLTS
```

Review the [Install article](install-azure-cli.md) to get Azure CLI 2.0 up and running on your system,
or use the [Cloud Shell](/azure/cloud-shell/overview) to run the CLI in your browser.
Read the [Get Started](get-started-with-azure-cli.md) article to begin using the CLI.
For information about the latest release, see the [release notes](release-notes-azure-cli.md).

The following samples can help you learn how to perform common scenarios with Azure CLI 2.0:
- [Linux Virtual Machines](/azure/virtual-machines/virtual-machines-linux-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- [Windows Virtual Machines](/azure/virtual-machines/virtual-machines-windows-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- [Web Apps](/azure/app-service-web/app-service-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
- [SQL Database](/azure/sql-database/sql-database-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)

A detailed [reference](/cli/azure/) is also available that documents how to use each individual Azure CLI 2.0 command.

[Get started](get-started-with-azure-cli.md) with Azure CLI 2.0 now.


> [!NOTE]
> If you use the previous version of the CLI (Azure CLI), you can continue to use it.
> If you use both CLIs, remember that `azure` is the old CLI - Azure CLI, and that `az` is the new CLI - Azure CLI 2.0. 