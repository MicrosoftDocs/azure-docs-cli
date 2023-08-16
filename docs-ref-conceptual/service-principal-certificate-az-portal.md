---
title: Assign an existing certificate to a service principal through the Azure portal – Azure CLI | Microsoft Docs
description: Learn assign an existing certificate to a service principal by using the Azure portal.
manager: jasongroce
author: daphnemamsft
ms.author: daphnema
ms.date: 08/16/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service principal, create service principal azure, create service principal azure cli
---
# Assign an existing certificate to Service Principal through Azure Portal

You can assign a certificate to a service principal through the Azure portal by following these steps:

1. In the Azure Portal, select Active Directory.
2. Then select App Registrations on the left hand sidebar.
3. Next, select your AKS service principal.
4. Then proceed to click on "Certificates and secrets." Here, you can upload it, or download and install it on your PC you are using to connect with. Make sure the certificate is stored somewhere you can access it on your local machine for later steps.
5. To use the Service Principal with the certificate to access the Azure Container Registry, use the following command:

```azurecli-interactive
# Sign into Azure CLI with Service Principal's appID and tenantID and use certificate as password
az login --service-principal --username appID --tenant tenantID --password /path/to/cert
```

6. Then sign into the registry with `az acr login`, which uses the Active Directory token from the CLI login:

```azurecli-interactive
az acr login --name registryName
```

> [!NOTE]
> Certificate must be in PEM format - it won't work with PKCS#12 files (.p12/.pfx)
>
> You don't need to prefix the path with an @ like you do with the previous az commands