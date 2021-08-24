---
title: Azure CLI references for Azure Virtual Machines
description: Azure CLI reference landing page for Azure Virtual Machines
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 08/24/2021
ms.author: dbradish
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli
---

# Azure CLI for Azure Virtual Machines

The Azure Command Line Interface ([Azure CLI](./what-is-azure-cli.md)) is a set of commands you use to create and manage Azure resources. It's available across many Azure services and enables you to manage Azure Virtual Machines from a command line.

The [Azure Virtual Machines](/azure/virtual-machines) CLI experience is composed of two parts: a core and its extensions. Core Azure CLI commands ship as part of the CLI and are fully supported. Extensions give you access to experimental and pre-release commands. For more information about using extensions, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).  

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

See [Azure Virtual Machines](/cli/azure/service-page/azure%20virtual%20machines) for a list of the Azure CLI core and extension references available for the Azure Virtual Machines service. For references in each subgroup, see the tables in the following sections:

- [Desktop virtualization](#desktop-virtualization)
- [Virtual machine images](#virtual-machine-images)
- [Virtual machine maintenance](#virtual-machine-maintenance)
- [Shared image galleries](#shared-image-galleries)
- [Virtual machines](#virtual-machines)
- [Virtual machine scale sets](#virtual-machine-scale-sets)
- [Additional storage references](#additional-storage-references)

## Desktop virtualization

The references in this table are part of the [desktopvirtualization](https://github.com/Azure/azure-cli-extensions/tree/main/src/desktopvirtualization) extension.

| Reference | Description | More information |
|-|-|-|
| [az desktopvirtualization](/cli/azure/desktopvirtualization) | Manage desktop virtualization. |  |
| [az desktopvirtualization applicationgroup](/cli/azure/desktopvirtualization/applicationgroup) | Manage desktop virtualization application groups. |  |
| [az desktopvirtualization hostpool](/cli/azure/desktopvirtualization/hostpool) | Manage desktop virtualization host pools. |  |
| [az desktopvirtualization workspace](/cli/azure/desktopvirtualization/workspace) | Manage desktop virtualization workspaces. |  |

## Virtual machine images

| Reference | Description | More information |
|-|-|-|
| [az image](/cli/azure/image) | Manage custom virtual machine images. |  |
| [az image builder](/cli/azure/image/builder) | Manage and create image builder templates. |  |
| [az image builder customizer](/cli/azure/image/builder/customizer) | Manage image builder template customizers. |  |
| [az image builder output](/cli/azure/image/builder/output) | Manage image builder template output distributors. |  |

## Virtual machine maintenance

The references in this table are part of the [maintenance](https://github.com/Azure/azure-cli-extensions/tree/main/src/maintenance) extension.

| Reference | Description | More information |
|-|-|-|
| [az maintenance](/cli/azure/maintenance) | Manage virtual machine maintenance. |  |
| [az maintenance applyupdate](/cli/azure/maintenance/applyupdate) | Apply maintenance updates. |  |
| [az maintenance applyupdate-for-resource-group](/cli/azure/maintenance/applyupdate-for-resource-group) | Manage maintenance configuration for a resource group. |  |
| [az maintenance assignment](/cli/azure/maintenance/assignment) | Manage maintenance configuration assignments. |  |
| [az maintenance configuration](/cli/azure/maintenance/configuration) | Manage maintenance configuration. |  |
| [az maintenance configuration-for-resource-group](/cli/azure/maintenance/configuration-for-resource-group) | Manage maintenance configuration for a resource group. |  |
| [az maintenance public-configuration](/cli/azure/maintenance/public-configuration) | Manage public maintenance configuration. |  |
| [az maintenance update](/cli/azure/maintenance/update) | Manage maintenance updates. |  |

## Shared image galleries

| Reference | Description | More information |
|-|-|-|
| [az sig](/cli/azure/sig) | Manage shared image galleries. |  |
| [az sig image-definition](/cli/azure/sig/image-definition) | Manage shared gallery images definitions. |  |
| [az sig image-version](/cli/azure/sig/image-version) | Manage shared gallery image versions. |  |
| [az sig share](/cli/azure/sig/share) | Manage image gallery sharing profiles. |  |

## Virtual machines

Some references in this table are part of the [aem](https://github.com/Azure/azure-cli-extensions/tree/main/src/aem) or [vm-repair](https://github.com/Azure/azure-cli-extensions/tree/main/src/vm-repair) extensions.

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az vm](/cli/azure/vm) | Manage Windows or Linux virtual machines. | | |
| [az vm aem](/cli/azure/vm/aem) | Manage Azure Enhanced Monitoring for SAP. | aem |  |
| [az vm availability-set](/cli/azure/vm/availability-set) | Manage the availability sets for a virtual machine resource. | | |
| [az vm boot-diagnostics](/cli/azure/vm/boot-diagnostics) | Manage the boot diagnostics for a virtual machine. | | |
| [az vm diagnostics](/cli/azure/vm/diagnostics) | Manage the diagnostics settings for a virtual machine. |  |
| [az vm disk](/cli/azure/vm/disk) | Manage the managed data disks attached to a virtual machine. | | |
| [az vm encryption](/cli/azure/vm/encryption) | Manage the encryption of the disks of a virtual machine. | | |
| [az vm extension](/cli/azure/vm/extension) | Manage the extensions for a virtual machine. | | |
| [az vm extension image](/cli/azure/vm/extension/image) | Find the available extensions for a virtual machine. | | |
| [az vm host](/cli/azure/vm/host) | Manage the dedicated hosts for a virtual machine. | | |
| [az vm host group](/cli/azure/vm/host/group) | Manage the dedicated host groups for a virtual machine. | | |
| [az vm identity](/cli/azure/vm/identity) | Manage the service identities of a virtual machine. | | |
| [az vm image](/cli/azure/vm/image) | Show image information for a virtual machine. | | |
| [az vm image terms](/cli/azure/vm/image/terms) | Manage Azure Marketplace image terms for a virtual machine. | |
| [az vm monitor](/cli/azure/vm/monitor) | Manage the monitor aspect for a virtual machine. | | |
| [az vm monitor log](/cli/azure/vm/monitor/log) | Manage the log analytics workspace for a virtual machine. | |
| [az vm monitor metrics](/cli/azure/vm/monitor/metrics) | Manage the metrics for a virtual machine. | |
| [az vm nic](/cli/azure/vm/nic) | Manage the network interfaces on a virtual machine. | | |
| [az vm repair](/cli/azure/vm/repair) | Manage repair commands to fix a virtual machine. | vm-repair | |
| [az vm run-command](/cli/azure/vm/run-command) | Manage run commands on a virtual machine. | | |
| [az vm secret](/cli/azure/vm/secret) | Manage secrets on a virtual machine. | | |
| [az vm unmanaged-disk](/cli/azure/vm/unmanaged-disk) | Manage the unmanaged data disks attached to a virtual machine. | | |
| [az vm user](/cli/azure/vm/user) | Manage the user accounts for a virtual machine. | | |

## Virtual machine scale sets

| Reference | Description | More information |
|-|-|-|
| [az vmss](/cli/azure/vmss) | Manage groupings of virtual machines in an Azure virtual machine scale set. | |
| [az vmss diagnostics](/cli/azure/vmss/diagnostics) | Configure Diagnostics extension for a virtual machine scale set. | |
| [az vmss disk](/cli/azure/vmss/disk) | Manage the data disks of a virtual machine scale set. | |
| [az vmss encryption](/cli/azure/vmss/encryption) | Manage the encryption of a virtual machine scale set. | |
| [az vmss extension](/cli/azure/vmss/extension) | Manage the extensions of a virtual machine scale set. | |
| [az vmss extension image](/cli/azure/vmss/extension/image) | Find the available virtual machine extension images of a virtual machine scale set. | |
| [az vmss identity](/cli/azure/vmss/identity) | Manage service identities of a virtual machine scale set. | |
| [az vmss nic](/cli/azure/vmss/nic) | Manage the network interfaces of a virtual machine scale set. | |
| [az vmss rolling-upgrade](/cli/azure/vmss/rolling-upgrade) | Manage the rolling upgrades of a virtual machine scale set. | |
| [az vmss run-command](/cli/azure/vmss/run-command) | Manage the run commands on a virtual machine scale set. | |

## Additional storage references

| Reference | Description | More information |
|-|-|-|
| [az ppg](/cli/azure/ppg) | Manage proximity placement groups. |  |
| [az ssh](/cli/azure/ssh) | Manage the SSH configuration for a virtual machine. |  |
| [az sshkey](/cli/azure/sshkey) | Manage the SSH public key configuration for a virtual machine. |  |

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [references](/cli/azure/reference-index) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.

- Learn more about extensions in [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).
