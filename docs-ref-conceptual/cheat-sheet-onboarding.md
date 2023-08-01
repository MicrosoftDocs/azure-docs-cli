---
title: Azure CLI onboarding cheat sheet | Microsoft Docs
description: Quickly onboard with the Azure CLI.  Get answers to common CLI questions and learn to use the Azure CLI.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 07/28/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli 
ms.custom: devx-track-azurecli
keywords: azure cli, onboarding, how to use azure cli, azure command line interface, learn to use the Azure CLI
---
# Azure CLI onboarding cheat sheet

If you are looking to onboard quickly with the Azure CLI, you have come to the right place!
This page is a cheat sheet of tips and techniques to help you onboard with the Azure CLI in record time.

Here is a quick reference chart of common questions and short answers.

## Getting started

| Question | Answer | Learn more
|-|-|-|
| What advantage is there to using Azure CLI? | You can manage multiple Azure resources concurrently from a flexible command-line UI. For example, create 50 Azure storage accounts, or update multiple user permissions through a script. | [Choose the right command-line tool](choose-the-right-azure-command-line-tool.md)
| Where can I run the Azure CLI? | The Azure CLI runs in Windows (CMD or PowerShell), Linux, maxOS, Docker containers, and Azure Cloud Shell.  Using Azure Cloud Shell is the quickest way to get started. | [Run Azure Cloud Shell](/azure/cloud-shell/quickstart?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
| Do I have to install the Azure CLI? | Azure Cloud Shell and some Linux distributions have the Azure CLI preinstalled. For all other environments, you must install the Azure CLI. | [Install the Azure CLI](install-azure-cli.md)
| How do I run the Azure CLI in a Docker container? | `docker run -it mcr.microsoft.com/azure-cli` | [How to run the Azure CLI in a Docker container](run-azure-cli-docker.md)
| What URLs do I need for proxy bypass? | This depends on the Cloud you are using.  For a complete list see... | [Azure CLI endpoints for proxy bypass](azure-cli-endpoints.md)
| How do I sign in? | Use `az login` inside your console window. Use your own Azure user name and password, a service principal, managed identity or WAM. | [Sign in with Azure CLI](authenticate-azure-cli.md)

## Using reference commands

| Question | Answer | Learn more
|-|-|-|
| What is the Azure CLI syntax pattern? | "`command group` + _command subgroup_ + **command** + --parameters" Example: "`az storage` _account_ **create** --name myStorageAccount" | [Azure CLI syntax components](/cli/azure/reference-types-and-status#azure-cli-syntax-components).
| What is difference between a command group, cmdlet, command, alias, module, and reference | Good question!  The Azure CLI only has command groups, references, commands and user-defined aliases. You may be thinking of Azure PowerShell if you are looking for cmdlets and modules. |  [Azure CLI syntax components](/cli/azure/reference-types-and-status#azure-cli-syntax-components).
| What is an extension and why does it have to be installed separately? | Extensions are reference group add-ins that are not shipped as part of the core Azure CLI. You are prompted to install an extension the first time you use it. Get a list of available extensions by running `az extension list-available -output table`. | [Use and manage extensions with the Azure CLI](azure-cli-extensions-overview.md)
| How do I get a list of all commands, both core and extension? | For a list of command groups, in your console type `az` and <kbd>Enter</kbd>. For a list of subgroups and commands, use the `--help` parameter.  Example: `az account --help` or `az account subscription --help` will output a command list for just the group or subgroup. | [Reference list A-Z](/cli/azure/reference-index)
| Does the Azure CLI have tab completion | Yes!  When typing a command in PowerShell, press your <kbd>Tab</kbd> key. This feature is only available in PowerShell. | [Enable Tab Completion on PowerShell](/cli/azure/install-azure-cli-windows#enable-tab-completion-on-powershell)
| How do I get in-line help? | Every command has a `--help` parameter that will result in descriptions and tips to display in your console. Example: `az account ---help` or `az vm create --help` | [Request support](azure-cli-support-request.md)
| How can I learn to use reference commands that cross multiple Azure services for a single job to be done? | We're glad you asked!  The Azure CLI provides several interactive commands that provide syntax and next steps.  In the next section, learn about `az interactive`, `az scenario`, `az next`, and `az find`. | [Learning Azure CIL](#learning-azure-cli)

For side-by-side comparison examples of the Azure CLI and Azure PowerShell, see [Azure CLI vs Azure PowerShell: Side-by-side Command Comparison](/cli/azure/choose-the-right-azure-command-line-tool#azure-cli-vs-azure-powershell-side-by-side-command-comparison).  There are also script comparisons between Bash, PowerShell and Cmd in [How to query Azure CLI command output using a JMESPath query](query-azure-cli.md).

## Learning Azure CLI

There are several reference commands that provide prompts to help you learn the Azure CLI.

| Command | Description | Example
|-|-|-|
| [az interactive](interactive-azure-cli.md) | In a PowerShell console, get auto-completion, command descriptions, and examples as you type | `az interactive`
| [az scenario](/cli/azure/scenario) | Get end to end (E2E) examples and execute them with walk-through prompts | `az scenario guide "virtual machines"`
| [az next](/cli/azure/reference-index#az-next) | **TO DO:** What's the future of this command.  How is it different than `az scenario`?
| [az find](/cli/azure/reference-index#az-find) | An AI robot that will return reference examples for keywords | `az find "active subscription"`

> [!TIP]
>
> Go to [Azure CLI sample list A-Z](samples-index.md) or [Azure CLI doc list A-Z](reference-docs-index.md) to immediately find
> tested scripts and code snippets for popular command groups. The Azure CLI in-line help has also been published in article-format in
> [Reference index A-Z](/cli/azure/reference-index).

Another great way to learn to use the Azure CLI is through [Microsoft Learn Modules for CLI tools](/training/browse/?expanded=azure&products=azure-clis).  When the module provides a sandbox environment, use the sandox to try new commands without incuring costs.

## Common usage questions

| Question | Reference command answer | Learn more
|-|-|-|
| How do I know what subscription I'm using? | `az account show --output table` | [How to manage Azure subscriptions with the Azure CLI](/cli/azure/manage-azure-subscriptions-azure-cli#get-the-active-subscription)
| How do I change my subscription? | `az account set --subscription "mySubscriptionName` | [How to manage Azure subscriptions with the Azure CLI](/cli/azure/manage-azure-subscriptions-azure-cli#change-the-active-subscription)
| How can I set a default resource group, location etc.? | `az config set defaults.location=westus2 defaults.group=MyResourceGroup` | [Configure settings using az config](/cli/azure/azure-cli-configuration#configure-settings-using-az-config)
| How do I query command output? | `az account show --query "{tenantId:tenantId,subscriptionid:id}"` | See [How to query Azure CLI command output using a JMESPath query](query-azure-cli.md) for many `--query` examples in Bash, PowerShell and Cmd.
| How do I format output from a command? | `az account list --ouput table` | [Output formats for Azure CLI commands](format-output-azure-cli.md)
| Can you help me to learn Bash with Azure CLI commands? | Absolutely! We all have different backgrounds, and for that reason Microsoft offers a How-to guide for learning Bash.  Enjoy! |  [Learn to use Bash with the Azure CLI](azure-cli-learn-bash.md)
