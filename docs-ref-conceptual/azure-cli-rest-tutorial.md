---
title: Learn how to use the Azure REST API with Azure CLI| Microsoft Docs
description: Learn how to use Azure rest with Azure Command Line (CLI). 
manager: jasongroce
author: daphnemamsft
ms.author: dbradish
ms.date: 11/21/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Use the Azure REST API with Azure Command Line Interface (CLI)

[Representational State Transfer (REST) APIs](/rest/api/gettingstarted/#components-of-a-rest-api-requestresponse) are service endpoints that support different sets of HTTP operations (or methods). These HTTP methods allow you to perform different actions for your service's resources, that the user cannot perform with Azure CLI commands alone. 

In order to demonstrate how to use the Azure REST API with Azure CLI, you can walkthrough the following tutorial in which you learn how to create and update your app service plans:

> [!div class="checklist"]
>
> * Prerequisites
> * Create an app service plan 
> * Get an app service plan 
> * List your app service plans
> * Delete an app service plan 

## Prerequisites 

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]

## Create an app service plan 

### Set up your custom Azure REST API request:

To invoke a custom Azure REST API request with Azure CLI, you use the `az rest` command, followed by the `--url` parameter. The `--url` parameter defines the URL of the requested resource, and is the only required parameter, while the others listed are all optional. 

```azurecli-interactive

az rest --url
        [--body]
        [--headers]
        [--method {delete, get, head, options, patch, post, put}]
        [--output-file]
        [--resource]
        [--skip-authorization-header]
        [--uri-parameters]
```

### Creating your custom request with Azure CLI 

In this scenario, you will use the "get" HTTP method in order to create you app service plan. To construct the URL that the HTTP method will call from, you use:

https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Web/serverfarms/{name}?api-version=2022-03-01

Your request should look like: 

```azurecli-interactive

# Syntax for creating your app service plan
az rest --method get --url https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Web/serverfarms/{name}?api-version=2022-03-01 --body "{\"location\": \"locationName\"}"

# An example with susbscriptionID, resourceGroupName, the name of your app service plan, and the locationName included in your body.

az rest --method put --url  https://management.azure.com/subscriptions/subscriptionId/resourceGroups/az-rest-example/providers/Microsoft.Web/serverfarms/tutorial-plan?api-version=2022-03-01 --body "{\"location\": \"eastus\"}"

```

```output console

{
  "id": "/subscriptions/subscriptionId/resourceGroups/az-rest-example/providers/Microsoft.Web/serverfarms/tutorial-plan",
  "kind": "app",
  "location": "eastus",
  "name": "tutorial-plan",
  "properties": {
    "adminRuntimeSiteName": null,
    "adminSiteName": null,
    "computeMode": "Dedicated",
    "createdTime": "2023-12-05T20:05:21.79",
    "currentNumberOfWorkers": 1,
    "currentWorkerSize": "Default",
    "currentWorkerSizeId": 0,
    "elasticScaleEnabled": false,
    "existingServerFarmIds": null,
    "freeOfferExpirationTime": null,
    "geoRegion": "East US",
    "hostingEnvironment": null,
    "hostingEnvironmentId": null,
    "hostingEnvironmentProfile": null,
    "hyperV": false,
    "isSpot": false,
    "isXenon": false,
    "kind": "app",
    "kubeEnvironmentProfile": null,
    "maximumElasticWorkerCount": 1,
    "maximumNumberOfWorkers": 10,
    "mdmId": "waws-prod-blu-177_145850",
    "migrateToVMSS": null,
    "name": "tutorial-plan",
    "numberOfSites": 0,
    "numberOfWorkers": 1,
    "perSiteScaling": false,
    "planName": "VirtualDedicatedPlan",
    "provisioningState": "Succeeded",
    "reserved": false,
    "resourceGroup": "az-rest-example",
    "serverFarmId": 145850,
    "siteMode": null,
    "sku": {
      "capacity": 1,
      "family": "S",
      "name": "S1",
      "size": "S1",
      "tier": "Standard"
    },
    "spotExpirationTime": null,
    "status": "Ready",
    "subscription": "subscriptionID",
    "tags": null,
    "targetWorkerCount": 0,
    "targetWorkerSizeId": 0,
    "vnetConnectionsMax": 2,
    "vnetConnectionsUsed": 0,
    "webSiteId": null,
    "webSpace": "az-rest-example-EastUSwebspace",
    "workerSize": "Default",
    "workerSizeId": 0,
    "workerTierName": null,
    "zoneRedundant": false
  },
  "sku": {
    "capacity": 1,
    "family": "S",
    "name": "S1",
    "size": "S1",
    "tier": "Standard"
  },
  "type": "Microsoft.Web/serverfarms"
}

```