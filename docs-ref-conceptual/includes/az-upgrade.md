---
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 09/25/2020
ms.topic: include
ms.custom: devx-track-azurecli
---
The CLI provides an in-tool command to update to the latest version:

```azurecli
az upgrade
```

> [!NOTE]
>
> The `az upgrade` command was added in version 2.11.0 and will not work with versions prior to 2.11.0. Older versions can be updated by reinstalling as described in [Install the Azure CLI](../install-azure-cli.md).
>
> This command will also update all installed extensions by default. For more `az upgrade` options, please refer to the [command reference page](/cli/azure/reference-index#az_upgrade).
