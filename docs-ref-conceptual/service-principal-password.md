---
title: Work with Azure service principals with a password – Azure CLI | Microsoft Docs
description: Learn how to create and use service principals with the Azure CLI. Use service principals with a password to gain control over which Azure resources can be accessed.
manager: jasongroce
author: daphnemamicrosoft
ms.author: daphnema
ms.date: 08/2/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

### Password-based authentication

With password-based authentication, a random password is created for you.  If you don't specify a `--name` parameter value, a name containing a time stamp is created for you.  You must specify a `--scopes` as this value doesn't have a default.  If you prefer, you can set the role assignment later by using [az role assignment create](/cli/azure/role/assignment#az-role-assignment-create).

```azurecli-interactive
# Create a service principal with required parameter
az ad sp create-for-rbac --scopes /subscriptions/mySubscriptionID

# Create a service principal for a resource group using a preferred name and role
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role reader \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName
```

You can also create a service principal using variables.

```azurecli-interactive
let "randomIdentifier=$RANDOM*$RANDOM"  
servicePrincipalName="msdocs-sp-$randomIdentifier"
roleName="azureRoleName"
subscriptionID=$(az account show --query id -o tsv)
# Verify the ID of the active subscription
echo "Using subscription ID $subscriptionID"
resourceGroup="myResourceGroupName"

echo "Creating SP for RBAC with name $servicePrincipalName, with role $roleName and in scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup"
az ad sp create-for-rbac --name $servicePrincipalName --role $roleName --scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup
```

The output for a service principal with password authentication includes the `password` key. __Make sure you copy this value__ - it can't be retrieved. If you lose the password, [reset the service principal credentials](#6-reset-credentials).
