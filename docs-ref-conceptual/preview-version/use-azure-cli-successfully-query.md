---
title: Query Azure CLI command output (preview)
description: Learn how to use the --query parameter and JMESPath in the next-generation Azure CLI preview to select properties, filter results, and capture values in variables.
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: concept-article
ms.date: 11/16/2026
ms.custom: devx-track-azurecli
ai-usage: ai-generated
---

# Query Azure CLI command output (preview)

Every Azure CLI preview command accepts the global `--query` parameter. `--query` applies a [JMESPath](https://jmespath.org/) query to the command result before Azure CLI renders it in the output format you choose. Use it to return only the properties you need, filter lists, and capture single values in shell variables.

The examples in this article use resource groups, because `az group list` and `az group show` return a small, predictable set of properties, such as `name`, `location`, and `tags`.

## Prerequisites

- Azure CLI preview, installed and signed in. For more information, see [Sign in interactively with the Azure CLI (preview)](authenticate-azure-cli-interactively.md).
- At least one resource group in your subscription.

## Select a property

To return one property from a single object, pass the property name:

```bash
az group show --name <resource-group> --query location
```

To return several properties, create a new object with a _multiselect hash_. Each key is the name you want in the output, and each value is a property path:

```bash
az group show --name <resource-group> --query "{Name:name, Location:location}"
```

To reach a nested property, separate the names with periods, for example `tags.environment`.

## Work with lists

Commands that return lists, such as `az group list`, return a JSON array. Use `[]` to apply an expression to every element:

```bash
az group list --query "[].name"
az group list --query "[].{Name:name, Location:location}"
```

Use an index to select one element, for example `[0].name` for the first resource group.

## Filter results

Use a _filter expression_, `[?condition]`, to keep only the elements that match a condition. Enclose string literals in single quotes:

```bash
az group list --query "[?location=='eastus'].name"
az group list --query "[?tags.environment=='test'].{Name:name, Location:location}"
```

JMESPath also includes functions. For example, to count the resource groups in a location:

```bash
az group list --query "length([?location=='eastus'])"
```

The double-quoted query strings in this article work in Bash, zsh, and PowerShell, because they contain no `$` characters or other characters that the shells expand.

## Save a value in a variable

When a query returns a single value, Azure CLI renders it in TSV format by default, as plain text without quotation marks. To make scripts explicit, add `--output tsv`:

# [Bash](#tab/bash)

```bash
location=$(az group show --name <resource-group> --query location --output tsv)
echo "$location"
```

# [PowerShell](#tab/powershell)

```powershell
$location = az group show --name <resource-group> --query location --output tsv
$location
```

---

The `clients.cli.output.simpleFormat` configuration setting controls the default format for single values. For more information, see [Configuration management](azure-cli-configuration.md).

## Related content

- For more information, see [Output formats for Azure CLI commands (preview)](format-output-azure-cli.md).
- For more information, see the [JMESPath specification](https://jmespath.org/specification.html).
- For more information, see [Configuration management](azure-cli-configuration.md).
