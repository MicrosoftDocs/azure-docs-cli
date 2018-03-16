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

# The Azure CLI 2.0 Alias Extension

The alias extension allows users to define custom commands for the Azure CLI, which invoke existing commands. These custom commands can take arguments, providing flexibility in setting up aliases to help you with your workflow. Aliases give you a way to increase your productivity even further in the CLI by letting you make your common uses of it concise and simple.

> [!NOTE]
> The Alias Extension is in public preview. The features and configuration file format are subject to change.

## Installing the Alias Extension

The minimum required Azure CLI version to use the alias extension is **2.0.28**. To check your CLI version, run `az --version`. If you need to update your installation, see [Install the Azure CLI 2.0](./install-azure-cli.md).

You install the extension with the [az extension add](/cli/azure/extension#az_extension_add).

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

New versions of the alias extension are released periodically, and are not included with any updates that you install for the CLI itself. You need to install extension updates separately, using the [az extension update](/cli/azure/extension#az_extension_update) command.

```azurecli
az extension update --name alias
```

## Alias commands file

To create an alias command, you need a configuration file to hold their definitions. This file is located at `$AZURE_USER_CONFIG/alias`, where the default value of `AZURE_USER_CONFIG` is `$HOME/.azure` on macOS and Linux, and `%USERPROFILE%\.azure` on Windows. The alias configuration file is written in the INI configuration file format. 

## Create a simple alias command

When adding a command to the alias configuration file, it uses the following format:

```
[alias_name]
command = invoked_commands
```

One use of this is for shortening existing command groups or command names. The following example configuration shortens the `group` command group to `rg` and the `list` command to `ls`.

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

Aliases can also be shortcuts for complete commands. For example, here is an alias named `lsgroups` which lists available resource groups and their locations as an ASCII table:

```
[lsgroups]
command = group list --query [].{Name:name, Location:location} --output table
```

Now `lsgroups` can be run like any other CLI command.

```azurecli
az lsgroups
```

This type of alias is most useful when you will be working with commands that don't take arguments, but you have a standard way that you want to format the output or specific parts of the response that you want to inspect.

## Create an alias command with arguments

You can also add positional arguments to an alias command, by including them as `{{ arg_name }}` in the alias name. The whitespace inside of the curly braces is required.

```
[alias_name {{ arg1 }} {{ arg2 }} ...]
command = invoke_including_args
```

This is the type of alias which you will be writing most often, taking advantage of the brevity offered by aliases while allowing for any arguments that need to be changed between command invokes. These arguments can appear anywhere inside of the invoked command, and don't have to correspond to arguments of the original command.

In the following command, the name of a resource group and VM are used and the first available public IP address of the VM is returned.

```
[get-vm-ip {{ resourceGroup }} {{ vmName }}]
command = vm list-ip-addresses --resource-group {{ resourceGroup } --name {{ vmName }} --query [0].virtualMachine.network.publicIpAddresses[0].ipAddress
```

When invoking this command, you use positional arguments. The following example uses the new alias to get the IP information for the vm `MyVM` in the `MyResourceGroup` resource group.

```azruecli
az get-vm-ip MyResourceGroup MyVM
```

You can also use environment variables in commands invoked by aliases. These environment variables are evaluated at runtime. The following example adds the `create-rgrp` command, which creates a new resource group in `eastus` and adds a tag indicating that the locally logged in user is the owner of it.

```
[create-rgrp {{ groupName }}]
command = group create --name {{ groupName }} --location eastus --tags owner=$USER
```

## Process arguments using Jinja 2 templates

Argument substitution in the alias extension is performed by [Jinja2](http://jinja.pocoo.org/docs/2.10/) and so when
expanding a positional argument, you have access to the full capabilities of the jinja template engine. This allows you to perform actions like data extraction and substitution on strings. The following example shows how the functionality of jinja templates can be used to create an alias command which takes a storage URL, and extracts the account and container names from it.

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

If you uninstalled due to a bug or other problem you were having with the extension, please [file a GitHub issue](https://github.com/Azure/azure-cli-extensions) so that we can provide a fix.