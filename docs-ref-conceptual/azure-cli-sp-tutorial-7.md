---
title: Reset service principal credentials – Azure CLI | Microsoft Docs
description: Learn how to reset your service principal credentials using Azure CLI.
manager: jasongroce
author: daphnemamsft
ms.author: daphnema
ms.date: 09/6/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# 7 - Reset credentials

If you lose the credentials for a service principal, use [az ad sp credential reset](/cli/azure/ad/sp/credential#az-ad-sp-credential-reset). The reset command takes the same parameters
as `az ad sp create-for-rbac`.

```azurecli-interactive
az ad sp credential reset --name myServicePrincipal_appID_or_name
```