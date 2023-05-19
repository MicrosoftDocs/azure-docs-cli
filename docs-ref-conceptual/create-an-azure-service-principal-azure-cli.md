---
title: Work with Azure service principals – Azure CLI | Microsoft Docs
description: Learn how to create and use service principals with the Azure CLI. Use service principals to gain control over which Azure resources can be accessed.
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.date: 03/01/2022
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service principal, create service principal azure, create service principal azure cli
---
# Work with Azure service principal using the Azure CLI

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

## 1. Create a service principal

Create an Azure service principal with the [az ad sp create-for-rbac](/cli/azure/ad/sp#az_ad_sp_create_for_rbac) command.

The `appId` and `tenant` keys appear in the output of `az ad sp create-for-rbac` and are used in service principal authentication. Record their values, but they can be retrieved at any point with [az ad sp list](/cli/azure/ad/sp#az-ad-sp-list).

When creating a service principal, you choose the type of sign-in authentication it uses. There are two types of authentication available for Azure service principals: password-based authentication, and certificate-based authentication.

> [!WARNING]
> When you create an Azure service principal using the `az ad sp create-for-rbac` command, the output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. As an alternative, consider using [managed identities](/azure/active-directory/managed-identities-azure-resources/overview) if available to avoid the need to use credentials.
>
> To reduce your risk of a compromised service principal, assign a more specific role and narrow the scopes to a resource or resource group. See [Steps to add a role assignment](/azure/role-based-access-control/role-assignments-steps) for more information.


### Password-based authentication

With password-based authentication, a random password is created for you.  If you do not specify a `--name` parameter value, a name containing a time stamp will be created for you.  You must specify a `--scopes` as this value does not have a default.  If you prefer, you can set the role assignment later by using [az role assignment create](/cli/azure/role/assignment#az-role-assignment-create).

```azurecli-interactive
# Create a service principal with required parameter
az ad sp create-for-rbac --scopes /subscriptions/mySubscriptionID

# Create a service principal for a resource group using a preferred name and role
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role reader \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName
```

You can also create a service principal using variables.

```azurecli-interactive
let "randomIdentifier=$RANDOM*$RANDOM"  
servicePrincipalName="msdocs-sp-$randomIdentifier"
roleName="azureRoleName"
subscriptionID=$(az account show --query id -o tsv)
# Verify the ID of the active subscription
echo "Using subscription ID $subscriptionID"
resourceGroup="myResourceGroupName"

echo "Creating SP for RBAC with name $servicePrincipalName, with role $roleName and in scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup"
az ad sp create-for-rbac --name $servicePrincipalName --role $roleName --scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup
```

The output for a service principal with password authentication includes the `password` key. __Make sure you copy this value__ - it can't be retrieved. If you lose the password, [reset the service principal credentials](#6-reset-credentials).

### Certificate-based authentication

For certificate-based authentication, use the `--cert` parameter. This parameter requires that you hold an existing certificate. Make sure any tool that uses this service principal has access to the certificate's private key. Certificates should be in an ASCII format such as PEM, CER, or DER. Pass the certificate as a string, or use the `@path` format to load the certificate from a file.

> [!NOTE]
> When using a PEM file, the **CERTIFICATE** must be appended to the **PRIVATE KEY** within the file.

```azurecli-interactive
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --cert "-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----"
```

```azurecli-interactive
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --cert @/path/to/cert.pem
```

The `--keyvault` parameter can be added to use a certificate in Azure Key Vault. In this case, the `--cert` value is the name of the certificate.

```azurecli-interactive
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --cert certificateName \
                         --keyvault vaultName
```

To create a _self-signed_ certificate for authentication, use the `--create-cert` parameter:

```azurecli-interactive
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --create-cert
```

Console output:

```
Creating a role assignment under the scopes of "/subscriptions/myId"
Please copy C:\myPath\myNewFile.pem to a safe place.
When you run 'az login', provide the file path in the --password parameter
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

The `--keyvault` parameter can be added to store the certificate in Azure Key Vault. When using `--keyvault`, the `--cert` parameter is __required__.

```azurecli-interactive
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --create-cert \
                         --cert certificateName \
                         --keyvault vaultName
```

Unless you store the certificate in Key Vault, the output includes the `fileWithCertAndPrivateKey` key. This key's value tells you where the generated certificate is stored.
__Make sure__ that you copy the certificate to a secure location, or you can't sign in with this service principal.

If you lose access to a certificate's private key, [reset the service principal credentials](#6-reset-credentials).

#### Retrieve certificate from Key Vault

For certificate stored in Key Vault, retrieve the certificate with its private key with [az keyvault secret show](/cli/azure/keyvault/secret#az-keyvault-secret-show) and convert it to a PEM file. In the Key Vault, the name of the certificate's secret is the same as the certificate name.

```azurecli-interactive
az keyvault secret download --file /path/to/cert.pfx --vault-name VaultName --name CertName --encoding base64
openssl pkcs12 -in cert.pfx -passin pass: -out cert.pem -nodes
```

#### Convert existing PKCS12 file

If you already have a PKCS#12 file, you can convert it to PEM format using OpenSSL.  If you have a password, change the `passin` argument.

```console
openssl pkcs12 -in fileName.p12 -clcerts -nodes -out fileName.pem -passin pass:
```

## 2. Get an existing service principal

A list of the service principals in a tenant can be retrieved with [az ad sp list](/cli/azure/ad/sp#az-ad-sp-list). By default this
command returns the first 100 service principals for your tenant. To get all of a tenant's service principals, use the `--all` parameter. Getting this list can take a long time, so it's
recommended that you filter the list with one of the following parameters:

* `--display-name` requests service principals that have a _prefix_ that match the provided name. The display name of a service principal is the value set with the `--name`
  parameter during creation. If you didn't set `--name` during service principal creation, the name prefix is `azure-cli-`.
* `--spn` filters on exact service principal name matching. The service principal name always starts with `https://`.
  if the value you used for `--name` wasn't a URI, this value is `https://` followed by the display name.
* `--show-mine` requests only service principals created by the signed-in user.
* `--filter` takes an OData filter, and performs _server-side_ filtering. This method is recommended over filtering client-side with the CLI's `--query` parameter. To learn about OData filters, see [OData expression syntax for filters](/rest/api/searchservice/odata-expression-syntax-for-azure-search).

The information returned for service principal objects is verbose. To get only the information necessary for sign-in, use the query string
`[].{id:appId, tenant:appOwnerTenantId}`. For example, to get the sign-in information for all service principals created by the currently logged in user:

```azurecli-interactive
az ad sp list --show-mine --query "[].{id:appId, tenant:appOwnerTenantId}"
```

> [!IMPORTANT]
>
> `az ad sp list` or [az ad sp show](/cli/azure/ad/sp#az-ad-sp-show) get the user and tenant, but not any authentication secrets _or_ the authentication method.
> Secrets for certificates in Key Vault can be retrieved with [az keyvault secret show](/cli/azure/keyvault/secret#az-keyvault-secret-show), but no other secrets are stored by default.
> If you forget an authentication method or secret, [reset the service principal credentials](#6-reset-credentials).

## 3. Manage service principal roles

The Azure CLI has the following commands to manage role assignments:

* [az role assignment list](/cli/azure/role/assignment#az-role-assignment-list)
* [az role assignment create](/cli/azure/role/assignment#az-role-assignment-create)
* [az role assignment delete](/cli/azure/role/assignment#az-role-assignment-delete)

The **Contributor** role has full permissions to read and write to an Azure account. The **Reader** role is more restrictive, with read-only access. For more information on Role-Based Access Control (RBAC) and roles, see [RBAC: Built-in roles](/azure/active-directory/role-based-access-built-in-roles).

This example adds the **Reader** role and removes the **Contributor** role:

```azurecli-interactive
az role assignment create --assignee appID \
                          --role Reader \
                          --scope /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName

az role assignment delete --assignee appID \
                          --role Contributor \
                          --scope /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName
```

Adding a role _doesn't_ restrict previously assigned permissions. When restricting a service principal's permissions, the __Contributor__ role should be removed if previously assigned.

The changes can be verified by listing the assigned roles:

```azurecli-interactive
az role assignment list --assignee appID
```

## 4. Sign in using a service principal

Test the new service principal's credentials and permissions by signing in. To sign in with a service principal, you need the `appId`, `tenant`, and credentials.

To sign in with a service principal using a password:

```azurecli-interactive
az login --service-principal --username appID --password PASSWORD --tenant tenantID
```

To sign in with a certificate, it must be available locally as a PEM or DER file, in ASCII format. When using a PEM file, the **PRIVATE KEY** and **CERTIFICATE** must be appended together within the file.

```azurecli-interactive
az login --service-principal --username appID --tenant tenantID --password /path/to/cert
```

To learn more about signing in with a service principal, see [Sign in with the Azure CLI](authenticate-azure-cli.md).

## 5. Create a resource using service principal

The following section provides an example of how to create an resource for [Azure Storage](/azure/storage/) with a service principal, using the following commands:

* [az login](/cli/azure/reference-index#az-login)
* [az group create](/cli/azure/group#az-group-create)
* [az storage account create](/cli/azure/storage/account#az-storage-account-create)
* [az storage account keys list](/cli/azure/storage/account/keys#az-storage-account-keys-list)

To sign in with a service principal, you need the `appID`, `tenantID`, and `password` returned as the response when you [created your service principal](#1-create-a-service-principal).

1. Log in as the service principal.

    ```azurecli-interactive
    az login --service-principal --username appID --password PASSWORD --tenant tenantID
    ```

1. Create a resource group to hold all resources used for the same quickstart, tutorial, or development project.

    ```azurecli-interactive
    az group create --location westus --name myResourceGroupName
    ```

1. Create a storage account.

    For Azure Storage, valid values for the `<KIND>` parameter are:

    * BlobStorage
    * BlockBlobStorage
    * FileStorage
    * Storage
    * StorageV2

    ```azurecli-interactive
    az storage account create --name myStorageAccountName --resource-group myResourceGroupName --kind <KIND> --sku F0 --location westus --yes
    ```

1. Get resource keys, which you use in your code to authenticate to the Azure storage account.

    ```azurecli-interactive
    az storage account keys list --name myStorageAccountName --resource-group myResourceGroupName
    ```

## 6. Reset credentials

If you lose the credentials for a service principal, use [az ad sp credential reset](/cli/azure/ad/sp/credential#az-ad-sp-credential-reset). The reset command takes the same parameters
as `az ad sp create-for-rbac`.

```azurecli-interactive
az ad sp credential reset --name myServicePrincipal_appID_or_name
```

## 7. Troubleshooting

### Insufficient privileges
If your account doesn't have permission to create a service principal, `az ad sp create-for-rbac` will return an error message containing "Insufficient privileges to complete the operation." Contact your Azure Active Directory admin to create a service principal.

### Invalid tenant
If you have specified an invalid subscription ID, you see the error message "The request did not have a subscription or a valid tenant level resource provider."  If using variables, use the Bash `echo` command to see the value being passed to the reference command.  Use [az account set](/cli/azure/account#az-account-set) to change your subscription or learn [How to manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md).

### Resource group not found
If you have specified an invalid resource group name, you see the error message "Resource group 'name' could not be found."  If using variables, use the Bash `echo` command to see the value being passed to both the subscription and reference commands.  Use [az group list](/cli/azure/group#az-group-list) to see the resource groups for the current subscription, or learn [How to manage Azure resource groups with the Azure CLI](./manage-azure-groups-azure-cli.md).

### Authorization to perform action
If your account doesn't have permission to assign a role, you see an error message that your account "does not have authorization to perform action 'Microsoft.Authorization/roleAssignments/write'." Contact your Azure Active Directory admin to manage roles.

## See also

* [Application and service principal objects in Azure Active Directory](/azure/active-directory/develop/app-objects-and-service-principals)
* [Manage service principals using the Azure portal](/azure/developer/python/how-to-manage-service-principals)
* [Azure authentication with service principals](/azure/developer/java/sdk/identity-service-principal-auth)
* [Service principals with Azure Kubernetes Service (AKS)](/azure/aks/kubernetes-service-principal)
* [View the service principal of a managed identity](/azure/active-directory/managed-identities-azure-resources/how-to-view-managed-identity-service-principal-cli)
