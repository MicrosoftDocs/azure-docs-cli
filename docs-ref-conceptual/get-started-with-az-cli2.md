---
title: Get started with Azure CLI 2.0
description: Get started with Azure CLI 2.0 on Linux, Mac, or Windows.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: allclark
manager: douge
ms.date: 02/18/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 85c418a8-6177-4833-bb8d-ff4ce2233c1a
---

# Get started with Azure CLI 2.0

1. [Install Azure CLI 2.0](install-az-cli2.md)
on whatever platform you use.

1. To verify the installation, run `az --version`. 

1. Run the login command.

    ```azurecli
    az login
    ```

   You get a code to use in the next step. 

1. Use a web browser to open the page [https://aka.ms/devicelogin](https://aka.ms/devicelogin)
    and enter the code to authenticate.

    You are prompted to log in using your credentials.

1. Log in.

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

Use the `--query` parameter to execute a [JMESPath(http://jmespath.org) query on the results of your `az` command.
Learn more in this article on [query](query-az-cli2.md).

## Format the output

Use the `--output` parameter to [format the output(format-output-az-cli2.md) of the command.

## Get samples

Get the Azure CLI 2.0 samples from the github repository [Azure/azure-cli-samples](https://github.com/Azure/azure-cli-samples).

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