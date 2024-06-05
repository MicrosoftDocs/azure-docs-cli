---
title: Create a resource using a service principal and the Azure CLI | Microsoft Docs
description: Learn how to create a resource using a service principal and the Azure CLI.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 10/10/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Create a resource using a service principal

If given the necessary permissions, a service principal can create and manage Azure resources just like an account. This tutorial step provides an example of how to create a resource for [Azure Storage](/azure/storage/) using a service principal and the following commands:

* [az login](/cli/azure/reference-index#az-login)
* [az group create](/cli/azure/group#az-group-create)
* [az storage account create](/cli/azure/storage/account#az-storage-account-create)
* [az storage account keys list](/cli/azure/storage/account/keys#az-storage-account-keys-list)

To sign in with a service principal, you need the `appID`, `tenantID`, and `password` returned in the console output when you [created a service principal](./azure-cli-sp-tutorial-1.md).

1. Sign in as the service principal.

    ```azurecli-interactive
    az login --service-principal \
             --username myServicePrincipalID \
             --password myServicePrincipalPassword \
             --tenant myOrganizationTenantID
    ```

    Output console:

    ```output
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
          "name": "myServicePrincipalID",
          "type": "servicePrincipal"
        }
      }
    ]
    ```

1. Create a resource group to hold all resources for the same project.

    ```azurecli-interactive
    az group create --location westus --name myResourceGroupName
    ```

1. Create a storage account.

    For Azure Storage, valid values for the `<KIND>` parameter are:

    * BlobStorage
    * BlockBlobStorage
    * FileStorage
    * Storage
    * StorageV2

    ```azurecli-interactive
    az storage account create --name myStorageAccountName \
                              --resource-group myResourceGroupName \
                              --kind <KIND> \
                              --sku F0 \
                              --location westus \
                              --yes
    ```

1. Get resource keys, which you use in your code to authenticate to the Azure storage account.

    ```azurecli-interactive
    az storage account keys list --resource-group myResourceGroupName \
                                 --account-name myStorageAccountName
    ```

    Output Console:

    ```output
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
