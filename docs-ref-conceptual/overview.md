---
title: Azure CLI 2.0
description: Overview of the Azure CLI 2.0.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: allclark
manager: douge
ms.date: 02/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 80ae9f6c-adb7-483c-bfb4-fbb958e075ba
---

# Overview of the Azure CLI 2.0

The Azure CLI 2.0 is Azure's new command line experience for managing Azure resources.  It can be used on macOS, Linux, and Windows. 

Azure CLI 2.0 is optimized for managing and administering Azure resources from the command line, as well as for building automation scripts that work against the Azure Resource Manager. Using the Azure CLI 2.0, you can create new VMs within Azure as easily as typing the following command:

```azurecli
az vm create -n MyLinuxVM -g MyResourceGroup --image UbuntuLTS
```

Please review the [Install article](install-az-cli2.md) to get Azure CLI 2.0 up and running on your system. Then read the [Get Started](get-started-with-az-cli2.md) article to begin using it.

The following samples can help you learn how to perform common end-to-end scenarios with Azure CLI 2.0:
- [Virtual Machines](/azure/virtual-machines/virtual-machines-linux-cli-samples?toc=%2fazure%2ftoc.json)
- [Web Apps](/azure/app-service/app-service-cli-samples?toc=%2fcli%2fazure%2ftoc.json)
- [SQL Database](/azure/sql-database/sql-databsse-cli-samples?toc=%2fazure%2ftoc.json)

A detailed [reference](/azure/doc-ref-autogen) is also available that documents how to use each individual Azure CLI 2.0 command.

[Get started](get-started-with-az-cli2.md) with Azure CLI 2.0 now.


> [!NOTE]
> If you use the previous version of the CLI (Azure CLI), you can continue to use it.  If you use both CLIs, remember that `azure` is the old CLI - Azure CLI, and that `az` is the new CLI - Azure CLI 2.0. 



