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

# Work with Azure service principal with an existing certificate, using the Azure CLI

First to create a new service principal with a certificate, and remove subscription Contributer rights, which are added by default

```bash
az ad sp create-for-rbac --name acme-acr --cert @C:\Certs\acme-cert.crt
az role assignment delete --assignee http://acme-acr --role Contributor
```

I then went into the portal and assigned the AcrPull to the new acme-acr service principal, from the IAM blade of the Azure Container Registry instance.

Now, I actually want to add a whole bunch of certs to the principal

```bash
az ad sp credential reset --append --name acme-acr --cert @C:\Certs\another-cert.crt
```

To Login: 

```bash
az login --service-principal --username http://acme-acr --tenant TENANT_ID --password C:\Certs\acme-cert.pem
```

Couple of gotchas with this one:

Certificate must be in PEM format - it won't work with PKCS#12 files (.p12/.pfx)
You don't need to prefix the path with an @ like you do with the previous az commands
If you have a PKCS#12 file, you can convert it to PEM format using (assuming no password, otherwise omit/change the passin argument):

```bash
openssl pkcs12 -in acme-cert.p12 -clcerts -nodes -out acme-cert.pem -passin pass:
```