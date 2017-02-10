---
title: Get started with Azure CLI 2.0 (Preview)
description: Get started with Azure CLI 2.0 (Preview) on Linux, Mac, or Windows.
keywords: Azure CLI 2.0 (Preview), Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: allclark
manager: douge
ms.date: 02/18/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 85c418a8-6177-4833-bb8d-ff4ce2233c1a
---

# Get started with Azure CLI 2.0 (Preview)

1. [Install Azure CLI 2.0 (Preview)](install-az-cli2.md)
on whatever platform you use.

2. To verify the installation, run `az` with no arguments. You should get this output:

    ```
    Welcome to the cool new Azure CLI!

    Here are the base commands:

        account  : Manages stored and default subscriptions.
        acs      : Manage Azure container services.
        ad       : Synchronize on-premises directories and manage Azure Active Directory (AAD)
                resources.
        cloud    : Manage the Azure clouds registered.
        component: Manages and updates Azure CLI components.
        configure: Interactive experience for setting up the Azure CLI.
        context  : Manage contexts.
        feedback : Loving or hating the CLI?  Let us know!
        login    : Log in to access Azure subscriptions.
        logout   : Log out to remove accesses to Azure subscriptions.
        network  : Manages Network resources.
        provider : Manage resource providers.
        resource : Generic commands to manage Azure resources.
        role     : Use role assignments to manage access to your Azure resources.
        storage  : Durable, highly available, and massively scalable cloud storage.
        tag      : Manage resource tags.
        vm       : Provision Linux and Windows virtual machines in minutes.
        vmss     : Create highly available, auto-scalable Linux or Windows virtual machines.
    ```

[!INCLUDE [interactive_login](includes/interactive-login.md)]

Now you can run any command that accesses your account.

## Create a resource group

```azurecli
az group create -l westus -n MyRG
```

## Create a VM

```azurecli
az vm create -g MyRG -n MyVM --admin-username admin --admin-password Password@1234
```

## Log in using a service principal

For automated tasks, consider [logging in using a service principal](authenticate-az-cli2.md#service-principal).

## Query the results

Use the [`--query` parameter](query-az-cli2.md) to execute a [JMESPath query](http://jmespath.org) query on the results of your `az` command.

## Format the output

Use the [`--output` parameter](format-output-az-cli2.md) to format the output of the command.

## Get samples

Get the Azure CLI 2.0 (Preview) samples from the github repository [Azure/azure-cli-samples](https://github.com/Azure/azure-cli-samples).

## Get help

```azurecli
az [command-group [command]] -h
```

For example, to see what commands and subgroups are available for VMs, use

```azurecli
az vm -h
```

To get help with the command to create a VM, use

```azurecli
az vm create -h
```

## Read the API reference docs

[API reference](/cli/azure)

## Send us your feedback

```azurecli
az feedback
```