---
title: Azure CLI configuration options
description: How to configure the Azure CLI 2.0
keywords: Azure CLI, configuration, settings, Azure
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 11/30/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Azure CLI 2.0 configuration

The Azure CLI 2.0 allows for user configuration to override default settings and provide default options for
some required parameters. These settings are evaluated in the following order, with higher items on the list taking
precedence.

1. Configuration options specified in the command line
2. Environment variables
3. Values in `$AZURE_CONFIG_DIR/config`. The default value of `AZURE_CONFIG_DIR` is `$HOME/.azure/config` on Linux and macOS, and
`%USERPROFILE%\.azure\config` on Windows.

## Configuration file format

Configuration files are written in the [INI file format](https://docs.python.org/3/library/configparser.html#supported-ini-file-structure). These files
are separated into sections with a `[section]` header, with each section containing a list of key/value entries written as `key=value` . Section names are 
case-sensitive, while key names are not. Comments are any line that begins with a `#` or `;`, inline comments are not allowed. Boolean values are case-insensitive
and can be written as any of the following.

| True | False |
|------|-------|
| 1 | 0 |
| yes | no |
| true | false |
| on | off |

The following is an example configuration file for the CLI.

```
; Global defaults
[defaults]
location=westus2

[core]
disable_confirm_prompt=Yes

[logging]
enable_log_file=yes
log_dir=~/.azure/logs
```

## Configuration values

The following table contains all of the sections and option names that can be placed in a configuration file. Their corresponding
environment variables can be set as `AZURE\_{section}\_{name}`. Sections are case-sensitive, and names are not.

| Section | Name      | Type | Description|
|---------|-----------|------|------------|
| __defaults__ | group | string | The default resource group to use for all commands which take the `--resource-group` argument. |
| | location | string | The default location to use for all commands which take the `--location` argument. |
| | web | string | The default app name to use for all `az webapp` subcommands which take the `--name` argument. |
| | vm | string | The default VM name to use for all `az vm` subcommands which take the `--name` argument. |
| | vmss | string | The default VMSS name to use for all `az vmss` subcommands which take the `--name` argument. |
| | acr | string | The default container registry name to use for all `az acr` subcommands which take the `--name` argument. |
| | acs | string | The default container service name to use for all `az acs` subcommands which take the `--name` argument. |  
| __core__    | output    | string | The default output format. Can be one of 'json', 'jsonc', 'tsv', or 'table'. |
| | disable\_confirm\_prompt | boolean | Turn confirmation prompts on/off. |
| | collect\_telemetry | boolean | Allow Microsoft to collect anonymous data on the usage of the CLI. For privacy information, see the [Azure CLI 2.0 Terms of Use](aka.ms/AzureCliLegal). |
| __logging__ | enable\_log\_file | boolean | Turn logging on/off. |
| | log\_dir | path | The directory to write logs to. By default this is `$AZURE\_CONFIG\_DIR/logs`. |
| __storage__ | connection\_string | string | The default connection string to use with storage commands. |
| | account | string | The default account to use with storage commands. |
| | key | string | The default key to use with storage commands. | 
| | sas\_token | string | The default SAS token to use with storage commands. |
| __batchai__ | storage\_account | string | The default storage account to use with Azure Batch AI. |
| | storage\_key | string | The default storage key to use with Azure Batch AI. |
| __batch__ | account | string | The default account to use with Azure Batch. |
| | access\_key | string | The default access key to use with Azure Batch. Only used with `aad` authorization. |
| | endpoint | string | The default endpoint to connect to with Azure Batch. |
| | auth\_mode | string | The authorization mode to use. Can be `shared\_key` or `aad`. |


