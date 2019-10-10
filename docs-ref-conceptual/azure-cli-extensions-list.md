---
title: Available extensions for the Azure CLI
description: A complete list of the officially supported extensions for the Azure CLI.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 10/10/2019
ms.topic: article
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Available extensions for the Azure CLI

This article is a complete list of the available extensions for the Azure CLI which are supported by Microsoft.

The list of extensions is also available  from the CLI. To get it, run [az extension list-available](/cli/azure/extension?view=azure-cli-latest#az-extension-list-available):

```azurecli-interactive
az extension list-available --output table
```

| Name | Version | Summary | Preview |
|------|---------|---------|---------|
| [aem](https://github.com/Azure/azure-cli-extensions) | 0.1.1 | Manage Azure Enhanced Monitoring Extensions for SAP |  |
| [aks-preview](https://github.com/Azure/azure-cli-extensions/tree/master/src/aks-preview) | 0.4.17 | Provides a preview for upcoming AKS features | Yes |
| [alias](https://github.com/Azure/azure-cli-extensions) | 0.5.2 | Support for command aliases | Yes |
| [appconfig](https://github.com/Azure/azure-cli-extensions) | 0.5.0 | Provides a preview for upcoming App Configuration features. | Yes |
| [application-insights](https://github.com/Azure/azure-cli-extensions/tree/master/src/application-insights) | 0.1.1 | Support for managing Application Insights components and querying metrics, events, and logs from such components. | Yes |
| [azure-batch-cli-extensions](https://github.com/Azure/azure-batch-cli-extensions) | 5.0.0 | Additional commands for working with Azure Batch service |  |
| [azure-cli-iot-ext](https://github.com/azure/azure-iot-cli-extension) | 0.8.3 | Provides the data plane command layer for Azure IoT Hub, IoT Edge and IoT Device Provisioning Service |  |
| [azure-cli-ml](https://docs.microsoft.com/azure/machine-learning/service/) | 1.0.65 | Microsoft Azure Command-Line Tools AzureML Command Module |  |
| [azure-devops](https://github.com/Microsoft/azure-devops-cli-extension) | 0.13.0 | Tools for managing Azure DevOps. |  |
| [azure-firewall](https://github.com/Azure/azure-cli-extensions/tree/master/src/azure-firewall) | 0.1.3 | Manage Azure Firewall resources. | Yes |
| [db-up](https://github.com/Azure/azure-cli-extensions/tree/master/src/db-up) | 0.1.13 | Additional commands to simplify Azure Database workflows. | Yes |
| [dev-spaces](https://github.com/Azure/azure-cli-extensions) | 1.0.3 | Dev Spaces provides a rapid, iterative Kubernetes development experience for teams. |  |
| [dev-spaces-preview](https://github.com/Azure/azure-cli-extensions) | 0.1.6 | Dev Spaces provides a rapid, iterative Kubernetes development experience for teams. | Yes |
| [dms-preview](https://github.com/Azure/azure-cli-extensions/tree/master/src/dms-preview) | 0.9.0 | Support for new Database Migration Service scenarios. | Yes |
| [dns](https://github.com/Azure/azure-cli-extensions) | 0.0.2 | An Azure CLI Extension for DNS zones |  |
| [eventgrid](https://github.com/Azure/azure-cli-extensions) | 0.4.3 | Microsoft Azure Command-Line Tools EventGrid Command Module. | Yes |
| [express-route](https://github.com/Azure/azure-cli-extensions/tree/master/src/express-route) | 0.1.3 | Manage ExpressRoutes with preview features. | Yes |
| [express-route-cross-connection](https://github.com/Azure/azure-cli-extensions/tree/master/src/express-route-cross-connection) | 0.1.1 | Manage customer ExpressRoute circuits using an ExpressRoute cross-connection. |  |
| [find](https://github.com/Azure/azure-cli-extensions/tree/master/src/find) | 0.3.0 | Intelligent querying for CLI information. | Yes |
| [front-door](https://github.com/Azure/azure-cli-extensions/tree/master/src/front-door) | 1.0.1 | Manage networking Front Doors. |  |
| [healthcareapis](https://github.com/Azure/azure-cli-extensions) | 0.1.1 | Microsoft Azure Command-Line Tools HealthCareApis Extension | Yes |
| [image-copy-extension](https://github.com/Azure/azure-cli-extensions) | 0.2.1 | Support for copying managed vm images between regions |  |
| [interactive](https://github.com/Azure/azure-cli) | 0.4.3 | Microsoft Azure Command-Line Interactive Shell | Yes |
| [keyvault-preview](https://github.com/Azure/azure-keyvault-cli-extension) | 0.1.3 | Preview Azure Key Vault commands. | Yes |
| [log-analytics](https://github.com/Azure/azure-cli-extensions/tree/master/src/log-analytics) | 0.1.3 | Support for Azure Log Analytics query capabilities. | Yes |
| [managementgroups](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | An Azure CLI Extension for Management Groups |  |
| [managementpartner](https://github.com/Azure/azure-cli-extensions) | 0.1.2 | Support for Management Partner preview |  |
| [mesh](https://github.com/Azure/azure-cli-extensions) | 0.10.6 | Support for Microsoft Azure Service Fabric Mesh - Public Preview | Yes |
| [mixed-reality](https://github.com/Azure/azure-cli-extensions) | 0.0.1 | Mixed Reality Azure CLI Extension. |  |
| [netappfiles-preview](https://github.com/Azure/azure-cli-extensions/tree/master/src/netappfiles-preview) | 0.3.2 | Provides a preview for upcoming Azure NetApp Files (ANF) features. | Yes |
| [privatedns](https://github.com/Azure/azure-cli-extensions) | 0.1.1 | Commands to manage Private DNS Zones | Yes |
| [resource-graph](https://github.com/Azure/azure-cli-extensions/tree/master/src/resource-graph) | 1.0.0 | Support for querying Azure resources with Resource Graph. |  |
| [sap-hana](https://github.com/Azure/azure-hanaonazure-cli-extension) | 0.5.5 | Additional commands for working with SAP HanaOnAzure instances. |  |
| [storage-preview](https://github.com/Azure/azure-cli-extensions/tree/master/src/storage-preview) | 0.2.8 | Provides a preview for upcoming storage features. | Yes |
| [subscription](https://github.com/Azure/azure-cli-extensions) | 0.1.3 | Support for subscription management preview. |  |
| [virtual-network-tap](https://github.com/Azure/azure-cli-extensions/tree/master/src/virtual-network-tap) | 0.1.0 | Manage virtual network taps (VTAP). | Yes |
| [virtual-wan](https://github.com/Azure/azure-cli-extensions/tree/master/src/virtual-wan) | 0.1.0 | Manage virtual WAN, hubs, VPN gateways and VPN sites. | Yes |
| [vm-repair](https://github.com/Azure/azure-cli-extensions/tree/master/src/vm-repair) | 0.2.2 | Auto repair commands to fix VMs. |  |
| [webapp](https://github.com/Azure/azure-cli-extensions/tree/master/src/webapp) | 0.2.24 | Additional commands for Azure AppService. | Yes |