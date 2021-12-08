---
title: Cleanup virtual machine resources (VM) – Azure CLI | Microsoft Docs
description: Clean up resources used in the virtual machine tutorial.
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

# 6 - Cleanup

Now that the tutorial is complete, it's time to clean up the created resources. You
can delete individual resources with the `delete` command, but the safest way to remove all resources
in a resource group is with `group delete`.

```azurecli-interactive
az group delete --name TutorialResources --no-wait
```

This command deletes the resources created during the tutorial, and is guaranteed to deallocate
them in the correct order. The `--no-wait` parameter keeps the CLI from blocking while the
deletion takes place. If you want to wait until the deletion is complete or watch it progress, use the `group wait` command.

```azurecli-interactive
az group wait --name TutorialResources --deleted
```

With cleanup completed, the tutorial is finished. Continue on for a summary of everything
you learned and links to resources that will help you with your next steps.