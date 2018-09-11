---
title: Azure CLI configuration options
description: How to configure the Azure CLI 2.0
keywords: Azure CLI, configuration, settings, Azure
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 05/16/2018 
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---
# Azure CLI 2.0 configuration

The Azure CLI 2.0 allows for user configuration for settings such as logging, data collection, and default argument values.
The CLI offers a convenience command for managing some defaults, `az configure`. Other values can be set in a
configuration file or with environment variables.

Configuration values used by the CLI are evaluated in the following precedence, with items higher on the list taking priority.

1. Command-line parameters
2. Environment variables
3. Values in the configuration file or set with `az configure`

## CLI configuration with az configure

You set defaults for the CLI with the [az configure](/cli/azure/reference-index#az-configure) command.
This command takes one argument, `--defaults`, which is a space-separated list of `key=value` pairs. The provided values are used by the CLI in place of
required arguments.

The following table contains a list of available configuration keys.

| Name | Description |
|------|-------------|
| group | The default resource group to use for all commands. |
| location | The default location to use for all commands. |
| web | The default app name to use for `az webapp` commands. |
| vm | The default VM name to use for `az vm` commands. |
| vmss | The default virtual machine scale set (VMSS) name to use for  `az vmss` commands. |
| acr | The default container registry name to use for `az acr` commands. |

As an example, here's how you would set the default resource group and location for all commands.

```azurecli-interactive
az configure --defaults location=westus2 group=MyResourceGroup
```

## CLI configuration file

The CLI configuration file contains other settings that are used for managing CLI behavior. The configuration file itself is located
at `$AZURE_CONFIG_DIR/config`. The default value of `AZURE_CONFIG_DIR` is `$HOME/.azure` on Linux and macOS,
and `%USERPROFILE%\.azure` on Windows.

Configuration files are written in the INI file format. This file format is defined by section headers, followed by a list of key-value entries.

* Section headers are written as `[section-name]`. Section names are case-sensitive.
* Entries are written as `key=value`. Key names are not case-sensitive.
* Comments are any line that begins with a `#` or `;`. Inline comments are not allowed.

Booleans are case-insensitive, and are represented by the following values.

* __True__: 1, yes, true, on
* __False__: 0, no, false, off

Here's an example of a CLI configuration file that disables any confirmation prompts and sets up logging to the `/var/log/azure` directory.

```ini
[core]
disable_confirm_prompt=Yes

[logging]
enable_log_file=yes
log_dir=/var/log/azure
```

See the next section for details on all of the available configuration values and what they mean. For the full details on the INI file format,
see the [Python documentation on INI](https://docs.python.org/3/library/configparser.html#supported-ini-file-structure).

## CLI configuration values and environment variables

The following table contains all of the sections and option names that can be placed in a configuration file. Their corresponding
environment variables are set as `AZURE_{section}_{name}`, in all caps. For example, the `storage_account` default for `batchai` is set 
in the `AZURE_BATCHAI_STORAGE_ACCOUNT` variable.

When you provide a default value, that argument is no longer required by any command. Instead, the default value is used.

| Section | Name      | Type | Description|
|---------|-----------|------|------------|
| __core__ | output | string | The default output format. Can be one of `json`, `jsonc`, `tsv`, or `table`. |
| | disable\_confirm\_prompt | boolean | Turn confirmation prompts on/off. |
| | collect\_telemetry | boolean | Allow Microsoft to collect anonymous data on the usage of the CLI. For privacy information, see the [Azure CLI 2.0 Terms of Use](https://aka.ms/AzureCliLegal). |
| __logging__ | enable\_log\_file | boolean | Turn logging on/off. |
| | log\_dir | string | The directory to write logs to. By default this value is `${AZURE_CONFIG_DIR}/logs`. |
| __storage__ | connection\_string | string | The default connection string to use for `az storage` commands. |
| | account | string | The default account name to use for `az storage` commands. |
| | key | string | The default account key to use for `az storage` commands. |
| | sas\_token | string | The default SAS token to use for `az storage` commands. |
| __batchai__ | storage\_account | string | The default storage account to use for `az batchai` commands. |
| | storage\_key | string | The default storage key to use for `az batchai` commands. |
| __batch__ | account | string | The default Azure Batch account name to use for `az batch` commands. |
| | access\_key | string | The default access key to use for `az batch` commands. Only used with `aad` authorization. |
| | endpoint | string | The default endpoint to connect to for `az batch` commands. |
| | auth\_mode | string | The authorization mode to use for `az batch` commands. Can be `shared_key` or `aad`. |

> [!NOTE]
> You may see other values in your configuration file, but these are managed directly through CLI commands,
> including `az configure`. The ones listed in the table above are the only values you should change yourself.