---
title: Delete Azure resources at scale using a script | Microsoft Docs
description: Learn how to delete Azure resources at scale with Azure CLI using a foreach loop
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure, 
---

# Delete Azure resources at scale using a script

In this tutorial step, learn to delete multiple Azure resources using a Bash or PowerShell script.
This skill is especially helpful when you're managing a large number of Azure resources and need to
remove development or testing environments.

## Prerequisites

- You created at least two storage accounts as described in
  [Learn Azure CLI syntax differences in Bash, PowerShell, and Cmd][01].

## Delete a resource group by name

Using random IDs and running these tutorial steps creates test resource groups that can be removed.
The easiest way to clean up Azure resources is to delete the resource group. However, when you
delete a resource group, _every object inside the resource group is also deleted_, so make sure you
specify the correct resource group.

```azurecli-interactive
# Get a list of resource groups in the active subscription
az group list --output table

# Delete a resource group and do not wait for the operation to finish
az group delete --name <msdocs-tutorial-rg-0000000> --no-wait
```

> [!TIP]
> The `--yes` parameter of the [az group delete][02] command bypasses the console confirmation
> prompt.

## Delete multiple Azure resources using a script

When you work with a large number of resources, and you don't want to delete all the objects within
a resource group, consider using a script. This example gets a list of all the Azure storage
accounts created in this tutorial and deletes them in a `foreach` loop.

# [Bash](#tab/bash)

```azurecli-interactive
# Set your resource group variable
rgName="<msdocs-tutorial-rg-0000000>"

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
$rgName="<msdocs-tutorial-rg-0000000>"

# Get the name of all storage accounts in a resource group.
az storage account list --resource-group $rgName `
    --query "[].{Name:name}" `
    --output table

# Delete storage accounts without a confirmation prompt.
$saList = az storage account list --resource-group $rgName `
    --query "[?starts_with(name, 'msdocs') == 'true'].id" --output tsv

foreach ($saId in $saList) {
    Write-Output "Deleting storage account $saId"
    az storage account delete --ids $saId --yes
}

# Verify the storage accounts are gone.
az storage account list --resource-group $rgName `
    --query "[?starts_with(name, 'msdocs') == ``true``].name"
```

---

## Get more details

For more information on the references used in this tutorial, see:

- [az group list][03]
- [az group delete][02]
- [az storage account list][05]
- [az storage account delete][04]

This tutorial concludes your onboarding with the Azure CLI. You're now ready to manage Azure
resources at scale using scripts with the Azure CLI.

<!-- updated link references -->

[01]: ./get-started-tutorial-2-environment-syntax.md
[02]: /cli/azure/group#az-group-delete
[03]: /cli/azure/group#az-group-list
[04]: /cli/azure/storage/account#az-storage-account-delete
[05]: /cli/azure/storage/account#az-storage-account-list
