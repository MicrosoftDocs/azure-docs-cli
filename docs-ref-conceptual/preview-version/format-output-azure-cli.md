---
title: Output formats for Azure CLI commands (preview)
description: Learn about the output formats in the next-generation Azure CLI preview, how to choose one for each command, and how to set a default format and color behavior.
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: concept-article
ms.date: 11/16/2026
ms.custom: devx-track-azurecli
ai-usage: ai-generated
---

# Output formats for Azure CLI commands (preview)

The Azure CLI preview returns JSON by default. Use the global `--output` parameter, or its short form `-o`, to choose a different format for a single command, or change the default format with a configuration setting.

## Available formats

| Format | Description |
|--------|-------------|
| `json` | JSON. The default for objects and lists. |
| `jsonc` | Colorized JSON. |
| `table` | A table with column headers. Omits nested objects and arrays. |
| `tsv` | Tab-separated values with no keys or headers. Omits nested objects and arrays. The default for single values. |
| `yaml` | YAML. |
| `yamlc` | Colorized YAML. |

The classic Azure CLI also has a `none` format. The preview doesn't include it.

## Choose a format for a command

Add `--output` to any command:

```bash
az group list --output table
az group list -o yaml
```

Because `table` and `tsv` omit nested objects and arrays, use `--query` to choose the columns, including nested properties, that you want to see:

```bash
az group list --query "[].{Name:name, Location:location, Environment:tags.environment}" --output table
```

Use `tsv` to pass values to other commands or to save them in shell variables. For more information, see [Query Azure CLI command output (preview)](use-azure-cli-successfully-query.md).

## Change the default format

Two configuration settings control the default format when you don't specify `--output`:

| Setting | Default | Applies to |
|---------|---------|------------|
| `clients.cli.output.format` | `json` | Objects and lists |
| `clients.cli.output.simpleFormat` | `tsv` | Single values, such as the result of a `--query` that returns one property |

Both settings accept the same values as `--output`. For example, to show objects and lists as tables by default:

```bash
az config set --key clients.cli.output.format --value table
```

The `--output` parameter always overrides these settings.

## Control color

The `core.output.color` setting controls whether `jsonc` and `yamlc` output uses color:

- `auto` (default): Uses color unless the environment or output redirection indicates otherwise.
- `always`: Always uses color.
- `never`: Never uses color.

The `NO_COLOR` and `FORCE_COLOR` environment variables take precedence over this setting.

## Separate results from messages

Azure CLI writes only command results to standard output (stdout). Errors, warnings, and other diagnostic messages go to standard error (stderr). As a result, you can pipe or parse a command's output even when the command reports warnings.

## Related content

- For more information, see [Query Azure CLI command output (preview)](use-azure-cli-successfully-query.md).
- For more information, see [Configuration management](azure-cli-configuration.md).
