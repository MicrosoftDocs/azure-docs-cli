---
author: chasecrum
ms.author: chasecrum
manager: mamccrea
ms.date: 12/19/2022
ms.topic: include
ms.custom: devx-track-azurecli
---

## Overview

RPMs are released for [CBL-Mariner](https://github.com/microsoft/CBL-Mariner) 2.0.

## Install

Install with the `tdnf install` command:

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
