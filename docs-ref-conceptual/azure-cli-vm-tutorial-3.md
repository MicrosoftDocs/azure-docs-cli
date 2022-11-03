---
title: Create a virtual machines (VM) – Azure CLI | Microsoft Docs
description: Learn how to create virtual machines (VM) connected to a virtual network (VNet) with the Azure CLI .
ms.date: 11/12/2021
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: tutorial
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli create vm, virtual machine in azure cli
---

# 3 - Create a virtual machine on a virtual network

Virtual machines (VM) in Azure have a large number of dependencies. The CLI creates these resources for you based on
the command-line arguments you specify. In this section, you'll learn how to deploy a VM to a VNet.

To deploy a VM on a VNet, they must have the same Azure location. Once a VM is created, you cannot change the VNet to which it is connected.

## Create a VM

Use the [az vm create](/cli/azure/vm#az_vm_create) command to create a new virtual machine running Ubuntu, which uses SSH authentication for login, and is connected to the subnet and VNet you created in the previous section.

```azurecli-interactive
# create shell variables
vmName=TutorialVM1

az vm create \
  --resource-group $resourceGroup \
  --name $vmName \
  --image UbuntuLTS \
  --vnet-name $vnetName \
  --subnet $subnetName \
  --generate-ssh-keys \
  --output json \
  --verbose 
```

> [!NOTE]
> If you have an SSH key named `id_rsa` already available, this key is used for authentication rather than having a new
> key generated.

As the VM is created, you see the local values used and Azure resources being created due to the `--verbose` option.
Once the VM is ready, a JSON is returned from the Azure service including the public IP address.

```json
{
  "fqdns": "",
  "id": "...",
  "location": "eastus",
  "macAddress": "...",
  "powerState": "VM running",
  "privateIpAddress": "...",
  "publicIpAddress": "<PUBLIC_IP_ADDRESS>",
  "resourceGroup": "TutorialResources",
  "zones": ""
}
```

Confirm that the VM is running by connecting over SSH.

```bash
ssh <PUBLIC_IP_ADDRESS>
```

Go ahead and log out from the VM by typing `exit`.

There are other ways to get this IP address after the VM has started. In the next section you will see how to get detailed information on
the VM, and how to filter it.
