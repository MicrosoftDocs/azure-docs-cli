---
title: Create virtual machines (VM) – Azure CLI | Microsoft Docs
description: Learn how to create virtual machines (VM) with the Azure CLI by completing this tutorial through Azure Cloud Shell or by installing the CLI locally.
ms.date: 07/09/2018
ms.author: dbradish
author: dbradish-microsoft
manager: barbkess
ms.devlang: azure-cli
ms.topic: tutorial
ms.prod: azure
ms.technology: azurecli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli create vm, virtual machine in azure cli
---

# 2- Create a virtual machine

Virtual machines in Azure have a large number of dependencies. The CLI creates these resources for you based on
the command-line arguments you specify.

Create a new virtual machine running Ubuntu, which uses SSH authentication for login.

```azurecli-interactive
az vm create --resource-group TutorialResources \
  --name TutorialVM1 \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --output json \
  --verbose 
```

> [!NOTE]
> If you have an SSH key named `id_rsa` already available, this key is used for authentication rather than having a new
> key generated.

As the VM is created, you see the local values used and Azure resources being created due to the `--verbose` option.
Once the VM is ready, JSON is returned from the Azure service including the public IP address.

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

Go ahead and log out from the VM.

There are other ways to get this IP address after the VM has started. In the next section you will see how to get detailed information on
the VM, and how to filter it.
