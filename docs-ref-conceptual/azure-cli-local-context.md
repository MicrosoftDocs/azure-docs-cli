---
title: Azure CLI local context options
description: How to use Azure CLI local context to store reusable parameter values
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.prod: azure
ms.date: 06/30/2020
ms.topic: conceptual
ms.devlang: azurecli
ms.technology: azure-cli
---

# Azure CLI local context

Azure CLI [az local-context](/cli/azure/local-contex) provides local persisted parameter values for Azure CLI commands.  The purpose of local context is to remove the need to continually retype common parameters. For example, location and resource-group are required parameters in many CLI commands, but they don’t contribute to the _intent_ of the command.  By storing parameter values with local context, you reduce redundancy and can significantly shorten CLI command syntax.

## Local context storage files

The local context file name is `.local_context` and is stored in your working directory.  If you are using [Azure Cloud Shell](https://shell.azure.com), your working directory is in the storage account being used by the Azure CLI.  If you are using a [local install](/install-azure-cli), your working directory is on your local machine.

## Local context parameters

The following Azure CLI parameters are supported by local context.  The `resource_group_name` and `location` parameters are stored differently in that you can add them to local context **without** executing a create command.

| Local context parameter | Storage action
|-|-|
| location | Execute any command
| resource_group_name | Execute any command
| vnet_name | Execute a create command
| storage_account_name | Execute a create command
| webapp_name | Execute a create command
| function_app_name | Execute a create command

## Next steps

- [Tutorial: Use local context with the Azure CLI](azure-cli-local-context-tutorial)
