---
title: Create an Azure service principal with Azure CLI 2.0
description: Learn how to create a service principal for your app or service with Azure CLI 2.0.
keywords: Azure CLI 2.0, Azure Active Directory, Azure Active directory, AD, RBAC
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 10/12/2017
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

Azure CLI 2.0 supports the creation of password-based authentication credentials and certificate credentials. In this topic, we cover both types of credentials.

## Verify your own permission level

First, you must have sufficient permissions in both your Azure Active Directory and your Azure subscription. Specifically, you must be able to create an app in the Active Directory, and assign a role to the service principal.

The easiest way to check whether your account has adequate permissions is through the portal. See [Check required permission in portal](/azure/azure-resource-manager/resource-group-create-service-principal-portal#required-permissions).

## Create a service principal for your application

You must have one of the following to identify the app you want to create a service principal for:

  * The unique name or URI of your deployed app (such as "MyDemoWebApp" in the examples), or
  * the Application ID, the unique GUID associated with your deployed app, service, or object

These values identify your application when creating a service principal.

### Get information about your application

Get identity information about your application with the `az ad app list`.

[!INCLUDE [cloud-shell-try-it.md](includes/cloud-shell-try-it.md)]

```azurecli-interactive
az ad app list --display-name MyDemoWebApp
```

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

The `--display-name` option filters the returned list of apps to show those with `displayName` starting with MyDemoWebApp.

### Create a service principal with a password

Use [az ad sp create-for-rbac](/cli/azure/ad/sp#create-for-rbac) and the `--password` parameter to create the service principal with a password. When you do not provide a role or scope, it defaults to the **Contributor** role for the current subscription. If you create a service principal without using either the `--password` or `--cert` parameter, password authentication is used and a password is generated for you.

```azurecli-interactive
az ad sp create-for-rbac --name {appName} --password "{strong password}"
```

```json
{
  "appId": "a487e0c1-82af-47d9-9a0b-af184eb87646d",
  "displayName": "MyDemoWebApp",
  "name": "http://MyDemoWebApp",
  "password": {strong password},
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
```

 > [!WARNING]
 > Don't create an insecure password.  Follow the
 > [Azure AD password rules and restrictions](/azure/active-directory/active-directory-passwords-policy) guidance.

### Create a service principal with a self-signed certificate

Use [az ad sp create-for-rbac](/cli/azure/ad/sp#create-for-rbac) and the `--create-cert` parameter to create a self-signed certificate.

```azurecli-interactive
az ad sp create-for-rbac --name {appName} --create-cert
```

```json
{
  "appId": "c495db57-82e0-4e2e-9369-069dff176858",
  "displayName": "azure-cli-2017-10-12-22-15-38",
  "fileWithCertAndPrivateKey": "<path>/<file-name>.pem",
  "name": "http://MyDemoWebApp",
  "password": null,
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
```

Copy the value of the `fileWithCertAndPrivateKey` response. This is the certificate file which will be used for authentication.

For more options when using certificates, see [az ad sp create-for-rbac](/cli/azure/ad/sp#create-for-rbac).

### Get information about the service principal

```azurecli-interactive
az ad sp show --id {appID}
```

```json
{
  "appId": "a487e0c1-82af-47d9-9a0b-af184eb87646d",
  "displayName": "MyDemoWebApp",
  "objectId": "0ceae62e-1a1a-446f-aa56-2300d176659bde",
  "objectType": "ServicePrincipal",
  "servicePrincipalNames": [
    "http://MyDemoWebApp",
    "a487e0c1-82af-47d9-9a0b-af184eb87646d"
  ]
}
```

### Sign in using the service principal

You can now log in as the new service principal for your app using the *appId* from `az ad sp show`, and either the *password* or the path to the created certificate.  Supply the *tenant* value from the results of `az ad sp create-for-rbac`.

```azurecli-interactive
az login --service-principal -u {appID} --password {password-or-path-to-cert} --tenant {tenant}
```

You will see this output after a successful sign-on:

```json
[
  {
    "cloudName": "AzureCloud",
    "id": "a487e0c1-82af-47d9-9a0b-af184eb87646d",
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

> [!NOTE]
> Azure Role-Based Access Control (RBAC) is a model for defining and managing roles for user and service principals.
> Roles have sets of permissions associated with them,
> which determine the resources a principal can read, access, write, or manage.
> For more information on RBAC and roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles).

The Azure CLI 2.0 provides the following commands to manage role assignments:

* [az role assignment list](/cli/azure/role/assignment#list)
* [az role assignment create](/cli/azure/role/assignment#create)
* [az role assignment delete](/cli/azure/role/assignment#delete)

The default role for a service principal is **Contributor**. It may not be the best choice for an app's interactions with Azure services, given its broad permissions. The **Reader** role is more restrictive and is a good choice for read-only access. You can view details on role-specific permissions or create custom ones through the Azure portal.

In this example, add the **Reader** role to our prior example, and delete the **Contributor**
one:

```azurecli-interactive
az role assignment create --assignee a487e0c1-82af-47d9-9a0b-af184eb87646d --role Reader
az role assignment delete --assignee a487e0c1-82af-47d9-9a0b-af184eb87646d --role Contributor
```

Verify the changes by listing the currently assigned roles:

```azurecli-interactive
az role assignment list --assignee a487e0c1-82af-47d9-9a0b-af184eb87646d
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
> If your account does not have sufficient permissions to assign a role, you see an error message.
> The message states your account "does not have authorization to perform action
> 'Microsoft.Authorization/roleAssignments/write' over scope '/subscriptions/{guid}'."

## Change the credentials of a security principal

It's a good security practice to review permissions and update passwords regularly. You may also want to manage and modify the security credentials as your app changes.

### Reset a service principal password

Use `az ad sp reset-credentials` to reset the current password for the service principal.

```azurecli-interactive
az ad sp reset-credentials --name 20bce7de-3cd7-49f4-ab64-bb5b443838c3 --password {new-password}
```

```json
{
  "appId": "a487e0c1-82af-47d9-9a0b-af184eb87646d",
  "name": "a487e0c1-82af-47d9-9a0b-af184eb87646d",
  "password": {new-password},
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
```

The CLI generates a secure password if you leave out the `--password` option.
