---
title: JMESPath query command results with Azure CLI | Microsoft Docs
description: The Azure CLI uses the --query argument to execute a JMESPath query on the results of commands. Learn how to use the features of JMESPath in this article.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/2/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords:
---
# How to query Azure CLI command output using a JMESPath query

The Azure CLI uses the `--query` parameter to execute a [JMESPath query](http://jmespath.org) on the results of commands. JMESPath is a query language for JSON, giving you the ability to select and modify data from CLI output.

All commands in Azure CLI support the `--query` parameter. This article covers how to use the features of JMESPath and gives examples of queries. Learn about JMESPath concepts that are useful for querying under the concepts tab. See examples of JMESPath queries under the examples tab.

# [Concepts](#tab/concepts)

[!INCLUDE [Query Concepts](includes/query-azure-cli-concepts.md)]

# [Examples](#tab/examples)

[!INCLUDE [Query Examples](includes/query-azure-cli-examples.md)]

---

## Next steps

To learn more about JMESPath queries, see [JMESPath Tutorial](https://jmespath.org/tutorial.html).

To learn more about other Azure CLI concepts mentioned in this article see:

* [Output formats for Azure CLI commands](./format-output-azure-cli.md)
* [How to use Azure CLI effectively](./use-azure-cli-successfully.md)
* [Learn to use Bash with Azure CLI](./azure-cli-learn-bash.md)
