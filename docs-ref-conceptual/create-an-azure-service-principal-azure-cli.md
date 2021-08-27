---
title: Create an Azure service principal – Azure CLI | Microsoft Docs
description: Learn how to create and use service principals with the Azure CLI. Use service principals to gain control over which Azure resources can be accessed. 
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 08/19/2021
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service principal, create service principal azure, create service principal azure cli
---
# Create an Azure service principal with the Azure CLI

Automated tools that use Azure services should always have restricted permissions. Instead of having
applications sign in as a fully privileged user, Azure offers service principals.

## What is an Azure service principal?

An Azure service principal is an identity created for use with
applications, hosted services, and automated tools to access
Azure resources. This access is restricted by the roles assigned
to the service principal, giving you control over which resources
can be accessed and at which level. For security reasons, it's
always recommended to use service principals with automated
tools rather than allowing them to log in with a user identity.

This article shows you the steps for creating, getting information about, and resetting an Azure service principal with the Azure CLI.

## Create a service principal

Create an Azure service principal with the [az ad sp create-for-rbac](/cli/azure/ad/sp#az_ad_sp_create_for_rbac) command. 

The `appId` and `tenant` keys appear in the output of `az ad sp create-for-rbac` and are used in service principal authentication. Record their values, but they can be retrieved at any point with [az ad sp list](/cli/azure/ad/sp#az_ad_sp_list).

When creating a service principal, you choose the type of sign-in authentication it uses. There are two types of authentication available for Azure service principals: password-based authentication, and certificate-based authentication.

> [!NOTE]
>
> If your account doesn't have permission to create a service principal, `az ad sp create-for-rbac` will return an error message containing
> "Insufficient privileges to complete the operation." Contact your Azure Active Directory admin to create a service principal.

> [!WARNING]
> When you create an Azure service principal using the `az ad sp create-for-rbac` command, the output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. As an alternative, consider using [managed identities](/azure/active-directory/managed-identities-azure-resources/overview) if available to avoid the need to use credentials.
>
> By default, `az ad sp create-for-rbac` assigns the [Contributor](/azure/role-based-access-control/built-in-roles#contributor) role to the service principal at the subscription scope. To reduce your risk of a compromised service principal, assign a more specific role and narrow the scope to a resource or resource group. See [Steps to add a role assignment](/azure/role-based-access-control/role-assignments-steps) for more information.
>
> In a future release, `az ad sp create-for-rbac` will NOT create a **Contributor** role assignment by default. If needed, use the `--role` argument to explicitly create a role assignment.

### Password-based authentication

Without any authentication parameters, password-based authentication is used with a random password created for you.

  ```azurecli-interactive
  az ad sp create-for-rbac --name ServicePrincipalName
  ```

> [!IMPORTANT]
> As of Azure CLI 2.0.68, the `--password` parameter to create a service principal with a user-defined password
> is __no longer supported__ to prevent the accidental use of weak passwords.

The output for a service principal with password authentication includes the `password` key. __Make sure__ you copy this value - it can't be retrieved. If you forget the password, [reset the service principal credentials](#reset-credentials).

### Certificate-based authentication

For certificate-based authentication, use the `--cert` argument. This argument requires that you hold an existing certificate. Make sure any tool that uses this service principal has access to the certificate's private key. Certificates should be in an ASCII format such as PEM, CER, or DER. Pass the certificate as a string, or use the `@path` format to load the certificate from a file.

> [!NOTE]
> When using a PEM file, the **CERTIFICATE** must be appended to the **PRIVATE KEY** within the file.

```azurecli-interactive
az ad sp create-for-rbac --name ServicePrincipalName --cert "-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----"
```

```azurecli-interactive
az ad sp create-for-rbac --name ServicePrincipalName --cert @/path/to/cert.pem
```

The `--keyvault` argument can be added to use a certificate in Azure Key Vault. In this case, the `--cert` value is the name of the certificate.

```azurecli-interactive
az ad sp create-for-rbac --name ServicePrincipalName --cert CertName --keyvault VaultName
```

To create a _self-signed_ certificate for authentication, use the `--create-cert` argument:

```azurecli-interactive
az ad sp create-for-rbac --name ServicePrincipalName --create-cert
```

Console output:

```
Creating a role assignment under the scope of "/subscriptions/myId"
Please copy C:\myPath\myNewFile.pem to a safe place.
When you run 'az login', provide the file path in the --password argument
{
  "appId": "myAppId",
  "displayName": "myDisplayName",
  "fileWithCertAndPrivateKey": "C:\\myPath\\myNewFile.pem",
  "name": "http://myName",
  "password": null,
  "tenant": "myTenantId"
}
```

Contents of the new PEM file:
```
-----BEGIN PRIVATE KEY-----
myPrivateKeyValue
-----END PRIVATE KEY-----
-----BEGIN CERTIFICATE-----
myCertificateValue
-----END CERTIFICATE-----
```

> [!NOTE]
> The `az ad sp create-for-rbac --create-cert` command creates the service principal and a PEM file. The PEM file contains a correctly formatted **PRIVATE KEY** and **CERTIFICATE**.

The `--keyvault` argument can be added to store the certificate in Azure Key Vault. When using `--keyvault`, the `--cert` argument is __required__.

```azurecli-interactive
az ad sp create-for-rbac --name ServicePrincipalName --create-cert --cert CertName --keyvault VaultName
```

Unless you store the certificate in Key Vault, the output includes the `fileWithCertAndPrivateKey` key. This key's value tells you where the generated certificate is stored.
__Make sure__ that you copy the certificate to a secure location, or you can't sign in with this service principal.

If you lose access to a certificate's private key, [reset the service principal credentials](#reset-credentials).

#### Retrieve certificate from Key Vault

For certificate stored in Key Vault, retrieve the certificate with its private key with [az keyvault secret show](/cli/azure/keyvault/secret#az_keyvault_secret_show) and convert it to a PEM file. In the Key Vault, the name of the certificate's secret is the same as the certificate name.

```azurecli-interactive
az keyvault secret download --file /path/to/cert.pfx --vault-name VaultName --name CertName --encoding base64
openssl pkcs12 -in cert.pfx -passin pass: -out cert.pem -nodes
```

## Get an existing service principal

A list of the service principals in a tenant can be retrieved with [az ad sp list](/cli/azure/ad/sp#az_ad_sp_list). By default this
command returns the first 100 service principals for your tenant. To get all of a tenant's service principals, use the `--all` argument. Getting this list can take a long time, so it's
recommended that you filter the list with one of the following arguments:

* `--display-name` requests service principals that have a _prefix_ that match the provided name. The display name of a service principal is the value set with the `--name`
  parameter during creation. If you didn't set `--name` during service principal creation, the name prefix is `azure-cli-`.
* `--spn` filters on exact service principal name matching. The service principal name always starts with `https://`.
  if the value you used for `--name` wasn't a URI, this value is `https://` followed by the display name.
* `--show-mine` requests only service principals created by the signed-in user.
* `--filter` takes an OData filter, and performs _server-side_ filtering. This method is recommended over filtering client-side with the CLI's `--query` argument. To learn about OData filters, see [OData expression syntax for filters](/rest/api/searchservice/odata-expression-syntax-for-azure-search).

The information returned for service principal objects is verbose. To get only the information necessary for sign-in, use the query string
`[].{id:appId, tenant:appOwnerTenantId}`. For example, to get the sign-in information for all service principals created by the currently logged in user:

```azurecli-interactive
az ad sp list --show-mine --query "[].{id:appId, tenant:appOwnerTenantId}"
```

> [!IMPORTANT]
>
> `az ad sp list` or [az ad sp show](/cli/azure/ad/sp#az_ad_sp_show) get the user and tenant, but not any authentication secrets _or_ the authentication method.
> Secrets for certificates in Key Vault can be retrieved with [az keyvault secret show](/cli/azure/keyvault/secret#az_keyvault_secret_show), but no other secrets are stored by default.
> If you forget an authentication method or secret, [reset the service principal credentials](#reset-credentials).

## Manage service principal roles

The Azure CLI has the following commands to manage role assignments:

* [az role assignment list](/cli/azure/role/assignment#az_role_assignment_list)
* [az role assignment create](/cli/azure/role/assignment#az_role_assignment_create)
* [az role assignment delete](/cli/azure/role/assignment#az_role_assignment_delete)

The default role for a service principal is **Contributor**. This role has full permissions to read and write to an Azure account. The **Reader** role is more restrictive, with read-only access.  For more information on Role-Based Access Control (RBAC) and roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles).

This example adds the **Reader** role and removes the **Contributor** one:

```azurecli-interactive
az role assignment create --assignee APP_ID --role Reader
az role assignment delete --assignee APP_ID --role Contributor
```

> [!NOTE]
> If your account doesn't have permission to assign a role, you see an error message that your account "does not have authorization to
> perform action 'Microsoft.Authorization/roleAssignments/write'." Contact your Azure Active Directory admin to manage roles.

Adding a role _doesn't_ restrict previously assigned permissions. When restricting a service principal's permissions, the __Contributor__ role should be removed.

The changes can be verified by listing the assigned roles:

```azurecli-interactive
az role assignment list --assignee APP_ID
```

## Sign in using a service principal

Test the new service principal's credentials and permissions by signing in. To sign in with a service principal, you need the `appId`, `tenant`, and credentials.

To sign in with a service principal using a password:

```azurecli-interactive
az login --service-principal --username APP_ID --password PASSWORD --tenant TENANT_ID
```

To sign in with a certificate, it must be available locally as a PEM or DER file, in ASCII format. When using a PEM file, the **PRIVATE KEY** and **CERTIFICATE** must be appended together within the file.

```azurecli-interactive
az login --service-principal --username APP_ID --tenant TENANT_ID --password /path/to/cert
```

To learn more about signing in with a service principal, see [Sign in with the Azure CLI](authenticate-azure-cli.md).

## Create a resource using service principal

The following section provides an example of how to create an resource for [Azure Storage](/azure/storage/) with a service principal, using the following commands:

* [az login](/cli/azure/reference-index#az_login)
* [az group create](/cli/azure/group#az_group_create)
* [az storage account create](/cli/azure/storage/account#az_storage_account_create)
* [az storage account keys list](/cli/azure/storage/account/keys#az_storage_account_keys_list)

To sign in with a service principal, you need the `appId`, `tenant`, and `password` returned as the response when you [created your service principal](#sign-in-using-a-service-principal).

1. Log in as the service principal.

    ```azurecli-interactive
    az login --service-principal --username APP_ID --password PASSWORD --tenant TENANT_ID
    ```

1. Create a resource group to hold all resources used for the same quickstart, tutorial, or development project.

    ```azurecli-interactive
    az group create --location WESTUS --name MY_RESOURCE_GROUP
    ```

1. Create a resource to an Azure service. Replace `<SERVICENAME>` with the name of the Azure service.

    For Azure Storage, valid values for the `<KIND>` parameter are:

    * BlobStorage
    * BlockBlobStorage
    * FileStorage
    * Storage
    * StorageV2

    ```azurecli-interactive
    az storage account create --name MY_RESOURCE_<SERVICENAME> --resource-group MY_RESOURCE_GROUP --kind <KIND> --sku F0 --location WESTUS --yes
    ```

1. Get resource keys for the new resource, which you use in your code to authenticate to the Azure service.

    ```azurecli-interactive
    az storage account keys list --name MY_RESOURCE_<SERVICENAME> --resource-group MY_RESOURCE_GROUP
    ```

## Reset credentials

If you forget the credentials for a service principal, use [az ad sp credential reset](/cli/azure/ad/sp/credential#az_ad_sp_credential_reset). The reset command takes the same arguments
as `az ad sp create-for-rbac`.

```azurecli-interactive
az ad sp credential reset --name APP_ID
```

## See also

* [Application and service principal objects in Azure Active Directory](/azure/active-directory/develop/app-objects-and-service-principals)
* [How to manage service principals](/azure/developer/python/how-to-manage-service-principals)
