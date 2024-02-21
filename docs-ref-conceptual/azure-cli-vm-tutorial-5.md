---
title: Set shell variables from CLI output – Azure CLI | Microsoft Docs
description: Learn how to get virtual machines (VM) information and store results in an Azure CLI shell variable.
ms.date: 01/08/2024
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: tutorial
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: virtual machine in azure cli, set shell variables from cli output 
---

# Set shell variables from CLI output

Now that you have the NIC ID, run `az network nic show` to get its information. You don't need a resource group here, since the resource group name is contained within the Azure resource ID.

```azurecli-interactive
az network nic show --ids $nicId
```

This command shows all of the information for the network interface of the VM. This data includes DNS settings, IP information, security settings, and the MAC address. The following query shows how to obtain the public IP address and subnet object IDs.

# [Bash](#tab/bash)

```azurecli-interactive
az network nic show --ids $nicId \
  --query '{IP:ipConfigurations[].publicIPAddress.id, Subnet:ipConfigurations[].subnet.id}' \
  -o json
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
az network nic show --ids $nicId `
  --query '{IP:ipConfigurations[].publicIPAddress.id, Subnet:ipConfigurations[].subnet.id}' `
  -o json
```

---

```output
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

In order to use command-line tools, change the command to remove the custom JSON keys and output as `tsv`. The `read` command processes this style of output by loading results into multiple variables. Since two values are displayed on separate lines, the `read` command
delimiter must be set to the empty string rather than the default of non-newline whitespace.

# [Bash](#tab/bash)

```azurecli-interactive
read -d '' ipId subnetId <<< $(az network nic show \
  --ids $nicId \
  --query '[ipConfigurations[].publicIPAddress.id, ipConfigurations[].subnet.id]' \
  -o tsv)
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
$output = az network nic show --ids $nicId --query "[ipConfigurations[].publicIPAddress.id, ipConfigurations[].subnet.id]" -o tsv

# Split the output into two variables
$ipId, $subnetId = $output -split "`t"
```

---

If you don't want to use the Bash `read` or PowerShell `-split` command, you can set each variable separately.

```azurecli-interactive
$ipId = az network nic show --ids $nicId --query '[ipConfigurations[].publicIPAddress.id]' -o tsv
$subnetId = az network nic show --ids $nicId --query '[ipConfigurations[].subnet.id]' -o tsv
```

Use the public IP object ID to look up the public IP address and store it in a shell variable. The subnet ID was used to demonstrate how to query and store multiple values in the Azure CLI. Therefore, it isn't be needed for the rest of the tutorial.

# [Bash](#tab/bash)

```azurecli-interactive
vmIpAddress=$(az network public-ip show --ids $ipId \
  --query ipAddress \
  -o tsv)
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
$vmIpAddress = $(az network public-ip show `
    --ids $ipId `
    --query ipAddress `
    -o tsv)
```

---

Now you have the IP address of the VM stored in a shell variable. Go ahead and check that it's the same value that you used to initially connect to the VM.

```bash
echo $vmIpAddress
```
