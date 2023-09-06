---
title: Manage service principal roles – Azure CLI | Microsoft Docs
description: Learn how to manage role assignments using Azure CLI.
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

# 3 - Manage service principal roles

The Azure CLI has the following commands to manage role assignments:

* [az role assignment list](/cli/azure/role/assignment#az-role-assignment-list)
* [az role assignment create](/cli/azure/role/assignment#az-role-assignment-create)
* [az role assignment delete](/cli/azure/role/assignment#az-role-assignment-delete)

The **Contributor** role has full permissions to read and write to an Azure account. The **Reader** role is more restrictive, with read-only access. For more information on Role-Based Access Control (RBAC) and roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles).

This example adds the **Reader** role and removes the **Contributor** role:

```azurecli-interactive
az role assignment create --assignee appID \
                          --role Reader \
                          --scope /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName

az role assignment delete --assignee appID \
                          --role Contributor \
                          --scope /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName
```

Adding a role _doesn't_ restrict previously assigned permissions. Since the *Contributor* rights are added by default, the role should be deleted using the command shown previously.

The changes can be verified by listing the assigned roles:

```azurecli-interactive
az role assignment list --assignee appID
```

You can also go into the [Azure portal](https://ms.portal.azure.com/) and manually assign the role to the service principal from the IAM section of the Azure Container Registry Instance.