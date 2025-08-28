---
title: What is the Azure CLI? | Microsoft Docs
description: The Azure Command-Line Interface (CLI) is a command-line tool designed to create and manage Azure resources available in Windows, macOS, Linux, and Docker containers.
ms.topic: overview
ms.service: azure-cli
ms.custom: devx-track-azurecli, linux-related-content
keywords: command line interface, azure cli, azure command line, azure command line interface, what is cli, azure cli examples
---

# What is the Azure CLI?

The Azure Command-Line Interface (CLI) is a cross-platform command-line tool to connect to Azure and
execute administrative commands on Azure resources. It allows the execution of commands through a
terminal using interactive command-line prompts or a script.

For interactive use, you first launch a shell such as cmd.exe on Windows, or Bash on Linux or macOS,
and then issue a command at the shell prompt. To automate repetitive tasks, you assemble the CLI
commands into a shell script using the script syntax of your chosen shell, and then you execute the
script.

You can [install the Azure CLI][09] locally on Linux, macOS, or Windows computers. It can also be
used from a browser through the [Azure Cloud Shell][12] or run from inside a Docker container.

## Current Version

[!INCLUDE [current-version](includes/current-version.md)]

## Authentication

Azure CLI supports several authentication methods. For detailed information about authenticating to
Azure from the Azure CLI, see [Sign in with Azure CLI][02].

## Command reference design

The Azure CLI syntax follows a simple `reference name` - `command` - `parameter` - `parameter value`
pattern. For example, switching between subscriptions is often a common task. Here's the syntax.

```azurecli
az account set --subscription "my subscription name"
```

Another common use of the Azure CLI is managing role assignments.

```azurecli
az role assignment create --assignee servicePrincipalName --role Reader --scope /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName
az role assignment delete --assignee userSign-inName --role Contributor
```

For more information on managing subscriptions, see [Manage subscriptions with Azure CLI][14]. See
[Create an Azure service principal with the Azure CLI][04] for an in-depth tutorial on managing
service principals and role assignments.

## PowerShell syntax comparison

[Choose the right command-line tool][10] explains the difference between `tools` and `environments`
with an emphasis on the Azure CLI and Azure PowerShell. It also gives many
[side-by-side command comparisons][11]. Here are two examples:

|Command|Azure CLI|Azure PowerShell|
| --- | --- | --- |
| Create Resource Group | az group create --name \<ResourceGroupName> --location eastus |New-AzResourceGroup -Name \<ResourceGroupName> -Location eastus
| Create Azure Storage Account | az storage account create --name \<StorageAccountName> --resource-group \<ResourceGroupName> --location eastus --sku Standard_LRS --kind StorageV2 | New-AzStorageAccount -Name \<StorageAccountName> -ResourceGroupName \<ResourceGroupName> -Location eastus -SkuName Standard_LRS -Kind StorageV2

For Azure CLI syntax comparisons between Bash and PowerShell environments, see
[Learn Azure CLI syntax differences in Bash, PowerShell and Cmd][07].

## Output formats

The Azure CLI uses JSON as its default output format, but offers other formats as described in
[Output formats for Azure CLI commands][06]. Use the `--output` parameter to format Azure CLI
command results. Here's an example:

```azurecli-interactive
az account list --output table
```

Set your default output by setting the `output` configuration property as described in
[Azure CLI configuration][03].

```azurecli-interactive
az config set core.output=jsonc
```

## Data collection

Azure CLI collects telemetry data by default. Microsoft aggregates collected data to identify
patterns of usage to identify common issues and to improve the experience of Azure CLI. Microsoft
Azure CLI doesn't collect any private or personal data. For example, the usage data helps identify
issues such as commands with low success and helps prioritize our work.

While we appreciate the insights this data provides, we also understand that not everyone wants to
send usage data. You can disable data collection with the
`az config set core.collect_telemetry=false` command. You can also read our [privacy statement][13]
to learn more.

## See Also

- [Onboarding Cheat Sheet][05]
- [Get started with the Azure CLI][08]
- [Full command reference list for the Azure CLI][01]

<!-- link references -->

[01]: ../../docs-ref-autogen/Latest-version/latest/reference-index.yml
[02]: ./authenticate-azure-cli.md
[03]: ./azure-cli-configuration.md#cli-configuration-values-and-environment-variables
[04]: ./azure-cli-sp-tutorial-1.md
[05]: ./cheat-sheet-onboarding.md
[06]: ./format-output-azure-cli.md
[07]: ./get-started-tutorial-2-environment-syntax.md
[08]: ./get-started-with-azure-cli.md
[09]: ./install-azure-cli.md
[10]: choose-the-right-azure-command-line-tool.md
[11]: choose-the-right-azure-command-line-tool.md#azure-cli-vs-azure-powershell-side-by-side-command-comparison
[12]: https://ms.portal.azure.com/#cloudshell/
[13]: https://privacy.microsoft.com/privacystatement
[14]: manage-azure-subscriptions-azure-cli.md
