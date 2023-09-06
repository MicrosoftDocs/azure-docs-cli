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

The following section provides an example of how to create a resource for [Azure Storage](/azure/storage/) with a service principal, using the following commands:

* [az login](/cli/azure/reference-index#az-login)
* [az group create](/cli/azure/group#az-group-create)
* [az storage account create](/cli/azure/storage/account#az-storage-account-create)
* [az storage account keys list](/cli/azure/storage/account/keys#az-storage-account-keys-list)

To sign in with a service principal, you need the `appID`, `tenantID`, and `password` returned as the response when you [created your service principal](#1-create-a-service-principal).

1. Sign in as the service principal.

    ```azurecli-interactive
    az login --service-principal --username appID --password PASSWORD --tenant tenantID
    ```

1. Create a resource group to hold all resources used for the same quickstart, tutorial, or development project.

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
    az storage account create --name myStorageAccountName --resource-group myResourceGroupName --kind <KIND> --sku F0 --location westus --yes
    ```

1. Get resource keys, which you use in your code to authenticate to the Azure storage account.

    ```azurecli-interactive
    az storage account keys list --name myStorageAccountName --resource-group myResourceGroupName
    ```
