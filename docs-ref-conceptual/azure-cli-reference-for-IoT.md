---
title: Azure CLI references for Azure IoT | Microsoft Docs
description: Find Azure CLI core and extension reference commands to manage Azure IoT. With over 100 different commands available, you can work effectively with Azure IoT from a command line.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: reference
ms.date: 06/19/2023
ms.service: azure-cli
ms.reviewer: paymaun.heidari
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, azure iot, azure maps, azure tsi
---

# Azure CLI reference commands for Azure IoT

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources for many Azure services. For Azure IoT, over 100 different commands are available, which give you the ability to work effectively with the service from a command-line.

The Azure CLI commands for [Azure IoT](/azure/iot-fundamentals/) are composed of two parts: Azure CLI (commonly referred to as CLI **core**) and the Azure CLI **extension** for IoT .

IoT functionality in Azure CLI **core** is focused on infrastructure management and configuration. IoT Hub CRUD operations, or configuring IoT Hub message routes are typical use cases for core commands.

The Azure CLI **extension** for IOT introduces rich features and functionality to manage, manipulate and interact with the data, entities and objects on the infrastructure itself. For example, managing fleets of devices, monitoring device-to-cloud events, and invoking cloud to device methods are all enabled via the IoT extension. The Azure CLI extension for IoT unlocks the use of experimental or pre-release technology, which contributes to its versatility in various scenarios and use cases. Azure CLI extensions are automatically installed the first time you run an extension reference. For more information about extension references, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the `az extension add` command to manually install an extension.

## Reference command List

List of Azure CLI references that can be used to manage Azure IoT, reference type and reference descriptions:

| Reference | Core or extension | Description
|-|-|-|
| [az dt](../latest/docs-ref-autogen/dt.yml) | Extension | Manage Azure Digital Twins solutions & infrastructure.
| [az iot](../latest/docs-ref-autogen/iot.yml) | Both  | All available Azure CLI core commands for Azure IoT.
| [az iot central](../latest/docs-ref-autogen/iot/central.yml) | Both | Manage IoT Central assets.
| [az iot device](../latest/docs-ref-autogen/iot/device.yml) | Extension | Leverage device-to-cloud and cloud-to-device messaging capabilities.
| [az iot du](../latest/docs-ref-autogen/iot/du.yml) | Extension | Manage Device Update for IoT Hub infrastructure, updates, and deployments.
| [az iot dps](../latest/docs-ref-autogen/iot/dps.yml) | Both | Manage Azure IoT Hub Device Provisioning Service.
| [az iot edge](../latest/docs-ref-autogen/iot/edge.yml) | Extension | Manage IoT solutions on the Edge.
| [az iot hub](../latest/docs-ref-autogen/iot/hub.yml) | Both | Manage Azure IoT Hub infrastructure.
| [az iot product](../latest/docs-ref-autogen/iot/product.yml) | Extension | Manage device testing for product certification.

## Additional Azure CLI commands for Azure services used by IoT

| Reference | Type | Description
|-|-|-|
| [az maps](../latest/docs-ref-autogen/maps.yml) | core | Manage Azure Maps.
| [az tsi](../latest/docs-ref-autogen/tsi.yml) | extension | Manage Azure Time Series Insights.

## Popular IoT articles using the Azure CLI

- [Create an IoT hub](/azure/iot-hub/iot-hub-create-using-cli)
- [Manage IoT Central](/azure/iot-central/core/howto-manage-iot-central-from-cli)
- [CLI-driven device tutorials using Azure RTOS](/azure/rtos/getting-started?branch=master)
- [Deploy and monitor IoT Edge modules at scale with the Azure CLI extension for IoT](/azure/iot-edge/how-to-deploy-cli-at-scale)
- [Send telemetry from a device to an IoT hub and monitor it with the Azure CLI](/azure/iot-hub/quickstart-send-telemetry-cli)
- [Use the Azure CLI to configure IoT Hub message routing](/azure/iot-hub/tutorial-routing?tabs=cli)
- [Create a Device Update account and instance](/azure/iot-hub-device-update/create-device-update-account?tabs=cli)

## Azure CLI reference examples

Examples are provided with every Azure CLI reference. Although you can also complete these tasks through the Azure portal, using the Azure CLI requires a command line. Here are a few code blocks to give you an idea of how easy it is to use the Azure CLI.

To work with Azure IoT, you first need a resource group. Azure resource groups are simple to create and manage with the Azure CLI.  

```azurecli
#create a resource group
az group create --location westus --name MyResourceGroup
```

```azurecli
#get a list of resource groups for a subscription
az group list --subscription MySubscription --output table
```

It's also easy to create an Azure IoT Hub.

```azurecli
#create an Azure IoT hub
az iot hub create --resource-group MyResourceGroup --name MyIotHub --location westus
```

## See also

* [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.
* Discover additional [reference commands](../latest/docs-ref-autogen/reference-index.yml) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)
