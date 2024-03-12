---
title: Azure CLI configuration options | Microsoft Docs
description: The Azure CLI allows user configuration for various settings. Manage values with the az configure command, environment variables, or in the configuration file.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 08/2/2023 
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: environment variables, configuration file, configuration settings, user configuration, azure cli variables, azure cli configuration, cli configuration
---
# Azure CLI configuration

The Azure CLI allows for user configuration for settings such as logging, data collection, and default argument values. The CLI offers a convenience command for managing some defaults, `az config`, and an interactive option through `az init`.     Other values can be set in a configuration file or with environment variables. This article provides further information on these user configuration settings and how to configure the Azure CLI.

Configuration values used by the CLI are evaluated in the following precedence, with items higher on the list taking priority.

1. Command-line parameters
1. Environment variables
1. Values in the configuration file set with `az config` or `az init`

## Configure settings using az init

The easiest way to set Azure CLI configurations is to use the interactive [az init](/cli/azure/reference-index#az-init) command.  Choose a common configuration like "interaction" or "automation," or opt to walk through individual configurations.  What is especially helpful with this approach is `az init` provides reasons why you might want to choose one configuration option over another.

```azurecli-interactive
az init
```

## Configure settings using az config

You can set defaults for the CLI with the [az config set](/cli/azure/config#az-config-set) command.
This command takes a space-separated list of `key=value` pairs as an argument. The provided values are used by the Azure CLI in place of required arguments.

The following table contains a list of available configuration keys.

| Name | Description |
|------|-------------|
| defaults.group | The default resource group to use for all commands. |
| defaults.location | The default location to use for all commands. |
| defaults.web | The default app name to use for `az webapp` commands. |
| defaults.vm | The default VM name to use for `az vm` commands. |
| defaults.vmss | The default virtual machine scale set (VMSS) name to use for  `az vmss` commands. |
| defaults.acr | The default container registry name to use for `az acr` commands. |

As an example, here's how you would set the default resource group and location for all commands.

```azurecli-interactive
az config set defaults.location=westus2 defaults.group=MyResourceGroup
```

The following command turns off the survey links while executing the Azure CLI commands:

```azurecli-interactive
az config set output.show_survey_link=no
```

## CLI configuration file

The CLI configuration file contains other settings that are used for managing CLI behavior. The configuration file itself is located
at `$AZURE_CONFIG_DIR/config`. The default value of `AZURE_CONFIG_DIR` is `$HOME/.azure` on Linux and macOS,
and `%USERPROFILE%\.azure` on Windows.

Configuration files are written in the INI file format. Section headers define the file format, followed by a list of key-value entries.

* Section headers are written as `[section-name]`. Section names are case-sensitive.
* Entries are written as `key=value`. Key names aren't case-sensitive.
* Comments are any line that begins with a `#` or `;`. Inline comments aren't allowed.

Booleans are case-insensitive. The following values represent booleans:

* __True__: `1`, `yes`, `true`, `on`
* __False__: `0`, `no`, `false`, `off`

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
environment variables are set as `AZURE_{section}_{name}`, in all caps. For example, `output` default for `core` is set in the `AZURE_CORE_OUTPUT` variable, the `storage_account` default for `batchai` is set in the `AZURE_BATCHAI_STORAGE_ACCOUNT` variable, and the default `location` is set in the `AZURE_DEFAULTS_LOCATION` variable.

When you provide a default value, that argument is no longer required by any command. Instead, the default value is used.

| Section | Name      | Type | Description|
|---------|-----------|------|------------|
| __core__ | output | string | The default output format. Allowed values: `json` (default), `jsonc`, `yaml`, `yamlc`, `table`, `tsv`, `none`. For more information, see [Output formats for Azure CLI commands](format-output-azure-cli.md). |
| | disable\_confirm\_prompt | boolean | Turn confirmation prompts on/off. |
| | display\_region\_identified | boolean | Azure customers can choose to deploy resources in many different regions.  In some cases, customers may be able to reduce costs by selecting nearby regions offering the same services.  If a nearby region is identified, a message will display the region to select for future deployments. This setting controls if the message is displayed.
| | collect\_telemetry | boolean | Allow Microsoft to collect anonymous data on the usage of the CLI. For privacy information, see the [Azure CLI MIT license](https://github.com/Azure/azure-cli/blob/dev/LICENSE). |
| | only\_show\_errors | boolean | Only show errors during command invocation. In other words, only errors are written to `stderr`. It suppresses warnings from preview, deprecated and experimental commands. It's also available for individual commands with the `--only-show-errors` parameter. |
| | no\_color | boolean | Disable color. Originally colored messages are prefixed with `DEBUG`, `INFO`, `WARNING` and `ERROR`. This boolean bypasses the issue of a third-party library where the terminal's color can't revert back after a `stdout` redirection. |
| __clients__ | show_secrets_warning | boolean | Turn the warning for sensitive information output on/off. |
| __logging__ | enable\_log\_file | boolean | Turn logging on/off. |
| | log\_dir | string | The directory to write logs to. By default this value is `${AZURE_CONFIG_DIR}/logs*`. |
| __defaults__ | group | string | The default resource group to use for all commands. |
| | location | string | The default location to use for all commands. |
| | web | string | The default app name to use for `az webapp` commands. |
| | vm | string | The default VM name to use for `az vm` commands. |
| | vmss | string | The default virtual machine scale set (VMSS) name to use for `az vmss` commands. |
| | acr | string | The default container registry name to use for `az acr` commands. |
| __storage__ | account | string | The default storage account name (for example, **mystorageaccount** in `https://mystorageaccount.blob.core.windows.net`) to use for `az storage` data-plane commands (for example, `az storage container list`). |
| | key | string | The default access key to use for `az storage` data-plane commands. |
| | sas\_token | string | The default SAS token to use for `az storage` data-plane commands. |
| | connection\_string | string | The default connection string to use for `az storage` data-plane commands. |
| __batchai__ | storage\_account | string | The default storage account to use for `az batchai` commands. |
| | storage\_key | string | The default storage key to use for `az batchai` commands. |
| __batch__ | account | string | The default Azure Batch account name to use for `az batch` commands. |
| | access\_key | string | The default access key to use for `az batch` commands. Only used with `aad` authorization. |
| | endpoint | string | The default endpoint to connect to for `az batch` commands. |
| | auth\_mode | string | The authorization mode to use for `az batch` commands. Allowed values: `shared_key`, `aad`. |
| __cloud__ | name | string | The default cloud for all `az` commands.  Allowed values: `AzureCloud` (default), `AzureChinaCloud`, `AzureUSGovernment`. To change clouds, you can use the `az cloud set –name` command.  For an example, see [Manage Clouds with the Azure CLI](manage-clouds-azure-cli.md). |
| __extension__ | use_dynamic_install | string | Install an extension if it's not added yet when running a command from it. Allowed values: `no` (default), `yes_prompt`, `yes_without_prompt`. |
| | run_after_dynamic_install | boolean | Continue to run the command when an extension is dynamically installed for it. Default is `False`. |
| | index_url | string | URL of private extension index file following the format in [index.json](https://github.com/Azure/azure-cli-extensions/blob/main/src/index.json). Once specified, executing `az extension add --name <extension-name>` uses that file to find the extension to add. |

> [!NOTE]
> You may see other values in your configuration file, but these are managed directly through CLI commands,
> including `az config`. The ones listed in the table previously are the only values you should change yourself.
