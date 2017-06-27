---
title: Managing Cloud Sets with Azure CLI 2.0
description: Create, log in, and manage different cloud sets with the Azure CLI 2.0.
keywords: Azure CLI 2.0, Azure, cloud sets, datacenters
cloud: ???
author: sptramer
manager: douge

ms.author: sttramer
ms.date: 06/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: ???
---

# Managing Cloud Sets with Azure CLI 2.0

If you have multiple subscriptions associated with Azure, you may have more than one cloud set available. A cloud set is a collection of services and endpoints. Often each cloud set is associated with a particular region that has different data protection standards or requirements.

To effectively work with cloud sets, you will need to be able to switch between which are currently active, and possibly create new cloud sets.

## Listing cloud sets

You may list cloud sets with the [`cloud list`](/cli/azure/cloud#list) command. This will tell you which cloud set is currently active, what their current profile is, and can provide information on regional suffixes and hostnames.

To get a list of the available cloud sets and the currently active one:

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

In order to switch the currently active cloud, you run the [`cloud set`](/cli/azure/cloud#set) command. This command takes one required argument, the name of the cloud set. If you have a cloud set with multiple profiles, the `--profile` arugment is also required.

```azurecli
az cloud set --name AzureChinaCloud
```

> [!IMPORTANT]
> After changing cloud sets, you are always required to re-authenticate. For instructions on authenticating, see [Log in with Azure CLI 2.0](/cli/azure/authenticate-azure-cli).

## Creating and removing cloud sets

You may wish to create your own cloud set, if you have your own endpoints or require a different profile. Creating a cloud set is done with the [`cloud register`](/cli/azure/cloud#register) command. This command requires a name, and optionally a set of capabilities and endpoint designations.

To create a cloud set with a specialized endpoint for the resource manager, with a specific profile:

```azurecli
az cloud register --name MyCloud --endpoint-resource-manager .endpoint.manager.suffix --profile 2017-03-09-profile-preview
```

This creates the cloud, but does _not_ automatically select it. You will still need to switch cloud sets.

If you no longer require the created cloud set, it can be unregistered:

```azurecli
az cloud unregister --name MyCloud
```

