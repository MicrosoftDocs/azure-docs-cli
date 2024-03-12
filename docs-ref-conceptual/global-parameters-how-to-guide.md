---
title: Use global parameters using Azure CLI  | Microsoft Docs
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

When working with the Azure CLI, there are arguments that are available for most commands. These arguments are called "global parameters," as they are common to almost all Azure CLI reference commands.

## `--help` global parameter

If you find that you need some help with required and global parameters, you can use the `--help` global parameter in order to generate a list of definition for each required and global parameter. You can also view a basic example for the command you are trying to run:


```azurecli-interactive
az group create --name myResourceGroup --location eastus --help
```

Output console:
The output content has been shortened due to readability.

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

Learn more in-depth details about logging by adding the `--verbose` global parameter to your reference command. This is helpful when trying to understand why certain commands take longer than others to execute.

```azurecli-interactive
az group create --name myResourceGroup --location eastus --verbose 
```

Output console:

The output content has been shortened since the content is repeated from the first step. This is to highlight the specific output the `--verbose` parameter provides.

```output
{...}
Command ran in 1.413 seconds (init: 0.487, invoke: 0.926)
```

## `--debug` global parameter

If the additional details from the `--verbose` parameter aren't enough and you wish to view the entire log, you can use the `--debug` global parameter. Provide output generated with `--debug` when submitting a bug report.

```azurecli-interactive
az group create --name myrResourceGroup --location eastus --debug
```

Output console:

The output content has been shortened due to readability and repeated content from the first step.

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

During the process of debugging, you may want to only highlight the actual errors and filter out the warnings. To do so, use the `--only-show-errors` global parameter to only show errors and suppress any warnings. For the following example, see the difference of the first line of the output when including the `--only-show-errors` global parameter:

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

Output console:

```output
Any comments or concerns? You can use the 'feedback' command! We would greatly appreciate it.

A new Recommender is added which can make the completion ability more intelligent and provide the scenario completion!
If you want to disable this feature, you can use 'az config set interactive.enable_recommender=False' to disable it.

A command preload mechanism was added to prevent lagging and command run errors.
You can skip preloading in a single pass by CTRL+C or turn it off by setting 'az config set interactive.enable_preloading=False'

Loading command table... Expected time around 1 minute.
```

## `--subscription` global parameter

You can use the `--subscription` global parameter to set a specific subscription for a command:

The following example changes the active subscription using the subscription ID:

```azurecli-interactive
az account set --subscription "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
```

## `--output` global parameter

To show the output of a command in a specific format, specifying the `--output` global parameter. To learn more about configuring output, see [Output formats for Azure CLI commands](../docs-ref-conceptual/format-output-azure-cli.md). In this example, the output is shown as a table:

> [!NOTE]
> The accepted values for output are: json, jsonc, none, table, tsv, yaml, and yamlc. The default output value is set to json. 


```azurecli-interactive
az vm list --resource-group myResourceGroup --output table
```

Output console:

```output
Name    ResourceGroup    Location    Zones
------  ---------------  ----------  -------
myVm    myResourceGroup        eastus
```

## `--query` global parameter

There are times the output console may display extensive amounts of information that you may want to filter through. To do so, you can use the `--query` global parameter to execute a [JMESPath query](http://jmespath.org) on the results of commands. JMESPath is a query language for JSON, which gives you the ability to select and modify data from the Azure CLI output.

Most commands in Azure CLI support the `--query` parameter. To learn more about querying your command output, see [How to query Azure CLI command output using a JMESPath query](../docs-ref-conceptual/query-azure-cli.md)

This example returns the SSH public keys authorized to connect to the VM by adding a query:

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

## See also

- [Azure CLI configuration](./azure-cli-configuration.md)
- [Use the Azure CLI successfully](./use-cli-effectively.md)

