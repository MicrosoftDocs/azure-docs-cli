---
title: Azure CLI 2.0 alias extension
description: How to use the Azure CLI 2.0 alias extension
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 03/14/2018
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# The Azure CLI 2.0 alias extension

The alias extension allows users to define custom commands for the Azure CLI by using existing commands. Aliases help keep your workflow concise and simple by allowing shortcuts and giving you the ability to use positional arguments. Since aliases are powered internally with the Jinja2 engine, they even offer advanced inline argument processing.

> [!NOTE]
> The Alias Extension is in public preview. The features and configuration file format may change.

## Install the alias extension

The minimum required Azure CLI version to use the alias extension is **2.0.28**. To check your CLI version, run `az --version`. If you need to update your installation, see [Install the Azure CLI 2.0](./install-azure-cli.md).

Install the extension with the [az extension add](/cli/azure/extension#az_extension_add) command.

```azurecli
az extension add --name alias
```

Verify the installation of the extension with [az extension list](/cli/azure/extension#az_extension_list). If the alias extension was installed properly, you will see it in the command output.

```azurecli
az extension list --output table
```

```output
ExtensionType    Name                       Version
---------------  -------------------------  ---------
whl              alias                      0.2.0
```

## Keep the extension up to date

The alias extension is under active development and new versions are released regularly. New versions are not automatically installed whenever you update the CLI. Extension updates must be installed separately, using the [az extension update](/cli/azure/extension#az_extension_update) command.

```azurecli
az extension update --name alias
```

## Alias commands file format

To create an alias command, you need a configuration file to hold its definition. This file is located at `$AZURE_USER_CONFIG/alias`, where the default value of `AZURE_USER_CONFIG` is `$HOME/.azure` on macOS and Linux and `%USERPROFILE%\.azure` on Windows. The alias configuration file is written in the INI configuration file format. The general format for alias commands is:

```
[command_name]
command = invoked_commands
```

Don't include `az` as part of the invoked command.

## Create simple alias commands

One use of aliases is for shortening existing command groups or command names. The following example configuration shortens the `group` command group to `rg` and the `list` command to `ls`.

```azurecli
[rg]
command = group

[ls]
command = list
```

These newly defined aliases can now be used anywhere that their definition would be.

```azurecli
az rg list
az rg ls
az vm ls
```

Aliases can also be shortcuts for complete commands. For example, here is an alias named  that lists available resource groups and their locations as an ASCII table:

```
[lsgroups]
command = group list --query [].{Name:name, Location:location} --output table
```

Now `lsgroups` can be run like any other CLI command.

```azurecli
az lsgroups
```

This type of alias is most useful when you have a command you run often and want a short name for it.

## Create an alias command with arguments

You can also add positional arguments to an alias command, by including them as `{{ arg_name }}` in the alias name. The whitespace in the curly braces is required.

```
[alias_name {{ arg1 }} {{ arg2 }} ...]
command = invoke_including_args
```

You will be working with these types of aliases frequently to take advantage of brevity while still allowing arguments to be specified. These arguments can appear anywhere in the invoked command, and don't have to correspond to arguments of the original command.

In the following command, the name of a resource group and VM are used and the first available public IP address of the VM is returned.

```
[get-vm-ip {{ resourceGroup }} {{ vmName }}]
command = vm list-ip-addresses --resource-group {{ resourceGroup } --name {{ vmName }} --query [0].virtualMachine.network.publicIpAddresses[0].ipAddress
```

When running this command, you give values to the positional arguments. This example gets the IP information for the vm `MyVM` in the `MyResourceGroup` resource group.

```azruecli
az get-vm-ip MyResourceGroup MyVM
```

You can also use environment variables in commands invoked by aliases. These environment variables are evaluated at runtime. The next example adds the `create-rgrp` alias, which creates a new resource group in `eastus` and adds an `owner` tag with the value of the local `USER` environment variable.

```
[create-rgrp {{ groupName }}]
command = group create --name {{ groupName }} --location eastus --tags owner=$USER
```

## Process arguments using Jinja2 templates

Argument substitution in the alias extension is performed by [Jinja2](http://jinja.pocoo.org/docs/2.10/) and so when
expanding a positional argument, you have access to the full capabilities of the jinja template engine. Templates allow you to perform actions like data extraction and substitution on strings. The next example uses the functionality of Jinja2 templates to create an alias command that takes a storage URL and extracts the account and container names.

```
[storage-ls {{ url }}]
command = storage blob list --account-name {{ url.replace('https://', '').split('.')[0] }} --container-name {{ url.replace('https://', '').split('/')[1] }}
```

To learn about the full capabilities of the jinja template engine, see [the jinja template documentation](http://jinja.pocoo.org/docs/2.10/templates/).

## Uninstall the alias extension

To uninstall the extension, use the [az extension remove](/cli/azure/extension#az_extension_remove) command.

```bash
az extension remove --name alias
```

If you uninstalled due to a bug or other problem with the extension, please [file a GitHub issue](https://github.com/Azure/azure-cli-extensions) so that we can provide a fix.