---
title: Azure CLI 2.0 Extensions
description: Using extensions with the Azure CLI 2.0
keywords: Azure CLI, Extensions
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 03/15/2018
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Using extensions with the Azure CLI 2.0

Extensions are individual modules not shipped with the Azure CLI itself that add functionality through new commands. These might be experimental or pre-release offerings, specialized tools from Microsoft, or custom features you
write yourself. Extensions allow for a degree of flexibility with the CLI that let you modify it to your own needs, without having to ship a lot of additional packages that aren't considered part of the core feature set.

This article helps you understand how to install, update, and remove extensions for the CLI. It should also answer common questions about extension behavior.

## Finding extensions

In order to know what extensions are available, you can use [az extension list-available](/cli/azure/extension?view=azure-cli-latest#az_extension_list_available). This command lists the official extensions provided and maintained by Microsoft.

```azurecli
az extension list-available --query '*[].{Name:metadata.name, Version:metadata.version, Summary:metadata.summary}' --output table
```

We also host a [list of Microsoft extensions](azure-cli-extensions-list.md) on the documentation site.

## Installing extensions

Once you have found an extension to install, use [az extension add](https://docs.microsoft.com/en-us/cli/azure/extension?view=azure-cli-latest#az_extension_add) to get it. If the extension is 
listed in `az extension list-available`, you can install the extension by name.

```azurecli
az extension add --name <extension-name>
```

If the extension is from an external resource or you have a direct link to it, you can provide the source URL or local path. This _must_ be a compiled Python wheel file.

```azurecli
az extension add --source <URL-or-path>
```

Once an extension is installed, it can be found under the value of the `$AZURE_EXTENSION_DIR` shell variable. If this variable is unset, by default the value is `$HOME/.azure/cliextensions` on 
Linux and macOS, and `%USERPROFILE%\.azure\cliextensions` on Windows.

## Updating extensions

Extensions can only be updated by name, using [az extension update](https://docs.microsoft.com/en-us/cli/azure/extension?view=azure-cli-latest#az_extension_update).

```azurecli
az extension update --name <extension-name>
```

If an extension name cannot be resolved by the CLI for whatever reason, reinstall the extension to
update it. There is also the possibility that the extension was moved out of preview and became a
built-in command for the CLI. In that case, update the CLI and uninstall the extension.

## Uninstalling extensions

If you no longer need an extension, it can be removed with [az extension remove](https://docs.microsoft.com/en-us/cli/azure/extension?view=azure-cli-latest#az_extension_remove).

```azurecli
az extension remove --name <extension-name>
```

You can also remove an extension manually by deleting it from the location where it was installed. This will be the value of the `$AZURE_EXTENSION_DIR` shell variable. 
If this variable is unset, by default the value is `$HOME/.azure/cliextensions` on Linux and macOS, and `%USERPROFILE%\.azure\cliextensions` on Windows.

```bash
rm -rf $AZURE_EXTENSION_DIR/<extension-name>
```

It is recommended that you uninstall using `az extension remove`.

## FAQ

Here are some answers to other common questions about CLI extensions.

### What file formats are allowed for installation?

Currently, only compiled Python wheels can be installed as extensions.

### Can extensions replace existing commands?

Yes. Extensions may replace existing commands, but before running a command that has been replaced the CLI will issue a warning.

### How can I tell if an extension is in pre-release?

An extension should indicate through its own documentation and versioning if it is in pre-release. It is also common for Microsoft to release preview commands for the CLI as extensions,
with plans to move them into the main CLI interface once the product is out of preview.

### Can extensions depend upon each other?

No. Extensions must be individual packages which do not rely on one another. This is because the CLI gives no guarantee about when extensions are loaded, so dependencies could not 
be guaranteed to be satisfied. Installing an extension installs that extension only, and it should continue to work even if you remove other extensions.

### Are extensions updated along with the CLI?

No. Extensions must be updated separately, as described in the [Updating extensions](#updating-extensions) section.
