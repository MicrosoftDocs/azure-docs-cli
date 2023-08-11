---
title: Work with Azure service principals with a certificate – Azure CLI | Microsoft Docs
description: Learn how to create and use service principals with the Azure CLI. Use service principals with an existing certificate to gain control over which Azure resources can be accessed.
manager: jasongroce
author: daphnemamicrosoft
ms.author: daphnema
ms.date: 08/2/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Using Service Principal with certificate-based authentication

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

The `--keyvault` parameter can be added to store the certificate in Azure Key Vault. When you use `--keyvault`, the `--cert` parameter is __required__.

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

If you lose access to a certificate's private key, [reset the service principal credentials](./create-an-azure-service-principal-azure-cli.md#6-reset-credentials).

## Retrieve certificate from Key Vault

For certificate stored in Key Vault, retrieve the certificate with its private key with [az keyvault secret show](/cli/azure/keyvault/secret#az-keyvault-secret-show) and convert it to a PEM file. In the Key Vault, the name of the certificate's secret is the same as the certificate name.

```azurecli-interactive
az keyvault secret download --file /path/to/cert.pfx --vault-name VaultName --name CertName --encoding base64
openssl pkcs12 -in cert.pfx -passin pass: -out cert.pem -nodes
```

## Convert existing PKCS12 file

If you already have a PKCS#12 file, you can convert it to PEM format using OpenSSL.  If you have a password, change the `passin` argument.

```console
openssl pkcs12 -in fileName.p12 -clcerts -nodes -out fileName.pem -passin pass:
```

# Assign certificate to service principal using Azure Portal

You can assign a certificate to a service principal through the Azure portal by following these steps:

1. In the Azure Portal, select Active Directory
2. Then select App Registrations on the left hand sidebar
3. Next, select your AKS service principal
4. Then proceed to click on "Certificates and secrets." Here, you can upload it, or download and install it on your PC you are using to connect with. Make sure the certificate is stored somewhere you can access it on your local machine for later steps.
5. To use the Service Principal with the certificate to access the Azure Container Registry, use the following command:

```bash
# Sign into Azure CLI with SP's APP_ID and TENANT_ID and use certificate as password
az login --service-principal --username <APP_ID> --tenant <TENANT_ID> --password </path/to/cert PEM or DER file>
```

6. Then sign into the registry with `az acr login`, which uses the Active Directory token from the CLI login:

```bash
az acr login --name <registry name>
```

> [!NOTE]
> Certificate must be in PEM format - it won't work with PKCS#12 files (.p12/.pfx)
>
> You don't need to prefix the path with an @ like you do with the previous az commands
