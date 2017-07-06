---
title: Create an Azure service principal with Azure CLI 2.0
description: Learn how to create a service principal for your app or service with Azure CLI 2.0.
keywords: Azure CLI 2.0, Azure Active Directory, Azure Active directory, AD, RBAC
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 02/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
ms.assetid: fab89cb8-dac1-4e21-9d34-5eadd5213c05
---

# Create an Azure service principal with Azure CLI 2.0

If you want to manage permissions for your app or service, you can do so through creating a service principal under Azure Active Directory. A service principal will allow you to set per-app permissions restrictions. This topic will run you through the steps for creating a service principal and setting its permissions.

> [!NOTE]
> Right now, Azure CLI 2.0 only supports the creation of password-based authentication credentials. If you need to create certificate-based credentials, create the service principal through the Azure portal. Read [Use portal to create Active Directory application and service principal that can access resources](/azure/azure-resource-manager/resource-group-create-service-principal-portal) for more details.

## Verify your own permission level

To create a service principal, you must have the appropriate permissions on your user account. You must be able to create an app in the Active Directory, and assign a role to the service principal. 

The easiest way to check whether your account has adequate permissions is through the portal. See [Check required permission in portal](/azure/azure-resource-manager/resource-group-create-service-principal-portal.md#required-permissions).

## Get required product identifier

You must have one of the following to identify the product you want to create a service principal for:

  * The unique name or URI of your deployed app
  * The Application ID, the unique GUID associated with your deployed app, service, or object

If you don't have this information, you can use the [az webapp list](/cli/azure/webapp#list) command:

```azurecli
az webapp list --output table --query [].{name:name,URI:defaultHostName}
```

### Create the service principal

Use [az ad sp create-for-rbac](/cli/azure/ad/sp#create-for-rbac) to create the service principal. For example, if you have the application name:

```azurecli-interactive
az ad sp create-for-rbac --name APP_NAME --password ... 
``` 

```json
{
  "appId": "d7d167ca-ad2a-4b31-ab64-7d5b714b7d8d",
  "displayName": "APP_NAME",
  "name": "http://APP_NAME",
  "password": ...,
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
```

Record the `appId` and `tenant` values, which will be used to authenticate.

 > [!WARNING] 
 > Don't create an insecure password.  Follow the [Azure AD password rules and restrictions](/azure/active-directory/active-directory-passwords-policy) guidance. If you omit the `--password` argument, a secure password will be created for you.

### Sign in using the service principal

You can now log in as the new service principal for your app using the `appId` and `password` from the output of the previous command, or from [az sp app show](/cli/azure/ad/sp#show).  Supply the `tenant` value from the results of `az ad sp create-for-rbac`:

```azurecli-interactive
az login --service-principal -u d7d167ca-ad2a-4b31-ab64-7d5b714b7d8d --password {password} --tenant {tenant}
``` 

You will see this output after a successful sign-on:

```json
[
  {
    "cloudName": "AzureCloud",
    "id": "d7d167ca-ad2a-4b31-ab64-7d5b714b7d8d",
    "isDefault": true,
    "state": "Enabled",
    "tenantId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
    "user": {
      "name": "https://MyDemoWebApp",
      "type": "servicePrincipal"
    }
  }
]
```

Use the `id`, `password`, and `tenant` values as the credentials for running your app. 

## Managing roles 

The Azure CLI 2.0 provides the following commands to manage role assignments:

* [az role assignment list](/cli/azure/role/assignment#list)
* [az role assignment create](/cli/azure/role/assignment#create)
* [az role assignment delete](/cli/azure/role/assignment#delete)

The default role for a service principal is **Contributor**. It may not be the best choice for an app's interactions with Azure services, given its broad permissions. The **Reader** role is more restrictive and is a good choice for read-only access.  For more information on Role-Based Access Control (RBAC) and roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles).

In this example, add the **Reader** role to our prior example, and delete the **Contributor** one:

```azurecli-interactive
az role assignment create --assignee d7d167ca-ad2a-4b31-ab64-7d5b714b7d8d --role Reader
az role assignment delete --assignee d7d167ca-ad2a-4b31-ab64-7d5b714b7d8d --role Contributor
```

Verify the changes by listing the currently assigned roles:

```azurecli-interactive
az role assignment list --assignee d7d167ca-ad2a-4b31-ab64-7d5b714b7d8d
```

```json
{
    "id": "/subscriptions/34345f33-0398-4a99-a42b-f6613d1664ac/providers/Microsoft.Authorization/roleAssignments/c27f78a7-9d3b-404b-ab59-47818f9af9ac",
    "name": "c27f78a7-9d3b-404b-ab59-47818f9af9ac",
    "properties": {
      "principalId": "790525226-46f9-4051-b439-7079e41dfa31",
      "principalName": "http://MyDemoWebApp",
      "roleDefinitionId": "/subscriptions/34345f33-0398-4a99-a42b-f6613d1664ac/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7",
      "roleDefinitionName": "Reader",
      "scope": "/subscriptions/34345f33-0398-4a99-a42b-f6613d1664ac"
    },
    "type": "Microsoft.Authorization/roleAssignments"
}
```

> [!NOTE] 
> If your account does not have sufficient permissions to assign a role, you will see an error message that your account "does not have authorization to perform action 'Microsoft.Authorization/roleAssignments/write' over scope '/subscriptions/{guid}'."
