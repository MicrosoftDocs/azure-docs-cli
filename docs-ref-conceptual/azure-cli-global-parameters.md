---
title: Use global parameters with Azure CLI  | Microsoft Docs
description: Learn how to use various global parameters with Azure CLI to configure a resource group.
manager: jasongroce
author: daphnemamsft
ms.author: daphnema
ms.date: 08/2/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli 
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli, how to use azure cli, azure command line interface, how to open azure cli, azure cli commands
---

# Working with global parameters when using Azure CLI

When you work with the Azure CLI reference commands, there are arguments that are available for most
commands. These arguments are called "global parameters," as they're common to almost all Azure CLI
reference commands.

## `--help` global parameter

To get information about a reference group or command, use the `--help` global parameter. The
`--help` parameter displays Azure CLI reference information in your console including available
subgroup and parameter lists.


```azurecli-interactive
az group create --name myResourceGroup --location eastus --help
```

The following console output shown here has fields omitted for brevity:

```output
Command
    az group create : Create a new resource group.

Arguments
    --location -l                 [Required] : Location. Values from: `az account list-locations`.
                                               You can configure the default location using `az
                                               configure --defaults location=<location>`.
    --name --resource-group -g -n [Required] : Name of the new resource group.
    --managed-by                             : The ID of the resource that manages this resource
                                               group.
    --tags                                   : Space-separated tags: key[=value] [key[=value] ...].
                                               Use "" to clear existing tags.

Global Arguments
    --debug                                  : Increase logging verbosity to show all debug logs.
    --help -h                                : Show this help message and exit.
    --only-show-errors                       : Only show errors, suppressing warnings.

Examples
    Create a new resource group in the West US region.
        az group create -l westus -n MyResourceGroup
```

## `--verbose` global parameter

Learn more in-depth details about logging by adding the `--verbose` global parameter to your
reference command. Verbose output is helpful when trying to understand why certain commands take
longer than others to execute.

```azurecli-interactive
az group create --name myResourceGroup --location eastus --verbose 
```

The following console output shown here has fields omitted for brevity, but note the additional
information on the execution time.

```output
{...}
Command ran in 1.413 seconds (init: 0.487, invoke: 0.926)
```

## `--debug` global parameter

If the extra details from the `--verbose` parameter aren't enough and you wish to view the entire
log, use the `--debug` global parameter. Also provide the output generated with `--debug` when
submitting a bug report.

```azurecli-interactive
az group create --name myrResourceGroup --location eastus --debug
```

The following console output shown here has fields omitted for brevity:

```output

cli.knack.cli: Command arguments: ['group', 'create', '--name', 'myResourceGroup', '--location', 'eastus', '--debug']
cli.knack.cli: __init__ debug log:
[...]
cli.knack.cli: Event: CommandInvoker.OnTransformResult [<function _resource_group_transform at 0x000001D9B72123B0>, <function _x509_from_base64_to_hex_transform at 0x000001D9B7212440>]
cli.knack.cli: Event: CommandInvoker.OnFilterResult []
{...}
[...]
telemetry.process: Return from creating process
telemetry.main: Finish creating telemetry upload process.

```

## `--only-show-errors` global parameter

During the process of debugging, remove the warnings returned by a reference command by using the
`--only-show-errors` global parameter.

# [Without `--only-show-errors`](#tab/tabid-1)

```azurecli-interactive
az interactive 
```

Output console:

```output
**This command is in preview and under development. Reference and support levels: https://aka.ms/CLI_refstatus**

Any comments or concerns? You can use the 'feedback' command! We would greatly appreciate it.

A new Recommender is added which can make the completion ability more intelligent and provide the scenario completion!
If you want to disable this feature, you can use 'az config set interactive.enable_recommender=False' to disable it.

A command preload mechanism was added to prevent lagging and command run errors.
You can skip preloading in a single pass by CTRL+C or turn it off by setting 'az config set interactive.enable_preloading=False'

Loading command table... Expected time around 1 minute.
```

# [With `--only-show-errors`](#tab/tabid-2)

```azurecli-interactive
az interactive --only-show-errors
```

In this output, the warning of "This command is in preview..." hasn't been returned.

```output
Any comments or concerns? You can use the 'feedback' command! We would greatly appreciate it.

A new Recommender is added which can make the completion ability more intelligent and provide the scenario completion!
If you want to disable this feature, you can use 'az config set interactive.enable_recommender=False' to disable it.

A command preload mechanism was added to prevent lagging and command run errors.
You can skip preloading in a single pass by CTRL+C or turn it off by setting 'az config set interactive.enable_preloading=False'

Loading command table... Expected time around 1 minute.
```

## `--subscription` global parameter

You can use the `--subscription` global parameter to set a specific subscription for a command. The
following example changes the active subscription using the subscription ID:

```azurecli-interactive
az account set --subscription "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
```

## `--output` global parameter

To show the output of a command in a specific format, specify the `--output` global parameter. In
this example, the output is shown as a table:

> [!NOTE]
> The accepted values for output are: json, jsonc, none, table, tsv, yaml, and yamlc. The default output value is json.


```azurecli-interactive
az vm list --resource-group myResourceGroup --output table
```

Output console:

```output
Name    ResourceGroup    Location
------  ---------------  ----------
myVm    myResourceGroup  eastus
```

To learn more about the different output formats, see [Output formats for Azure CLI commands](../docs-ref-conceptual/format-output-azure-cli.md).

## `--query` global parameter

There are times the output console might display extensive amounts of information that you need to
filter through. To do so, use the `--query` global parameter to execute a [JMESPath query](http://jmespath.org)
on the results of commands. JMESPath is a query language for JSON, which gives you the ability to
select and modify data from Azure CLI output.

This example returns the SSH public keys authorized to connect to the virtual machine by adding `--query`:

```azurecli-interactive
 az vm show --resource-group myResourceGroup --name myVm --query "osProfile.linuxConfigurat
ion.ssh.publicKeys"
```

Output console:

```output
[
  {
    "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7WbiMEsB0iwdGPjeGXs3UWFtzbCkUwtIxzkIOpEtlqkLGa0XQdvwhzok6szq6Ycx/f4cfid/yrmBPtzmxdQnGeCy2FOcVIzp+SkjIUg/Ez2YyDcMb60u66QUmHPRyhipJ/PDZROt6O0092qfTkTjB+7hLRiZzV2raLjiQ95eV0AXUP+Gsvdo/7ytqWNIm3iQTWbQ/GwSg+p0v+kmZELIbrxo845dambSpgBL8g0wCUZaptru3ZHo9m0UWbFPASVJKauhfPCSVPQCaOCaAdB01Ih8QDVRCazT+jyV6GgTwUIXVQthVBbt56ibhuSUdf0cWF8IVncjH+WXexVAhQw0j",
    "path": "/home/daphnema/.ssh/authorized_keys"
  }
]
```

To learn more about querying command output, see [How to query Azure CLI command output using a JMESPath query](../docs-ref-conceptual/query-azure-cli.md).

## See also

- [Azure CLI configuration](./azure-cli-configuration.md)
- [Use the Azure CLI successfully](./use-cli-effectively.md)
