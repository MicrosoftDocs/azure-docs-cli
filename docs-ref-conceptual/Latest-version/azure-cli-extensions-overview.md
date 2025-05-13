---
title: Manage Azure CLI Extensions - Install, Update, and Remove
description: Learn how to install, update, and manage Azure CLI extensions. Use Microsoft or custom extensions to enhance your CLI experience and automate tasks.
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: manage extensions, microsoft extensions, install extensions, uninstall extensions, azure extensions, azure cli extensions
---

# Manage Azure CLI Extensions: Install, Update, and Remove

The Azure CLI offers the capability to load extensions. Extensions for the Azure CLI are
characterized as Python wheels that aren't shipped as part of the CLI but run as CLI commands. With
extensions, you gain access to experimental and prerelease commands along with the ability to write
your own CLI interfaces. This article covers how to manage extensions and answers common questions
about their use.

## How to find extensions

To see the Azure CLI extensions provided and maintained by Microsoft, use the
[az extension list-available][02] command.

```azurecli-interactive
az extension list-available --output table
```

We also host a [list of extensions][07] on the documentation site.

## How to install extensions

### Install extensions manually

After you find an extension to install, use [az extension add][01] to install it. If the extension
appears in the output of `az extension list-available`, you can install it by name.

```azurecli-interactive
az extension add --name <extension-name>
```

If the extension is from an external resource or you have a direct link to it, provide the source
URL or local path. The extension _must_ be a compiled Python wheel file.

```azurecli-interactive
az extension add --source <URL-or-path>
```

You can also build a private extension index following the format in [index.json][08], then set the
extension index URL used by Azure CLI to it starting from version `2.20.0`. After that, you can
install the extension by name from the private extension index.

```azurecli-interactive
az config set extension.index_url=<URL>
az extension add --name <extension-name>
```

After you install an extension, it appears under the value of the `$AZURE_EXTENSION_DIR` shell
variable. If this variable is unset, the default location is `$HOME/.azure/cliextensions` on Linux
and macOS, and `%USERPROFILE%\.azure\cliextensions` on Windows.

### Install extensions automatically

When you run an extension command that isn't installed, the Azure CLI can recognize the command you
run, and automatically install the extension for you starting from version `2.10.0`. This feature,
known as **dynamic install**, is enabled by default starting with version `2.12.0`. You can also
enable it through configuration for previous supported versions.

```azurecli-interactive
az config set extension.use_dynamic_install=yes_prompt
```

Use the following configuration command to enable dynamic install without a prompt.

```azurecli-interactive
az config set extension.use_dynamic_install=yes_without_prompt
```

Use the following configuration command to turn off the dynamic install feature to revert to the
default behavior. The extension command returns a command-not-found error if the extension isn't
installed.

```azurecli-interactive
az config set extension.use_dynamic_install=no
```

By default, an extension command that prompts for a dynamic install continues to run after the
extension is installed. You can change the default behavior and make the command exit without a
rerun by setting the `run_after_dynamic_install` property to `no`.

```azurecli-interactive
az config set extension.run_after_dynamic_install=no
```

## How to update extensions

If you install an extension by name, update it using [az extension update][04].

```azurecli-interactive
az extension update --name <extension-name>
```

Otherwise, an extension can be updated from source by following the [Install extensions][05]
instructions.

If you can't use the CLI to resolve an extension name, uninstall the extension and try reinstalling
it. The extension might also be part of the base CLI. Update the CLI as described in
[Install the Azure CLI][10] and check whether the extension's commands are available.

## How to uninstall extensions

If you no longer need an extension, remove it with [az extension remove][03].

```azurecli-interactive
az extension remove --name <extension-name>
```

You can also remove an extension manually by deleting it from the location where it was installed.
The `$AZURE_EXTENSION_DIR` shell variable defines where modules are installed. If this variable is
unset, by default the value is `$HOME/.azure/cliextensions` on Linux and macOS, and
`%USERPROFILE%\.azure\cliextensions` on Windows.

```bash
rm -rf $AZURE_EXTENSION_DIR/<extension-name>
```

## FAQ

Here are some answers to other common questions about CLI extensions.

### What file formats are allowed for installation?

Currently, only compiled Python wheels can be installed as extensions.

### Can extensions replace existing commands?

Yes. Extensions can replace existing commands, but the CLI issues a warning before running a
replaced command.

### How can I tell if an extension is in prerelease?

An extension's documentation and versioning shows if it's in prerelease. Microsoft often releases
preview commands as CLI extensions, with the option of moving them into the main CLI product later.
When commands are moved out of extensions, the old extension should be uninstalled.

### Can extensions depend upon each other?

No. Since the CLI doesn't guarantee a load order, dependencies might not be satisfied. Removing an
extension doesn't affect any others.

### Are extensions updated along with the CLI?

No. Extensions must be updated separately, as described in [Update extensions][06].

### How to develop our own extension?

Refer to the official repository for more help. [Azure/azure-cli-extensions][09]

<!-- updated link references -->

[01]: /cli/azure/extension#az-extension-add
[02]: /cli/azure/extension#az-extension-list-available
[03]: /cli/azure/extension#az-extension-remove
[04]: /cli/azure/extension#az-extension-update
[05]: #how-to-install-extensions
[06]: #how-to-update-extensions
[07]: azure-cli-extensions-list.md
[08]: https://github.com/Azure/azure-cli-extensions/blob/master/src/index.json
[09]: https://github.com/Azure/azure-cli/tree/master/doc/extensions
[10]: install-azure-cli.md
