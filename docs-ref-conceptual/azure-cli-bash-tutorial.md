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

In this tutorial, you will learn to create and query Azure resources using Bash and the Azure CLI. You will learn how to do the following:

> [!div class="checklist"]
>
> - Querying results as JSON dictionaries or arrays
> - Formatting output as JSON, table, or TSV
> - Querying and formatting single and multiple values
> - Use If/Then, Case, Do Until, Do While, Grep, and For Each
> - Work with local and environment variables

If you don't have an Azure subscription, create an [Azure free account](https://azure.microsoft.com/free/?ref=microsoft.com&utm_source=microsoft.com&utm_medium=docs&utm_campaign=visualstudio) before you begin.

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

Use the `--output table` argument to format the output as an ASCII table. Nested objects aren't included in table output, but can still be filtered as part of a query. You can shorten the argument to `-o table`. We will explore additional formatting options later in this tutorial.

```azurecli
az account show --output table
```

For more information about formatting the output as a table, see [Output Formats](/cli/azure/format-output-azure-cli#table-output-format).

### Querying and formatting single values and nested values

The following queries demonstrate querying single values and nested values. The final query in this set demonstrates formatting the output with the `-o tsv` argument. This argument returns the results as tab- and newline-separated values. This is useful for removing quotation marks

```azurecli-interactive
az account show --query name
az account show --query name -o tsv

az account show --query user.name
az account show --query user.name -o tsv
```

### Querying and formatting multiple values, including nested values

The following queries demonstrate querying multiple values and renaming the values returned, using multiple output formats.

```azurecli-interactive
az account show --query [name,id,user.name] # return multiple values
az account show --query [name,id,user.name] -o table
az account show --query "{SubscriptionName: name, SubscriptionId: id, UserName: user.name}" # rename the values returned
az account show --query "{SubscriptionName: name, SubscriptionId: id, UserName: user.name}" -o table
```

For more information about returning multiple values, see [Get multiple values](/cli/azure/query-azure-cli#get-multiple-values).

### Querying boolean values

The following queries demonstrates querying all accounts in a subscription, potentially returning a JSON array if there are multiple subscriptions for a given account, and then querying for which account is the default account, and which accounts are not the default account. These queries build on what you learned previously to filter and format the results. Finally, it creates a local variable containing the subscription id for use later in this tutorial.

```azurecli-interactive
az account list
az account list --query "[?isDefault]" # Returns the default subscription
az account list --query "[?isDefault]" -o table # Returns the default subscription as a table
az account list --query "[?isDefault].[name,id]" # Returns the name and id of the default subscription
az account list --query "[?isDefault].[name,id]" -o table # Returns the name and id of the default subscription as a table
az account list --query "[?isDefault].{SubscriptionName: name, SubscriptionId: id}" -o table # Returns the name and id of the default subscription as a table with friendly names
az account list --query "[?isDefault == \`false\`]" # Returns the non-default subscriptions
az account list --query "[?isDefault == \`false\`].name" -o table # Returns the non-default subscriptions as a table
az account list --query "[?isDefault].id" -o tsv # Returns the subscription id without quotation marks
subscriptionId="$(az account list --query "[?isDefault].id" -o tsv)" # Captures the subscription id as a local variable.
echo $subscriptionId # Returns the contents of the local variable.
```

