---
title: Create virtual network (VNet) – Azure CLI | Microsoft Docs
description: Learn how to create a virtual network (VNet) and subnet with the Azure CLI .
ms.date: 11/12/2021
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

# 2 - Create a virtual network

Virtual networks (VNets) allow virtual machines (VMs) and other Azure resources to communicate securely with each other, the internet, and on-premise networks. VNets can also be connected to other VNets if their address ranges don't overlap. In this section you'll learn how to create a virtual network with a subnet.

Subnets allow you to segment the VNet address space into sub-networks for organization purposes. Azure deploys resources to subnets within a virtual network, so you need to create a subnet.

Use the [az network vnet create](/cli/azure/network/vnet#az_network_vnet_create) command to create a virtual network named `TutorialVNet1` with address prefix of 10.0.0.0/16 and a subnet named `TutorialSubnet1` with address prefix of 10.0.0.0/24.

```azurecli-interactive
# shell variable for VNet name
vnet=`TutorialVNet1`

# shell variable for subnet name
subnet=`TutorialSubnet1`

# shell variable for VNet address prefix
address_prefix=`10.0.0.0/16`

# shell variable for subnet address prefix
subnet_prefix=`10.0.0.0/24`

az network vnet create \
  --name $vnet \
  --resource-group $resource_group \
  --address-prefixes $address_prefix
  --subnet-name $subnet
  -subnet-prefixes $subnet_prefix
```
