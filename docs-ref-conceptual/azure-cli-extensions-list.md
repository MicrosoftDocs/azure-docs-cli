---
title: Available extensions for the Azure CLI 2.0
description: A complete list of the officially supported extensions for the Azure CLI 2.0.
author: derekbekoe
ms.author: debekoe
manager: routlaw
ms.date: 03/15/2018
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Available extensions for the Azure CLI 2.0

This article is a complete list of the available extensions for the Azure CLI 2.0 which are offered and supported by Microsoft.

The list of extensions is also available directly from the CLI. To get it, run [az extension list-available](/cli/azure/extension?view=azure-cli-latest#az_extension_list_available):

```azurecli
az extension list-available --query '*[].{Name:metadata.name, Version:metadata.version, Summary:metadata.summary}' --output table
```

## aem

```azurecli
az extension add --name aem
```

CLI Extension to manage Azure Enhanced Monitoring Extension for SAP

_Latest version:_ `0.1.0`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)


## alias

```azurecli
az extension add --name alias
```

Azure CLI Alias Extension

_Latest version:_ `0.1.1`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)


## azure-batch-cli-extensions

```azurecli
az extension add --name azure-batch-cli-extensions
```

Microsoft Azure Command-Line Tools Extended Batch Command Module

_Latest version:_ `2.1.0`

_Project URL:_ [https://github.com/Azure/azure-batch-cli-extensions](https://github.com/Azure/azure-batch-cli-extensions)


## azure-cli-iot-ext

```azurecli
az extension add --name azure-cli-iot-ext
```

Azure IoT CLI Extension

_Latest version:_ `0.4.1`

_Project URL:_ [https://github.com/azure/azure-iot-cli-extension](https://github.com/azure/azure-iot-cli-extension)


## dns

```azurecli
az extension add --name dns
```

An Azure CLI Extension for DNS zones

_Latest version:_ `0.0.1`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)


## eventhubs

```azurecli
az extension add --name eventhubs
```

An Azure CLI Extension to manage Event Hubs resources

_Latest version:_ `0.0.1`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)


## image-copy-extension

```azurecli
az extension add --name image-copy-extension
```

An Azure CLI Extension that copies images from region to region.

_Latest version:_ `0.0.5`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)


## managementgroups

```azurecli
az extension add --name managementgroups
```

An Azure CLI Extension for Management Groups

_Latest version:_ `0.1.0`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)


## managementpartner

```azurecli
az extension add --name managementpartner
```

An Azure CLI Extension for Management Partner

_Latest version:_ `0.1.0`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)


## rdbms

```azurecli
az extension add --name rdbms
```

An Azure CLI Extension to manage Azure MySQL and Azure PostgreSQL resources

_Latest version:_ `0.0.3`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)


## servicebus

```azurecli
az extension add --name servicebus
```

An Azure CLI Extension to manage servicebus resources

_Latest version:_ `0.0.1`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)


## subscription

```azurecli
az extension add --name subscription
```

An Azure CLI Extension to manage Subscription Definitions

_Latest version:_ `0.1.0`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)

## webapp

```azurecli
az extension add --name webapp
```

An Azure CLI Extension to manage appservice resources

_Latest version:_ `0.1.2`

_Project URL:_ [https://github.com/Azure/azure-cli-extensions](https://github.com/Azure/azure-cli-extensions)