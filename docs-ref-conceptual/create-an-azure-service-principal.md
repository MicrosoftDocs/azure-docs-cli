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

An Azure service principal is a security identity used by user-created apps, services, and automation tools to access specific Azure resources. Think of it as a 'user identity' with a very specific role, and very tightly controlled permissions to access your resources. It only needs to be able to do very specific things, unlike a general user identity, and it improves security if you only grant it the minimum permissions level needed to perform its management tasks. 

## Create the service principal

Right now, Azure CLI 2.0 only supports password-based authentication credentials. In this topic, we'll cover creating a service principal with a specific password, and optionally assigning specific roles to it.

### Verify your own permission level

First, you must have sufficient permissions in both your Azure Active Directory and your Azure subscription. Specifically, you must be able to create an app in the Active Directory, and assign the service principal to a role. 

The easiest way to check whether your account has adequate permissions is through the portal. See [Check required permission in portal](/azure/azure-resource-manager/resource-group-create-service-principal-portal.md#required-permissions).

If you have this permission level, log in to your Azure account.

```azurecli
az login -u {your username} -p {password}
```

### Create a service principal with an ID and password

In this example, you'll create a specific security principal based on your app ID and a supplied password, and under which your app will run. Before you start, you need the ID of your app or tool. 

If you don't have one, create an app ID for your app with the `az ad app create` command. You must have the following information:

  * A display name to show when querying for the app. Pick something meaningful but short!
  * The home page URL (typically where users login) of the app or service.
  * A space-separated list of base unique URIs for the app. 

For example, given the home page is ALSO the base URI:

`az ad app create --display-name "MyWebApp" --homepage "https://webapplication17089.azurewebsites.net" --identifier-uris "https://webapplication17089.azurewebsites.net"`

Returns:

```
{
  "appId": "59db508a-3429-4094-a828-e8b4680fc790",
  "appPermissions": null,
  "availableToOtherTenants": false,
  "displayName": "MyWebApp",
  "homepage": "https://webapplication17089.azurewebsites.net",
  "identifierUris": [
    "https://webapplication17089.azurewebsites.net"
  ],
  "objectId": "413e5d9c-745b-4f0a-a415-9dc80670891e",
  "objectType": "Application",
  "replyUrls": []
}
```
In this case, the app ID (*appId*) is `59db508a-3429-4094-a828-e8b4680fc790`. The display name when queried (and in the portal) is *MyWebApp*. It doesn't have a password associated with it, though!

You add a password to this app object with the optional `--password {password}` flag on `az ad app create`. You can also add or change the password with the `az ad app update` command with the `--password` flag, as in this example, which adds the password "mypassword!":

```
az ad app update --id 59db508a-3429-4094-a828-e8b4680fc790 --password "mypassword!"
```
> [!WARNING] Please do NOT use the password above! You must create a password using the [Azure AD password rules and restrictions](/active-directory/active-directory-passwords-policy).

Now, you can create the security principal with the basic `az ad sp create` command.
     
```azurecli
az ad sp create --id {id-or-uri-here}
```

For example, `az ad sp create --id https://webapplication17089.azurewebsites.net` creates a service principal for the web app 'webapplication17089.azurewebsites.net', where the credentials are the same as those of the logged in user. As an example (continuing from the previous step):

`az ad sp create --id 59db508a-3429-4094-a828-e8b4680fc790`

Returns:

```
{
  "appId": "59db508a-3429-4094-a828-e8b4680fc790",
  "displayName": "MyWebApp",
  "objectId": "75f31156-1d19-46ac-9fe8-eead1d79cc3d",
  "objectType": "ServicePrincipal",
  "servicePrincipalNames": [
    "59db508a-3429-4094-a828-e8b4680fc790",
    "https://webapplication17089.azurewebsites.net"
  ]
}
```
In this case, the service principal names are the same ass the app IDs `59db508a-3429-4094-a828-e8b4680fc790` and `https://webapplication17089.azurewebsites.net`.

If you need to get this at any time, use the `az ad sp show` command, like this:

```azurecli
az ad show --id {servicePrincipalName}
```

You can log in as your new security principal by supplying the app ID (as the user name), the password, and a tenant ID. An Azure "tenant", in this case, is an ID associated with an instance of Azure AD. Get the tenant ID with the `az account list` command and copy the *tenantId* value from the returned JSON:

```azurecli
az login --service-principal -u {appId} --password {password} --tenant {tenantId}
``` 
> [!NOTE] It may take awhile for your service principal to propagate throughout Azure AD. Give it 15 to 30 seconds, typically.

### Create a role-based service principal

Typically, you want to create a separate set of role-based permissions separate from your own. To do that, use Azure Role-Based Access Control (RBAC).     
    
To do this, grant the service principal permissions on your subscription. As an example, add the service principal to the **contributor** role, which grants permission to read all resources in the subscription.

```azurecli
az ad sp create-for-rbac --name {appId} --role contributor
``` 
When run on the example app from the previous section, the result is as follows:

```
{
  "appId": "59db508a-3429-4094-a828-e8b4680fc790",
  "displayName": null,
  "name": "https://webapplication17089.azurewebsites.net",
  "password": null,
  "tenant": "72f988bf-86f1-41af-91ab-2d7cd011db47"
}
```

> [!NOTE] The **contributor** role has broad permissions and may not be the best choice depending on the scope of your app's interactions with Azure services. The **reader** role is more restrictive and can be a good choice for read-only apps. For more details on other roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles.md). You can view details on role-specific permissions or create custom ones through the Azure portal.

You can add additional roles with the following command:

```azurecli
az role assignment create --assignee {appId} --role {rolename}
```

And delete them with:

```azurecli
az role assignment delete --assignee {appId} --role {rolename}
```

In this case, we add the **reader** role to our prior example, and delete the **contributor** one:

```
az role assignment create --assignee 59db508a-3429-4094-a828-e8b4680fc790 --role reader
az role assignment delete --assignee 59db508a-3429-4094-a828-e8b4680fc790 --role contributor
```

You can view the currently assigned roles with the following command:

```azurecli
az role assignment list --query [*].properties.roleDefinitionName
```

> [!NOTE] If your account does not have sufficient permissions to assign a role, you see an error message. The message states your account "does not have authorization to perform action 'Microsoft.Authorization/roleAssignments/write' over scope '/subscriptions/{guid}'."

## Set expiry on credentials

`az ad sp reset-credentials`

default is 1 year

That's it! Your AD application and service principal are set up.  



