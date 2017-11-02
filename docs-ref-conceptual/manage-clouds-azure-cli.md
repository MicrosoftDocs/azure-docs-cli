---
title: Managing multiple clouds with Azure CLI 2.0
description: Create, log in, and manage different clouds with the Azure CLI 2.0.
keywords: Azure CLI 2.0, Azure, clouds, datacenters, government, region, china, germany
author: sptramer
manager: douge

ms.author: sttramer
ms.date: 06/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
---

# Managing multiple clouds with Azure CLI 2.0

If you have multiple subscriptions associated with Azure, you may have more than one cloud available. Each cloud has its own associated endpoints and capabilities, and is often associated with a particular region that has different data protection standards or requirements.

To effectively work with multiple clouds, you will need to be able to switch between which is currently active, and possibly create new clouds.

## Listing clouds

You may list your available clouds with the [cloud list](/cli/azure/cloud#list) command. This will tell you which cloud is currently active, what its current profile is, and can provide information on regional suffixes and host names.

To get a list of the available clouds and the currently active one:

```azurecli
az cloud list --output table
```

```output
IsActive    Name               Profile
----------  -----------------  ---------
True        AzureCloud         latest
            AzureChinaCloud    latest
            AzureUSGovernment  latest
            AzureGermanCloud   latest
```

## Switching the active cloud

In order to switch the currently active cloud, you run the [cloud set](/cli/azure/cloud#set) command. This command takes one required argument, the name of the cloud.

```azurecli
az cloud set --name AzureChinaCloud
```

> [!IMPORTANT]
> If you have never authenticated for the active cloud, you will need to do so before performing any other CLI operations. For instructions on authenticating, see [Log in with Azure CLI 2.0](/cli/azure/authenticate-azure-cli).

## Register or unregister a cloud

Register a new cloud if you have your own endpoints or require a different profile. Creating a cloud is done with the [cloud register](/cli/azure/cloud#register) command. This command requires a name, and optionally a set of capabilities and endpoint designations.

To create a cloud with a specialized endpoint for the resource manager, with a specific profile:

```azurecli
az cloud register --name MyCloud --endpoint-resource-manager "https://my.endpoint.manager" --profile 2017-03-09-profile
```

This creates the cloud, but does _not_ automatically select it.

If you no longer require the created cloud, it can be unregistered with the [cloud unregister](/cli/azure/cloud#unregister) command:

```azurecli
az cloud unregister --name MyCloud
```

