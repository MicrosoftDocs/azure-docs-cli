---
title: How to use the Azure CLI alias extension
description: The alias extension allows users to define custom commands for the Azure CLI using existing commands. Learn how to use the Azure CLI alias extension.
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure cli alias extension, alias extension, alias commands
---

# How to use the Azure CLI alias extension

The alias extension allows users to define custom commands for the Azure CLI using existing
commands. Aliases help keep your workflow simple by allowing shortcuts. The Jinja2 template engine
powers Azure CLI aliases and offers advanced argument processing.

> [!NOTE]
> The Alias Extension is in public preview. The features and configuration file format might change.

## Install the alias extension

The minimum required Azure CLI version to use the alias extension is **2.0.28**. To check your CLI
version, run `az --version`. If you need to update your installation, follow the instructions in
[Install the Azure CLI][01].

Install the alias extension with the [az extension add][02]
command.

```azurecli-interactive
az extension add --name alias
```

Verify the installation of the extension with [az extension list][03]. If the alias extension
installs properly, it appears in the command output.

```azurecli-interactive
az extension list --output table --query '[].{Name:name}'
```

```output
Name
------
alias
```

## Keep the alias extension up-to-date

The alias extension is under active development and new versions are released regularly. However,
new versions aren't installed when you update the CLI. Install the updates for the extension with
[az extension update][05].

```azurecli-interactive
az extension update --name alias
```

## Manage aliases for the Azure CLI

The alias extension lets you create and manage aliases for other CLI commands. To view all the
available commands and parameter details, run the alias command with `--help`.

```azurecli-interactive
az alias --help
```

## Create simple alias commands

One use of aliases is for shortening existing command groups or command names. For example, you can
shorten the `group` command group to `rg` and the `list` command to `ls`.

```azurecli-interactive
az alias create --name rg --command group
az alias create --name ls --command list
```

You can now use these newly defined aliases anywhere their definitions apply.

```azurecli-interactive
az rg list
az rg ls
az vm ls
```

Don't include `az` as part of the alias command.

Aliases can also be shortcuts for complete commands. The next example lists available resource
groups and their locations in table output:

```azurecli-interactive
az alias create --name ls-groups --command "group list --query '[].{Name:name, Location:location}' --output table"
```

Now `ls-groups` can be run like any other CLI command.

```azurecli-interactive
az ls-groups
```

## Create an alias command with arguments

You can also add positional arguments to an alias command by including them as `{{ arg_name }}` in
the alias name. The whitespace inside the braces is required.

```azurecli-interactive
az alias create --name "alias_name {{ arg1 }} {{ arg2 }} ..." --command "invoke_including_args"
```

The next example alias shows you how to use positional arguments to get a VM's public IP address.

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

You can also use environment variables in aliased commands, which are evaluated at runtime. The next
example adds the `create-rg` alias, which creates a resource group in `eastus` and adds an `owner`
tag. This tag is assigned the value of the local environment variable `USER`.

```azurecli-interactive
az alias create \
    --name "create-rg {{ groupName }}" \
    --command "group create --name {{ groupName }} --location eastus --tags owner=\$USER"
```

To register environment variables inside the alias command, you must escape the dollar sign (`$`).

## Process arguments using Jinja2 templates

[Jinja2][08] performs the argument substitution in the
alias extension. Jinja2 templates allow for manipulating the arguments.

With Jinja2 templates, you can write aliases that take different types of arguments than the
underlying command. For example, you can make an alias that takes a storage URL. Then this URL is
parsed to pass the account and container names to the storage command.

```azurecli-interactive
az alias create \
    --name 'storage-ls {{ url }}' \
    --command "storage blob list
        --account-name {{ url.replace('https://', '').split('.')[0] }}
        --container-name {{ url.replace('https://', '').split('/')[1] }}"
```

To learn about the Jinja2 template engine, see [the Jinja2 documentation][06].

## Alias configuration file

Another way to create and modify aliases is to alter the alias configuration file. Alias command
definitions are written into a configuration file, located at `$AZURE_CONFIG_DIR/alias`. The default
value of `AZURE_CONFIG_DIR` is `$HOME/.azure` on macOS and Linux, and `%USERPROFILE%\.azure` on
Windows. The alias configuration file is written in the INI configuration file format. The format
for alias commands is:

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

The next example shows an alias for a command with arguments. This command gets the public IP
address for a VM. Aliased commands must all be on a single line, and use all of the arguments in the
alias name.

```ini
[get-vm-ip {{ resourceGroup }} {{ vmName }}]
command = vm list-ip-addresses --resource-group {{ resourceGroup }} --name {{ vmName }} --query [0].virtualMachine.network.publicIpAddresses[0].ipAddress
```

## Uninstall the alias extension

To uninstall the extension, use the [az extension remove][04] command.

```azurecli-interactive
az extension remove --name alias
```

If you uninstalled because of a bug or other problem with the extension, [file a GitHub issue][07]
so that we can provide a fix.

<!-- updated link references -->

[01]: ./install-azure-cli.md
[02]: /cli/azure/extension#az_extension_add
[03]: /cli/azure/extension#az_extension_list
[04]: /cli/azure/extension#az_extension_remove
[05]: /cli/azure/extension#az_extension_update
[06]: http://jinja.pocoo.org/docs/2.10/templates/
[07]: https://github.com/Azure/azure-cli-extensions/issues
[08]: https://jinja.palletsprojects.com/en/stable/
