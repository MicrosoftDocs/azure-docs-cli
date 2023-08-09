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

You can assign a certificate to a service principal by following these steps:

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
If you have a PKCS#12 file, you can convert it to PEM format using (assuming no password, otherwise omit/change the passing argument):

