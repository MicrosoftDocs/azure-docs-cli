---
title: Create a service principal containing a certificate using Azure CLI | Microsoft Docs
description: Learn to use service principals with a self-signed certificate to control access to Azure resources
author: dbradish-microsoft
ms.author: dbradish
ms.date: 10/10/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Use an Azure service principal with certificate-based authentication

When creating a service principal, you choose the type of sign-in authentication it uses. There are two types of authentication available for Azure service principals: **password-based authentication** and **certificate-based authentication**. 

We recommend using certificate-based authentication due to the security restrictions of password-based authentication. Certificate-based authentication enables you to adopt a phishing resistant authentication by using [conditional access policies](/azure/active-directory/conditional-access/overview), which better protects Azure resources. To learn more about why certificate-based authentication is more secure, see [Microsoft Entra certificate-based authentication](/azure/active-directory/authentication/concept-certificate-based-authentication).

This step in the tutorial explains how to use a service principal certificate to access an Azure resource.

## Create a service principal containing a new certificate

To create a _self-signed_ certificate for authentication, use the `--create-cert` parameter:

```azurecli-interactive
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --create-cert
```

Console output:

```output
{
  "appId": "myServicePrincipalID",
  "displayName": "myServicePrincipalName",
  "fileWithCertAndPrivateKey": "certFilePath\certFileName.pem",
  "password": null,
  "tenant": "myOrganizationTenantID"
}
```

Unless you store the certificate in Key Vault, the output includes the `fileWithCertAndPrivateKey` key. This key's value tells you where the generated certificate is stored. Copy the certificate to a secure location. If you lose access to a certificate's private key, [reset the service principal credentials](./azure-cli-sp-tutorial-7.md).

The contents of a PEM file can be viewed with a text editor. Here's a PEM file example:

![Screenshot of PEM file](~/docs-ref-conceptual/media/sp-tutorial/pem-file.png)

## Create a service principal using an existing certificate

Create a service principal with an existing certificate by using the `--cert` parameter. Any tool that uses this service principal must have access to the certificate's private key. Certificates should be in an ASCII format such as PEM, CER, or DER. Pass the **certi897ficate** as a string, or use the `@path` format to load the certificate from a file.

When you use a PEM file, the **CERTIFICATE** must be appended to the **PRIVATE KEY** within the file.

```azurecli-interactive
# create a service principal with the certificate as a string
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --cert "-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----"
```

```azurecli-interactive
# create a service principal with the certificate file location
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --cert @/path/to/cert.pem
```

## Work with Azure Key Vault

The `--keyvault` parameter can be added to create or retrieve certificates in Azure Key Vault. When you use the `--keyvault` parameter, the `--cert` parameter is also required. In this example, the `--cert` value is the name of the certificate.

```azurecli-interactive
# Create a service principal storing the certificate in Azure Key Vault
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --create-cert \
                         --cert myCertificateName \
                         --keyvault myVaultName
```

```azurecli-interactive
# Create a service principal using an existing certificate in Azure Key Vault
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role roleName \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName \
                         --cert myCertificateName \
                         --keyvault myVaultName
```

### Retrieve a certificate from Azure Key Vault

For a certificate stored in Azure Key Vault, retrieve the certificate with its private key with [az keyvault secret show](/cli/azure/keyvault/secret#az-keyvault-secret-show) and convert it to a PEM file. In Azure Key Vault, the name of the certificate's secret is the same as the certificate name.

```azurecli-interactive
az keyvault secret download --file /path/to/cert.pfx \
                            --vault-name VaultName \
                            --name CertName \
                            --encoding base64
openssl pkcs12 -in cert.pfx -passin pass: -passout pass: -out cert.pem -nodes

az login --service-principal -u "<myAppClientID>" -p cert.pem --tenant "<myTenantID>"
```

## Convert an existing PKCS12 file

If you already have a PKCS#12 file, you can convert it to PEM format using OpenSSL. If you have a password, change the `passin` argument.

```console
openssl pkcs12 -in fileName.p12 -clcerts -nodes -out fileName.pem -passin pass: -passout pass:
```

## Append a certificate to a service principal

Use the `--append` parameter in [az ad sp credential reset](/cli/azure/ad/sp/credential#az-ad-sp-credential-reset()) to append a certificate to an existing service principal.
By default, this command clears all passwords and keys so use carefully.

```azurecli-interactive
az ad sp credential reset --id myServicePrincipalID \
                          --append \
                          --cert @/path/to/cert.pem
```

Console output:

```output
Certificate expires yyyy-mm-dd hh:mm:ss+00:00. Adjusting key credential end date to match.
The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
{
  "appId": "myServicePrincipalID",
  "password": null,
  "tenant": "myOrganizationTenantID"
}
```

## Sign in with a service principal using a certificate

To sign in with a certificate, the certificate must be available locally as a PEM or DER file in ASCII format. PKCS#12 files (.p12/.pfx) don't work. When you use a PEM file, the **PRIVATE KEY** and **CERTIFICATE** must be appended together within the file. You don't need to prefix the path with an `@` like you do with other az commands.

```azurecli-interactive
az login --service-principal \
         --username myServicePrincipalID \
         --tenant myOwnerOrganizationId \
         --password /path/to/cert
```

## Next Steps

Now that you've learned how to work with service principals using a certificate, proceed to the next step to learn how to retrieve an existing service principal.

> [!div class="nextstepaction"]
> [Get an existing service principal](./azure-cli-sp-tutorial-4.md)
