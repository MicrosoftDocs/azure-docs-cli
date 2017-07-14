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

If you want to create a separate login with access restrictions, you can do so through a service principal. This topic will run you through the steps for creating a service principal to log in with for use with the CLI.

## Create the service principal

Use [az ad sp create-for-rbac](/cli/azure/ad/sp#create-for-rbac) to create the service principal. You can create a service principal with your choice of authentication type:

* `--password` is regular password-based authentication. Make sure that you create a strong password by following the [Azure AD password rules and restrictions](/azure/active-directory/active-directory-passwords-policy). If this argument is omitted, a password is auto-created.
* `--cert` is certificate-based authentication for an existing cert, either as a PEM or DER public string, or `@file`. `--keyvault` can be added to indicate the cert is stored in Azure Key Vault.
* `--create-cert` creates a _self-signed_ certificate for authentication. `--keyvault` can be added to store the certificate in Azure Key Vault.

The `--name` value should be any useful identifier for you, in case you need to search for the service principal later. It doesn't have to be tied to any specific existing Azure Active Directory application.

Creating a service principal with a password:

```azurecli
az ad sp create-for-rbac --name SP_NAME --password ...
```

Creating a service principal with a certificate in Key Vault:

```azurecli
az ad sp create-for-rbac --name SP_NAME --cert CERT_NAME --keyvault
```

Creating a service principal with a self-signed certificate that will be stored locally:

```azurecli
az ad sp create-for-rbac --name SP_NAME --create-cert
```

The output of these commands will be similar to:

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

> [!NOTE]
> If your account does not have sufficient permissions to create a service principal, you will see an error message containing "Insufficient privileges to complete the operation." Contact your Azure Active Directory admin to create a service principal in this case.

## Managing roles 

The Azure CLI 2.0 provides the following commands to manage role assignments:

* [az role assignment list](/cli/azure/role/assignment#list)
* [az role assignment create](/cli/azure/role/assignment#create)
* [az role assignment delete](/cli/azure/role/assignment#delete)

The default role for a service principal is **Contributor**. It may not be the best choice for an app's interactions with Azure services, given its broad permissions. The **Reader** role is more restrictive, providing read-only access.  For more information on Role-Based Access Control (RBAC) and roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles).

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

## Sign in using the service principal

You can now log in as the new service principal for your app using the `appId` , `tenant`, and credentials. The authentication information you provide will change based on whether you chose to create the service principal with a password, or a certificate.

To log in with a password:

```azurecli
az login --service-principal -u d7d167ca-ad2a-4b31-ab64-7d5b714b7d8d --password ... --tenant TENANT_ID
```

To log in with a certificate, you need the certificate available locally:

```azurecli
az login --service-principal -u d7d167ca-ad2a-4b31-ab64-7d5b714b7d8d --tenant TENANT_ID --password PATH_TO_CERT.pem
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
      "name": "https://APP_NAME",
      "type": "servicePrincipal"
    }
  }
]
```

Use the `id`, `password`, and `tenant` values as the credentials for running your app. 