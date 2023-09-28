---
title: Create a resource using service principal – Azure CLI | Microsoft Docs
description: Learn how to create a resource using service principal with Azure CLI.
manager: jasongroce
author: daphnemamsft
ms.author: daphnema
ms.date: 09/6/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# 6 - Create a resource using service principal

When using service principals with an Azure service, you want to ensure that your resources are secure. You can achieve this by creating your resources using service principal.
The following section provides an example of how to create a resource for [Azure Storage](/azure/storage/) with a service principal, using the following commands:

* [az login](/cli/azure/reference-index#az-login)
* [az group create](/cli/azure/group#az-group-create)
* [az storage account create](/cli/azure/storage/account#az-storage-account-create)
* [az storage account keys list](/cli/azure/storage/account/keys#az-storage-account-keys-list)

To sign in with a service principal, you need the `appID`, `tenantID`, and `password` returned as the response when you [created your service principal](./azure-cli-sp-tutorial-1.md).

1. Sign in as the service principal.

    ```azurecli-interactive
    az login --service-principal --username appID --password PASSWORD --tenant tenantID
    ```

    Output console:

    ```
    [
      {
        "cloudName": "AzureCloud",
        "homeTenantId": "tenantID",
        "id": "mySubscriptionId",
        "isDefault": true,
        "managedByTenants": [],
        "name": "mySubscriptionName",
        "state": "Enabled",
        "tenantId": "tenantID",
        "user": {
          "name": "myName",
          "type": "servicePrincipal"
        }
      }
    ]
    ```

2. Create a resource group to hold all resources used for the same quickstart, tutorial, or development project.

    ```azurecli-interactive
    az group create --location westus --name myResourceGroupName
    ```

3. Create a storage account.

    For Azure Storage, valid values for the `<KIND>` parameter are:

    * BlobStorage
    * BlockBlobStorage
    * FileStorage
    * Storage
    * StorageV2

    ```azurecli-interactive
    az storage account create --name myStorageAccountName --resource-group myResourceGroupName --kind <KIND> --sku F0 --location westus --yes
    ```
    
    Output console:  

    ```
    {
      "accessTier": "Hot",
      "allowBlobPublicAccess": true,
      "allowCrossTenantReplication": null,
      "allowSharedKeyAccess": null,
      "allowedCopyScope": null,
      "azureFilesIdentityBasedAuthentication": null,
      "blobRestoreStatus": null,
      "creationTime": "2023-09-15T17:29:49.429047+00:00",
      "customDomain": null,
      "defaultToOAuthAuthentication": null,
      "dnsEndpointType": null,
      "enableHttpsTrafficOnly": true,
      "enableNfsV3": null,
      "encryption": {
        "encryptionIdentity": null,
        "keySource": "Microsoft.Storage",
        "keyVaultProperties": null,
        "requireInfrastructureEncryption": null,
        "services": {
          "blob": {
            "enabled": true,
            "keyType": "Account",
            "lastEnabledTime": "2023-09-15T17:29:49.569653+00:00"
          },
          "file": {
            "enabled": true,
            "keyType": "Account",
            "lastEnabledTime": "2023-09-15T17:29:49.569653+00:00"
          },
          "queue": null,
          "table": null
        }
      },
      "extendedLocation": null,
      "failoverInProgress": null,
      "geoReplicationStats": null,
      "id": "/subscriptions/mysubscriptionID/resourceGroups/myResourceGroupName/providers/Microsoft.Storage/storageAccounts/myStorageAccountName",
      "identity": null,
      "immutableStorageWithVersioning": null,
      "isHnsEnabled": null,
      "isLocalUserEnabled": null,
      "isSftpEnabled": null,
      "keyCreationTime": {
        "key1": "2023-09-15T17:29:49.554030+00:00",
        "key2": "2023-09-15T17:29:49.554030+00:00"
      },
      "keyPolicy": null,
      "kind": "StorageV2",
      "largeFileSharesState": null,
      "lastGeoFailoverTime": null,
      "location": "eastus",
      "minimumTlsVersion": "TLS1_0",
      "name": "myStorageAccountName",
      "networkRuleSet": {
        "bypass": "AzureServices",
        "defaultAction": "Allow",
        "ipRules": [],
        "resourceAccessRules": null,
        "virtualNetworkRules": []
      },
      "primaryEndpoints": {
        "blob": "https://myStorageAccountName.blob.core.windows.net/",
        "dfs": "https://myStorageAccountName.dfs.core.windows.net/",
        "file": "https://myStorageAccountName.file.core.windows.net/",
        "internetEndpoints": null,
        "microsoftEndpoints": null,
        "queue": "https://myStorageAccountName.queue.core.windows.net/",
        "table": "https://myStorageAccountName.table.core.windows.net/",
        "web": "https://myStorageAccountName.z13.web.core.windows.net/"
      },
      "primaryLocation": "eastus",
      "privateEndpointConnections": [],
      "provisioningState": "Succeeded",
      "publicNetworkAccess": null,
      "resourceGroup": "myResourceGroupName",
      "routingPreference": null,
      "sasPolicy": null,
      "secondaryEndpoints": {
        "blob": "https://myStorageAccountName-secondary.blob.core.windows.net/",
        "dfs": "https://myStorageAccountName-secondary.dfs.core.windows.net/",
        "file": null,
        "internetEndpoints": null,
        "microsoftEndpoints": null,
        "queue": "https://myStorageAccountName-secondary.queue.core.windows.net/",
        "table": "https://myStorageAccountName-secondary.table.core.windows.net/",
        "web": "https://myStorageAccountName-secondary.z13.web.core.windows.net/"
      },
      "secondaryLocation": "westus",
      "sku": {
        "name": "Standard_RAGRS",
        "tier": "Standard"
      },
      "statusOfPrimary": "available",
      "statusOfSecondary": "available",
      "storageAccountSkuConversionStatus": null,
      "tags": {},
      "type": "Microsoft.Storage/storageAccounts"
    }
    ```

4. Get resource keys, which you use in your code to authenticate to the Azure storage account.

    ```azurecli-interactive
    az storage account keys list --resource-group myResourceGroupName --account-name myStorageAccountName
    ```
    
    Output Console: 

    ```
    [
      {
        "creationTime": "2023-09-15T17:29:49.554030+00:00",
        "keyName": "key1",
        "permissions": "FULL",
        "value": "myKeyValue1"
      },
      {
        "creationTime": "2023-09-15T17:29:49.554030+00:00",
        "keyName": "key2",
        "permissions": "FULL",
        "value": "myKeyValue2"
      }
    ]
    ```

## Next Steps

Now that you've learned how to create a resource using service principal, proceed to the next step to learn how to reset your service principal credentials.

> [!div class="nextstepaction"]
> [Reset service principal credentials](./azure-cli-sp-tutorial-7.md)