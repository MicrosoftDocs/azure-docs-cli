--- 
title: Learning Bash with Azure CLI
description: Learning Bash with Azure CLI
author: dbradish-microsoft
ms.author: dbradish
ms.prod: non-product-specific
ms.topic: sample
ms.date: 04/11/2022
---
# Learning Bash with Azure CLI

In this tutorial, you will learn to create and query Azure resource using Bash and the Azure CLI.

> [!div class="checklist"]
>
> - 
> - 

## Starting Bash

[!INCLUDE [quickstarts-free-trial-note](/azure-docs-pr/includes/quickstarts-free-trial-note.md)]

[!INCLUDE [azure-cli-prepare-your-environment.md](/azure-docs-pr/includes/azure-cli-prepare-your-environment.md)]


## Querying dictionary results

A command that always returns only a single object return a dictionary. Dictionaries are unordered objects accessed with keys. For this section, we are going to query the [Account](/cli/azure/account) object.

```azurecli-interactive
az account show
```


