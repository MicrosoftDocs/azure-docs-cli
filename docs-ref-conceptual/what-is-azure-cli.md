---
title: What is the Azure CLI?
description: Overview of the Azure CLI, a command-line tool designed to create and manage Azure resources available in Windows, macOS, Linux, and Docker containers.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 06/04/2021
ms.topic: overview
ms.service: azure-cli
ms.devlang: azurecli 
ms.custom: devx-track-azurecli
---
# What is the Azure CLI

The Azure CLI is a cross-platform command-line tool to connect to Azure and execute administrative commands on Azure resources. It allows the execution of commands through a terminal using interactive command-line prompts or a script.

For interactive use, you first launch a shell such as cmd.exe on Windows, or Bash on Linux or macOS, and then issue a command at the shell prompt. To automate repetitive tasks, you assemble the CLI commands into a shell script using the script syntax of your chosen shell, and then you execute the script.

You can install the Azure CLI locally on Linux, Mac, or Windows computers. It can also be used from a browser through the Azure Cloud Shell or run from inside a Docker container.

## Syntax samples

### Subscriptions

The Azure CLI syntax follows a simple `reference name` - `command` - `parameter` - `parameter value` pattern.  For example, switching between subscriptions is often a common task.  Here is the syntax.

```azurecli
az account set --subscription "my subscription name"
```

Now, how easy was that?!  See [Manage subscriptions with Azure CLI](manage-azure-subscriptions-azure-cli.md) to learn more about using the Azure CLI to work with subscriptions and create management groups.

### Role assignments

Another common use of the Azure CLI is managing role assignments.

```azurecli
az role assignment create --assignee servicePrincipalName --role Reader
az role assignment delete --assignee userSign-inName --role Contributor
```

See [Create an Azure service principal with the Azure CLI](create-an-azure-service-principal-azure-cli.md) for an in-depth turorial on managing service principals and role assignments.

## Current Version

[!INCLUDE [current-version](includes/current-version.md)]

## Prerequisites

You need to prepare your environment before using the Azure CLI.  

[!INCLUDE [prerequisites](includes/azure-cli-prepare-your-environment-no-header.md)]

## See Also

- [Get started with the Azure CLI](get-started-with-azure-cli.md)
- [Choose the right command-line tool](choose-the-right-azure-command-line-tool.md)
- [Full command reference list for the Azure CLI](/cli/azure/reference-index)
- [Control Azure services with the Azure CLI](/learn/modules/control-azure-services-with-cli/)
- [Azure resources that the Azure CLI can manage](azure-services-the-azure-cli-can-manage.md)