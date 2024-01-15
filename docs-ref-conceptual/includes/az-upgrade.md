---
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/01/2023
ms.topic: include
ms.custom: devx-track-azurecli
---
Beginning with version [2.11.0](/cli/azure/release-notes-azure-cli#august-25-2020), the Azure CLI provides an in-tool command to update to the latest version.

```azurecli
az upgrade
```

This command also updates all installed extensions by default. For more `az upgrade` options, see the [command reference page](/cli/azure/reference-index#az_upgrade).  For Azure CLI versions prior to [2.11.0](/cli/azure/release-notes-azure-cli#august-25-2020), update by reinstalling as described in [Install the Azure CLI](../install-azure-cli.md).

If you are using ZIP distribution, please delete the old installation folder and extract the new version to the same location.