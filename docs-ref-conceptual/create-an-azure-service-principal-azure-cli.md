---
title: Use Azure service principals with Azure CLI
description: Learn how to create and use a service principal with Azure CLI.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 06/11/2018
ms.topic: conceptual
ms.technology: azure-cli
ms.devlang: azure-cli
ms.service: role-based-access-control
---
# Create an Azure service principal with Azure CLI

If you want to create a separate sign in with access restrictions, you can do so through a service principal. Service principals are separate identities that can be
associated with an account. Service principals are useful for working with applications and tasks that must be automated. This article runs you through the steps for creating a service principal.

## Create the service principal

Use the [az ad sp create-for-rbac](/cli/azure/ad/sp#az-ad-sp-create-for-rbac) command to create a service principal. The Service Principal's name isn't tied to any existing application or user name. You can create a service principal with your choice of authentication type.

* `--password` is used for password-based authentication. Make sure that you create a strong password by following the [Azure Active Directory password rules and restrictions](/azure/active-directory/active-directory-passwords-policy). If you don't specify a password, one is created for you.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --password PASSWORD
  ```

* `--cert` is used for certificate-based authentication for an existing certificate, either as a PEM or DER public string, or `@{file}` to load a file.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --cert {CertStringOrFile}
  ```

  The `--keyvault` argument can be added to indicate the cert is stored in Azure Key Vault. In this case, the `--cert` value refers to the name of the certificate in Key Vault.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --cert CertName --keyvault VaultName
  ```

* `--create-cert` creates a _self-signed_ certificate for authentication. If the `--cert` argument is not provided, a random certificate name is generated.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --create-cert
  ```

  The `--keyvault` argument can be added to store the certificate in Azure Key Vault. When using `--keyvault`, the `--cert` argument is also required.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --create-cert --cert CertName --keyvault VaultName
  ```

If an argument indicating the authentication type isn't included, `--password` is used by default.

The output of the `create-for-rbac` command is in the following format:

```json
{
  "appId": "APP_ID",
  "displayName": "ServicePrincipalName",
  "name": "http://ServicePrincipalName",
  "password": ...,
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
```

The `appId`, `tenant`, and `password` values are used for authentication. The `displayName` is used when searching for an existing service principal.

> [!NOTE]
> If your account does not have sufficient permissions to create a service principal, you see an error message containing "Insufficient privileges to complete the operation." Contact your Azure Active Directory admin to create a service principal.

## Manage service principal roles

The Azure CLI provides the following commands to manage role assignments.

* [az role assignment list](/cli/azure/role/assignment#az-role-assignment-list)
* [az role assignment create](/cli/azure/role/assignment#az-role-assignment-create)
* [az role assignment delete](/cli/azure/role/assignment#az-role-assignment-delete)

The default role for a service principal is **Contributor**. This role has full permissions to read and write to an Azure account, and is usually not appropriate for applications. The **Reader** role is more restrictive, providing read-only access.  For more information on Role-Based Access Control (RBAC) and roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles).

This example adds the **Reader** role and deletes the **Contributor** one.

```azurecli-interactive
az role assignment create --assignee APP_ID --role Reader
az role assignment delete --assignee APP_ID --role Contributor
```

Adding a role does _not_ change any previously assigned permissions. When restricting a service principal's permissions, the __Contributor__ role should always be removed.

The changes can be verified by listing the assigned roles.

```azurecli-interactive
az role assignment list --assignee APP_ID
```

> [!NOTE]
> If your account doesn't have the permissions to assign a role, you see an error message that your account "does not have authorization to perform action 'Microsoft.Authorization/roleAssignments/write' over scope '/subscriptions/{guid}'." Contact your Azure Active Directory admin to manage roles.

## Sign in using the service principal

You can test the new service principal's credentials and permissions by signing in under it within the Azure CLI. Sign in as the new service principal using the `appId`, `tenant`, and credentials values. The authentication information you provide changes based on whether you chose to create the service principal with a password, or a certificate.

To sign in with a password, provide it as an argument parameter.

```azurecli-interactive
az login --service-principal --username APP_ID --password PASSWORD --tenant TENANT_ID
```

To sign in with a certificate, it must be available locally as a PEM or DER file.

```azurecli-interactive
az login --service-principal --username APP_ID --tenant TENANT_ID --password PATH_TO_CERT
```

## Reset credentials

In the event that you forget the credentials for a service principal, they can be reset with the [az ad sp reset-credentials](https://docs.microsoft.com/en-us/cli/azure/ad/sp#az-ad-sp-reset-credentials) command. The same restrictions and options for creating a new service principal also apply here.

```azurecli-interactive
az ad sp reset-credentials --name APP_ID --password NEW_PASSWORD
```
