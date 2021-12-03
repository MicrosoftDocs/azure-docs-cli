---
title: Create virtual machines prerequisites (VM) – Azure CLI | Microsoft Docs
description: Learn how to create virtual machines (VM) with the Azure CLI by completing this tutorial through Azure Cloud Shell or by installing the CLI locally.
ms.date: 07/09/2018
ms.author: dbradish
author: dbradish-microsoft
manager: barbkess
ms.devlang: azure-cli
ms.topic: tutorial
ms.prod: azure
ms.technology: azurecli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli create vm, virtual machine in azure cli
---

# 1- Overview and Prerequisites

In this tutorial, you learn all of the steps involved in creating a virtual machine with the Azure CLI. The tutorial
also covers output queries, Azure resource reuse, and resource cleanup.

This tutorial can be completed with the interactive experienced offered through Azure Cloud Shell, or you may [install the CLI](install-azure-cli.md)
locally.

Use __ctrl-shift-v__ (__cmd-shift-v__ on macOS) to paste tutorial text into Azure Cloud Shell.

## Prerequisites

- **Sign in** If you're using a local install of the CLI, you need to sign in before performing any other steps.

    ```azurecli-interactive
    az login
    ```

    Complete the authentication process by following the steps displayed in your terminal.

## Create a resource group

In Azure, all resources are allocated in a resource management group. Resource groups provide logical groupings of resources
that make them easier to work with as a collection. For this tutorial, all of the created resources go into a
single group named `TutorialResources`.

```azurecli
az group create --name TutorialResources --location eastus
 ```
