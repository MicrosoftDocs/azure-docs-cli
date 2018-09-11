---
title: Azure CLI 2.0 alias extension
description: How to use the Azure CLI 2.0 alias extension
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/07/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# The Azure CLI 2.0 alias extension

The alias extension allows users to define custom commands for the Azure CLI by using existing commands. Aliases help keep your workflow simple by allowing shortcuts. Since aliases are powered by the Jinja2 template engine, they even offer advanced argument processing.

> [!NOTE]
> The Alias Extension is in public preview. The features and configuration file format may change.

## Install the alias extension

The minimum required Azure CLI version to use the alias extension is **2.0.28**. To check your CLI version, run `az --version`. If you need to update your installation,  follow the instructions in [Install the Azure CLI 2.0](./install-azure-cli.md).

Install the extension with the [az extension add](/cli/azure/extension#az-extension-add) command.

```azurecli-interactive
az extension add --name alias
```

Verify the installation of the extension with [az extension list](/cli/azure/extension#az-extension-list). If the alias extension was installed properly, it's listed in the command output.

```azurecli-interactive
az extension list --output table --query '[].{Name:name}'
```

```output
Name
------
alias
```

## Keep the extension up-to-date

The alias extension is under active development and new versions are released regularly. New versions aren't installed when you update the CLI. Install the updates for the extension with [az extension update](/cli/azure/extension#az-extension-update).

```azurecli-interactive
az extension update --name alias
```

## Manage aliases for the Azure CLI

The alias extension lets you create and manage aliases for other CLI commands. To view all the available commands and parameter details, run the alias command with `--help`.

```azurecli-interactive
az alias --help
```

## Create simple alias commands

One use of aliases is for shortening existing command groups or command names. For example, you can shorten the `group` command group to `rg` and the `list` command to `ls`.

```azurecli-interactive
az alias create --name rg --command group
az alias create --name ls --command list
```

These newly defined aliases can now be used anywhere that their definition would be.

```azurecli-interactive
az rg list
az rg ls
az vm ls
```

Do not include `az` as part of the command.

Aliases can also be shortcuts for complete commands. The next example lists available resource groups and their locations in table output:

```azurecli-interactive
az alias create --name ls-groups --command "group list --query '[].{Name:name, Location:location}' --output table"
```

Now `ls-groups` can be run like any other CLI command.

```azurecli-interactive
az ls-groups
```

## Create an alias command with arguments

You can also add positional arguments to an alias command by including them as `{{ arg_name }}` in the alias name. The whitespace inside the braces is required.

```azurecli-interactive
az alias create --name "alias_name {{ arg1 }} {{ arg2 }} ..." --command "invoke_including_args"
```

The next example alias shows how to use positional arguments to get the public IP address for a VM.

```azurecli-interactive
az alias create \
    --name "get-vm-ip {{ resourceGroup }} {{ vmName }}" \
    --command "vm list-ip-addresses --resource-group {{ resourceGroup }} --name {{ vmName }}
        --query [0].virtualMachine.network.publicIpAddresses[0].ipAddress"
```

When running this command, you give values to the positional arguments.

```azurecli-interactive
az get-vm-ip MyResourceGroup MyVM
```

You can also use environment variables in aliased commands, which are evaluated at runtime. The next example adds the `create-rg` alias, which creates a resource group in `eastus` and adds an `owner` tag. This tag is assigned the value of the local environment variable `USER`.

```azurecli-interactive
az alias create \
    --name "create-rg {{ groupName }}" \
    --command "group create --name {{ groupName }} --location eastus --tags owner=\$USER"
```

To register the environment variables inside the command of the alias, the dollar sign `$` must be escaped.

## Process arguments using Jinja2 templates

Argument substitution in the alias extension is performed by [Jinja2](http://jinja.pocoo.org/docs/2.10/). Jinja2 templates allow for manipulating the arguments.

With Jinja2 templates, you can write aliases that take different types of arguments than the underlying command. For example, you can make an alias that takes a storage URL. Then this URL is parsed to pass the account and container names to the storage command.

```azurecli-interactive
az alias create \
    --name 'storage-ls {{ url }}' \
    --command "storage blob list
        --account-name {{ url.replace('https://', '').split('.')[0] }}
        --container-name {{ url.replace('https://', '').split('/')[1] }}"
```

To learn about the Jinja2 template engine, see [the Jinja2 documentation](http://jinja.pocoo.org/docs/2.10/templates/).

## Alias configuration file

Another way to create and modify aliases is to alter the alias configuration file. Alias command definitions are written into a configuration file, located at `$AZURE_USER_CONFIG/alias`. The default value of `AZURE_USER_CONFIG` is `$HOME/.azure` on macOS and Linux, and `%USERPROFILE%\.azure` on Windows. The alias configuration file is written in the INI configuration file format. The format for alias commands is:

```ini
[alias_name]
command = invoked_commands
```

For aliases that have positional arguments, the format for alias commands is:

```ini
[alias_name {{ arg1 }} {{ arg2 }} ...]
command = invoked_commands_including_args
```

## Create an alias command with arguments via the alias configuration file

The next example shows an alias for a command with arguments. This command gets the public IP address for a VM. Aliased commands must all be on a single line, and use
all of the arguments in the alias name.

```ini
[get-vm-ip {{ resourceGroup }} {{ vmName }}]
command = vm list-ip-addresses --resource-group {{ resourceGroup }} --name {{ vmName }} --query [0].virtualMachine.network.publicIpAddresses[0].ipAddress
```

## Uninstall the alias extension

To uninstall the extension, use the [az extension remove](/cli/azure/extension#az-extension-remove) command.

```azurecli-interactive
az extension remove --name alias
```

If you uninstalled because a bug or other problem with the extension, [file a GitHub issue](https://github.com/Azure/azure-cli-extensions/issues) so that we can provide a fix.
