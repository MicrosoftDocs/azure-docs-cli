---
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/01/2023
ms.topic: include
ms.custom: devx-track-azurecli, linux-related-content
---

## Install Azure CLI

RPMs are released for Azure Linux through [CBL-Mariner](https://github.com/microsoft/CBL-Mariner).  The `azure-cli` package supports ARM64 architecture from CLI version [2.46.0](/cli/azure/release-notes-azure-cli#march-07-2023).

To install the Azure CLI, follow these steps:

1. Install the official Microsoft curated set of trusted root certificates:

    ```bash
    sudo tdnf install ca-certificates
    ```

2. Install Azure CLI:

    ```bash
    sudo tdnf install azure-cli
    ```

## Install specific version

Available versions can be found at [Azure CLI release notes](../release-notes-azure-cli.md).

To view available versions with command:

```bash
tdnf list azure-cli
```

To install specific version:

```bash
sudo tdnf install azure-cli-<version>-1
```

## Update Azure CLI

Update the Azure CLI with the `tdnf update` command:

```bash
sudo tdnf update azure-cli
```

## Uninstall Azure CLI

[!INCLUDE [uninstall-boilerplate.md](uninstall-boilerplate.md)]

Remove the package from your system:

```bash
sudo tdnf remove azure-cli
```

### Remove data

[!INCLUDE [remove-data-boilerplate.md](remove-data-boilerplate.md)]
