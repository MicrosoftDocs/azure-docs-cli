---
title: Azure CLI Extensions
description: Using extensions with the Azure CLI
keywords: Azure CLI, Extensions
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/07/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Use extensions with Azure CLI 

The Azure CLI offers the capability to load extensions. Extensions are Python wheels that aren't shipped as part of the CLI but run as CLI commands.
With extensions, you gain access to experimental and pre-release commands along with the ability to write your own CLI interfaces. This article covers how to manage extensions and answers common questions about their use.

## Find extensions

To see the extensions provided and maintained by Microsoft, use the [az extension list-available](/cli/azure/extension#az-extension-list-available) command.

```azurecli-interactive
az extension list-available --output table
```

We also host a [list of extensions](azure-cli-extensions-list.md) on the documentation site.

## Install extensions

Once you have found an extension to install, use [az extension add](https://docs.microsoft.com/cli/azure/extension#az-extension-add) to get it. If the extension is listed in `az extension list-available`, you can install the extension by name.

```azurecli-interactive
az extension add --name <extension-name>
```

If the extension is from an external resource or you have a direct link to it, provide the source URL or local path. The extension _must_ be a compiled Python wheel file.

```azurecli-interactive
az extension add --source <URL-or-path>
```

Once an extension is installed, it's found under the value of the `$AZURE_EXTENSION_DIR` shell variable. If this variable is unset, by default the value is `$HOME/.azure/cliextensions` on
Linux and macOS, and `%USERPROFILE%\.azure\cliextensions` on Windows.

## Update extensions

If an extension was installed by name, update it using [az extension update](https://docs.microsoft.com/cli/azure/extension#az-extension-update).

```azurecli-interactive
az extension update --name <extension-name>
```

Otherwise, an extension can be updated from source by following the [Install extensions](#install-extensions) instructions.

If an extension name can't be resolved by the CLI, uninstall it and attempt to reinstall. The extension could also have become part of the base CLI.
Try updating the CLI as described in [Install the Azure CLI](install-azure-cli.md) and see if the extension's commands were added.

## Uninstall extensions

If you no longer need an extension, remove it with [az extension remove](https://docs.microsoft.com/cli/azure/extension#az-extension-remove).

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

Yes. Extensions may replace existing commands, but before running a command that has been replaced the CLI will issue a warning.

### How can I tell if an extension is in pre-release?

An extension's documentation and versioning will show if it's in pre-release. Microsoft often releases preview commands as CLI extensions, with the option
of moving them into the main CLI product later. When commands are moved out of extensions, the old extension should be uninstalled. 

### Can extensions depend upon each other?

No. Since the CLI doesn't guarantee a load order, dependencies might not be satisfied. Removing an extension won't affect any others.

### Are extensions updated along with the CLI?

No. Extensions must be updated separately, as described in [Update extensions](#update-extensions).
