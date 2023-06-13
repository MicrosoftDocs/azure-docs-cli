---
title: Azure CLI samples full list
description: See links to Azure CLI samples grouped by Azure service.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 06/13/2023
ms.service: azure-cli
ms.tool: azure-cli
ms.topic: sample 
ms.custom: devx-track-azurecli
---

# Azure CLI samples list

Azure CLI samples have been written by many Azure services to provide end-to-end scenarios for jobs to be done.  Here is an A - Z article list grouped by Azure service.  Many of these sample scripts are stored in the [Azure-samples/azure-cli-samples](https://github.com/Azure-Samples/azure-cli-samples) GitHub repository. 

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment.md)]

## Samples

The following table includes links to Azure CLI scripts written for a Bash environment.

| Azure Service | Sample | Reference commands
|---|---|---|
| application-gateway | [Azure CLI examples for Azure Application Gateway](/azure/application-gateway/cli-samples) |  |
|  | [Manage web traffic using the Azure CLI](/azure/application-gateway/scripts/create-vmss-cli) | az group create,  az group delete,  az network application-gateway create,  az network public-ip create,  az network public-ip show,  az network vnet create,  az network vnet subnet create,  az vmss create|
|  | [Restrict web traffic using the Azure CLI](/azure/application-gateway/scripts/create-vmss-waf-cli) | az group create,  az group delete,  az monitor diagnostic-settings create,  az network application-gateway create,  az network public-ip create,  az network public-ip show,  az network vnet create,  az network vnet subnet create,  az storage account create,  az vmss create|
| virtual-network | [Peer two virtual networks with an Azure CLI script sample](/azure/virtual-network/scripts/virtual-network-cli-sample-peer-two-virtual-networks) | az group create,  az group delete,  az network vnet create,  az network vnet peering create|
