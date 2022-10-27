---
title: Set shell variables from CLI output – Azure CLI | Microsoft Docs
description: Learn how to get virtual machines (VM) information and store results in an Azure CLI shell variable.
ms.date: 11/12/2021
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: tutorial
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: virtual machine in azure cli, set shell variables from cli output 
---

# 5 - Set shell variables from CLI output

Now that you have the NIC ID, run `az network nic show` to get its information. Note that you don't need a resource group here, since the resource group name is contained within the Azure resource ID.

```azurecli-interactive
az network nic show --ids $nicId
```

This command shows all of the information for the network interface of the VM. This data includes DNS settings, IP information, security settings, and the MAC address. The following query shows how to obtain the public IP address and subnet object IDs.

```azurecli-interactive
az network nic show --ids $nicId \
  --query '{IP:ipConfigurations[].publicIpAddress.id, Subnet:ipConfigurations[].subnet.id}' \
  -o json
```

```json
{
  "IP": [
    "/subscriptions/.../resourceGroups/TutorialResources/providers/Microsoft.Network/publicIPAddresses/TutorialVM1PublicIP"
  ],
  "Subnet": [
    "/subscriptions/.../resourceGroups/TutorialResources/providers/Microsoft.Network/virtualNetworks/TutorialVM1VNET/subnets/TutorialVM1Subnet"
  ]
}
```

This command displays a JSON object that has custom keys ('IP' and 'Subnet') for the extracted values. While this style of output might not be useful
for command-line tools, it helps with human readability and can be used with custom scripts.

In order to use command-line tools, change the command to remove the custom JSON keys and output as `tsv`. This style of output can be processed by
the shell `read` command to load results into multiple variables. Since two values are displayed on separate lines, the `read` command
delimiter must be set to the empty string rather than the default of non-newline whitespace.

```azurecli
read -d '' ipId subnetId <<< $(az network nic show \
  --ids $nicId \
  --query '[ipConfigurations[].publicIpAddress.id, ipConfigurations[].subnet.id]' \
  -o tsv)
```

Use the public IP object ID to look up the public IP address and store it in a shell variable. The subnet ID was used to demonstrate how to query and store multiple values in the Azure CLI, it will not be needed for the rest of the tutorial.

```azurecli
vmIpAddress=$(az network public-ip show --ids $ipId \
  --query ipAddress \
  -o tsv)
```

Now you have the IP address of the VM stored in a shell variable. Go ahead and check that it is the same value that you used to initially connect to the VM.

```bash
echo $vmIpAddress
```
