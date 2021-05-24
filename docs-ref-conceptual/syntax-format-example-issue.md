---
title: Azure CLI syntax formatting example
description: Azure CLI syntax formatting example
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 05/24/2021
ms.author: dbradish
ms.service: azure-cli
ms.custom: devx-track-azurecli
---

# H1

## Code block 1

```azurecli
az network list-service-aliases --eastus2

az network firewall create -resource-group myResourceGroup

az network firewall policy create --name myName --resource-group myResourceGroup

az network firewall policy rule-collection-group create --name myName --policy-name myPolicyName --priority 1

az network firewall policy rule-collection-group collection add-filter-collection --name myName

az network firewall policy rule-collection-group collection rule update --collection-name myCollectionName
```

## Code blcok interactive

```azurecli
az network list-service-aliases --eastus2

az network firewall create -resource-group myResourceGroup

az network firewall policy create --name myName --resource-group myResourceGroup

az network firewall policy rule-collection-group create --name myName --policy-name myPolicyName --priority 1

az network firewall policy rule-collection-group collection add-filter-collection --name myName

az network firewall policy rule-collection-group collection rule update --collection-name myCollectionName
```