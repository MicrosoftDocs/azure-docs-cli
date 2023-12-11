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
> * Create an app service plan with PUT
> * Update your app service plan with PATCH
> * Get the description of your app service plan with GET
> * Restart your app in your app service plan with POST
> * Delete an app service plan with DELETE

## Prerequisites 

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]

## Use PUT to create an app service plan 

### Set up your custom Azure REST API request:

To invoke a custom Azure REST API request with Azure CLI, you use the `az rest` command, followed by the `--url` parameter. The `--url` parameter defines the URL of the requested resource, and is the only required parameter, while the others listed are all optional. 

> [!NOTE]
> If Content-Type header is not set and --body is a valid JSON string, Content-Type header will default to application/json.

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

Use the "put" HTTP method to create a new app service plan. Here is an example of the syntax:

# [Bash](#tab/bash)

```azurecli-interactive
# Bash script
az rest --method put --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewAppServicePlanName>?api-version=2022-03-01 --body  '{"location": "locationName"}'  

```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Powershell script
az rest --method put --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewAppServicePlanName>?api-version=2022-03-01 --body  '{\"location\": \"locationName\"}' 

```

Here is an example with completed parameters:

```azurecli-interactive

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroupName="msdocs-app-service-rg-$randomIdentifier"
myNewAppServicePlanName="msdocs-app-service-plan-$randomIdentifier"
location="East US"

# Invoke request
az rest --method put --url  https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Web/serverfarms/$myNewAppServicePlanName?api-version=2022-03-01 --body '{"location": "$location"}' 

```

Console output:

```output

{
  "id": "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewAppServicePlanName>",
  "kind": "app",
  "location": "<location>",
  "name": "<myNewAppServiceName>",
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
    "resourceGroup": "<resourceGroupName>",
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
    "subscription": "<subscriptionID>",
    "tags": null,
    "targetWorkerCount": 0,
    "targetWorkerSizeId": 0,
    "vnetConnectionsMax": 2,
    "vnetConnectionsUsed": 0,
    "webSiteId": null,
    "webSpace": "<resourceGroupName-location>webspace",
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

You have now successfully created your new app service plan. 

## Use PATCH to update your app service plan

Update your service plan by using the "put" HTTP method again and editing the `--body` parameter with the properties you want to update/change. In this specific scenario, you are changing the SKU values of your app service plan. Here is an example of the syntax:

# [Bash](#tab/bash)

```azurecli-interactive
# Bash script
az rest --method get --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewAppServicePlanName>?api-version=2022-03-01 --body  '{\"location\": \"<location>\", \"sku\": {\"name\": \"<skuName>\", \"tier\": \"<skuTier>\", \"size\": \"<skuSize\", \"family\": \"<skuFamily>\", \"capacity\": \"<skuCapacity>\"}} '

```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Powershell script
az rest --method put --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewAppServicePlanName>?api-version=2022-03-01 --body  '{"location": "<location>", "sku": {"name": "<skuName>", "tier": "<skuTier>", "size": "<skuSize", "family": "<skuFamily>", "capacity": "<skuCapacity>"}} '

```

Here is an example with completed parameters:

```azurecli-interactive

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroupName="msdocs-app-service-rg-$randomIdentifier"
myNewAppServicePlanName="msdocs-app-service-plan-$randomIdentifier"
location="East US"
skuName="P1"
skuTier="Premium"
skuSize="P1"
skuFamily="P
skuCapacity="1"

# Invoke request
az rest --method put --url  https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Web/serverfarms/$myNewAppServicePlanName?api-version=2022-03-01 --body '{"location": "$location", "sku": {"name": "$skuName", "tier": "$skuTier", "size": "$skuSize", "family": "$skuFamily", "capacity": "$skuCapacity"}} '

```

Console output:

```output
{
  "id": "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewAppServicePlanName>",
  "kind": "app",
  "location": "<location>",
  "name": "<myNewAppServiceName>",
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
    "maximumNumberOfWorkers": 20,
    "mdmId": "waws-prod-blu-177_145850",
    "migrateToVMSS": null,
    "name": "tutorial-plan",
    "numberOfSites": 0,
    "numberOfWorkers": 1,
    "perSiteScaling": false,
    "planName": "VirtualDedicatedPlan",
    "provisioningState": "Succeeded",
    "reserved": false,
    "resourceGroup": "<resourceGroupName>",
    "serverFarmId": 145850,
    "siteMode": null,
    "sku": {
      "capacity": 1,
      "family": "P",
      "name": "P1",
      "size": "P1",
      "tier": "Premium"
    },
    "spotExpirationTime": null,
    "status": "Ready",
    "subscription": "<subscriptionId>",
    "tags": null,
    "targetWorkerCount": 0,
    "targetWorkerSizeId": 0,
    "vnetConnectionsMax": 2,
    "vnetConnectionsUsed": 0,
    "webSiteId": null,
    "webSpace": "<resourceGroupName-location>webspace",
    "workerSize": "Default",
    "workerSizeId": 0,
    "workerTierName": null,
    "zoneRedundant": false
  },
  "sku": {
    "capacity": 1,
    "family": "P",
    "name": "P1",
    "size": "P1",
    "tier": "Premium"
  },
  "type": "Microsoft.Web/serverfarms"
}
```

You have now successfully updated the SKU properties in your app service plan description.

## Use GET to retrieve your app service plan

Use the "get" HTTP method to get the description of the app service plan you just created along with its new update. Here is an example of the syntax:

# [Bash](#tab/bash)

```azurecli-interactive
# Bash script
az rest --method get --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewAppServicePlanName>?api-version=2022-03-01 

```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Powershell script
az rest --method put --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewAppServicePlanName>?api-version=2022-03-01 

```

Here is an example with completed parameters:

```azurecli-interactive

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroupName="msdocs-app-service-rg-$randomIdentifier"
myNewAppServicePlanName="msdocs-app-service-plan-$randomIdentifier"

# Invoke request
az rest --method get --url  https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Web/serverfarms/$myNewAppServicePlanName?api-version=2022-03-01 

```

Console output:

```output
{
  "id": "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewAppServiceName>",
  "kind": "app",
  "location": "<location>",
  "name": "<myNewAppServiceName>",
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
    "maximumNumberOfWorkers": 20,
    "mdmId": "waws-prod-blu-177_145850",
    "migrateToVMSS": null,
    "name": "tutorial-plan",
    "numberOfSites": 0,
    "numberOfWorkers": 1,
    "perSiteScaling": false,
    "planName": "VirtualDedicatedPlan",
    "provisioningState": "Succeeded",
    "reserved": false,
    "resourceGroup": "<resourceGroupName>",
    "serverFarmId": 145850,
    "siteMode": null,
    "sku": {
      "capacity": 1,
      "family": "P",
      "name": "P1",
      "size": "P1",
      "tier": "Premium"
    },
    "spotExpirationTime": null,
    "status": "Ready",
    "subscription": "<subscriptionId>",
    "tags": null,
    "targetWorkerCount": 0,
    "targetWorkerSizeId": 0,
    "vnetConnectionsMax": 2,
    "vnetConnectionsUsed": 0,
    "webSiteId": null,
    "webSpace": "<resourceGroupName-location>webspace",
    "workerSize": "Default",
    "workerSizeId": 0,
    "workerTierName": null,
    "zoneRedundant": false
  },
  "sku": {
    "capacity": 1,
    "family": "P",
    "name": "P1",
    "size": "P1",
    "tier": "Premium"
  },
  "type": "Microsoft.Web/serverfarms"
}
```

You can now see the description of your app service plan. This is also helpful to ensure that your updates have been correctly changed in your app service plan description. 

## Use POST to restart your app 

Use the "post" HTTP method to restart your app in your app service plan. Here is an example of the syntax:

# [Bash](#tab/bash)

```azurecli-interactive
# Bash script
az rest --method put --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/sites/<myAppName>/restart?api-version=2022-03-01

```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Powershell script
az rest --method put --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/sites/<myAppName>/restart?api-version=2022-03-01
```

Here is an example with completed parameters:

```azurecli-interactive

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroupName="msdocs-app-service-rg-$randomIdentifier"
myAppName="msdocs-app-$randomIdentifier"
location="East US"

# Invoke request
az rest --method put --url  https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Web/sites/$myAppName/restart?api-version=2022-03-01
```

After the request is sent through, your app will be restarted. 

## Use DELETE to delete your app service plan

Use the "delete" HTTP method to delete an existing app service plan. Here is an example of the syntax:

# [Bash](#tab/bash)

```azurecli-interactive
# Bash script
az rest --method put --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewServiceAppPlanName>?api-version=2022-03-01

```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Powershell script
az rest --method put --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<myNewServiceAppPlanName>?api-version=2022-03-01
```

Here is an example with completed parameters:

```azurecli-interactive

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroupName="msdocs-app-service-rg-$randomIdentifier"
myNewAppServicePlanName="msdocs-app-service-plan-$randomIdentifier"
location="East US"

# Invoke request
az rest --method put --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Web/serverfarms/$myNewServiceAppPlanName?api-version=2022-03-01
```

After the request is sent through, your service plan will be deleted. 

# Clean up resources

If you are finished with the resources created in this article, you can delete the resource group. When you delete the resource group, all resources in that resource group (including your apps and app service plans) are deleted. 

# [Bash](#tab/bash)

```azurecli-interactive
# Bash script
az group delete --resource-group <resourceGroupName>

```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Powershell script
Remove-AzResourceGroup -Name <resourceGroupName>
```

Here is an example with completed parameters:

```azurecli-interactive

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
resourceGroupName="msdocs-app-service-rg-$randomIdentifier"

# Delete resource group 
az group delete --resource-group $resourceGroupName
```

After completing this step, your resource group along with all of its resources will be deleted. 

Congratulations! After completing this tutorial, you have now used several HTTP methods in order to invoke REST API requests to perform various actions for app service plans. 