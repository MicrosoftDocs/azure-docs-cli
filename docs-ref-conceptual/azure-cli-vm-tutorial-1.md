---
title: Create virtual machine (VM) on a virtual network (VNet) prerequisites – Azure CLI | Microsoft Docs
description: Prerequisites for creating a virtual machines (VM) on a virtual network (VNet) with the Azure CLI.
ms.date: 11/12/2021
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: tutorial
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli create vm, virtual machine in azure cli, shell variables
---

# 1 - Overview and Prerequisites

In this tutorial, you'll learn how to create a virtual network (VNet) and deploy a virtual machine (VM) to the VNet with the Azure CLI. This tutorial
also covers Azure CLI specific concepts such as shell variables and output queries.

This tutorial can be completed with the interactive experience offered through Azure Cloud Shell, or you may [install the CLI](install-azure-cli.md)
locally.

Use __ctrl-shift-v__ (__cmd-shift-v__ on macOS) to paste tutorial text into Azure Cloud Shell.

[!INCLUDE [azure-cli-prepare-your-environment.md](./includes/azure-cli-prepare-your-environment.md)]

## Shell variables

Shell variables store values for future use and can be used to pass values to command parameters. Shell variables allow for the reuse of commands, both on their own and in scripts. This tutorial uses shell variables for easier customization of command parameters. To use your own parameter values instead of using the provided values, change the values assigned to the shell variables. For more information about shell variables see [Use shell variables](./azure-cli-variables.md#use-shell-variables).

## Create a resource group

In Azure, all resources are allocated in a resource management group. Resource groups provide logical groupings of resources
that make them easier to work with as a collection. Use the [az group create](/cli/azure/group#az_group_create) command to create a resource group named `VMTutorialResources`.

```azurecli
# create shell variables
resourceGroup=VMTutorialResources
location=eastus

az group create --name $resourceGroup --location $location
 ```
