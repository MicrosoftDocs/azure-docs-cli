---
title: Create a virtual network (VNet) using the Azure CLI
description: Learn how to create an Azure virtual network and subnet using the CLI. Enable secure communication between VMs, the internet, and on-premises networks.
ms.topic: tutorial
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure cli create vnet, virtual network in azure cli, subnet in virtual network
---

# Create a virtual network

Virtual networks (VNets) allow virtual machines (VMs) and other Azure resources to communicate
securely with each other, the internet, and on-premises networks. VNets can also be connected to
other VNets if their address ranges don't overlap. In this section, you learn how to create a
virtual network with a subnet.

Subnets allow you to segment the VNet address space into subnetworks for organization purposes.
Azure deploys resources to subnets within a virtual network, so you need to create a subnet.

Use the [az network vnet create][01] command to create a virtual network named `TutorialVNet1` with
address prefix of 10.0.0.0/16 and a subnet named `TutorialSubnet1` with address prefix of
10.0.0.0/24.

# [Bash](#tab/bash)

```azurecli-interactive
# create Bash shell variables
vnetName=TutorialVNet1
subnetName=TutorialSubnet1
vnetAddressPrefix=10.0.0.0/16
subnetAddressPrefix=10.0.0.0/24

# Use the existing resource group
resourceGroup=VMTutorialResources

az network vnet create \
  --name $vnetName \
  --resource-group $resourceGroup \
  --address-prefixes $vnetAddressPrefix \
  --subnet-name $subnetName \
  --subnet-prefixes $subnetAddressPrefix
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# create PowerShell variables
$vnetName = "TutorialVNet1"
$subnetName = "TutorialSubnet1"
$vnetAddressPrefix = "10.0.0.0/16"
$subnetAddressPrefix = "10.0.0.0/24"

# Use the existing resource group
$resourceGroup = "VMTutorialResources"

# Create a virtual network and subnet
az network vnet create `
  --name $vnetName `
  --resource-group $resourceGroup `
  --address-prefixes $vnetAddressPrefix `
  --subnet-name $subnetName `
  --subnet-prefixes $subnetAddressPrefix

```

<!-- link references -->

[01]: /cli/azure/network/vnet#az_network_vnet_create
