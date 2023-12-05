---
title: Get started with Azure Command-Line Interface (CLI) | Microsoft Docs
description: Learn how to start using the Azure CLI by completing common commands. You can begin using the Azure CLI by running it in an Azure Cloud Shell environment.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 12/04/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli 
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli, how to use azure cli, azure command line interface, how to open azure cli, azure cli commands
---
# Get started with Azure CLI

Welcome to the Azure Command-Line Interface (CLI)!  This article introduces the CLI and helps you complete common tasks.

> [!NOTE]
>
> In scripts and on the Microsoft documentation site, Azure CLI examples are written for the `bash` shell. One-line examples will
> run on any platform. Longer examples which include line continuations (`\`) or variable assignment need to be modified to work
> on other shells, including PowerShell.

## Install or run in Azure Cloud Shell

The easiest way to learn how to use the Azure CLI is by running it in an Azure Cloud Shell environment through your browser. To learn about Cloud Shell, see  [Quickstart for Bash in Azure Cloud Shell](/azure/cloud-shell/quickstart).

When you're ready to install the CLI, see the [installation instructions](install-azure-cli.md).

After installing the CLI for the first time, check that it's installed and you've got the correct version by running `az --version`.

> [!NOTE]
> If you're using the Azure classic deployment model, [install the Azure classic CLI](install-classic-cli.md).

## How to sign into the Azure CLI

Before using any Azure CLI commands with a local install, you need to sign in with [az login](/cli/azure/reference-index#az-login).

[!INCLUDE [interactive-login](includes/interactive-login.md)]

After logging in, you see a list of subscriptions associated with your Azure account. The subscription information with `isDefault: true` is the currently activated subscription after logging in. To select another subscription, use the [az account set](/cli/azure/account#az-account-set) command with the subscription ID to switch to. For more information about subscription selection, see [Use multiple Azure subscriptions](manage-azure-subscriptions-azure-cli.md).

There are ways to sign in non-interactively, which are covered in detail in [Sign in with Azure CLI](authenticate-azure-cli.md).

## Common Azure CLI commands

This table lists some common commands used in the CLI and links to their reference documentation.

| Resource type | Azure CLI command group |
|---------------|-------------------------|
| [Resource group](/azure/azure-resource-manager/resource-group-overview) | [az group](../latest/docs-ref-autogen/group.yml) |
| [Virtual machines](/azure/virtual-machines) | [az vm](../latest/docs-ref-autogen/vm.yml) |
| [Storage accounts](/azure/storage/common/storage-introduction) | [az storage account](../latest/docs-ref-autogen/storage/account.yml) |
| [Key Vault](/azure/key-vault/key-vault-whatis) | [az keyvault](../latest/docs-ref-autogen/keyvault.yml) |
| [Web applications](/azure/app-service) | [az webapp](../latest/docs-ref-autogen/webapp.yml) |
| [SQL databases](/azure/sql-database) | [az sql server](../latest/docs-ref-autogen/sql/server.yml) |
| [CosmosDB](/azure/cosmos-db) | [az cosmosdb](../latest/docs-ref-autogen/cosmosdb.yml) |

## Finding commands

Azure CLI commands are organized as _commands_ of _groups_. Each group represents an Azure service, and commands operate on that service.

To search for commands, use [az find](/cli/azure/reference-index#az-find). For example, to search for command names containing `secret`,
use the following command:

```azurecli-interactive
az find secret
```

Use the `--help` argument to get a complete list of commands and subgroups of a group. For example, to find the CLI commands for working with
Network Security Groups (NSGs):

```azurecli-interactive
az network nsg --help
```

The CLI has full tab completion for commands under the bash shell.

## Globally available arguments

There are some arguments that are available for every command.

* `--help` prints CLI reference information about commands and their arguments and lists available subgroups and
  commands.
* `--output` changes the output format. The available output formats are `json`, `jsonc` (colorized JSON), `tsv` (Tab-Separated
  Values), `table` (human-readable ASCII tables), and `yaml`. By default the CLI outputs `json`. To learn more about the available
  output formats, see [Output formats for Azure CLI](format-output-azure-cli.md).
* `--query` uses the [JMESPath query language](http://jmespath.org/) to filter the output returned from Azure services. To learn more about queries, see [Query command results with Azure CLI](query-azure-cli.md) and the [JMESPath tutorial](http://jmespath.org/tutorial.html).
* `--verbose` prints information about resources created in Azure during an operation, and other useful information.
* `--debug` prints even more information about CLI operations, used for debugging purposes. If you find a bug, provide output generated with the `--debug` flag on when submitting a bug report.

## Interactive mode

The CLI offers an interactive mode that automatically displays help information and makes it easier to
select subcommands. You enter interactive mode with the [az interactive](/cli/azure/reference-index#az-interactive) command.

```azurecli-interactive
az interactive
```

For more information on interactive mode, see [Azure CLI Interactive Mode](interactive-azure-cli.md).

There's also a [Visual Studio Code plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli) that
offers an interactive experience, including autocomplete and mouse-over documentation.

## Learn CLI basics with quickstarts and tutorials

To learn how to use the Azure CLI, try our [onboarding tutorial](./get-started-tutorial-0-before-you-begin.md) which will teach you the following skills while working with Azure Storage:

* [Decide what environment you should use](./get-started-tutorial-0-before-you-begin.md#what-shell-environment-should-i-use)
* [Find and change your default subscription](./get-started-tutorial-1-prepare-environment.md#find-and-change-your-active-subscription)
* [Create an Azure resource containing a random ID in the name](./get-started-tutorial-1-prepare-environment.md#create-a-resource-group-containing-a-random-id)
* [Set environment variables](./get-started-tutorial-1-prepare-environment.md#set-environment-variables)
* [Learn syntax differences between Bash, PowerShell and Cmd](./get-started-tutorial-2-environment-syntax.md)
* [Debug Azure CLI reference commands](./get-started-tutorial-2-environment-syntax.md#debug-azure-cli-reference-commands)
* [Get properties from a local JSON file](./get-started-tutorial-3-use-variables.md#get-the-contents-of-a-json-file-and-store-it-in-a-variable)
* [Delete multiple resources using a script](./get-started-tutorial-4-delete-resources.md#delete-multiple-azure-resources-using-a-script)

There are also Quickstarts for other popular services.

* [Create a storage account using the Azure CLI](/azure/storage/common/storage-quickstart-create-storage-account-cli)
* [Transfer objects to/from Azure Blob storage using the CLI](/azure/storage/blobs/storage-quickstart-blobs-cli)
* [Create a single Azure SQL database using the Azure CLI](/azure/sql-database/sql-database-get-started-cli)
* [Create an Azure Database for MySQL server using the Azure CLI](/azure/mysql/quickstart-create-mysql-server-database-using-azure-cli)
* [Create an Azure Database for PostgreSQL using the Azure CLI](/azure/postgresql/quickstart-create-server-database-azure-cli)
* [Create a Python web app in Azure](/azure/app-service/app-service-web-get-started-python)
* [Run a custom Docker Hub image in Azure Web Apps for Containers](/azure/app-service/containers/quickstart-custom-docker-image)

## Give feedback

We welcome your feedback for the CLI to help us make improvements and resolve bugs. You can [file an issue on GitHub](https://github.com/azure/azure-cli/issues) or use the built-in
features of the CLI to leave general feedback with the [az feedback](/cli/azure/reference-index#az-feedback) command.

```azurecli-interactive
az feedback
```

## See also

* [Onboarding cheat sheet](./cheat-sheet-onboarding.md)
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)
* [Full command reference list for the Azure CLI](../latest/docs-ref-autogen/reference-index.yml)
