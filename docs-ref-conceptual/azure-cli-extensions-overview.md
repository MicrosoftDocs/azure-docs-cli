---
title: How to install and manage Azure CLI extensions | Microsoft Docs
description: Learn how to find, install, uninstall, and manage extensions with Azure CLI. Use the Azure CLI to load extensions provided and maintained by Microsoft.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/2/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli 
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: manage extensions, microsoft extensions, install extensions, uninstall extensions, azure extensions, azure cli extensions
---

# Use and manage extensions with the Azure CLI 

The Azure CLI offers the capability to load extensions. Extensions for the Azure CLI are characterized as Python wheels that aren't shipped as part of the CLI but run as CLI commands.
With extensions, you gain access to experimental and prerelease commands along with the ability to write your own CLI interfaces. This article covers how to manage extensions and answers common questions about their use.

## How to find extensions

To see the Azure CLI extensions provided and maintained by Microsoft, use the [az extension list-available](/cli/azure/extension#az-extension-list-available) command.

```azurecli-interactive
az extension list-available --output table
```

We also host a [list of extensions](azure-cli-extensions-list.md) on the documentation site.

## How to install extensions

### Install extensions manually

Once you have found an extension to install, use [az extension add](/cli/azure/extension#az-extension-add) to get it. If the extension is listed in `az extension list-available`, you can install the extension by name.

```azurecli-interactive
az extension add --name <extension-name>
```

If the extension is from an external resource or you have a direct link to it, provide the source URL or local path. The extension _must_ be a compiled Python wheel file.

```azurecli-interactive
az extension add --source <URL-or-path>
```

You can also build a private extension index following the format in [index.json](https://github.com/Azure/azure-cli-extensions/blob/master/src/index.json), then set the extension index URL used by Azure CLI to it starting from version `2.20.0`. After that, you can install the extension by name from the private extension index.

```azurecli-interactive
az config set extension.index_url=<URL>
az extension add --name <extension-name>
```

Once an extension is installed, it's found under the value of the `$AZURE_EXTENSION_DIR` shell variable. If this variable is unset, by default the value is `$HOME/.azure/cliextensions` on
Linux and macOS, and `%USERPROFILE%\.azure\cliextensions` on Windows.

### Install extensions automatically

When you run an extension command that isn't installed, the Azure CLI can recognize the command you run, and automatically install the extension for you starting from version `2.10.0`. This feature, referred to as **dynamic install**, is enabled by default since `2.12.0`. You can also enable it through configuration for previous supported versions.
```azurecli-interactive
az config set extension.use_dynamic_install=yes_prompt
```

Use the following configuration command to enable dynamic install without a prompt.
```azurecli-interactive
az config set extension.use_dynamic_install=yes_without_prompt
```

Use the following configuration command to turn off the dynamic install feature to revert to the default behavior. The extension command returns a command-not-found error if the extension isn't installed.
```azurecli-interactive
az config set extension.use_dynamic_install=no
```

By default, an extension command that prompts dynamic install will continue to run after the extension is installed. You can change the default behavior and make the command exit without a rerun by setting the `run_after_dynamic_install` property to `no`.
```azurecli-interactive
az config set extension.run_after_dynamic_install=no
```

## How to update extensions

If you install an extension by name, update it using [az extension update](/cli/azure/extension#az-extension-update).

```azurecli-interactive
az extension update --name <extension-name>
```

Otherwise, an extension can be updated from source by following the [Install extensions](#how-to-install-extensions) instructions.

If you can't use CLI to resolve an extension name, uninstall it and attempt to reinstall. The extension could also have become part of the base CLI.
Try updating the CLI as described in [Install the Azure CLI](install-azure-cli.md) and see if the extension's commands were added.

## How to uninstall extensions

If you no longer need an extension, remove it with [az extension remove](/cli/azure/extension#az-extension-remove).

```azurecli-interactive
az extension remove --name <extension-name>
```

You can also remove an extension manually by deleting it from the location where it was installed. The `$AZURE_EXTENSION_DIR` shell variable defines where modules are installed.
If this variable is unset, by default the value is `$HOME/.azure/cliextensions` on Linux and macOS, and `%USERPROFILE%\.azure\cliextensions` on Windows.

```bash
rm -rf $AZURE_EXTENSION_DIR/<extension-name>
```

## FAQ

Here are some answers to other common questions about CLI extensions.

### What file formats are allowed for installation?

Currently, only compiled Python wheels can be installed as extensions.

### Can extensions replace existing commands?

Yes. Extensions may replace existing commands, but before running a command that has been replaced the CLI issues a warning.

### How can I tell if an extension is in prerelease?

An extension's documentation and versioning shows if it's in prerelease. Microsoft often releases preview commands as CLI extensions, with the option
of moving them into the main CLI product later. When commands are moved out of extensions, the old extension should be uninstalled. 

### Can extensions depend upon each other?

No. Since the CLI doesn't guarantee a load order, dependencies might not be satisfied. Removing an extension doesn't affect any others.

### Are extensions updated along with the CLI?

No. Extensions must be updated separately, as described in [Update extensions](#how-to-update-extensions).

### How to develop our own extension?
Refer to the official repository for more help. [Azure/azure-cli-extensions](https://github.com/Azure/azure-cli/tree/master/doc/extensions)
