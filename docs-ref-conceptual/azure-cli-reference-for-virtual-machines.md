---
title: Azure CLI references for Azure Virtual Machines | Microsoft Docs
description: Find Azure CLI core and extension reference commands to manage Azure Virtual Machines.  Follow links to popular articles to learn how to use the Azure CLI for Azure VMs.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: reference
ms.date: 06/19/2023
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, azure virtual machines, desktop virtualization, image, shared image gallery
---

# Azure CLI reference commands for Azure Virtual Machines

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands you use to create and manage Azure resources. It's available across many Azure services and enables you to manage Azure Virtual Machines from a command line.

The [Azure Virtual Machines](/azure/virtual-machines) CLI experience is composed of two parts: a **core** and its **extensions**. Core Azure CLI commands ship as part of the CLI and are fully supported. Extensions give you access to experimental and pre-release commands. For more information about using extensions, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).  

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

See [Azure Virtual Machines](/cli/azure/service-page/azure%20virtual%20machines) for an alphabetic list of Azure CLI core and extension references available for the Azure Virtual Machine service. For references in each subgroup, see the tables in the following sections:

- [Desktop virtualization](#desktop-virtualization-references)
- [Virtual machine images](#virtual-machine-image-references)
- [Virtual machine maintenance](#virtual-machine-maintenance-references)
- [Shared image galleries](#shared-image-gallery-references)
- [Virtual machines](#virtual-machine-references)
- [Virtual machine scale sets](#virtual-machine-scale-set-references)
- [Additional storage references](#additional-storage-references)

## Desktop virtualization references

All the references in this table are part of the [desktopvirtualization](https://github.com/Azure/azure-cli-extensions/tree/main/src/desktopvirtualization) extension.

| Reference | Description |
|-|-|
| [az desktopvirtualization](../latest/docs-ref-autogen/desktopvirtualization.yml) | Manage desktop virtualization. |
| [az desktopvirtualization applicationgroup](../latest/docs-ref-autogen/desktopvirtualization/applicationgroup.yml) | Manage desktop virtualization application groups. |
| [az desktopvirtualization hostpool](../latest/docs-ref-autogen/desktopvirtualization/hostpool.yml) | Manage desktop virtualization host pools. |
| [az desktopvirtualization workspace](../latest/docs-ref-autogen/desktopvirtualization/workspace.yml) | Manage desktop virtualization workspaces. |

## Virtual machine image references

| Reference | Description | More information |
|-|-|-|
| [az image](../latest/docs-ref-autogen/image.yml) | Manage custom virtual machine images. | [How to create a managed image of a virtual machine or VHD](/azure/virtual-machines/linux/capture-image) |
| [az image builder](../latest/docs-ref-autogen/image/builder.yml) | Manage and create image builder templates. |  |
| [az image builder customizer](../latest/docs-ref-autogen/image/builder/customizer.yml) | Manage image builder template customizers. |  |
| [az image builder output](../latest/docs-ref-autogen/image/builder/output.yml) | Manage image builder template output distributors. |  |

## Virtual machine maintenance references

All the references in this table are part of the [maintenance](https://github.com/Azure/azure-cli-extensions/tree/main/src/maintenance) extension.

| Reference | Description | More information |
|-|-|-|
| [az maintenance applyupdate](../latest/docs-ref-autogen/maintenance/applyupdate.yml) | Manage how maintenance updates are applied. | [Control updates with Maintenance Control and the Azure CLI](/azure/virtual-machines/maintenance-control-cli) |
| [az maintenance applyupdate-for-resource-group](/cli/azure/maintenance/applyupdate-for-resource-group) | Manage how maintenance updates are applied for a resource group. |  |
| [az maintenance assignment](../latest/docs-ref-autogen/maintenance/assignment.yml) | Manage maintenance configuration assignments. | [Control updates with Maintenance Control and the Azure CLI](/azure/virtual-machines/maintenance-control-cli) |
| [az maintenance configuration](../latest/docs-ref-autogen/maintenance/configuration.yml) | Manage maintenance configuration records | [Control updates with Maintenance Control and the Azure CLI](/azure/virtual-machines/maintenance-control-cli) |
| [az maintenance configuration-for-resource-group](/cli/azure/maintenance/configuration-for-resource-group) | Manage maintenance configuration records for a resource group. |  |
| [az maintenance public-configuration](../latest/docs-ref-autogen/maintenance/public-configuration.yml) | Manage public maintenance configuration records. | [Configure maintenance window](/azure/azure-sql/database/maintenance-window-configure?tabs=azure-cli) |
| [az maintenance update](../latest/docs-ref-autogen/maintenance/update.yml) | Manage maintenance updates. | [Control updates with Maintenance Control and the Azure CLI](/azure/virtual-machines/maintenance-control-cli) |

## Shared image gallery references

| Reference | Description | More information |
|-|-|-|
| [az sig](../latest/docs-ref-autogen/sig.yml) | Manage shared image galleries. | [Tutorial: Create and use a custom image for virtual machine scale sets with the Azure CLI](/azure/virtual-machine-scale-sets/tutorial-use-custom-image-cli) |
| [az sig image-definition](../latest/docs-ref-autogen/sig/image-definition.yml) | Manage the image definitions in a shared image gallery. | [Tutorial: Create and use a custom image for virtual machine scale sets with the Azure CLI](/azure/virtual-machine-scale-sets/tutorial-use-custom-image-cli) |
| [az sig image-version](../latest/docs-ref-autogen/sig/image-version.yml) | Manage the image versions in an image definition. | [Tutorial: Create and use a custom image for virtual machine scale sets with the Azure CLI](/azure/virtual-machine-scale-sets/tutorial-use-custom-image-cli) |
| [az sig share](../latest/docs-ref-autogen/sig/share.yml) | Manage the sharing profile of a shared image gallery. |  |

## Virtual machine references

Some references in this table are part of the [aem](https://github.com/Azure/azure-cli-extensions/tree/main/src/aem) or [vm-repair](https://github.com/Azure/azure-cli-extensions/tree/main/src/vm-repair) extension.

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az vm](../latest/docs-ref-autogen/vm.yml) | Manage Windows or Linux virtual machines. | | [Tutorial: Create and use a custom image for virtual machine scale sets with the Azure CLI](/azure/virtual-machine-scale-sets/tutorial-use-custom-image-cli) |
| [az vm aem](../latest/docs-ref-autogen/vm/aem.yml) | Manage Azure Enhanced Monitoring for SAP for a virtual machine. | aem |  |
| [az vm availability-set](../latest/docs-ref-autogen/vm/availability-set.yml) | Manage the availability sets of a virtual machine resource group. | | [Create a complete Linux virtual machine with the Azure CLI](/azure/virtual-machines/linux/create-cli-complete) |
| [az vm boot-diagnostics](../latest/docs-ref-autogen/vm/boot-diagnostics.yml) | Manage the boot diagnostics for a virtual machine. | | |
| [az vm diagnostics](../latest/docs-ref-autogen/vm/diagnostics.yml) | Manage the diagnostics extension settings for a virtual machine. | | |
| [az vm disk](../latest/docs-ref-autogen/vm/disk.yml) | Attach or detach managed data disks on a virtual machine. | | [Enable on-demand bursting](/azure/virtual-machines/disks-enable-bursting?tabs=azure-cli) |
| [az vm encryption](../latest/docs-ref-autogen/vm/encryption.yml) | Manage the encryption of a virtual machine's disks. | | [Quickstart: Create and encrypt a Linux VM with the Azure CLI](/azure/virtual-machines/linux/disk-encryption-cli-quickstart) |
| [az vm extension](../latest/docs-ref-autogen/vm/extension.yml) | Manage the extensions for a virtual machine. | | [Virtual machine extensions and features for Linux](/azure/virtual-machines/extensions/features-linux) |
| [az vm extension image](../latest/docs-ref-autogen/vm/extension/image.yml) | Find the available extensions for a virtual machine. | | [Virtual machine extensions and features for Linux](/azure/virtual-machines/extensions/features-linux) |
| [az vm host](../latest/docs-ref-autogen/vm/host.yml) | Manage the dedicated hosts for a virtual machine. | | [Deploy to dedicated hosts using the Azure CLI](/azure/virtual-machines/linux/dedicated-hosts-cli) |
| [az vm host group](../latest/docs-ref-autogen/vm/host/group.yml) | Manage the dedicated host groups for a virtual machine. | | [Deploy to dedicated hosts using the Azure CLI](/azure/virtual-machines/linux/dedicated-hosts-cli) |
| [az vm identity](../latest/docs-ref-autogen/vm/identity.yml) | Manage the service identities for a virtual machine. | | [Configure managed identities for Azure resources on an Azure VM using Azure CLI](/azure/active-directory/managed-identities-azure-resources/qs-configure-cli-windows-vm) |
| [az vm image](../latest/docs-ref-autogen/vm/image.yml) | Show information about available virtual machine images. | | [Find Azure Marketplace image information using the Azure CLI](/azure/virtual-machines/linux/cli-ps-findimage) |
| [az vm image terms](../latest/docs-ref-autogen/vm/image/terms.yml) | Manage Azure Marketplace image terms. | | [Find Azure Marketplace image information using the Azure CLI](/azure/virtual-machines/linux/cli-ps-findimage) |
| [az vm monitor log](../latest/docs-ref-autogen/vm/monitor/log.yml) | Show the log analytics workspace for a virtual machine. | | |
| [az vm monitor metrics](../latest/docs-ref-autogen/vm/monitor/metrics.yml) | Show the metrics for a virtual machine. | | |
| [az vm nic](../latest/docs-ref-autogen/vm/nic.yml) | Manage the network interfaces for a virtual machine. | | [How to create a Linux virtual machine in Azure with multiple network interface cards](/azure/virtual-machines/linux/multiple-nics) |
| [az vm repair](../latest/docs-ref-autogen/vm/repair.yml) | Manage repair virtual machines and scripts. | vm-repair | |
| [az vm run-command](../latest/docs-ref-autogen/vm/run-command.yml) | Manage run commands for a virtual machine. | | [Rotate certificates in Azure Kubernetes Service](/azure/aks/certificate-rotation) |
| [az vm secret](../latest/docs-ref-autogen/vm/secret.yml) | Manage secrets for a virtual machine. | | [Tutorial: Use TLS/SSL certificates to secure a web server](/azure/virtual-machines/linux/tutorial-secure-web-server) |
| [az vm unmanaged-disk](../latest/docs-ref-autogen/vm/unmanaged-disk.yml) | Manage unmanaged data disks for a virtual machine. | | [Azure Virtual Machines planning and implementation for SAP NetWeaver](/azure/virtual-machines/workloads/sap/planning-guide) |
| [az vm user](../latest/docs-ref-autogen/vm/user.yml) | Manage user accounts for a virtual machine. | | [Manage administrative users, SSH, and check or repair disks on Linux VMs using the VMAccess Extension with the Azure CLI](/azure/virtual-machines/extensions/vmaccess) |

## Virtual machine scale set references

| Reference | Description | More information |
|-|-|-|
| [az vmss](../latest/docs-ref-autogen/vmss.yml) | Manage Azure virtual machine scale sets. | [Quickstart: Create a virtual machine scale set with the Azure CLI](/azure/virtual-machine-scale-sets/quick-create-cli) |
| [az vmss diagnostics](../latest/docs-ref-autogen/vmss/diagnostics.yml) | Configure Azure Diagnostics extension for a virtual machine scale set. | |
| [az vmss disk](../latest/docs-ref-autogen/vmss/disk.yml) | Manage the data disks for a virtual machine scale set. | [Tutorial: Create and use disks with virtual machine scale set with the Azure CLI](/azure/virtual-machine-scale-sets/tutorial-use-disks-cli) |
| [az vmss encryption](../latest/docs-ref-autogen/vmss/encryption.yml) | Manage the encryption for a virtual machine scale set. | [Encrypt OS and attached data disks in a virtual machine scale set with the Azure CLI](/azure/virtual-machine-scale-sets/disk-encryption-cli) |
| [az vmss extension](../latest/docs-ref-autogen/vmss/extension.yml) | Manage the extensions for a virtual machine scale set. | [Quickstart: Create a virtual machine scale set with the Azure CLI](/azure/virtual-machine-scale-sets/quick-create-cli) |
| [az vmss extension image](../latest/docs-ref-autogen/vmss/extension/image.yml) | Show information about available extension images for a virtual machine scale set. | |
| [az vmss identity](../latest/docs-ref-autogen/vmss/identity.yml) | Manage the service identities for a virtual machine scale set. | [Create and manage virtual machine scale set](/azure/virtual-machine-scale-sets/scripts/cli-sample-manage-scale-set) |
| [az vmss nic](../latest/docs-ref-autogen/vmss/nic.yml) | Manage the network interfaces for a virtual machine scale set. | |
| [az vmss rolling-upgrade](../latest/docs-ref-autogen/vmss/rolling-upgrade.yml) | Manage rolling upgrades for a virtual machine scale set. | |
| [az vmss run-command](../latest/docs-ref-autogen/vmss/run-command.yml) | Manage run commands for a virtual machine scale set. | |

## Additional storage references

Some references in this table are part of the [serial-console](https://github.com/Azure/azure-cli-extensions/tree/main/src/serial-console) or [ssh](https://github.com/Azure/azure-cli-extensions/tree/main/src/ssh) extension.

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az ppg](../latest/docs-ref-autogen/ppg.yml) | Manage proximity placement groups. | | [Deploy VMs to proximity placement groups using Azure CLI](/azure/virtual-machines/linux/proximity-placement-groups) |
| [az serial-console](../latest/docs-ref-autogen/serial-console.yml) | Manage the Azure Serial Console for a virtual machine or virtual machine scale set. | serial-console | |
| [az serial-console send](../latest/docs-ref-autogen/serial-console/send.yml) | Use the Azure Serial Console to send commands to a virtual machine or virtual machine scale set. | serial-console | |
| [az ssh](../latest/docs-ref-autogen/ssh.yml) | Manage SSH configuration. | ssh | [Login to a Linux virtual machine in Azure with Azure Active Directory using SSH certificate-based authentication](/azure/active-directory/devices/howto-vm-sign-in-azure-ad-linux) |
| [az sshkey](../latest/docs-ref-autogen/sshkey.yml) | Manage SSH public key configuration. | | |

## See also

* [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.
* Discover additional [reference commands](../latest/docs-ref-autogen/reference-index.yml) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)
