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

If you plan to manage your app or service with Azure CLI 2.0,
you should run it under an Azure Active Directory (AAD) service principal rather than your own credentials.
This topic steps you through creating a security principal with Azure CLI 2.0.

> [!NOTE]
> You can also create a service principal through the Azure portal.
> Read [Use portal to create Active Directory application and service principal that can access resources](/azure/azure-resource-manager/resource-group-create-service-principal-portal) for more details.

## What is a 'service principal'?

An Azure service principal is a security identity used by user-created apps, services, and automation tools to access specific Azure resources. Think of it as a 'user identity' (login and password or certificate) with a specific role, and tightly controlled permissions to access your resources. It only needs to be able to do specific things, unlike a general user identity. It improves security if you only grant it the minimum permissions level needed to perform its management tasks. 

Right now, Azure CLI 2.0 only supports the creation of password-based authentication credentials. In this topic, we cover creating a service principal with a specific password, and optionally assigning specific roles to it.

## Verify your own permission level

First, you must have sufficient permissions in both your Azure Active Directory and your Azure subscription. Specifically, you must be able to create an app in the Active Directory, and assign a role to the service principal. 

The easiest way to check whether your account has adequate permissions is through the portal. See [Check required permission in portal](/azure/azure-resource-manager/resource-group-create-service-principal-portal.md#required-permissions).

## Create a service principal for your application

You must have one of the following to identify the app you want to create a service principal for:

  * The unique name or base URI of your deployed app (such as "MyDemoWebApp" in the following examples) 
  * the Application ID, the unique GUID associated with your deployed app, service, or object

These values identify your application when creating a service principal.

### Get information about your application

Get identity information about your application with the Azure CLI 2.0. 

```azurecli
az ad app list --display-name MyDemoWebApp
```

The `--display-name` filters the returned list of apps and only shows those with display names starting with MyDemoWebApp.

```json
{
    "appId": "a487e0c1-82af-47d9-9a0b-af184eb87646d",
    "appPermissions": null,
    "availableToOtherTenants": false,
    "displayName": "MyDemoWebApp",
    "homepage": "http://MyDemoWebApp.azurewebsites.net",
    "identifierUris": [
      "http://MyDemoWebApp"
    ],
    "objectId": "bd07205b-629f-4a2e-945e-1ee5dadf610b9",
    "objectType": "Application",
    "replyUrls": []
  }
```

### Create the service principal

```azurecli
az ad sp create-for-rbac --name {appId} --password "{strong password here}" 
``` 

```json
{
  "appId": "a487e0c1-82af-47d9-9a0b-af184eb87646d",
  "displayName": "MyDemoWebApp",
  "name": "http://MyDemoWebApp.azurewebsites.net",
  "password": {the password you supplied displayed here},
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
```

 > [!WARNING] 
 > Don't create a simple, insecure password! Create a password using the
 > [Azure AD password rules and restrictions](/azure/active-directory/active-directory-passwords-policy) guidance.

### Get information about the service principal

```azurecli
az ad sp show --id a487e0c1-82af-47d9-9a0b-af184eb87646d
```

```json
{
  "appId": "a487e0c1-82af-47d9-9a0b-af184eb87646d",
  "displayName": "MyDemoWebApp",
  "objectId": "0ceae62e-1a1a-446f-aa56-2300d176659bde",
  "objectType": "ServicePrincipal",
  "servicePrincipalNames": [
    "http://MyDemoWebApp.azurewebsites.net",
    "a487e0c1-82af-47d9-9a0b-af184eb87646d"
  ]
}
```

### Sign in using the service principal

You can now log in as the new service principal for your app using the *appId* and *password* from `az ad sp show`.  Supply the *tenant* value from the results of `az ad sp create-for-rbac`.

```azurecli
az login --service-principal -u a487e0c1-82af-47d9-9a0b-af184eb87646d --password {password} --tenant {tenant}
``` 

Run this command from a new CLI prompt. After a successful sign-on you will see output like this:

```json
[
  {
    "cloudName": "AzureCloud",
    "id": "afd86b90-8bfd-456d-9857-d78ebfac04e0",
    "isDefault": true,
    "name": "Microsoft Azure Internal Consumption",
    "state": "Enabled",
    "tenantId": "72f988bf-86f1-41af-91ab-2d7cd011db47",
    "user": {
      "name": "https://MyDemoWebApp.azurewebsites.net",
      "type": "servicePrincipal"
    }
  }
]
```

Use the `name`, `password`, and `tenant` values  as the credentials for running your app. 

## Managing roles 

> [!NOTE]
> Azure Role-Based Access Control (RBAC) is a model for defining and managing roles for user and service principals.
> Roles have sets of permissions associated with them,
> which determine the resources a principal can read, access, write, or manage.
> For more information on RBAC and roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles.md).

The Azure CLI 2.0 provides the following commands to manage role assignments:

* List the current roles granted to a service principal: [az role assignment list](https://docs.microsoft.com/en-us/cli/azure/role/assignment#list)
* Add additional roles to a service principal: [az role assignment create](https://docs.microsoft.com/en-us/cli/azure/role/assignment#create)
* Remove a role assignment from a service principal: [az role assignment delete](https://docs.microsoft.com/en-us/cli/azure/role/assignment#delete)

The default role for a service principal is **Contributor**. It may not be the best choice for an app's interactions with Azure services, given its broad permissions. The **Reader** role is more restrictive and is a good choice for read-only access. You can view details on role-specific permissions or create custom ones through the Azure portal.

In this example, we add the **Reader** role to our prior example, and delete the **Contributor**
one:

```azurecli
az role assignment create --assignee 20bce7de-3cd7-49f4-ab64-bb5b443838c3 --role Reader
az role assignment delete --assignee https://MyDemoWebApp.azurewebsites.net --role Contributor
```

Verify the changes by listing the currently assigned roles:

```azurecli
az role assignment list --assignee 20bce7de-3cd7-49f4-ab64-bb5b443838c3
```

> [!NOTE] 
> If your account does not have sufficient permissions to assign a role, you see an error message.
> The message states your account "does not have authorization to perform action
> 'Microsoft.Authorization/roleAssignments/write' over scope '/subscriptions/{guid}'."


## Change the credentials of a security principal

It's a good security practice to review permissions and update passwords regularly. You may also want to manage and modify the security credentials as your app changes.

### Reset a service principal password

```azurecli
az ad sp reset-credentials --name 20bce7de-3cd7-49f4-ab64-bb5b443838c3 --password {new-password} --years 2
```

```json
{
  "appId": "20bce7de-3cd7-49f4-ab64-bb5b443838c3",
  "name": "20bce7de-3cd7-49f4-ab64-bb5b443838c3",
  "password": {new-password},
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
```

If no value for `--password` is provided, a new one is generated for you. 