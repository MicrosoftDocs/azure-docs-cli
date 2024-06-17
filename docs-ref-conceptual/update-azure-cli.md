---
title: How to update the Azure CLI | Microsoft Docs
description: Learn how to update the Azure Command-Line Interface (CLI) by performing a manual update or enabling autoupgrade for the CLI.
author: jiasli
ms.author: jiasli
ms.date: 08/1/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli 
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: update azure cli
---

# How to update the Azure CLI

You can rely on package managers to update a local install of the Azure CLI on Windows, macOS and Linux environments (see the `Update` section in each platform-specific install instruction). The CLI also provides in-tool commands to upgrade manually or automatically.

## Manual Update
[!INCLUDE [az-upgrade](includes/az-upgrade.md)]

`az upgrade` is supported on Windows, macOS and some Linux distros as long as installation is supported. It only supports upgrading to the latest version. If you're running the Azure CLI through Azure Cloud Shell, you're most likely already using the most recent Azure CLI install. If not due to cases like ad-hoc release of a minor bug fix version, you need to wait for the next build of Azure Cloud Shell as `az upgrade` isn't supported in Azure Cloud Shell.

When `azure-cli` is already the latest version, running `az upgrade` checks and updates all installed [extensions](azure-cli-extensions-overview.md).

## Automatic Update

By default, autoupgrade for Azure CLI is disabled. If you would like to keep up with the latest version, you can enable autoupgrade through [configuration](../latest/docs-ref-autogen/config.yml).

```azurecli
az config set auto-upgrade.enable=yes
```

The Azure CLI will check new versions regularly and prompt you to upgrade after any command finishes running once the update is available.

The prompt message and output messages during upgrade may interrupt your command result if it's assigned to some variable or in an automated flow. To avoid interruption, you can use the following configuration to allow the update to happen automatically without confirmation, and only show warnings and errors during the upgrade.

```azurecli
az config set auto-upgrade.prompt=no
```

By default, all installed extensions are also updated. You can disable extension update through configuration.

```azurecli
az config set auto-upgrade.all=no
```

> [!NOTE]
> Please wait for `az upgrade` to complete before proceeding to the next set of commands, else the new versions of the CLI (+extensions) may have breaking changes.

If you decide not to use the automatic update feature anymore for cases like keeping command scripts running stably, you can turn it off through configuration.
```azurecli
az config set auto-upgrade.enable=no
```