---
title: Create an Azure service principal with Azure CLI 2.0
description: Learn how to create a service principal for your app or service with Azure CLI 2.0.
keywords: Azure CLI 2.0, Azure Active Directory, Azure Active directory, AD, RBAC
author: erickson-doug
manager: douge
ms.date: 02/20/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: fab89cb8-dac1-4e21-9d34-5eadd5213c05
---

# Create an Azure service principal with Azure CLI 2.0

If you plan to manage your app or service with Azure and the Azure CLI 2.0, you should run it under an Azure Active Directory (AAD) service principal, rather than your own login credentials.  This topic steps you through creating a security principal with Azure CLI 2.0.


> [!NOTE] You can also create a service principal through the Azure portal. Read [Use portal to create Active Directory application and service principal that can access resources](/azure/azure-resource-manager/resource-group-create-service-principal-portal) for more details.

## What is a 'service principal'?

An Azure service principal is a security identity used by user-created apps, services, and automation tools to access specific Azure resources. Think of it as a 'user identity' (login and password or certificate) with a very specific role, and very tightly controlled permissions to access your resources. It only needs to be able to do very specific things, unlike a general user identity, and it improves security if you only grant it the minimum permissions level needed to perform its management tasks. 

Right now, Azure CLI 2.0 only supports password-based authentication credentials. In this topic, we'll cover creating a service principal with a specific password, and optionally assigning specific roles to it.

## Verify your own permission level

First, you must have sufficient permissions in both your Azure Active Directory and your Azure subscription. Specifically, you must be able to create an app in the Active Directory, and assign the service principal to a role. 

The easiest way to check whether your account has adequate permissions is through the portal. See [Check required permission in portal](/azure/azure-resource-manager/resource-group-create-service-principal-portal.md#required-permissions).

If you have this permission level, log in to your Azure account.

```azurecli
az login -u {your username} -p {password}
```

or use `az login` (no flags) and copy the returned code into [the Azure device login portal](https://aka.ms/devicelogin).

## Create a service principal for your app 

Logged in? Great! Let's create the service principal. To do that, use the `az ad sp create-for-rbac` command. You must have one of the following:

  * The unique name of your deployed app (such as "WebApplication17089" in the following examples) 
  * A base URL ("https://webapplication17089.azurewebsites.net" in the following examples) for your deployed web app
  * an app or object ID (a unique GUID value associated with your deployed app, service, or object)

 Any one of these values will work as your *appID* in the examples below. Now, let's use `az ad sp create-for-rbac` to create a service principal that supports Azure RBAC roles.

 > [!WARNING] 
 > Please do NOT create a simple, insecure password! You should create a password using the [Azure AD password rules and restrictions](/active-directory/active-directory-passwords-policy) guidance.

```azurecli
az ad sp create-for-rbac --name {appId} --password "{strong password here}" 
``` 

Your results should look similar to this (but with values you supplied):

```
{
  "appId": "59db508a-3429-4094-a828-e8b4680fc790",
  "displayName": null,
  "name": "https://webapplication17089.azurewebsites.net",
  "password": {the password you supplied displayed here},
  "tenant": "72f988bf-86f1-41af-91ab-2d7cd011db47"
}
```
You can now login as your new security principal for your app, with the *appId* and *password* you provided.  You will also supply the *tenant* GUID value from the results. 

```azurecli
az login --service-principal -u {appId} --password {password} --tenant {tenant}
``` 

Run this command from a new CLI prompt and confirm that you are logged in as the security principal. You should see something like this:

```
[
  {
    "cloudName": "AzureCloud",
    "id": "afd86b90-8bfd-456d-9857-d78ebfac04e0",
    "isDefault": true,
    "name": "Microsoft Azure Internal Consumption",
    "state": "Enabled",
    "tenantId": "72f988bf-86f1-41af-91ab-2d7cd011db47",
    "user": {
      "name": "https://webapplication17089.azurewebsites.net",
      "type": "servicePrincipal"
    }
  }
]
```

Congratulations! You can use the `name`, `password`, and `tenant` as the credentials for running your app. Yoou may need to tweak the permissions, though; we'll discuss that in the next section.

## Managing roles 

> [!NOTE]
> Azure Role-Based Access Control (RBAC) is a model for defining and managing roles for user and security principals. Roles have sets of permissions associated with them, which determine the resources a principal can read, access, write, or manage. For more details on on RBAC and roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles.md).

You can add additional roles to your security principal with the `az ad sp create-for-rbac` command as well.

```azurecli
az ad sp create-for-rbac --name {appId} --password "{strong password here}" --role {rolename}
```

And delete them with:

```azurecli
az role assignment delete --assignee {appId} --role {rolename}
```

The default role for a security principal is **Contributor**, but it may not be the best choice depending on the scope of your app's interactions with Azure services, given its broad permissions. The **Reader** role is more restrictive and can be a good choice for read-only apps. You can view details on role-specific permissions or create custom ones through the Azure portal.

In this example, we add the **Reader** role to our prior example, and delete the **Contributor** one:

```
az ad sp create-for-rbac --name {appId} --role Reader
az role assignment delete --assignee https://webapplication17089.azurewebsites.net --role Contributor
```

You can view the currently assigned roles with the following command:

```azurecli
az role assignment list --query [*].properties.roleDefinitionName
```

> [!NOTE] 
> If your account does not have sufficient permissions to assign a role, you see an error message. The message states your account "does not have authorization to perform action 'Microsoft.Authorization/roleAssignments/write' over scope '/subscriptions/{guid}'."


## Reset the security principal credentials

It's a good security practice to review the permissions and update the password regularly. You may also want to manage and modify the security credentials as your app changes. You can do this easily with the `az ad sp reset-credentials` command. 

For example, we can reset the expiry for the service principal credentials to a new value. (The default expiration is 1 year.) Here, we set it to expire in 2 years.

```azurecli
az ad sp reset-credentials --name {appId} --password {current-password} --years 2
```

Or we can assign a new password:

```azurecli
az ad sp reset-credentials --name {appId} --password {my-new-password}
```

If no value for `--password` is provided, a new one is generated for you. 









