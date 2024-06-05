---
title: Learn about Azure CLI environments, terms, and compare the Azure CLI to Azure PowerShell | Microsoft Docs
description: Learn the environments you can use to execute Azure CLI commands, Azure CLI terms, how the Azure CLI compares to Azure PowerShell.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 12/04/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, devx-track-azurepowershell
keywords: azure, az account, az group, az config, az init, configuration
---
# Begin your Azure CLI journey

Welcome to the Azure CLI. We're glad you're here! You chose a tool that allows you to create, update, and delete Azure resources from a command-line. In this tutorial, you'll onboard with the Azure CLI and learn the following skills that help you to be successful in your Azure CLI journey:

> [!div class="checklist"]
>
> * 1 - Get to know the Azure CLI (in this tutorial step)
>   * Compare Azure CLI and PowerShell _tools_.
>   * Review Azure CLI command components.
>
> * 2 - [Prepare your environment for the Azure CLI](./get-started-tutorial-1-prepare-environment.md)
>   * Compare Bash and PowerShell _environments_.
>   * Set environment variables.
>   * Add a random ID to an Azure resource name.
>
> * 3 - [Compare Azure CLI syntax differences in Bash, PowerShell and Cmd](./get-started-tutorial-2-environment-syntax.md)
>   * Understand differences in line continuation and variable usage.
>   * Compare quoting differences and escape characters between environments.
>   * Work with dates.
>
> * 4 - [Populate variables for use in scripts](./get-started-tutorial-3-use-variables.md)
>   * Get (query) Azure resource properties.
>   * Store the results of a command in a variable, such as a password or secret.
>   * Store the contents of a JSON file in a variable, such as development or production settings.
>
> * 5 - [Delete Azure resources at scale using a script](./get-started-tutorial-4-delete-resources.md)
>   * Delete Azure resources using a FOR..EACH loop.

## What is the Azure CLI?

The Azure Command-Line Interface (CLI) is a cross-platform command-line tool to connect to Azure and execute administrative commands on Azure resources. It allows the execution of commands through a terminal using interactive command-line prompts or a script.

For interactive use, first launch a shell such as Bash, PowerShell, or Cmd.exe on Windows, Linux or macOS. Then issue a command at the shell prompt. To automate repetitive tasks, assemble the Azure CLI commands into a shell script using the script syntax of your chosen shell, and then execute the script.

## What shell environment should I use?

Windows PowerShell, PowerShell, Cmd, and Bash are different shell environments. Your shell environment not only determines which tools you can use, but your shell also changes your command-line experience. For example, there are important quoting differences, line continuation characters, and variable syntax differences between shells.

The Azure CLI reference examples in this tutorial are written for Bash, PowerShell and Cmd to help you evaluate each shell experience. Here's a brief comparison:

|Shell environment | Can I use Azure CLI? | Can I use Azure PowerShell?|
|-|-|-|
| CMD | Yes ||
| Bash | Yes ||
| Windows PowerShell | Yes | Yes |
| PowerShell | Yes | Yes |

Azure Cloud Shell is a hosted shell environment that runs on an Ubuntu container. Cloud Shell provides two shell environments: Bash (with Azure CLI preinstalled) and PowerShell (with Azure PowerShell preinstalled).

## How does the Azure CLI compare to Azure PowerShell?

Azure CLI and [Azure PowerShell](/powershell/azure/) are both command-line tools that enable you to create and manage Azure resources, but they're distinctly different. Here's a brief comparison of the two tools:

| Compare | Azure CLI | Azure PowerShell |
|-|-|-|
|What is it?|Cross-platform **_command-line interface_** | Cross-platform **_PowerShell module_**
|Built on | Python | PowerShell
|Install on| Windows, macOS, Linux | Windows, macOS, Linux
|Run in|Bash shell, PowerShell 5 or 7, Windows Cmd.exe, Azure Cloud Shell, Docker container, and other Unix shells.| Windows PowerShell, PowerShell, Azure Cloud Shell, Docker container
|Terms| Reference groups, reference subgroups and reference commands | Modules, cmdlets and aliases
|Syntax example | [az storage account create](/cli/azure/storage/account#az-storage-account-create) | [New-AzStorageAccount](/powershell/module/az.storage/new-azstorageaccount) |
|Learn more | [What is Azure CLI?](./what-is-azure-cli.md) | [What is Azure PowerShell?](/powershell/azure/what-is-azure-powershell)
|Release notes| [Azure CLI release notes](./release-notes-azure-cli.md) | [Azure PowerShell release notes](/powershell/azure/release-notes-azureps)

## What are Azure CLI command components?

All Azure CLI reference commands are one of two reference types:

* **Core** components of the Azure CLI are part of the primary Azure CLI service and ship from Microsoft on a [release schedule](./release-notes-azure-cli.md).
* **[Extensions](./azure-cli-extensions-overview.md)** aren't shipped as part of the core Azure CLI but they run as CLI commands. With extensions, you gain access to experimental and prerelease commands along with the ability to write your own CLI interfaces. You're prompted to install an extension on first use.

The Azure CLI syntax has four parts. For example, this is how [az storage account local-user create](/cli/azure/storage/account/local-user#az-storage-account-local-user-create) breaks down into syntax parts:

| Term | Example |
|-|-|
| Reference `group` | az `storage`
| Space-delimited reference `subgroups` | az storage `account` `local-user`
| Reference `command` | az storage account local-user `create`
| Reference command `parameters` | az storage account local-user create `--name`, `--account-name`, `--resource-group`

## Get more details

Do you want more detail on one of the subjects covered in this tutorial step? Use the links in this table to learn more.

| Subject | Learn more |
|-|-|
| Environments | [Choose the right Azure command-line tool](./choose-the-right-azure-command-line-tool.md)
| Terms | [Azure CLI terms and status](reference-types-and-status.md) |
| Extensions | [Use and manage extensions with the Azure CLI](./azure-cli-extensions-overview.md)

## Next Step

Now that you've learned about shell environments and Azure CLI syntax, proceed to the next step to prepare your environment and execute your first Azure CLI reference command.

> [!div class="nextstepaction"]
> [Prepare your environment for the Azure CLI](./get-started-tutorial-1-prepare-environment.md)
