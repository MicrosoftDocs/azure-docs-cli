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

[Representational State Transfer (REST) APIs](/rest/api/gettingstarted/#components-of-a-rest-api-requestresponse) are service endpoints that support different sets of HTTP operations (or methods). These HTTP methods allow you to perform different actions for your service's resources which cannot be performed with regular Azure CLI commands. It should be noted however, that `az rest` is not meant to replace any existing [Azure CLI command](/cli/azure/use-cli-effectively?view=azure-cli-latest&branch=main&tabs=bash%2Cbash2). 

In order to demonstrate how to use the Azure REST API with Azure CLI, you can walkthrough the following tutorial in which you learn how to create and update your Azure Container Registry (ACR). The [Azure Container Registry](/azure/container-registry/container-registry-intro) is a managed registry service that allows you to create and maintain Azure container registries, in order to store and manage your container images and related artifacts.

By walking through this tutorial, you learn how to utilize the HTTP methods: PUT, PATCH, GET, POST, and DELETE to manage your Azure Container Registry resources. 

## Prerequisites 

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]


## Set up your custom Azure REST API request:

To invoke a custom Azure REST API request with Azure CLI, you use the [`az rest`](/cli/azure/reference-index?view=azure-cli-latest#az-rest) command, followed by the `--url` parameter. The `--url` parameter defines the URL of the requested resource, and is the only required parameter, while the others listed are all optional. 

> [!NOTE]
> - This command automatically authenticates using the logged-in credential: If Authorization header is not set, it attaches header `Authorization: Bearer <token>`, where `<token>` is retrieved from Azure Active Directory (AAD). The target resource of the token will be derived from the `--url` parameter when the `--url` parameter starts with an endpoint from the `az cloud show --query endpoints`. You may also use the `--resource` parameter for a custom resource.
> - If Content-Type header is not set and --body is a valid JSON string, Content-Type header will default to application/json.

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

## Use PUT to create an Azure Container Registry

### Creating your custom request with Azure CLI 

Use the PUT HTTP method to create a new Azure Container Registry. Here is an example of the syntax:

# [Bash](#tab/bash)

```azurecli-interactive

# Bash script
az rest --method put \
--url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>?api-version=2023-01-01-preview \
--body "{'location': 'westus', 'tags': {key': 'value'}, 'sku': {'name': 'Standard'}, 'properties': {'adminUserEnabled': 'true'}}"

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-rg$randomIdentifier"
myContainerRegistryName="msdocs-container-registry$randomIdentifier"
location="westus"

# Invoke request
az rest --method put \
--url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$myContainerRegistryName?api-version=2023-01-01-preview \
--body "{'location': 'westus', 'tags': {'key': 'value'}, 'sku': {'name': 'Standard'}, 'properties': {'adminUserEnabled': 'true'}}"

```

# [PowerShell](#tab/powershell)

```azurecli-interactive

# Powershell script
az rest --method put `
--url https://management.azure.com/subscriptions/<subscriptionid>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>?api-version=2023-01-01-preview ` 
--body "{'location': 'westus', 'tags': {'key': 'value'}, 'sku': {'name': 'Standard'}, 'properties': {'adminUserEnabled': 'true'}}"

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-rg$randomIdentifier"
myContainerRegistryName="msdocs-container-registry$randomIdentifier"
location="westus"

# Invoke request
az rest --method put `
--url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$myContainerRegistryName?api-version=2023-01-01-preview `
--body "{'location': 'westus', 'tags': {'key': 'value'}, 'sku': {'name': 'Standard'}, 'properties': {'adminUserEnabled': 'true'}}"

```

***

JSON output for both Bash and Powershell:

```JSON

{
  "id": "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>",
  "location": "<location>",
  "name": "<myContainerRegistryName>",
  "properties": {
    "adminUserEnabled": true,
    "anonymousPullEnabled": false,
    "creationDate": "2024-01-03T18:38:36.7089583Z",
    "dataEndpointEnabled": false,
    "dataEndpointHostNames": [],
    "encryption": {
      "status": "disabled"
    },
    "loginServer": "<myContainerRegistryName>.azurecr.io",
    "networkRuleBypassOptions": "AzureServices",
    "policies": {
      "azureADAuthenticationAsArmPolicy": {
        "status": "enabled"
      },
      "exportPolicy": {
        "status": "enabled"
      },
      "quarantinePolicy": {
        "status": "disabled"
      },
      "retentionPolicy": {
        "days": 7,
        "lastUpdatedTime": "2024-01-03T19:44:53.9770581+00:00",
        "status": "disabled"
      },
      "softDeletePolicy": {
        "lastUpdatedTime": "2024-01-03T19:44:53.9771117+00:00",
        "retentionDays": 7,
        "status": "disabled"
      },
      "trustPolicy": {
        "status": "disabled",
        "type": "Notary"
      }
    },
    "privateEndpointConnections": [],
    "provisioningState": "Succeeded",
    "publicNetworkAccess": "Enabled",
    "zoneRedundancy": "Disabled"
  },
  "sku": {
    "name": "Standard",
    "tier": "Standard"
  },
  "systemData": {
    "createdAt": "2024-01-03T18:38:36.7089583+00:00",
    "createdBy": "<username>@microsoft.com",
    "createdByType": "User",
    "lastModifiedAt": "2024-01-03T19:44:53.684342+00:00",
    "lastModifiedBy": "<username>@microsoft.com",
    "lastModifiedByType": "User"
  },
  "tags": {
    "key": "value"
  },
  "type": "Microsoft.ContainerRegistry/registries"
}

```

You have now successfully created your new Azure Container Registry. 

## Use PATCH to update your Azure Container Registry

Update your Azure Container Registry by using the PATCH HTTP method again and editing the `--body` parameter with the properties you want to update/change. In this specific scenario, you are changing the SKU name of your Azure Container Registry. Here is an example of the syntax:

# [Bash](#tab/bash)

```azurecli-interactive

# Bash script
az rest --method patch \
--url https://management.azure.com/subscriptions/e0e0637e-211d-440f-8c77-b93e32534188/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>?api-version=2023-01-01-preview \
--body "{'location': 'westus', 'tags': {'key': 'value'}, 'sku': {'name': 'Premium'}, 'properties': {'adminUserEnabled': 'true'}}"

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-rg$randomIdentifier"
myContainerRegistryName="msdocs-container-registry$randomIdentifier"
location="westus"

# Invoke request
az rest --method patch \
--url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$myContainerRegistryName?api-version=2023-01-01-preview \
--body "{'location': 'westus', 'tags': {'key': 'value'}, 'sku': {'name': 'Premium'}, 'properties': {'adminUserEnabled': 'true'}}"

```

# [PowerShell](#tab/powershell)

```azurecli-interactive

# Powershell script
az rest --method patch ` 
--url https://management.azure.com/subscriptions/<subscriptionid>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>?api-version=2023-01-01-preview `
--body "{'location': 'westus', 'tags': {'key': 'value'}, 'sku': {'name': 'Premium'}, 'properties': {'adminUserEnabled': 'true'}}"

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-rg$randomIdentifier"
myContainerRegistryName="msdocs-container-registry$randomIdentifier"
location="westus"

# Invoke request
az rest --method patch `
--url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$myContainerRegistryName?api-version=2023-01-01-preview `
--body "{'location': 'westus', 'tags': {'key': 'value'}, 'sku': {'name': 'Premium'}, 'properties': {'adminUserEnabled': 'true'}}"

```

***

JSON output for both Bash and Powershell: 

```JSON
{
  "id": "/subscriptions/<subscriptionId>/resourceGroups/<resource-group>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>",
  "location": "westus",
  "name": "<myContainerRegistryName>",
  "properties": {...},
  "sku": {
    "name": "Premium",
    "tier": "Premium"
  },
  "systemData": {...},
  "tags": {
    "key": "value"
  },
  "type": "Microsoft.ContainerRegistry/registries"
}

```

You have now successfully updated the SKU properties in your Azure Container Registry description.

## Use GET to retrieve your Azure Container Registry

Use the GET HTTP method to get the description of the Azure Container Registry you just created along with its new update. Here is an example of the syntax:

# [Bash](#tab/bash)

```azurecli-interactive

# Bash script
az rest --method get \
--url https://management.azure.com/subscriptions/e0e0637e-211d-440f-8c77-b93e32534188/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>?api-version=2023-01-01-preview 

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-rg$randomIdentifier"
myContainerRegistryName="msdocs-container-registry$randomIdentifier"
location="westus"

# Invoke request
az rest --method get \
--url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$myContainerRegistryName?api-version=2023-01-01-preview 

```

# [PowerShell](#tab/powershell)

```azurecli-interactive

# Powershell script
az rest --method get `
--url https://management.azure.com/subscriptions/<subscriptionid>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>?api-version=2023-01-01-preview 

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-rg$randomIdentifier"
myContainerRegistryName="msdocs-container-registry$randomIdentifier"
location="westus"

# Invoke request
az rest --method get `
--url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$myContainerRegistryName?api-version=2023-01-01-preview
```

***

Note that the JSON output for both Bash and Powershel: output is the same as the one shown in the previous step.

This function is to see the description of your Azure Container Registry. This is helpful to ensure that your updates have been correctly changed after the patch function.

## Use POST to regenerate your Azure Container Registry credentials

Use the "post" HTTP method to regenerate one of the login credentials for the specified container registry. Here is an example of the syntax:

# [Bash](#tab/bash)

```azurecli-interactive

# Bash script
az rest --method post \
--url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>/regenerateCredential?api-version=2023-01-01-preview \
--body "{'name': 'password'}"

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-service-rg-$randomIdentifier"
me="msdocs-app-$randomIdentifier"
location="westus"

# Invoke request
az rest --method post \
--url  https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.Web/sites/$myAppName/restart?api-version=2022-03-01 \
--body "{'name': 'password'}"

```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Powershell script
az rest --method post `
--url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>/regenerateCredential?api-version=2023-01-01-preview `
--body "{'name': 'password'}"

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-rg$randomIdentifier"
myContainerRegistryName="msdocs-container-registry$randomIdentifier"
location="westus"

# Invoke request
az rest --method post `
 --url  https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.Web/sites/$myAppName/restart?api-version=2022-03-01 `
--body "{'name': 'password'}"
```

***

JSON output for both Bash and Powershell: 

```JSON
{
  "passwords": [
    {
      "name": "password",
      "value": "<passwordValue>"
    },
    {
      "name": "password2",
      "value": "<passwordValue2>"
    }
  ],
  "username": "<myContainerRegistryName>"
}

```

After the request is sent through, your specified Azure Container Registry credentials will be regenerated with a new password along with your existing password (password2).

## Use DELETE to delete your Azure Container Registry

Use the DELETE HTTP method to delete an existing Azure Container Registry. Here is an example of the syntax:

# [Bash](#tab/bash)

```azurecli-interactive

# Bash script
az rest --method delete \
--url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>?api-version=2023-01-01-preview

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-rg$randomIdentifier"
myContainerRegistryName="msdocs-container-registry$randomIdentifier"
location="westus"

# Invoke request
az rest --method delete \
--url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$myContainerRegistryName?api-version=2023-01-01-preview

```

# [PowerShell](#tab/powershell)

```azurecli-interactive

# Powershell script
az rest --method delete `
--url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<myContainerRegistryName>?api-version=2023-01-01-preview

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-service-rg-$randomIdentifier"
myNewAppServicePlanName="msdocs-app-service-plan-$randomIdentifier"
location="westus"

# Invoke request
az rest --method delete `
--url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$myContainerRegistryName?api-version=2023-01-01-preview
```
***

After the request is sent through, your specified Azure Container Registry will be deleted. 

## Clean up resources

If you are finished with the resources created in this article, you can delete the resource group. When you delete the resource group, all resources in that resource group are deleted. 

# [Bash](#tab/bash)

```azurecli-interactive
# Bash script
az group delete --resource-group <resourceGroup>

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
resourceGroup="msdocs-app-service-rg-$randomIdentifier"

# Delete resource group 
az group delete --resource-group $resourceGroup

```

# [PowerShell](#tab/powershell)

```azurecli-interactive

# Powershell script
Remove-AzResourceGroup -Name <resourceGroup>

# Here is an example with completed parameters:

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
resourceGroup="msdocs-app-service-rg-$randomIdentifier"

# Delete resource group 
az group delete --resource-group $resourceGroup
```
***

After completing this step, your resource group along with all of its resources will be deleted. 

Congratulations! After completing this tutorial, you have now used several HTTP methods in order to invoke REST API requests to perform various actions for Azure container registries. 