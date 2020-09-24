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
ms.reviewer: paymaun.heidari
ms.custom: devx-track-azurecli
---

# Azure CLI for Azure IoT

The Azure Command Line Interface ([Azure CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources.  It is available across many Azure services including Azure IoT.  There are over 100 references for Azure IoT giving you the ability to work effectively with IoT services from a command line.

## References for IoT

The Azure IoT CLI experience is composed of two parts: Azure CLI (commonly referred to as CLI **core**) and the Azure IoT CLI **extension**.

IoT functionality in Azure CLI **core** is focused on infrastructure management and configuration. IoT Hub CRUD operations, or configuring IoT Hub message routes are typical use cases for core commands.

The IoT **extension** introduces rich features and functionality to manage, manipulate and interact with the data, entities and objects on the infrastructure itself. For example managing fleets of devices, monitoring device-to-cloud events and invoking cloud to device methods are all enabled via the IoT extension. The Azure IoT extension for Azure CLI unlocks the use of experimental or pre-release technology contributing to its versatility in a variety of scenarios and use cases.

### Core reference commands

| Reference | Has extension | Description
|-|-|-|
| [az iot](/cli/azure/iot) | yes  | All available Azure CLI core commands for Azure IoT.
| [az iot central](/cli/azure/iot/central) | yes | Manage IoT Central assets.
| [az iot dps](/cli/azure/iot/dps) | yes | Manage Azure IoT Hub Device Provisioning Service.
| [az iot hub](/cli/azure/iot/hub) | yes | Manage Azure IoT Hub infrastructure.

### Extension reference commands

| Reference | Has core | Description
|-|-|-|
| [az iot](/cli/azure/ext/azure-iot/iot) | yes | All available Azure CLI extension commands for Azure IoT.
| [az iot central](/cli/azure/ext/azure-iot/iot/central) | yes | Manage Azure Central (IoT Central) solutions & infrastructure.
| [az iot device](/cli/azure/ext/azure-iot/iot/device) | | Leverage device-to-cloud and cloud-to-device messaging capabilities.
| [az dt](/cli/azure/ext/azure-iot/dt) | | Manage Azure Digital Twins solutions & infrastructure.
| [az iot dps](/cli/azure/ext/azure-iot/iot/dps) | yes | Manage entities in an Azure IoT Hub Device Provisioning Service.
| [az iot edge](/cli/azure/ext/azure-iot/iot/edge) | | Manage IoT solutions on the Edge.
| [az iot hub](/cli/azure/ext/azure-iot/iot/hub) | yes | Manage entities in an Azure IoT Hub.
| [az iot pnp](/cli/azure/ext/azure-iot/iot/pnp) | | Manage entities of an IoT Plug and Play model repository.

### Additional CLI commands for Azure services used by IoT

| Reference | Type | Description
|-|-|-|
| [az maps](/cli/azure/maps) | core | Manage Azure Maps.
| [az timeseriesinsights](/cli/azure/ext/timeseriesinsights/timeseriesinsights) | extension | Manage Azure Time Series Insights.

### Extension reference installation

Azure CLI extension references must be installed prior to use.  Use the [az extension add](./azure-cli-extensions-overview.md) command to install an extension reference by name.  Find out more about extension references in [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).

```azurecli
# install the Azure CLI extension reference for Azure IoT
az extension add --name azure-iot
```

## Popular IoT articles using the Azure CLI

- [Create an IoT hub](/azure/iot-hub/iot-hub-create-using-cli)
- [Manage IoT Central](/azure/iot-central/core/howto-manage-iot-central-from-cli)
- [CLI driven device tutorials using Azure RTOS](/azure/rtos/getting-started?branch=master)
- [Use the IoT extension for Azure IoT Hub device management](/azure/iot-hub/iot-hub-device-management-iot-extension-azure-cli-2-0)
- [Deploy and monitor IoT Edge modules at scale with the Azure CLI extension for IoT](/azure/iot-edge/how-to-deploy-cli-at-scale)
- [Send Telemetry to a device and monitor it with the Azure CLI extension for IoT](/azure/iot-hub/quickstart-send-telemetry-cli)
- [Use the Azure CLI to configure IoT Hub message routing](/azure/iot-hub/tutorial-routing-config-message-routing-cli)
- [Manage interfaces in a Plug and Play model repository](/azure/iot-pnp/howto-install-pnp-cli#manage-interfaces-in-a-model-repository)

## Azure CLI reference examples

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

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [released](/cli/azure/reference-index) and [extension](./azure-cli-extensions-list.md) references in the Azure CLI documentation.