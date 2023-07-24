---
author: chasecrum
ms.author: chasecrum
manager: mamccrea
ms.date: 07/13/2023
ms.topic: include
ms.custom: devx-track-azurecli
---

## Before you begin

- RPMs are released for [Azure Linux](https://github.com/microsoft/CBL-Mariner). 
- The `azure-cli` package supports ARM64 architecture from `2.46.0`.

## Install

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

## Update

Update the Azure CLI with the `tdnf update` command:

```bash
sudo tdnf update azure-cli
```

## Uninstall

[!INCLUDE [uninstall-boilerplate.md](uninstall-boilerplate.md)]

Remove the package from your system:

```bash
sudo tdnf remove azure-cli
```
