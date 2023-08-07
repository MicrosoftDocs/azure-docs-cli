---
title: Azure CLI onboarding cheat sheet | Microsoft Docs
description: Quickly onboard with the Azure CLI.  Get answers to common CLI questions and learn to use the Azure CLI.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/02/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli 
ms.custom: devx-track-azurecli
keywords: azure cli, onboarding, how to use azure cli, azure command line interface, learn to use the Azure CLI
---
# Azure CLI onboarding cheat sheet

If you're looking to onboard quickly with the Azure CLI, you have come to the right place!
Use this page to learn tips and techniques when getting started with the Azure CLI.

## Content indexes

Jump straight to reference command examples, sample scripts, and tutorials using these links:

- Find an index of quickstarts, how-to guides and tutorials in [Azure CLI doc index A-Z](reference-docs-index.md).
- Choose a tested script and make it your own from the [Azure CLI sample index A-Z](samples-index.md).
- For a published format of in-line help, go to the [Reference index A-Z](/cli/azure/reference-index).
- Go to [Microsoft Learn Modules for CLI tools](/training/browse/?expanded=azure&products=azure-clis) for free on-line training with a sandbox environment.

## Getting started

| Question | Answer | Learn more
|-|-|-|
| What advantage is there to using Azure CLI? | You can manage multiple Azure resources concurrently from a flexible command-line. For example, create 50 Azure storage accounts, or update multiple user permissions through a script. | [Choose the right command-line tool](choose-the-right-azure-command-line-tool.md)
| Where can I run the Azure CLI? | The Azure CLI runs in Windows (Cmd or PowerShell), Linux, macOS, Docker containers, and Azure Cloud Shell.  Using Azure Cloud Shell is the quickest way to get started. | [Run Azure Cloud Shell](/azure/cloud-shell/quickstart?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
| Do I have to install the Azure CLI? | Azure Cloud Shell and some Linux distributions have the Azure CLI preinstalled. For all other environments, you must install the Azure CLI. | [Install the Azure CLI](install-azure-cli.md)
| How do I run the Azure CLI in a Docker container? | `docker run -it mcr.microsoft.com/azure-cli` | [How to run the Azure CLI in a Docker container](run-azure-cli-docker.md)
| What URLs do I need for proxy bypass? | This depends on the Cloud you are using.  For a complete list see the list of endpoints needed for proxy bypass. | [Azure CLI endpoints for proxy bypass](azure-cli-endpoints.md)
| How do I sign in? | Use `az login` inside your console window. Use your own Azure username and password, a service principal, managed identity or WAM. | [Sign in with Azure CLI](authenticate-azure-cli.md)

## Using reference commands

| Question | Answer | Learn more
|-|-|-|
| What is the Azure CLI syntax pattern? | "command group + _command subgroup_ + **command** + --parameters" Example: "az storage _account_ **create** --name myStorageAccount" | [Azure CLI syntax components](/cli/azure/reference-types-and-status#azure-cli-syntax-components).
| What is the difference between a command group, cmdlet, command, alias, module, and reference? | Good question!  The Azure CLI only has command groups, reference commands, and user-defined aliases. You may be thinking of [Azure PowerShell](/powershell/azure/) if you are looking for cmdlets and modules. |  [Azure CLI syntax components](/cli/azure/reference-types-and-status#azure-cli-syntax-components).
| What is an extension and why does it have to be installed separately? | Extensions are command group add-ins that are not shipped as part of the core Azure CLI. You are prompted to install an extension the first time you use it. Get a list of available extensions by running `az extension list-available -output table`. | [Use and manage extensions with the Azure CLI](azure-cli-extensions-overview.md)
| How do I get a list of all commands, both core and extension? | For a list of command groups, in your console type `az` and <kbd>Enter</kbd>. For a list of subgroups and commands, use the `--help` parameter.  Example: `az account --help` or `az account subscription --help` outputs a command list for just the group or subgroup. | [Reference index A-Z](/cli/azure/reference-index)
| Does the Azure CLI have tab completion? | Yes!  When typing a command in PowerShell, press your <kbd>Tab</kbd> key. This feature is only available in PowerShell. | [Enable Tab Completion on PowerShell](/cli/azure/install-azure-cli-windows#enable-tab-completion-on-powershell)
| How do I get in-line help? | Every command has a `--help` parameter that results in descriptions and tips to display in your console. Example: `az account ---help` or `az vm create --help` | You can also [Request support](azure-cli-support-request.md).
| How can I learn to use multiple reference commands to complete a single job to be done? | We're glad you asked!  The Azure CLI provides several interactive commands that provide syntax and next steps.  In the next section, learn about `az interactive`, `az scenario`, `az next`, and `az find`. | [Learning Azure CLI](#learning-azure-cli)

For a side-by-side comparison of Azure CLI and Azure PowerShell syntax, see [Azure CLI vs Azure PowerShell: Side-by-side Command Comparison](/cli/azure/choose-the-right-azure-command-line-tool#azure-cli-vs-azure-powershell-side-by-side-command-comparison).

See script comparisons between Bash, PowerShell, and Cmd in [How to query Azure CLI command output using a JMESPath query](query-azure-cli.md).

## Learning Azure CLI

There are several reference commands that provide interactive prompts to help you learn the Azure CLI.

| Command | Description | Example
|-|-|-|
| [az interactive](interactive-azure-cli.md) | In a PowerShell console, get auto-completion, command descriptions, and examples as you type. | See [Work in interactive mode](interactive-azure-cli.md) for more information.  Example: Type `az interactive` in your console window then <kbd>Enter</kbd>.
| [az scenario](/cli/azure/scenario) | Get end to end (E2E) examples and execute them with walk-through prompts. | Type `az scenario guide "keywords of interest"` in your console then <kbd>Enter</kbd>.  The Azure CLI returns scenarios based on your keyword(s).  Example: `az scenario guide "virtual machines"`
| [az next](/cli/azure/reference-index#az-next) | Get recommendations for the next Azure CLI command based on customer execution patterns.  You are prompted to select a command path. | Type `az next` in your console then <kbd>Enter</kbd>.  Pick from 1 of 7 preset command paths.
| [az find](/cli/azure/reference-index#az-find) | This is an AI robot that will return reference examples for keywords. | Type `az find "active subscription"` in your console then <kbd>Enter</kbd>.

Another great way to learn to use the Azure CLI is through [Microsoft Learn Modules for CLI tools](/training/browse/?expanded=azure&products=azure-clis).  When the module provides a sandbox environment, use the sandbox to try new commands without incurring costs.

## Common usage questions

| Question | Reference command answer | Learn more
|-|-|-|
| How do I know what subscription I'm using? | `az account show --output table` | [How to manage Azure subscriptions with the Azure CLI](/cli/azure/manage-azure-subscriptions-azure-cli#get-the-active-subscription)
| How do I change my subscription? | `az account set --subscription "mySubscriptionName"` | [How to manage Azure subscriptions with the Azure CLI](/cli/azure/manage-azure-subscriptions-azure-cli#change-the-active-subscription)
| How can I set a default resource group and location? | `az config set defaults.location=westus2 defaults.group=MyResourceGroup` | [Configure settings using az config](/cli/azure/azure-cli-configuration#configure-settings-using-az-config)
| How do I query command output? | `az account show --query "{tenantId:tenantId,subscriptionid:id}"` | See [How to query Azure CLI command output using a JMESPath query](query-azure-cli.md) for many `--query` examples in Bash, PowerShell and Cmd.
| How do I format output from a command? | `az account list --ouput table` | [Output formats for Azure CLI commands](format-output-azure-cli.md)
| Can you help me to learn Bash with Azure CLI commands? | Absolutely! We all have different technical strengths, and for that reason, Microsoft offers a How-to guide for learning Bash.  Enjoy! |  [Learn to use Bash with the Azure CLI](azure-cli-learn-bash.md)

Would you like to see more onboarding tips in this article?  Use the [Feedback for this page](https://github.com/MicrosoftDocs/azure-docs-cli/issues/new?title=&body=%F0%9F%9A%A8%20Looks%20like%20you%20arrived%20from%20the%20internal%20review%20site%20%0A%F0%9F%9A%A8%20Do%20not%20enter%20Microsoft%20confidential%20information%20here%0A%0A%5BEnter%20feedback%20here%5D%0A%0A%0A---%0A%23%23%23%23%20Document%20Details%0A%0A%E2%9A%A0%20*Do%20not%20edit%20this%20section.%20It%20is%20required%20for%20learn.microsoft.com%20%E2%9E%9F%20GitHub%20issue%20linking.*%0A%0A*%20ID%3A%207e619320-8638-7beb-48ce-fa00a5d67779%0A*%20Version%20Independent%20ID%3A%20e5d2a07f-afd9-e985-abda-0840ac5f59b0%0A*%20Content%3A%20%5BAzure%20CLI%20onboarding%20cheat%20sheet%5D(https%3A%2F%2Freview.learn.microsoft.com%2Fen-us%2Fcli%2Fazure%2Fcheat-sheet-onboarding%3Fbranch%3Dpr-en-us-3776)%0A*%20Content%20Source%3A%20%5Bdocs-ref-conceptual%2Fcheat-sheet-onboarding.md%5D(https%3A%2F%2Fgithub.com%2FMicrosoftDocs%2Fazure-docs-cli%2Fblob%2Fmain%2Fdocs-ref-conceptual%2Fcheat-sheet-onboarding.md)%0A*%20Service%3A%20**azure-cli**%0A*%20GitHub%20Login%3A%20%40dbradish-microsoft%0A*%20Microsoft%20Alias%3A%20**dbradish**) and let us know!
