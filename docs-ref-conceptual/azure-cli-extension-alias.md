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

The alias extension allows users to define custom commands for the Azure CLI by using existing commands. Aliases help keep your workflow concise and simple by allowing shortcuts and giving you the ability to use positional arguments. Since aliases are powered by the Jinja2 template engine, they even offer advanced argument processing.

> [!NOTE]
> The Alias Extension is in public preview. The features and configuration file format may change.

## Install the alias extension

The minimum required Azure CLI version to use the alias extension is **2.0.28**. To check your CLI version, run `az --version`. If you need to update your installation,  follow the instructions in [Install the Azure CLI 2.0](./install-azure-cli.md).

Install the extension with the [az extension add](/cli/azure/extension#az_extension_add) command.

```azurecli
az extension add --name alias
```

Verify the installation of the extension with [az extension list](/cli/azure/extension#az_extension_list). If the alias extension was installed properly, it's listed in the command output.

```azurecli
az extension list --output table
```

```output
ExtensionType    Name                       Version
---------------  -------------------------  ---------
whl              alias                      0.2.0
```

## Keep the extension up to date

The alias extension is under active development and new versions are released regularly. New versions are not automatically installed whenever you update the CLI. Install the updates for the extension with [az extension update](/cli/azure/extension#az_extension_update).

```azurecli
az extension update --name alias
```

## Alias commands file format

Alias command definitions are written into a configuration file, located at `$AZURE_USER_CONFIG/alias`. The default value of `AZURE_USER_CONFIG` is `$HOME/.azure` on macOS and Linux, and `%USERPROFILE%\.azure` on Windows. The alias configuration file is written in the INI configuration file format. The general format for alias commands is:

```
[command_name]
command = invoked_commands
```

Don't include `az` as part of the command.

## Create simple alias commands

One use of aliases is for shortening existing command groups or command names. For example, you can shorten the `group` command group to `rg` and the `list` command to `ls`.

```
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

Aliases can also be shortcuts for complete commands. The next example lists available resource groups and their locations in table output:

```
[ls-groups]
command = group list --query '[].{Name:name, Location:location}' --output table
```

Now `ls-groups` can be run like any other CLI command.

```azurecli
az ls-groups
```

## Create an alias command with arguments

You can also add positional arguments to an alias command by including them as `{{ arg_name }}` in the alias name. The whitespace inside the curly braces is required.

```
[alias_name {{ arg1 }} {{ arg2 }} ...]
command = invoke_including_args
```

The next example alias shows how to use positional arguments to get the public IP address for a VM.

```
[get-vm-ip {{ resourceGroup }} {{ vmName }}]
command = vm list-ip-addresses --resource-group {{ resourceGroup }} --name {{ vmName }} --query [0].virtualMachine.network.publicIpAddresses[0].ipAddress
```

When running this command, you give values to the positional arguments.

```azruecli
az get-vm-ip MyResourceGroup MyVM
```

You can also use environment variables in commands invoked by aliases, which are evaluated at runtime. The next example adds the `create-rg` alias, which creates a resource group in `eastus` and adds an `owner` tag. This tag is assigned the value of the local environment variable `USER`.

```
[create-rg {{ groupName }}]
command = group create --name {{ groupName }} --location eastus --tags owner=$USER
```

## Process arguments using Jinja2 templates

Argument substitution in the alias extension is performed by [Jinja2](http://jinja.pocoo.org/docs/2.10/), giving you full access to the capabilities of the Jinja2 template engine. Templates allow you to perform actions like data extraction and substitution on strings.

With Jinja2 templates, you can write aliases which take different types of arguments than the underlying command. For example, you can make an alias which takes a storage URL. Then this URL is parsed to pass the account and container names to the storage command.

```
[storage-ls {{ url }}]
command = storage blob list --account-name {{ url.replace('https://', '').split('.')[0] }} --container-name {{ url.replace('https://', '').split('/')[1] }}
```

To learn about the Jinja2 template engine, see [the Jinja2 documentation](http://jinja.pocoo.org/docs/2.10/templates/).

## Uninstall the alias extension

To uninstall the extension, use the [az extension remove](/cli/azure/extension#az_extension_remove) command.

```bash
az extension remove --name alias
```

If you uninstalled due to a bug or other problem with the extension, please [file a GitHub issue](https://github.com/Azure/azure-cli-extensions) so that we can provide a fix.
