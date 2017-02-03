---
title: Azure CLI 2.0
description: Overview of the Azure CLI 2.0.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: allclark
manager: douge
ms.date: 02/18/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 80ae9f6c-adb7-483c-bfb4-fbb958e075ba
---

# Azure CLI 2.0

There is a new CLI for Azure: the Azure CLI 2.0, now available on [GitHub](http://github.com/azure/azure-cli).
Azure CLI 2.0 is applicable when you use the resource manager [deployment model](/azure/resource-manager-deployment-model).
You can continue to use [Azure CLI](/azure/xplat-cli-install?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json)
with either the classic or the resource manager deployment model.

Today Azure CLI 2.0 supports these services, with more coming online:
- Container Service
- Resource manager
- Storage
- Virual Machines
- Virtual Networks

You can use Azure CLI 2.0 with these services, but support for these services is still in preview.
There could be breaking changes between now and when they 
- Active Directory
- App Service
- IoT Hub
- Key Vault
- Redis Cache

In some cases, you may have to add the a component for services that are in preview.

```azurecli
az component update --add keyvault
```

> [!Note]
> If you use both CLIs, just remember that `azure` is the old CLI - Azure CLI, and that `az` is the new CLI - Azure CLI 2.0. 

[Get started](get-started-with-az-cli2.md) with Azure CLI 2.0 now.

