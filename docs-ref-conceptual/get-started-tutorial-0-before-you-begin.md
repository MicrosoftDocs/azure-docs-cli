---
title: Learn about Azure CLI environments, terms, and compare the Azure CLI to Azure PowerShell | Microsoft Docs
description: Learn the environments you can use to execute Azure CLI commands, Azure CLI terms, how the Azure CLI compares to Azure PowerShell.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 11/15/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure, az account, az group, az config, az init, configuration
---
# Learn to use the Azure CLI

Welcome to the Azure CLI! You have chosen a tool that will allow you to create, update, and delete Azure resources from a command-line. In this tutorial, you will onboard with the Azure CLI and learn how to complete the following tasks:

> [!div class="checklist"]
>
> * Learn to use the Azure CLI
> * [Prepare your environment](./get-started-tutorial-1-prepare-environment.md)
> * [Write commands for Bash, Powershell and Cmd environments](./get-started-tutorial-2-work-environments.md)
> * [Use variables to store values for a script](./get-started-tutorial-3-use-variables.md)

## What is the Azure CLI?

The Azure Command-Line Interface (CLI) is a cross-platform command-line tool to connect to Azure and execute administrative commands on Azure resources. It allows the execution of commands through a terminal using interactive command-line prompts or a script.

For interactive use, you first launch a shell such as cmd.exe on Windows, or Bash on Linux or macOS, and then issue a command at the shell prompt. To automate repetitive tasks, you assemble the CLI commands into a shell script using the script syntax of your chosen shell, and then you execute the script.

You can install the Azure CLI locally on Linux, Mac, or Windows computers. It can also be used from a browser through the Azure Cloud Shell or run from inside a Docker container.

## Azure CLI and Azure PowerShell

Azure CLI and Azure PowerShell are command-line tools that enable you to create and manage Azure resources. Both are cross-platform, installable on Windows, macOS, and Linux.

| Compare | Azure CLI | Azure PowerShell |
|-|-|-|
|Install|Cross-platform **command-line interface**, installable on Windows, macOS, Linux. | Cross-platform **PowerShell module**, runs on Windows, macOS, Linux.
|Run|Runs in Windows PowerShell, Cmd, or Bash and other Unix shells.| Requires Windows PowerShell or PowerShell.
|Terms| Reference groups, reference subgroups and reference commands | Modules, cmdlets and aliases
|Example | [az storage account create](/cli/azure/storage/account#az-storage-account-create) | [New-AzStorageAccount](/powershell/module/az.storage/new-azstorageaccount) |
|Learn more | [Azure CLI onboarding cheat sheet](./cheat-sheet-onboarding.md) | [Azure Powershell overview](/powershell/azure/what-is-azure-powershell)

## Shell environments

Windows PowerShell, PowerShell, Cmd, and Bash are shell environments. Your shell environment not only determines which tools you can use but also changes your command-line experience.

| Shell Environment | Azure CLI | Azure PowerShell
|-|-|-|
|Cmd | Yes | |
|Bash| Yes | |
|Windows PowerShell | Yes |Yes
|PowerShell | Yes | Yes

[Azure Cloud Shell](/azure/cloud-shell/get-started) is a hosted shell environment that runs on an Ubuntu container. Cloud Shell provides two shell environments: Bash (with Azure CLI preinstalled) and PowerShell (with Azure PowerShell preinstalled).

Both the Azure CLI and Azure PowerShell also run inside a [Docker container](./run-azure-cli-docker.md).

## Azure CLI terms and status

All Azure CLI reference commands are one of two reference types:

* Core components of the Azure are part of the primary Azure CLI service and ship from Microsoft on a [release schedule](./release-notes-azure-cli.md). 
* [Extensions](./azure-cli-extensions-overview.md) are not shipped as part of the core Azure CLI but they run as CLI commands. With extensions, you gain access to experimental and prerelease commands along with the ability to write your own CLI interfaces.

An Azure CLI syntax has four parts. For example, this is how [az storage account local-user create](/cli/azure/storage/account/local-user#az-storage-account-local-user-create) breaks down into parts:

| Name | Examples |
|-|-|
| Reference _group_ | az `storage`
| Space-delimited reference _subgroups_ | `account` `local-user`
| Reference _command_ | az storage account local-user `create`
| Reference command _parameters_ | `--account-name`, `--resource-group`

Every Azure CLI reference group, subgroup, command and parameter has one of three statuses. The status determines the support level.

* Experimental
* Preview
* GA (General acceptance)

Find the reference type and status of a command in the [reference documentation](/cli/azure/reference-index).

![status table](./media/status-table.png)

## Get more detail

Do you want more detail on one of the topics covered in this tutorial step? Use the links in this table to learn more.

|Topic| Learn more|
|-|-|
| Extensions | [Use and manage extensions with the Azure CLI](./azure-cli-extensions-overview.md)
| Environments | [Choose the right Azure command-line tool](./choose-the-right-azure-command-line-tool.md)
| Terms | [Azure CLI terminology](reference-types-and-status.md) |
| Lifecycle | [Azure CLI support lifecycle]()

## Next Step

Now that you've learned about the Azure CLI, proceed to the next step to prepare your environment and execute your first Azure CLI reference command.

> [!div class="nextstepaction"]
> [Prepare your environment](./get-started-tutorial-1-prepare-environment.md)
