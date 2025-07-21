---
title: Azure CLI onboarding cheat sheet | Microsoft Docs
description: Quickly onboard with the Azure CLI. Get answers to common CLI questions and learn to use the Azure CLI.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure cli, onboarding, how to use azure cli, azure command line interface, learn to use the Azure CLI
---

# Azure CLI onboarding cheat sheet

Ready to get started with the Azure CLI? This page provides essential tips and techniques to help
you onboard quickly and begin using the Azure CLI with confidence.

## Content indexes

Quickly access reference commands, sample scripts, and tutorials using these links:

- [Azure CLI doc index A-Z][34] – Browse quickstarts, how-to guides, and tutorials.
- [Azure CLI sample index A-Z][36] – Find scripts you can customize for your scenarios.
- [Reference index A-Z][20] – View in-line command help in a structured format.
- [Microsoft Training Modules for CLI tools][26] – Explore hands-on training for Azure CLI.

## Getting started

| Question | Answer | Learn more
|-|-|-|
| What advantage is there to using Azure CLI? | You can manage multiple Azure resources concurrently from a flexible command-line. For example, create 50 Azure storage accounts, or update multiple user permissions through a script. | [Choose the right command-line tool][31]
| Where can I run the Azure CLI? | The Azure CLI runs in Windows (PowerShell or Cmd), Linux, macOS, Docker containers, and Azure Cloud Shell. Using Azure Cloud Shell is the quickest way to get started. | [Run Azure Cloud Shell][14]
| Do I have to install the Azure CLI? | Azure Cloud Shell and some Linux distributions have Azure CLI preinstalled. For all other environments, you must install the Azure CLI. | [Install the Azure CLI][33]
| How do I run the Azure CLI in a Docker container? | `docker run -it mcr.microsoft.com/azure-cli` | [How to run the Azure CLI in a Docker container][35]
| What URLs do I need for proxy bypass? | This depends on the Cloud you're using. For a complete list, see the list of endpoints needed for proxy bypass. | [Azure CLI endpoints for proxy bypass][29]
| How do I sign in? | Use `az login` inside your console window. Use your Azure username and password, a service principal, managed identity, or WAM. | [Sign in with Azure CLI][28]

## Using reference commands

| Question | Answer | Learn more
|-|-|-|
| What is the Azure CLI syntax pattern? | "`<command group>` + `<command subgroup>` + `<command>` + `--parameters`" Example: `az storage account create --name myStorageAccount` | [Azure CLI syntax components][23].
| What is the difference between a command group, cmdlet, command, alias, module, and reference? | The Azure CLI only has command groups, reference commands, and user-defined aliases. You might be thinking of [Azure PowerShell][25] if you're looking for cmdlets and modules. | [Azure CLI syntax components][23].
| What is an extension and why does it have to be installed separately? | Extensions are command group add-ins that aren't shipped as part of the core Azure CLI. You're prompted to install an extension the first time you use it. Get a list of available extensions by running `az extension list-available --output table`. | [Use and manage extensions with the Azure CLI][30]
| How do I get a list of all commands, both core and extension? | For a list of command groups, in your console type `az` and <kbd>Enter</kbd>. For a list of subgroups and commands, use the `--help` parameter. Example: `az account --help` or `az account subscription --help` outputs a command list for just the group or subgroup. | [Reference index A-Z][20]
| Does the Azure CLI have tab completion? | When typing a command in PowerShell, press <kbd>Tab</kbd>. This feature is only available in PowerShell. | [Enable Tab Completion on PowerShell][17]
| How do I get in-line help? | Every command has a `--help` parameter that results in descriptions and tips to display in your console. Example: `az account --help` or `az vm create --help` | You can also [Request support][32].
| How can I learn to use multiple reference commands to complete a single job to be done? | The Azure CLI provides several interactive commands that provide syntax and next steps. In the next section, learn about `az interactive`, `az scenario`, `az next`, and `az find`. | [Learning Azure CLI][27]

For a side-by-side comparison of Azure CLI and Azure PowerShell syntax, see
[Azure CLI vs Azure PowerShell: Side-by-side Command Comparison][16].

See script comparisons between Bash, PowerShell, and Cmd in
[Learn Azure CLI syntax differences in Bash, PowerShell, and Cmd][08].

## Learning Azure CLI

The [Learn to use the Azure CLI tutorial][03] walks you through several common Azure CLI tasks with
examples in Bash, PowerShell, and Cmd. Here are some skills covered while working with Azure
Storage:

- [Decide what environment I should use][04]
- [Find and change my default subscription][06]
- [Create an Azure resource containing a random ID in the name][05]
- [Set environment variables][07]
- [Learn syntax differences between Bash, PowerShell, and Cmd][08]
- [Debug Azure CLI reference commands][13]
- [Get properties from a local JSON file][09]
- [Delete multiple resources using a script][01]

There are also several reference commands that offer interactive prompts to help you learn the Azure
CLI.

| Command | Description | Example
|-|-|-|
| [az interactive][10] | In a PowerShell console, get autocompletion, command descriptions, and examples as you type. | See [Work in interactive mode][10] for more information. Example: Type `az interactive` in your console window then <kbd>Enter</kbd>.
| [az scenario][24] | Get end-to-end (E2E) examples and execute them with walk-through prompts. | Type `az scenario guide "keywords of interest"` in your console then <kbd>Enter</kbd>. The Azure CLI returns scenarios based on your keywords. Example: `az scenario guide "virtual machines"`
| [az next][22] | Get recommendations for the next Azure CLI command based on customer execution patterns. You're prompted to select a command path. | Type `az next` in your console then <kbd>Enter</kbd>. Pick from 1 of 7 preset command paths.
| [az find][21] | This is an AI robot that returns reference examples for keywords. | Type `az find "active subscription"` in your console then <kbd>Enter</kbd>.

Another way to learn to use the Azure CLI is through
[Microsoft Training Modules for Azure CLI][26]. The module provides a sandbox environment. Use it to
try new commands without incurring costs.

## Common usage questions

| Question | Reference command answer | Learn more
|-|-|-|
| How do I know what subscription I'm using? | `az account show --output table` | [How to manage Azure subscriptions with the Azure CLI][19]
| How do I change my subscription? | `az account set --subscription "mySubscriptionName"` | [How to manage Azure subscriptions with the Azure CLI][18]
| How can I set a default resource group and location? | `az config set defaults.location=westus2 defaults.group=MyResourceGroup` | [Configure settings using az config][15]
| How do I query command output? | `az account show --query "{tenantId:tenantId,subscriptionid:id}"` | See [How to query Azure CLI command output using a JMESPath query][12] for `--query` examples in Bash, PowerShell, and Cmd.
| How do I format output from a command? | `az account list --output table` | [Output formats for Azure CLI commands][02]
| Can you help me to learn Bash with Azure CLI commands? | We all have different technical strengths, and for that reason, Microsoft offers a How-to guide for learning Bash. | [Learn to use Bash with the Azure CLI][11]

<!-- link references -->

[01]: ./delete-azure-resources-at-scale.md
[02]: ./format-output-azure-cli.md
[03]: ./get-started-tutorial-0-before-you-begin.md
[04]: ./get-started-tutorial-0-before-you-begin.md#what-shell-environment-should-i-use
[05]: ./get-started-tutorial-1-prepare-environment.md#create-a-resource-group-containing-a-random-id
[06]: ./get-started-tutorial-1-prepare-environment.md#find-and-change-your-active-subscription
[07]: ./get-started-tutorial-1-prepare-environment.md#set-environment-variables
[08]: ./get-started-tutorial-2-environment-syntax.md
[09]: ./get-started-tutorial-3-use-variables.md#get-the-contents-of-a-json-file-and-store-it-in-a-variable
[10]: ./interactive-azure-cli.md
[11]: ./use-azure-cli-successfully-bash.md
[12]: ./use-azure-cli-successfully-query.md
[13]: ./use-azure-cli-successfully-troubleshooting.md#the-debug-parameter
[14]: /azure/cloud-shell/quickstart?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json
[15]: /cli/azure/azure-cli-configuration#configure-settings-using-az-config
[16]: /cli/azure/choose-the-right-azure-command-line-tool#azure-cli-vs-azure-powershell-side-by-side-command-comparison
[17]: /cli/azure/install-azure-cli-windows#enable-tab-completion-on-powershell
[18]: /cli/azure/manage-azure-subscriptions-azure-cli#change-the-active-subscription
[19]: /cli/azure/manage-azure-subscriptions-azure-cli#get-the-active-subscription
[20]: /cli/azure/reference-index
[21]: /cli/azure/reference-index#az-find
[22]: /cli/azure/reference-index#az-next
[23]: /cli/azure/reference-types-and-status#azure-cli-syntax-components
[24]: /cli/azure/scenario
[25]: /powershell/azure/
[26]: /training/browse/?expanded=azure&products=azure-clis
[27]: #learning-azure-cli
[28]: authenticate-azure-cli.md
[29]: azure-cli-endpoints.md
[30]: azure-cli-extensions-overview.md
[31]: choose-the-right-azure-command-line-tool.md
[32]: https://github.com/Azure/azure-cli/issues/new/choose
[33]: install-azure-cli.md
[34]: reference-docs-index.md
[35]: run-azure-cli-docker.md
[36]: samples-index.md
