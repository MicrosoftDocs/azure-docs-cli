---
title: Query Azure CLI command results | Microsoft Docs
description: Learn to use the Azure CLI --query parameter syntax and return information about Azure resources. Find tips to JMESPath syntax.
ms.date: 06/26/2024
ms.topic: concept-article
ms.custom: devx-track-azurecli
#customer intent: As a new user of the Azure CLI, I keep receiving errors when trying to use the --query parameter in commands.  I need to see examples that include syntax differences between Bash and PowerShell scripting languages.
---

# How to query Azure CLI command output using a JMESPath query

The Azure CLI uses the `--query` parameter to execute a [JMESPath query](http://jmespath.org) on the
results of commands. JMESPath is a query language for JSON, giving you the ability to select and
modify data from CLI output.

All commands in Azure CLI support the `--query` parameter. This article covers how to use the
features of JMESPath and gives examples of queries. Learn about JMESPath concepts that are useful
for querying under the concepts tab. See examples of JMESPath queries under the examples tab.

# [Concepts](#tab/concepts)

[!INCLUDE [Query Concepts](includes/query-azure-cli-concepts.md)]

# [Examples](#tab/examples)

[!INCLUDE [Query Examples](includes/query-azure-cli-examples.md)]

---

## Next steps

To learn more about JMESPath queries, see [JMESPath Tutorial](https://jmespath.org/tutorial.html).

To learn more about other Azure CLI concepts mentioned in this article see:

* [Output formats for Azure CLI commands](./format-output-azure-cli.md)
* [How to use Azure CLI effectively](./use-azure-cli-successfully-tips.md)
* [Learn to use Bash with Azure CLI](./use-azure-cli-successfully-bash.md)
