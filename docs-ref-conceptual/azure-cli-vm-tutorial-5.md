---
title: Creating a new virtual machine on the existing subnet (VM) – Azure CLI | Microsoft Docs
description: Learn how to create a new virtual machine on the existing subnet with Azure CLI.
ms.date: 07/09/2018
ms.author: dbradish
author: dbradish-microsoft
manager: barbkess
ms.devlang: azure-cli
ms.topic: tutorial
ms.prod: azure
ms.technology: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli create vm, virtual machine in azure cli
---

# 5 - Creating a new VM on the existing subnet

The second VM uses the existing subnet. You can skip a few steps to get the public IP address of the new VM stored into an environment
variable right away, since it's returned in the VM creation information. If you'd need other information about the VM later, it can always be
obtained from the `az vm show` command.

```bash
VM2_IP_ADDR=$(az vm create -g TutorialResources \
  -n TutorialVM2 \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --subnet $SUBNET_ID \
  --query publicIpAddress \
  -o tsv)
```

Using the stored IP address, SSH into the newly created VM.

```bash
ssh $VM2_IP_ADDR
```

Go ahead and log out from the VM.
