---
title: Learn how to use the Azure REST API with Azure CLI| Microsoft Docs
description: Learn how to use Azure rest with Azure Command Line (CLI). 
manager: jasongroce
author: daphnemamsft
ms.author: daphnema
ms.date: 01/31/2024
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
---

# Use the Azure REST API with Azure CLI

[Representational State Transfer (REST) APIs](/rest/api/gettingstarted/#components-of-a-rest-api-requestresponse)
are service endpoints that support different sets of HTTP operations (or methods). These HTTP
methods allow you to perform different actions for your service's resources. The `az rest` command
should only be used when an existing [Azure CLI command](./use-azure-cli-successfully.md) isn't
available.

Upon completion of this article, you will know how to use the PUT, PATCH, GET, POST, and DELETE HTTP
requests to manage Azure Container Registry resources. The [Azure Container Registry](/azure/container-registry/container-registry-intro)
is a managed registry service that allows you to create and maintain Azure container registries that
store container images and related artifacts.

## Prerequisites 

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]

## Set up your custom Azure REST API request:

To invoke a custom Azure REST API request with Azure CLI, use the [`az rest`](/cli/azure/reference-index?#az-rest)
command, followed by the `--url` parameter. The `--url` parameter defines the URL of the requested
resource, and is the only required parameter.

> [!NOTE]
> - The `az rest` command automatically authenticates using the logged-in credential. If
> Authorization header is not set, it attaches header `Authorization: Bearer <token>`, where
> `<token>` is retrieved from [Microsoft Entra ID](/entra/identity/). The target resource of the
> token will be derived from the `--url` parameter when the `--url` parameter starts with an
> endpoint from the output of the `az cloud show --query endpoints` command. Use the `--resource`
> parameter for a custom resource.
> - If Content-Type header is not set and `--body` is a valid JSON
> string, Content-Type header will default to "application/json".

## Use PUT to create an Azure Container Registry

Use the PUT HTTP method to create a new Azure Container Registry.

```azurecli-interactive
# Command format example
az rest --method put \
    --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<containerRegistryName>?api-version=2023-01-01-preview \
    --body "{'location': '<locationName>', 'sku': {'name': '<skuName>'}, 'properties': {'adminUserEnabled': '<propertyValue>'}}"
```

Here's an example with completed parameters:

# [Bash](#tab/bash)

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-rg$randomIdentifier"
containerRegistryName="msdocscr$randomIdentifier"
locationName="westus"
skuName="Standard"
propertyValue="true"

# Create resource group
az group create --name $resourceGroup --location $locationName --output json

# Invoke request
az rest --method put \
    --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$containerRegistryName?api-version=2023-01-01-preview \
    --body "{'location': '$locationName', 'sku': {'name': '$skuName'}, 'properties': {'adminUserEnabled': '$propertyValue'}}"

```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$subscriptionId="00000000-0000-0000-0000-000000000000"
$resourceGroup="msdocs-app-rg$randomIdentifier"
$containerRegistryName="msdocscr$randomIdentifier"
$locationName="westus"
$skuName="Standard"
$propertyValue="true"

# Create resource group
az group create --name $resourceGroup --location $locationName --output json

# Invoke request
az rest --method put `
     --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/${containerRegistryName}?api-version=2023-01-01-preview `
     --body "{'location': '$locationName', 'sku': {'name': '$skuName'}, 'properties': {'adminUserEnabled': '$propertyValue'}}"

```

---

JSON output for both Bash and Powershell:

```JSON
{
  "id": "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<containerRegistryName>",
  "location": "<location>",
  "name": "<containerRegistryName>",
  "properties": {
    "adminUserEnabled": true,
    "anonymousPullEnabled": false,
    "creationDate": "2024-01-03T18:38:36.7089583Z",
    "dataEndpointEnabled": false,
    "dataEndpointHostNames": [],
    "encryption": {
      "status": "disabled"
    },
    "loginServer": "<containerRegistryName>.azurecr.io",
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
  "tags":{},
  "type": "Microsoft.ContainerRegistry/registries"
}
```

You have now successfully created your new Azure Container Registry using `az rest`!

## Use PATCH to update your Azure Container Registry

Update your Azure Container Registry by using the PATCH HTTP request. Edit the `--body` parameter
with the properties you want to update. This example uses the variables set in the previous section,
and updates the SKU name ($skuName="Premium") of the Azure Container Registry.

# [Bash](#tab/bash)

```azurecli-interactive
#Variable Block
$skuName="Premium"

az rest --method patch \
    --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$containerRegistryName?api-version=2023-01-01-preview \
    --body "{'location': '$locationName', 'sku': {'name': '$skuName'}, 'properties': {'adminUserEnabled': '$propertyValue'}}"
```

# [PowerShell](#tab/powershell)

In a PowerShell environment, add `{}` brackets around the `containerRegistryName` variable as a question mark is an allowed character in a variable name.

```azurecli-interactive
#Variable Block
$skuName="Premium"

az rest --method patch `
    --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/${containerRegistryName}?api-version=2023-01-01-preview `
    --body "{'location': '$locationName', 'sku': {'name': '$skuName'}, 'properties': {'adminUserEnabled': '$propertyValue'}}"
```

---

The following JSON dictionary output has fields omitted for brevity: 

```JSON
{
  "id": "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.ContainerRegistry/registries/<containerRegistryName>",
  "location": "westus",
  "name": "<containerRegistryName>",
  "properties": {...},
  "sku": {
    "name": "Premium",
    "tier": "Premium"
  },
  "systemData": {...},
  "type": "Microsoft.ContainerRegistry/registries"
}

```

## Use GET to retrieve your Azure Container Registry

Use the GET HTTP request see the update results from the PATCH request. This example uses the
variables set in the previous section.

# [Bash](#tab/bash)

```azurecli-interactive
az rest --method get \
    --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$containerRegistryName?api-version=2023-01-01-preview 
```

# [PowerShell](#tab/powershell)

In a PowerShell environment, add `{}` brackets around the `containerRegistryName` variable as a
question mark is an allowed character in a variable name.

```azurecli-interactive
az rest --method get `
    --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/${containerRegistryName}?api-version=2023-01-01-preview 
```

---

The output for GET method is the same as the one shown for PUT.

## Use POST to regenerate your Azure Container Registry credentials

Use the POST HTTP request to regenerate one of the login credentials for the Azure Container
Registry created in this article.

# [Bash](#tab/bash)

```azurecli-interactive
# Variable block
$passwordValue="password"

az rest --method post \
    --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$containerRegistryName/regenerateCredential?api-version=2023-01-01-preview \
    --body "{'name': '$passwordValue'}"
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Variable block
$passwordValue="password"

az rest --method post `
    --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$containerRegistryName/regenerateCredential?api-version=2023-01-01-preview `
    --body "{'name': '$passwordValue'}"
```

---

The following JSON dictionary output has fields omitted for brevity: 

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
  "username": "<containerRegistryName>"
}

```

After the request is complete, your specified Azure Container Registry credentials will be
regenerated with a new password along with your existing password (password2).

## Use DELETE to delete your Azure Container Registry

Use the DELETE HTTP request to delete an existing Azure Container Registry.

# [Bash](#tab/bash)

```azurecli-interactive
az rest --method delete \
    --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$containerRegistryName?api-version=2023-01-01-preview
```

# [PowerShell](#tab/powershell)

In a PowerShell environment, add `{}` brackets around the `containerRegistryName` variable as a
question mark is an allowed character in a variable name.

```azurecli-interactive
az rest --method delete `
    --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/${containerRegistryName}?api-version=2023-01-01-preview
```

---

## Clean up resources

When you are finished with the resources created in this article, you can delete the resource group.
When you delete the resource group, all resources in that resource group are deleted.

```azurecli-interactive
az group delete --resource-group <resourceGroupName>
```
