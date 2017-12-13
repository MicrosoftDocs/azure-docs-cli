---
title: Azure CLI configuration options
description: How to configure the Azure CLI 2.0
keywords: Azure CLI, configuration, settings, Azure
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 12/13/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Azure CLI 2.0 configuration

The Azure CLI 2.0 allows for user configuration to override internal settings such as logging and data collection, and provide default options for
some required parameters. This is done through a configuration file or environment variables that are recognized by the CLI.

## Configuration file format

Configuration files are written in the INI file format. These files are separated into sections with a `[section]` header, with each 
section containing a list of key/value entries written as `key=value` . Section names are case-sensitive, while key names are not. 
Comments are any line that begins with a `#` or `;`, inline comments are not allowed. Booleans are case-insensitive, and are represented by the following values.

* __True__: 1, yes, true, on
* __False__: 0, no, false, off

Here's an example of a CLI configuration file, which defaults all `--location` arguments to use `westus2`, disables any confirmation prompts,
and turns on logging to the `/var/log/azure` directory.

```
; Global defaults
[defaults]
location=westus2

[core]
disable_confirm_prompt=Yes

[logging]
enable_log_file=yes
log_dir=/var/log/azure
```

See the next section for details on all of the available configuration values and what they mean. For the full details on the INI file format,
see the [Python documentation on INI](https://docs.python.org/3/library/configparser.html#supported-ini-file-structure).

## Configuration values

Configuration values are set in the configuration file, through environment variables, or as command-line options. These are evaluated in the following order, 
with items higher on the list taking precedence.

1. Command-line parameters
2. Environment variables
3. Values in the configuration file

The configuration file itself is located at `$AZURE_CONFIG_DIR/config`. The default value of `AZURE_CONFIG_DIR` is `$HOME/.azure/config` on Linux and macOS,
and `%USERPROFILE%\.azure\config` on Windows.

The following table contains all of the sections and option names that can be placed in a configuration file. Their corresponding
environment variables can be set as `AZURE_{section}_{name}`, in all caps. For example, the `location` value would be stored in the
environment variable `AZURE_DEFAULT_LOCATION`.

Any value that has a default available does not have to be present in the command line arguments, even if it is required. For example,
if a value for `location` is provided in the configuration or by an environment variable, the `--location` argument is no longer required
for any command.

| Section | Name      | Type | Description|
|---------|-----------|------|------------|
| __defaults__ | group | string | The default resource group to use for all commands. |
| | location | string | The default location to use for all commands. |
| | web | string | The default app name to use for `az webapp` commands. |
| | vm | string | The default VM name to use for `az vm` commands. |
| | vmss | string | The default VMSS name to use for  `az vmss` commands. |
| | acr | string | The default container registry name to use for `az acr` commands. |
| | acs | string | The default container service name to use for `az acs` commands. |  
| __core__ | output | string | The default output format. Can be one of `json`, `jsonc`, `tsv`, or `table`. |
| | disable\_confirm\_prompt | boolean | Turn confirmation prompts on/off. |
| | collect\_telemetry | boolean | Allow Microsoft to collect anonymous data on the usage of the CLI. For privacy information, see the [Azure CLI 2.0 Terms of Use](http://aka.ms/AzureCliLegal). |
| __logging__ | enable\_log\_file | boolean | Turn logging on/off. |
| | log\_dir | string | The directory to write logs to. By default this is `$AZURE\_CONFIG\_DIR/logs`. |
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


