---
title: Manage service principal roles – Azure CLI | Microsoft Docs
description: Learn how to manage role assignments using Azure CLI.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 09/29/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# 5 - Manage service principal roles

In order to restrict access to your Azure service's resources, you can use a service principal to manage role assignments. Each role provides a different amount of permissions allowed by the user when accessing the service's resources.

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

Output Console:

```
{
  "condition": null,
  "conditionVersion": null,
  "createdBy": "userID",
  "createdOn": "2023-09-13T21:12:24.213484+00:00",
  "delegatedManagedIdentityResourceId": null,
  "description": null,
  "id": "/subscriptions/mySubscriptionID/resourceGroups/daphne-test/providers/Microsoft.Authorization/roleAssignments/myName",
  "name": "myName",
  "principalId": "myPrincipalId",
  "principalName": "myPrincipalName",
  "principalType": "servicePrincipal",
  "resourceGroup": "myResourceGroupName",
  "roleDefinitionId": "/subscriptions/mysubscriptionID/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7",
  "roleDefinitionName": "Reader",
  "scope": "/subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName",
  "type": "Microsoft.Authorization/roleAssignments",
  "updatedBy": "userID",
  "updatedOn": "2023-09-13T21:12:24.213484+00:00"
}
```

Adding a role _doesn't_ restrict previously assigned permissions. Since the *Contributor* rights are added by default, the role should be deleted using the command shown previously.

The changes can be verified by listing the assigned roles:

```azurecli-interactive
az role assignment list --assignee appID
```

You can also go into the [Azure portal](https://ms.portal.azure.com/) and manually assign the role to the service principal from the IAM section of the Azure Container Registry Instance.  For more information on role assignments, see [Steps to add a role assignment](/azure/role-based-access-control/role-assignments-steps).

## Next Steps

Now that you've learned how to manage your service principal roles, proceed to the next step to learn how to use service principals to create a resource.

> [!div class="nextstepaction"]
> [Create a resource using service principal](./azure-cli-sp-tutorial-6.md)
