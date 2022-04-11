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

If you don't have an [Azure subscription](../articles/guides/developer/azure-developer-guide.md#understanding-accounts-subscriptions-and-billing), create an [Azure free account](https://azure.microsoft.com/free/?ref=microsoft.com&utm_source=microsoft.com&utm_medium=docs&utm_campaign=visualstudio) before you begin.

## Starting Bash

Start Bash using Azure Cloud Shell or a local install. For more information, see [Install the Azure CLI](/cli/azure/install-azure-cli). This tutorial assumes that you are either running Bash using Azure Cloud Shell or running Azure CLI locally in a docker container.

## Querying dictionary results

A command that always returns only a single object returns a dictionary as a JSON object. Dictionaries are unordered objects accessed with keys. For this section, we are going to query the [Account](/cli/azure/account) object.

```azurecli-interactive
az account show
```

The command will output a dictionary as a JSON object. The following output has some fields omitted for brevity, and identifying information removed

```JSON
bash-5.1# az account show
{
  "environmentName": "AzureCloud",
  "isDefault": true,
  "managedByTenants": [],
  "name": "C & L Azure developer experience content projects",
  "state": "Enabled",
  "user": {
    "name": "user@contoso.com",
    "type": "user"
  }
}

```

### Formatting the output as a table

The default output is always a JSON object. Using the `--output table` argument to format the output as a table. You can shorten the argument to `-o table`.

```azurecli
az account show --output table
```

For more information about formatting the output, see [Output Formats](format-output-azure-cli).

