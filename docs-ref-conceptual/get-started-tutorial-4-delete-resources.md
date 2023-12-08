---
title: Delete Azure resources using a script | Microsoft Docs
description: Learn how to delete Azure resources at scale using a for-each loop
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 12/04/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure, 
---
# Delete Azure resources at scale using a script

In this tutorial step, learn to delete multiple Azure resources using a Bash or PowerShell script. This skill is especially helpful when you're managing a large number of Azure resources and need to tear down development or testing environments.

## Prerequisites

* You created at least two storage accounts as described in [Learn Azure CLI syntax differences in Bash, PowerShell and Cmd](./get-started-tutorial-2-environment-syntax.md).

## Delete a resource group by name

Using random IDs and running these tutorial steps creates test resource groups that can be removed. The easiest way to clean up Azure resources is to delete the resource group. However, when you delete a resource group, _you delete every object inside the group_, so it's important delete the right resource group name!

```azurecli-interactive
# Get a list of resource groups in the active subscription
az group list --output table

# Delete a resource group and do not wait for the operation to finish
az group delete --name <msdocs-tutorial-rg-0000000> --no-wait
```

> [!TIP]
> The `--yes` parameter of the [az group delete](/cli/azure/group#az-group-delete) command will by-pass the console confirmation prompt.

## Delete multiple Azure resources using a script

When you're working with a large number of resources and you don't want to delete all the objects within a group, consider using a script. This example gets a list of all the Azure storage accounts created in this tutorial and deletes them in a for-each loop.

# [Bash](#tab/bash)

```azurecli-interactive
# Set your resource group variable
rgName=<msdocs-tutorial-rg-0000000>

# Get the name of all storage accounts in a resource group.
az storage account list --resource-group $rgName \
    --query "[].{Name:name}" \
    --output table

# Delete storage accounts without a confirmation prompt.
for saList in $(az storage account list --resource-group $rgName \
    --query "[?starts_with(name, 'msdocs') == \`true\`].id" \
    --output tsv); do
    echo "deleting storage account $saList"
    az storage account delete --ids $saList --yes
done

# Verify the storage accounts are gone.
az storage account list --resource-group $rgName \
    --query "[?starts_with(name, 'msdocs') == \`true\`].name"
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Set your resource group variable
$rgName=<msdocs-tutorial-rg-0000000>

# Get the name of all storage accounts in a resource group.
az storage account list --resource-group $rgName `
    --query "[].{Name:name}" `
    --output table

# Delete storage accounts without a confirmation prompt.
ForEach ($saList in $(az storage account list --resource-group $rgName `
    --query "[?starts_with(name, 'msdocs') == ``true``].id" `
    --output tsv)
    )
    {
    echo "deleting storage account $saList"
    az storage account delete --ids $saList --yes
    }

# Verify the storage accounts are gone.
az storage account list --resource-group $rgName `
    --query "[?starts_with(name, 'msdocs') == ``true``].name"
```

---

## Get more details

Do you want more detail on one of the references used in this tutorial step? Use these links to learn more.

* [az group list](/cli/azure/group#az-group-list)
* [az group delete](/cli/azure/group#az-group-delete)
* [az storage account list](/cli/azure/storage/account#az-storage-account-list)
* [az storage account delete](/cli/azure/storage/account#az-storage-account-delete)

This is the end of the tutorial, and look at all you accomplished! You're now officially onboarded with the Azure CLI. Well done!
