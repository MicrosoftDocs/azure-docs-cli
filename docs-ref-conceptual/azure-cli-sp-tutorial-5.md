---
title: Manage service principal roles using the Azure CLI | Microsoft Docs
description: Learn how to manage role assignments for a service principal using Azure CLI.
ms.date: 06/05/2024
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Manage service principal roles

In order to restrict access to your Azure resources, you can use a service principal to manage role assignments. Each role provides different permissions allowed by the user when accessing Azure resources. This step in the tutorial explains how to create and remove service principal roles.

The Azure CLI has the following commands to manage role assignments:

* [az role assignment list](/cli/azure/role/assignment#az-role-assignment-list)
* [az role assignment create](/cli/azure/role/assignment#az-role-assignment-create)
* [az role assignment delete](/cli/azure/role/assignment#az-role-assignment-delete)

## Create or remove a role assignment

The **Contributor** role has full permissions to read and write to an Azure account. The **Reader** role is more restrictive with read-only access. Always use the principle of least privilege. For a complete list of available roles in Azure RBAC, see [Azure built-in roles](/azure/role-based-access-control/built-in-roles).

Adding a role _doesn't_ restrict previously assigned permissions. This example adds the **Reader** role and removes the **Contributor** role:

```azurecli-interactive
az role assignment create --assignee myServicePrincipalID \
                          --role Reader \
                          --scope /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName

az role assignment delete --assignee myServicePrincipalID \
                          --role Contributor \
                          --scope /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName
```

Output Console:

```output
{
  "condition": null,
  "conditionVersion": null,
  "createdBy": null,
  "createdOn": "yyyy-mm-ddT00:00:00.000000+00:00",
  "delegatedManagedIdentityResourceId": null,
  "description": null,
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.Authorization/roleAssignments/00000000-0000-0000-0000-000000000000",
  "name": "00000000-0000-0000-0000-000000000000",
  "principalId": "00000000-0000-0000-0000-000000000000",
  "principalType": "ServicePrincipal",
  "roleDefinitionId": "/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.Authorization/roleDefinitions/00000000-0000-0000-0000-000000000000",
  "scope": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroupName",
  "type": "Microsoft.Authorization/roleAssignments",
  "updatedBy": "00000000-0000-0000-0000-000000000000",
  "updatedOn": "yyyy-mm-ddT00:00:00.000000+00:00"
}
```

## How to get a value for the scope parameter

One question you might have is "How do I know the `--scope` parameter value?" The answer is to find and copy the **Resource ID** of the Azure resource your service principal needs to access. This information is usually found in the Azure portal's **Properties** or **Endpoints** page of each resource. Here are common `--scope` examples, but _rely on your **Resource ID** for an actual format and value_.

| Scope | Example |
|-|-|
| Subscription | `/subscriptions/mySubscriptionID`
| Resource group | `/subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName`
| Virtual machine | `/subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName/providers/Microsoft.Compute/virtualMachines/myVMname`
| Storage account file service | `/subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName/providers/Microsoft.Storage/storageAccounts/myStorageAccountName/fileServices/default`
| Data factory | `/subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName/providers/Microsoft.DataFactory/factories/myDataFactoryName`

For more scope examples, see [Understand scope for Azure RBAC](/azure/role-based-access-control/scope-overview).

## Verify changes

The changes can be verified by listing the assigned roles:

```azurecli-interactive
# list all role assignments for the current subscription
az role assignment list --output table

# list role assignments for a user
az role assignment list --assignee myUserName@contoso.com

# list role assignments for a subscription
az role assignment list --subscription mySubscriptionID
```

You can also go into the [Azure portal](https://ms.portal.azure.com/) and manually assign the role to the service principal from the Access control (IAM) menu. For more examples on listing role assignments, see [List Azure role assignments using Azure CLI](/azure/role-based-access-control/role-assignments-list-cli).

## Next Steps

Now that you've learned how to manage your service principal roles, proceed to the next step to learn how to use service principals to create a resource.

> [!div class="nextstepaction"]
> [Create a resource using service principal](./azure-cli-sp-tutorial-6.md)
