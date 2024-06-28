---
title: Get started with Azure Command-Line Interface (CLI) | Microsoft Docs
description: Learn how to start using the Azure CLI by completing common commands. You can begin using the Azure CLI by running it in an Azure Cloud Shell environment.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 03/07/2024
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli 
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli, how to use azure cli, azure command line interface, how to open azure cli, azure cli commands
---
# Get started with Azure CLI

Welcome to the Azure Command-Line Interface (CLI)! This article introduces the CLI and helps you complete common tasks.

## Install or run in Azure Cloud Shell

The easiest way to learn how to use the Azure CLI is by running a Bash environment in [Azure Cloud Shell](https://ms.portal.azure.com/#cloudshell/) through your browser. To learn about Cloud Shell, see [Quickstart for Bash in Azure Cloud Shell](/azure/cloud-shell/quickstart).

When you're ready to install the Azure CLI, see the [installation instructions](install-azure-cli.md)
for Windows, Linux, macOS, and Docker container. If you're using the Azure classic deployment model, [install the Azure classic CLI](install-classic-cli.md).

Check your version by running `az --version`. Azure Cloud Shell always has the latest version of the Azure CLI preinstalled.

```azurecli-interactive
az version
```

## Sign into the Azure CLI

Before using any Azure CLI commands with a local install, you need to sign in with [az login](/cli/azure/reference-index#az-login).

[!INCLUDE [interactive-login](includes/interactive-login.md)]

After logging in, you receive a list of subscriptions associated with your Azure account. The
subscription information with `isDefault: true` is the currently activated subscription after
logging in. To select another subscription, use the [az account set](/cli/azure/account#az-account-set)
command with the subscription ID of the desired account. For more information about subscription selection,
see [Manage Azure subscriptions](manage-azure-subscriptions-azure-cli.md).

There are ways to sign in non-interactively, which are covered in detail in [Sign in with Azure CLI](authenticate-azure-cli.md#sign-into-azure-with-azure-cli).

## Find commands

Azure CLI commands are organized as command groups. Each group represents an area of an Azure service. There are two options to find command groups:

* Use the [az find](/cli/azure/reference-index#az-find) command. For example, to search for command names containing `vm`, use the following command:

  ```azurecli-interactive
  az find vm
  ```

* Use the `--help` argument to get a complete list of subgroups within a reference group. This example returns all the subgroups for virtual machines:

  ```azurecli-interactive
  az vm --help
  ```
  
  Here is example output with lines omitted for brevity:

  ```output
  Subgroups:
    application            : Manage applications for VM.
    availability-set       : Group resources into availability sets.
    boot-diagnostics       : Troubleshoot the startup of an Azure Virtual Machine.
    ...
  ```

  Here's another example that finds the Azure CLI commands for grouping virtual machines into availability sets, a _subgroup_ of `az vm`:

  ```azurecli-interactive
  az vm availability-set --help
  ```

  Also use `--help` to get parameter lists and command examples for a reference _command_.

  ```azurecli-interactive
  az vm create --help
  ```

  Here is example output with lines omitted for brevity:

  ```output
  Arguments
      --name  [Required] : Name of the virtual machine.
      ...
  Authentication Arguments
      --admin-password   : Password for the VM if authentication type is 'Password'.
      --admin-username   : Username for the VM...
      ...
  Managed Service Identity Arguments
      ...
  Examples
      Create a VM from a custom managed image.
        az vm create -g MyResourceGroup -n MyVm --image MyImage
      ...
  ```

* Use the [A to Z reference index](/cli/azure/reference-index) that lists all command groups alphabetically.

## Find published samples and articles

If you prefer to learn Azure CLI syntax by seeing tested published examples, there are two indexes of article content:

* [Samples index A to Z](./samples-index.md). The samples index provides a list of Azure CLI samples sorted by [subject area](./samples-index.md?tabs=service), [reference group](./samples-index.md?tabs=command), and [GitHub repository](./samples-index.md?tabs=github).

* [Article index A to Z](./reference-docs-index.md). Use your keyboard `find` shortcut keys, like
  `Ctrl + F`, to drop quickly to the reference command group in which you're interested. For example, the article index looks something like this for `az vm`:

  |Reference subgroup|Azure CLI article showing reference use
  |---|---|
  | [az vm](/cli/azure/vm) | [Output formats for Azure CLI commands](/cli/azure/format-output-azure-cli)
  |  | [How to use variables in Azure CLI commands](/cli/azure/azure-cli-variables)
  |  | [Get VM information with queries](/cli/azure/azure-cli-vm-tutorial-4)
  |  | {More articles listed here.}
  | [az vm aem](/cli/azure/vm/aem) | [New Version of Azure VM extension for SAP solutions](/azure/sap/workloads/vm-extension-for-sap-new)
  |  | [Standard Version of Azure VM extension for SAP solutions](/azure/sap/workloads/vm-extension-for-sap-standard)
  | [az vm application](/cli/azure/vm/application) | {...}

## Use tab completion

The CLI has full tab completion for commands in a Bash environment. To enable tab completion in a PowerShell environment, see [Enable tab completion in PowerShell](./install-azure-cli-windows.md#enable-tab-completion-in-powershell).

## Be aware of globally available arguments

There are some arguments that are available for most commands.

* `--help` prints CLI reference information about commands and their arguments and lists available subgroups and
  commands.

* `--output` changes the output format. The available output formats are `json`, `jsonc` (colorized JSON), `tsv` (Tab-Separated
  Values), `table` (human-readable ASCII tables), and `yaml`. By default the CLI outputs `json`. To learn more about the available
  output formats, see [Output formats for Azure CLI](format-output-azure-cli.md).
* `--query` uses the [JMESPath query language](http://jmespath.org/) to filter the output returned from Azure services. To learn more about queries, see [Query command results with Azure CLI](use-azure-cli-successfully-query.md) and the [JMESPath tutorial](http://jmespath.org/tutorial.html).
* `--verbose` prints information about resources created in Azure during an operation, and other useful information.
* `--debug` prints even more information about CLI operations, used for debugging purposes. If you find a bug, provide output generated with the `--debug` flag on when submitting a bug report. It can be used, for example, to identify the REST API that the command executed is invoking underneath, and the response received from the service.
* `--subscription` is the name or ID of a subscription. For more information about setting your default subscription, see [Manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md).
* `--only-show-errors` suppresses warnings in command output and only shows errors.

## Use interactive mode

The CLI offers an interactive mode that automatically displays help information and makes it easier to
select subcommands. You enter interactive mode with the [az interactive](/cli/azure/reference-index#az-interactive) command.

```azurecli-interactive
az interactive
```

For more information on interactive mode, see [Run the Azure CLI in Interactive Mode](interactive-azure-cli.md).

There's also a [Visual Studio Code plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli) that
offers an interactive experience, including autocomplete and mouse-over documentation.

## Learn Azure CLI basics with quickstarts and tutorials

To learn how to use the Azure CLI, try our [onboarding tutorial](./get-started-tutorial-0-before-you-begin.md) that teaches you the following skills while working with Azure Storage:

* [Find and change your default subscription.](./get-started-tutorial-1-prepare-environment.md#find-and-change-your-active-subscription)
* [Create an Azure resource containing a random ID in the name.](./get-started-tutorial-1-prepare-environment.md#create-a-resource-group-containing-a-random-id)
* [Set environment variables.](./get-started-tutorial-1-prepare-environment.md#set-environment-variables)
* [Learn syntax differences between Bash, PowerShell, and Cmd.](./get-started-tutorial-2-environment-syntax.md)
* [Debug Azure CLI reference commands.](./use-azure-cli-successfully-troubleshooting.md#the---debug-parameter)
* [Get properties from a local JSON file.](./get-started-tutorial-3-use-variables.md#get-the-contents-of-a-json-file-and-store-it-in-a-variable). This example shows how to get configuration values for development, stage, and production. 
* [Delete multiple resources using a script.](./get-started-tutorial-4-delete-resources.md#delete-multiple-azure-resources-using-a-script)

> [!NOTE]
>
> In scripts and on the Microsoft documentation site, Azure CLI examples are written for the
> Bash shell. Most one-line examples will run on any platform. Longer examples which include line
> continuations (`\`), variable assignment, _or quotes_ need to be modified to work in other shells,
> including PowerShell. For more information on syntax differences between environments,
> see [Learn syntax differences between Bash, PowerShell, and Cmd.](./get-started-tutorial-2-environment-syntax.md)

## Give feedback

We welcome your feedback for the CLI to help us make improvements and resolve bugs. You can [file an issue on GitHub](https://github.com/azure/azure-cli/issues) or use the built-in
features of the CLI to leave general feedback with the [az feedback](/cli/azure/reference-index#az-feedback) command.

```azurecli-interactive
az feedback
```

## See also

* [Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* [Learn to use the Azure CLI tutorial](./get-started-tutorial-0-before-you-begin.md)
* [Use the Azure CLI in a Bash environment](./use-azure-cli-successfully-bash.md)
* [Considerations for using the Azure CLI in a PowerShell environment](./use-azure-cli-successfully-powershell.md)
