---
title: Service principal cleanup – Azure CLI | Microsoft Docs
description: Learn how to clean up service principal resources.
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

# 8 - Cleanup

Now that you have completed the tutorial, it's time to clean up the created service principal resources. You can delete individual resources with the `delete` command, but the safest way to remove all resources in a resource group is with `group delete`.

```azurecli-interactive
az group delete --name $resourceGroup --no-wait
```

This command deletes the resources created during the tutorial, and  clears them in the correct order. The `--no-wait` parameter keeps the CLI from blocking while the deletion takes place. If you want to wait until the deletion is complete or watch it progress, use the `group wait` command.

```azurecli-interactive
az group wait --name $resourceGroup --deleted
```
 
## Next Steps

Now that you've learned how to cleanup your service principal resources, proceed to the next step to see an overall summary of everything you have learned.

> [!div class="nextstepaction"]
> [Summary](./azure-cli-sp-tutorial-9.md)