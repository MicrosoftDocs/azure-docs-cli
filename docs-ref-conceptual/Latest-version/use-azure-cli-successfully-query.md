---
title: Query Azure CLI command results | Microsoft Docs
description: Learn to use the Azure CLI --query parameter syntax and return information about Azure resources. Find tips to JMESPath syntax.
ms.custom: devx-track-azurecli
#customer intent: As a new user of the Azure CLI, I keep receiving errors when trying to use the --query parameter in commands.  I need to see examples that include syntax differences between Bash and PowerShell scripting languages.
---

# How to query Azure CLI command output using a JMESPath query

The Azure CLI uses the `--query` parameter to execute a [JMESPath query][04] on the results of
commands. JMESPath is a query language for JSON, giving you the ability to select and modify data
from CLI output.

All commands in Azure CLI support the `--query` parameter. This article covers how to use the
features of JMESPath and gives examples of queries. Learn about JMESPath concepts that are useful
for querying under the concepts tab. See examples of JMESPath queries under the examples tab.

# [Concepts](#tab/concepts)

[!INCLUDE [Query Concepts](includes/query-azure-cli-concepts.md)]

# [Examples](#tab/examples)

[!INCLUDE [Query Examples](includes/query-azure-cli-examples.md)]

---

## Next steps

To learn more about JMESPath queries, see [JMESPath Tutorial][05].

To learn more about other Azure CLI concepts mentioned in this article see:

- [Output formats for Azure CLI commands][01]
- [How to use Azure CLI effectively][03]
- [Learn to use Bash with Azure CLI][02]

<!-- link references -->

[01]: ./format-output-azure-cli.md
[02]: ./use-azure-cli-successfully-bash.md
[03]: ./use-azure-cli-successfully-tips.md
[04]: http://jmespath.org
[05]: https://jmespath.org/tutorial.html
