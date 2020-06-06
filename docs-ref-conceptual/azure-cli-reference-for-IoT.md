---
title: Azure CLI references for Azure IoT
description: Azure CLI reference landing page for Azure IoT
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 06/05/2020
ms.author: dbradish
ms.service: azure-cli
ms.devlang: azurecli
---

# Azure CLI for Azure IoT

The Azure Command Line Interface ([Azure CLI](/cli/azure/what-is-azure-cli)) is a set of commands used to create and manage Azure resources.  It is available across many Azure services including Azure IoT.  There are over 100 references for Azure IoT giving you the ability to work effectively with IoT services from a command line.

## References for IoT

There are two type of Azure CLI references for IoT: released and extension.  Released references have been published as a permanent part of the Azure CLI.  Extension references haven't shipped as part of the CLI but run as CLI commands. With extensions, you gain access to experimental and pre-release commands.

| Reference | Extension | Description
|-|-|-|
| [az iot](/cli/azure/iot) | [extension](/cli/azure/ext/azure-iot/iot)  | All available Azure IoT commands.
| [az iot central](/cli/azure/iot/central) | [extension](/cli/azure/ext/azure-cli-iot-ext/iot/central) | Manage IoT Central assets.
| az iot device | [extension](/cli/azure/ext/azure-cli-iot-ext/iot/device) | Leverage device-to-cloud and cloud-to-device messaging capabilities.
| [az iot dps](/en-us/cli/azure/iot/dps) | [extension](/cli/azure/ext/azure-iot/iot/dps) | Manage Azure IoT Hub Device Provisioning Service.
| az iot dt | [extension](/cli/azure/ext/azure-cli-iot-ext/iot/dt) | Manage digital twin of an IoT Plug and Play device.
| az iot edge | [extension](/cli/azure/ext/azure-iot/iot/edge) | Manage IoT solutions on the Edge.
| [az iot hub](/cli/azure/iot/hub) | [extension](/cli/azure/ext/azure-cli-iot-ext/iot/hub) | Manage Azure IoT hubs.
| [az iot pnp](/cli/azure/iot/pnp) | [extension](/cli/azure/ext/azure-iot/iot/pnp) | Manage IoT Plug and Play repositories and repository access keys.

## Reference examples

Examples are provided with every Azure CLI reference. Although you can also complete these tasks through the Azure portal, using the Azure CLI requires a single command line.  Here are a few code blocks to give you an idea of how easy it is to use the Azure CLI.

To work with Azure IoT, you'll first need a resource group.  Azure resource groups are simple to create and manage with the Azure CLI.  

```azurecli
#create a resource group
az group create -location westus -name MyResourceGroup
```

```azurecli
#get a list of resource groups for a subscription
az group list --subscription MySubscription --output table
```

It is as straightforward to create an Azure IoT Hub in the '''westus''' region in the standard pricing tier.

```azurecli
#create an Azure IoT hub
az iot hub create --resource-group MyResourceGroup --name MyIotHub --location westus
```

## See also

* [Get started with Azure CLI](/cli/azure/get-started-with-azure-cli) to learn about installation and sign in.

* Discover additional [released](/cli/azure/reference-index) and [extension](/cli/azure/azure-cli-extensions-list) references in the Azure CLI documentation.

* Find out more about extension references in [Use extensions with Azure CLI](/cli/azure/azure-cli-extensions-overview).
