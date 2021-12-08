---
title: Create virtual machines prerequisites (VM) – Azure CLI | Microsoft Docs
description: Prerequisites for creating a virtual machines (VM) with the Azure CLI.
ms.date: 07/09/2018
ms.author: dbradish
author: dbradish-microsoft
manager: barbkess
ms.devlang: azure-cli
ms.topic: tutorial
ms.prod: azure
ms.technology: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli create vm, virtual machine in azure cli
---

# 1 - Overview and Prerequisites

In this tutorial, you'll learn how to create a virtual machine with the Azure CLI. This tutorial
also covers Azure CLI specific concepts such as persisted parameters, output queries, and shell variables.

This tutorial can be completed with the interactive experienced offered through Azure Cloud Shell, or you may [install the CLI](install-azure-cli.md)
locally.

Use __ctrl-shift-v__ (__cmd-shift-v__ on macOS) to paste tutorial text into Azure Cloud Shell.

## Prerequisites

- **Sign in** If you're using a local install of the CLI, you need to sign in before performing any other steps.

    ```azurecli-interactive
    az login
    ```

    Complete the authentication process by following the steps displayed in your terminal.

## Turn on persisted parameters

Persisted parameters store parameter values for future use, so you can drop repeated parameter values between sequential commands. Use the [az config param-persist on](/cli/azure/config/param-persist#az_config_param_persist_on) command to enable persisted parameters.

```azurecli
az config param-persist on
 ```

For more information on persisted parameters see [Use persisted parameters to simplify sequential Azure CLI commands](/cli/azure/param-persist-tutorial?tabs=azure-cli).

## Create a resource group

In Azure, all resources are allocated in a resource management group. Resource groups provide logical groupings of resources
that make them easier to work with as a collection. For this tutorial, all of the created resources go into a
single group named `TutorialResources`.

```azurecli
az group create --name TutorialResources --location eastus
 ```
