---
title: Work with Azure service principals – Azure CLI | Microsoft Docs
description: Learn how to create and use service principals with the Azure CLI. Use service principals to gain control over which Azure resources can be accessed.
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
# Work with Azure service principals using the Azure CLI

Automated tools that use Azure services should always have restricted permissions to ensure that Azure resources are secure. Therefore, instead of having applications sign in as a fully privileged user, Azure offers service principals. An Azure service principal is an identity created for use with applications, hosted services, and automated tools.  This identity is used to access resources.

In this tutorial, you learn how to:

> [!div class="checklist"]
> * Create a service principal
> * Manage service principal roles
> * Sign in using a service principal and password
> * Sign in using a service principal and certificate
> * Create an Azure resource using a service principal
> * Reset a service principal credentials

## Prerequisites

* You must have `User Access Administrator` or `Role Based Access Control Administrator` or higher permissions in the subscription to create a service principal. For a list of roles available for [Azure role-based access control (Azure RBAC)](/azure/role-based-access-control/overview), see [Azure built-in roles](/azure/role-based-access-control/built-in-roles).

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]

## 1 - Create a service principal

Use the [az ad sp create-for-rbac](/cli/azure/ad/sp#az_ad_sp_create_for_rbac) Azure CLI reference command to create a service principal. Because this example does not specify a `--name` parameter, a name containing a time stamp is automatically created.

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

If you aren't adhering to resource naming conventions and plan to create a role and scope for your new service principal later, the `az ad sp create-for-rbac` command without parameters works fine. However, without a role and scope, the new service principal doesn't have access to resources. It just exists. Here are a few more things to know:

* Record your system-assigned password as you won't be able to retrieve it again. If you lose the password, reset it using [az ad sp credential reset](/cli/azure/ad/sp/credential#az-ad-sp-credential-reset) as explained in step seven, [Reset credentials](./azure-cli-sp-tutorial-7.md).
* Get the `appId`, `displayName` and `tenant` at any time with the [az ad sp list](/cli/azure/ad/sp#az-ad-sp-list) command as explained in step four, [Get an existing service principal](./azure-cli-sp-tutorial-4.md).
* Set the role assignment by using [az role assignment create](/cli/azure/role/assignment#az-role-assignment-create) as explained in step 5, [Manage service principal roles](./azure-cli-sp-tutorial-5.md).

## Create a service principal with role and scope

As a best practice, always assign a specific `--role` and `--scopes` when you create a service principal. In this example, a new service principal named **spForMyApp** was created with **reader** permissions to all resources in **myRG1**, but only **myVM** in resource group **myRG2**. Notice the space-delimited list of scopes.

```azurecli-interactive
az ad sp create-for-rbac --name spNameForMyApp \
                         --role reader \
                         --scopes /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myRG1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myRG2/providers/Microsoft.Compute/virtualMachines/myVM
```

> [!WARNING]
> When you create an Azure service principal using the `az ad sp create-for-rbac` command, the output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. As an alternative, consider using [managed identities](/azure/active-directory/managed-identities-azure-resources/overview) if available to avoid the need to use credentials.

## Next Steps

Now that you've learned how to create an Azure service principal, proceed to the next step to learn how to use service principals with password-based authentication.

> [!div class="nextstepaction"]
> [Work with service principals using a password](./azure-cli-sp-tutorial-2.md)
