---
title: Create Azure service principals using the Azure CLI | Microsoft Docs
description: Learn how to create and use service principals to control access to Azure resources using the Azure CLI.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 10/10/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---
# Create an Azure service principal with Azure CLI

Automated tools that use Azure services should always have restricted permissions to ensure that Azure resources are secure. Therefore, instead of having applications sign in as a fully privileged user, Azure offers service principals. An Azure service principal is an identity created for use with applications, hosted services, and automated tools. This identity is used to access resources.

In this tutorial, you learn how to:

> [!div class="checklist"]
>
> * Create a service principal
> * Sign in using a service principal and password
> * Sign in using a service principal and certificate
> * Manage service principal roles
> * Create an Azure resource using a service principal
> * Reset service principal credentials

## Prerequisites

* In a subscription, you must have `User Access Administrator` or `Role Based Access Control Administrator` permissions, or higher, to create a service principal. For a list of roles available for Azure role-based access control (Azure RBAC), see [Azure built-in roles](/azure/role-based-access-control/built-in-roles).

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]

## Create a service principal

Use the [az ad sp create-for-rbac](/cli/azure/ad/sp#az_ad_sp_create_for_rbac) Azure CLI reference command to create a service principal. This example doesn't specify a `--name` parameter, so a name containing a time stamp is automatically created.

```azurecli-interactive
az ad sp create-for-rbac
```

Output console:

```output
{
  "appId": "myAppId",
  "displayName": "myServicePrincipalName",
  "password": "myServicePrincipalPassword",
  "tenant": "myTentantId"
}
```

If you aren't adhering to resource naming conventions and plan to create a role and scope for your new service principal later, the `az ad sp create-for-rbac` command without parameters is an acceptable solution. However, without a role and scope, the new service principal doesn't have access to resources. It just exists.

When you create a service principal without parameters, also complete these steps:

* Record your system-assigned password as you can't retrieve it again. If you lose the password, reset it using [az ad sp credential reset](/cli/azure/ad/sp/credential#az-ad-sp-credential-reset) as explained in [Reset service principal credentials](./azure-cli-sp-tutorial-7.md).
* Set the role assignment for your new service principal by using [az role assignment create](/cli/azure/role/assignment#az-role-assignment-create) as explained in [Manage service principal roles](./azure-cli-sp-tutorial-5.md).

## Create a service principal with role and scope

As a best practice, always assign a specific `--role` and `--scopes` when you create a service principal. Follow these steps:

1. Determine the correct role.

   When determining role, always use the principle of least privilege. For example, don't give your service principal `contributor` permissions to a subscription if the service principal only needs to access Azure storage within a resource group. Consider a specialize role like [storage blob data contributor](/azure/role-based-access-control/built-in-roles#storage-blob-data-contributor). For a complete list of available roles in Azure RBAC, see [Azure built-in roles](/azure/role-based-access-control/built-in-roles).

1. Get a value for the scopes parameter.

   Find and copy the **Resource ID** of the Azure resource the new service principal needs to access. This information is usually found in the Azure portal's **Properties** or **Endpoints** page of each resource. Here are common `--scopes` examples, but _rely on your **Resource ID** for an actual format and value_.

   | Scope | Example |
   |-|-|
   | Subscription | `/subscriptions/mySubscriptionID`
   | Resource group | `/subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName`
   | Virtual machine | `/subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName/providers/Microsoft.Compute/virtualMachines/myVMname`
   | Storage account file service | `/subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName/providers/Microsoft.Storage/storageAccounts/myStorageAccountName/fileServices/default`
   | Data factory | `/subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName/providers/Microsoft.DataFactory/factories/myDataFactoryName`

   For more scope examples, see [Understand scope for Azure RBAC](/azure/role-based-access-control/scope-overview).

1. Create the service principal.

   In this example, a new service principal named **myServicePrincipalName1** is created with **reader** permissions to all resources in resource group **RG1**.

   # [Bash](#tab/bash)

   ```azurecli-interactive
   # Bash script
   az ad sp create-for-rbac --name myServicePrincipalName1 \
                            --role reader \
                            --scopes /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myRG1
   ```

   The `--scopes` parameter accepts a space-delimited list of scopes. In this example, a new service principal named **myServicePrincipalName2** is created with **reader** permissions to all resources in resource group **myRG1**. This service principal is also given **reader** permissions to **myVM** located in **myRG2**.
  
   ```azurecli-interactive
   # Bash script
   az ad sp create-for-rbac --name myServicePrincipalName2 \
                            --role reader \
                            --scopes /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myRG1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myRG2/providers/Microsoft.Compute/virtualMachines/myVM
   ```

   # [PowerShell](#tab/powershell)

   When working in a [PowerShell](/powershell/scripting/overview) environment, remove Bash line continuation characters.

   ```powershell
   # PowerShell script
   az ad sp create-for-rbac --name myServicePrincipalName1 --role reader --scopes /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myRG1
   ```

   The `--scopes` parameter accepts a space-delimited list of scopes. In this example, a new service principal named **myServicePrincipalName2** is created with **reader** permissions to all resources in resource group **myRG1**. This service principal is also given **reader** permissions to **myVM** located in **myRG2**.

   ```azurecli
   # PowerShell script
   az ad sp create-for-rbac --name myServicePrincipalName2 --role reader --scopes /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myRG1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myRG2/providers/Microsoft.Compute/virtualMachines/myVM
   ```

   ---

   If you decide that you granted too few or too many permissions to your new service principal, alter the permissions by [managing service principal roles](azure-cli-sp-tutorial-5.md).

## Create a service principal using variables

You can also create a service principal using variables:

# [Bash](#tab/bash)

```azurecli-interactive
# Bash script
let "randomIdentifier=$RANDOM*$RANDOM"
servicePrincipalName="msdocs-sp-$randomIdentifier"
roleName="azureRoleName"
subscriptionID=$(az account show --query id --output tsv)
# Verify the ID of the active subscription
echo "Using subscription ID $subscriptionID"
resourceGroup="myResourceGroupName"

echo "Creating SP for RBAC with name $servicePrincipalName, with role $roleName and in scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup"
az ad sp create-for-rbac --name $servicePrincipalName \
                         --role $roleName \
                         --scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup
```

# [PowerShell](#tab/powershell)

```azurecli
# PowerShell script
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$servicePrincipalName="msdocs-sp-$randomIdentifier"
$roleName="azureRoleName"
$subscriptionID=$(az account show --query id --output tsv)
$resourceGroup="myResourceGroupName"
echo "Creating SP for RBAC with name $servicePrincipalName, with role $roleName and in scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup"

az ad sp create-for-rbac --name $servicePrincipalName --role $roleName --scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup
```

---

For a complete list of service principal properties, use [az ad sp list](/cli/azure/ad/sp#az-ad-sp-list) and see [Get an existing service principal](./azure-cli-sp-tutorial-4.md).

> [!WARNING]
> When you create an Azure service principal using the `az ad sp create-for-rbac` command, the output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. As an alternative, consider using [managed identities](/azure/active-directory/managed-identities-azure-resources/overview) if available to avoid the need to use credentials.

## Next Steps

Now that you've learned how to create an Azure service principal, proceed to the next step to learn how to use service principals with password-based authentication.

> [!div class="nextstepaction"]
> [Use password-based authentication](./azure-cli-sp-tutorial-2.md)
