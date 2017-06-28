---
title: Managing Cloud Sets with Azure CLI 2.0
description: Create, log in, and manage different cloud sets with the Azure CLI 2.0.
keywords: Azure CLI 2.0, Azure, clouds, datacenters
author: sptramer
manager: douge

ms.author: sttramer
ms.date: 06/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
---

# Managing Multiple Clouds with Azure CLI 2.0

If you have multiple subscriptions associated with Azure, you may have more than one cloud available. Each cloud has its own associated endpoints and capabilities, and is often associated with a particular region that has different data protection standards or requirements.

To effectively work with multiple clouds, you will need to be able to switch between which is currently active, and possibly create new clouds.

## Listing clouds

You may list your available clouds with the [`cloud list`](/cli/azure/cloud#list) command. This will tell you which cloud is currently active, what its current profile is, and can provide information on regional suffixes and host names.

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

In order to switch the currently active cloud, you run the [`cloud set`](/cli/azure/cloud#set) command. This command takes one required argument, the name of the cloud. If you have a cloud with multiple profiles, the `--profile` argument is also required.

```azurecli
az cloud set --name AzureChinaCloud
```

> [!IMPORTANT]
> After changing the active cloud, you will need to authenticate if you haven't done so for the new cloud before. For instructions on authenticating, see [Log in with Azure CLI 2.0](/cli/azure/authenticate-azure-cli).

> [!NOTE]
> You can switch to a cloud that you do not have a registered account for. If you do, authentication will fail until you create an account.

## Creating and removing clouds

You may wish to register new clouds if you have your own endpoints or require a different profile. Creating a cloud is done with the [`cloud register`](/cli/azure/cloud#register) command. This command requires a name, and optionally a set of capabilities and endpoint designations.

To create a cloud with a specialized endpoint for the resource manager, with a specific profile:

```azurecli
az cloud register --name MyCloud --endpoint-resource-manager .endpoint.manager.suffix --profile 2017-03-09-profile-preview
```

This creates the, but does _not_ automatically select it. You will still need to switch cloud sets.

If you no longer require the created cloud, it can be unregistered:

```azurecli
az cloud unregister --name MyCloud
```

