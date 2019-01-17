---
title: Use Azure service principals with Azure CLI
description: Learn how to create and use a service principal with Azure CLI.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 01/15/2019
ms.topic: conceptual
ms.technology: azure-cli
ms.devlang: azurecli
---
# Create an Azure service principal with Azure CLI

If you want to create a separate sign-in with access restrictions, you can do so through a service principal. Service principals are separate identities that can be
associated with an account. Service principals are useful for working with applications and tasks that must be automated. This article runs you through the steps for creating a service principal.

## Create a service principal

Use the [az ad sp create-for-rbac](/cli/azure/ad/sp#az-ad-sp-create-for-rbac) command to create a service principal. The Service Principal's name isn't tied to any existing application or user name. You can create a service principal with your choice of authentication type.

* Without an authentication type, password-based authentication is used. A secure and random password is generated. This method is recommended if you want to use password-based authentication.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName
  ```

* `--password` assigns a user-supplied password for password-based authentication. If you create your own password, make sure that you create a strong password by following the [Azure Active Directory password rules and restrictions](/azure/active-directory/active-directory-passwords-policy). Don't use a weak password or reuse a password.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --password <Choose a strong password>
  ```

  > [!IMPORTANT]
  >
  > For security reasons, the `--password` argument for service principal creation will be deprecated in a future release. If you want to use password-based authentication,
  > we recommend avoiding `--password` and letting the CLI generate a secure password for you during service principal creation.

The output when creating a service principal with password authentication includes the `password` key. __Make sure__ you copy this value - it can't be retrieved. If you forget
a service principal's password, [reset the Service Principal credentials](#reset-credentials).

* `--cert` is used for certificate-based authentication for an existing certificate. Make sure you hold the private key to authenticate. Certificates should be in an ASCII format such as PEM, CER, or DER. Pass the certificate as a string, or use the `@path` format to load a file.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --cert "-----BEGIN CERTIFICATE-----
  ...
  -----END CERTIFICATE-----"
  ```

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --cert @/path/to/cert.pem
  ```

  > [!IMPORTANT]
  >
  > If you download a certificate from Key Vault and are supplying it locally, use the CER format. The PFX/PEM files exported by Key Vault are binary,
  > and aren't compatible with the CLI. To get around this restriction, use the `--keyvault` argument instead of downloading the certificate to create the
  > service principal.
  
  The `--keyvault` argument can be added to indicate the cert is stored in Azure Key Vault. In this case, the `--cert` value refers to the name of the certificate in Key Vault.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --cert CertName --keyvault VaultName
  ```

* `--create-cert` creates a _self-signed_ certificate for authentication.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --create-cert
  ```

  The `--keyvault` argument can be added to store the certificate in Azure Key Vault. When using `--keyvault`, the `--cert` argument is __required__.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName --create-cert --cert CertName --keyvault VaultName
  ```

Unless you store the certificate in Key Vault, the command output includes the `fileWithCertAndPrivateKey` key.
__Make sure__ that you copy this certificate to a secure location, or you can't authenticate. For certificates stored in Key Vault, you need
to retrieve the certificate's private key with [az keyvault secret show](/cli/azure/keyvault/secret#az-keyvault-secret-show). In Key Vault, the name of the certificate's secret
is the same as the certificate name. If you lose access to the certificate's private key, [reset the Service Principal credentials](#reset-credentials).

The `appId` and `tenant` keys appear in the output of `az ad sp create-for-rbac` and are used in service principal authentication.
Record their values, but they can be retrieved at any point with [az ad sp list](/cli/azure/ad/sp#az-ad-sp-list).

> [!NOTE]
>
> If your account does not have sufficient permissions to create a service principal, you see an error message containing
> "Insufficient privileges to complete the operation." Contact your Azure Active Directory admin to create a service principal.

## Get an existing service principal

Once a service principal is created, you can retrieve its information with [az ad sp list](/cli/azure/ad/sp#az-ad-sp-list). By default this
command returns the first 100 service principals for your tenant. To get all of tenant's service principals, use the `--all` argument. Getting service principals can take a long time, so it's
recommended that you filter the service principal list with one of the following arguments:

* `--display-name` requests service principals that have a _prefix_ that match the provided name. The display name of a service principal is the value set with the `--name`
  parameter during creation. If you didn't set `--name` during service principal creation, the name prefix is `azure-cli-`.
* `--spn` filters on exact service principal name matching. The service principal name always starts with `https://`.
  if the value you used for `--name` wasn't a URI, this value is `https://` followed by the display name.
* `--show-mine` requests only service principals created by the signed-in user.
* `--filter` takes an OData filter, and performs _server-side_ filtering. This method is recommended over filtering client-side with the CLI's `--query` argument. To learn about OData filters, see [OData expression syntax for filters](/rest/api/searchservice/odata-expression-syntax-for-azure-search).

The information returned for service principal objects is verbose. To get only the information necessary for sign-in, use the query string
`[].{"id":"appId", "tenant":"appOwnerTenantId"}`. For example, to get the sign-in information for all service principals created by the currently logged in user:

```azurecli-interactive
az ad sp list --show-mine --query '[].{"id":"appId", "tenant":"appOwnerTenantId"}'
```

> [!IMPORTANT]
>
> `az ad sp list` or [az ad sp show](/cli/azure/ad/sp#az-ad-sp-show) get you the service principal user and tenant, but not any authentication secrets _or_ the authentication method.
> Secrets for certificates in Key Vault can be retrieved with [az keyvault secret show](/cli/azure/keyvault/secret#az-keyvault-secret-show), but no other secrets are stored by default.
> If you forget an authentication method or secret, [reset the Service Principal credentials](#reset-credentials).

## Manage service principal roles

The Azure CLI provides the following commands to manage role assignments.

* [az role assignment list](/cli/azure/role/assignment#az-role-assignment-list)
* [az role assignment create](/cli/azure/role/assignment#az-role-assignment-create)
* [az role assignment delete](/cli/azure/role/assignment#az-role-assignment-delete)

The default role for a service principal is **Contributor**. This role has full permissions to read and write to an Azure account, and isn't appropriate for applications. The **Reader** role is more restrictive, with read-only access.  For more information on Role-Based Access Control (RBAC) and roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles).

This example adds the **Reader** role and deletes the **Contributor** one.

```azurecli-interactive
az role assignment create --assignee APP_ID --role Reader
az role assignment delete --assignee APP_ID --role Contributor
```

Adding a role _doesn't_ change any previously assigned permissions. When restricting a service principal's permissions, the __Contributor__ role should always be removed.

The changes can be verified by listing the assigned roles.

```azurecli-interactive
az role assignment list --assignee APP_ID
```

> [!NOTE]
> If your account doesn't have the permissions to assign a role, you see an error message that your account "does not have authorization to
> perform action 'Microsoft.Authorization/roleAssignments/write' over scope '/subscriptions/{guid}'." Contact your Azure Active Directory admin to manage roles.

## Sign in using a service principal

You can test the new service principal's credentials and permissions by signing in under it within the Azure CLI. Sign in as the new service principal using the `appId`, `tenant`, and credentials values. Use the authentication type that the service principal was created with.

To sign in with a password, provide it as an argument parameter.

```azurecli-interactive
az login --service-principal --username APP_ID --password PASSWORD --tenant TENANT_ID
```

To sign in with a certificate, it must be available locally as a PEM or DER file.

```azurecli-interactive
az login --service-principal --username APP_ID --tenant TENANT_ID --password PATH_TO_CERT
```

## Reset credentials

If you forget the credentials for a service principal, use [az ad sp credential reset](/cli/azure/ad/sp/credential#az-ad-sp-credential-reset). The reset command takes the same arguments
as `az ad sp create-for-rbac`.

```azurecli-interactive
az ad sp credential reset --name APP_ID 
```
