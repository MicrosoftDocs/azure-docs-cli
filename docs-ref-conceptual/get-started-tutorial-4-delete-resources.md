---
title: Delete Azure resources using a script | Microsoft Docs
description: Learn how to delete Azure resources at scale using a for-each loop
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 11/15/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure, 
---
# Delete Azure resources at scale using a script

In this tutorial step learn to delete Azure resources at scale using a Bash or PowerShell script. This is especially helpful when you are managing a large number of Azure resources and need to tear down development or testing environments.

## Prerequisites

* You have created storage accounts as described in [Learn Azure CLI syntax differences in Bash, PowerShell and Cmd](./get-started-tutorial-2-environment-syntax.md).

## Delete a resource group by name

Using random IDs and running these tutorial steps creates test resource groups that can be removed. The easiest way to clean up Azure resources is to delete the resource group. However, when you delete a resource group, _you delete every object inside the group_, so it is important delete the right resource group name!

```azurecli-interactive
# Get a list of resource groups in the active subscription
az group list --output table

# Delete a resource group and do not wait for the operation to finish
az group delete --name <msdocs-tutorial-rg-0000000> --no-wait
```

## Delete multiple storage accounts using for-each

When you are working with a large number of resources and you do not want to delete all the objects within a group, consider using a script. This example gets a list of all the Azure storage accounts created in this tutorial and deletes them in a for-each loop.

# [Bash](#tab/bash)

```azurecli-interactive
-- Set your resource group variable
resourceGroup=<msdocs-tutorial-rg-0000000>

-- Get the name of all storage accounts in a resource group.
az storage account list --resource-group $resource-group \
    --query "[].{Name:name}" \
    --output table

-- Delete storage accounts without a confirmation prompt.
for saList in $(az storage account list --resource-group $resource-group \
    --query "[?starts_with(name, 'msdocs') == \`true\`].id" \
    --output tsv); do
    echo "deleting storage account $saList"
    az storage account delete --ids $saList --yes
done

-- Verify the storage accounts are gone.
az storage account list --resource-group $resource-group \
    --query "[?starts_with(name, 'msdocs') == \`true\`].name"
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
-- Set your resource group variable
$resourceGroup=<msdocs-tutorial-rg-0000000>

-- Get the name of all storage accounts in a resource group.
az storage account list --resource-group $resourceGroup `
    --query "[].{Name:name}" `
    --output table

-- Delete storage accounts without a confirmation prompt.
ForEach ($saList in $(az storage account list --resource-group $resourceGroup `
    --query "[?starts_with(name, 'msdocs') == ``true``].id" `
    --output tsv)
    )
    {
    echo "deleting storage account $saList"
    az storage account delete --ids $saList --yes
    }

-- Verify the storage accounts are gone.
az storage account list --resource-group $resourceGroup `
    --query "[?starts_with(name, 'msdocs') == ``true``].name"
```

---

## Get more detail

Do you want more detail on one of the references used in this tutorial step? Use the links in this table to learn more.

|Topic| Learn more|
|-|-|
|References| [az group list](/cli/azure/group#az-group-list)
| | [az group delete](/cli/azure/group#az-group-delete)
| | [az storage account list](/cli/azure/storage/account#az-storage-account-list)
| | [az storage account delete](/cli/azure/storage/account#az-storage-account-delete)

This is the end of the tutorial, but look at all you have accomplished! You are now officially onboarded with the Azure CLI. Well done!