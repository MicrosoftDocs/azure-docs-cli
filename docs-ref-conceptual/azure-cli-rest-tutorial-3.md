---
title: Learn how to send an Azure REST API response with Azure CLI| Microsoft Docs
description: See different examples of how to use Azure rest with Azure Command Line (CLI) 
manager: jasongroce
author: daphnemamsft
ms.author: dbradish
ms.date: 11/21/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Use different Azure Rest methods with Azure CLI

## Get

```azurecli-interactive
az rest --method get --url 
```

## Options

```azurecli-interactive
az rest --method options 
```

## Patch

```azurecli-interactive
az rest --method patch
```

## Post

```azurecli-interactive
az rest --method post
```

## Put

```azurecli-interactive
az rest --method put
```

## Next Steps

Now that you've learned the how to sent an Azure REST API response using Azure CLI, proceed to the next step to learn how to review the response that your Azure REST API request returned.

> [!div class="nextstepaction"]
> [ Review an Azure REST API response with Azure CLI](./azure-cli-rest-tutorial-4.md)