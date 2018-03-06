---
title: Get started with Azure CLI 2.0
description: Get started using the Azure CLI 2.0 by learning command basics.
keywords: Azure CLI, CLI help, Azure help, query, automation,
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 02/05/2018
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Get started with Azure CLI 2.0

Welcome to the Azure CLI 2.0! The CLI is a tool designed to get you working quickly and efficiently with Azure services,
with an emphasis on automation. This article introduces features of the CLI and links out to resources that help you be productive.

## Install and log in

If you haven't already, [install the CLI](install-azure-cli.md) or try out the [Azure Cloud Shell](/azure/cloud-shell/overview).

Before using any CLI commands with a local install, you need to log in with [az login](/cli/azure/reference-index#az_login).

```azurecli
az login
```

This command prompts you to log in with an authentication code via a website. There are ways to log in non-interactively,
which are covered in detail in [Log in with Azure CLI 2.0](authenticate-azure-cli.md).

## Common commands

This table lists a few of the common commands used in the CLI links out to their documentation pages in the reference.
All subcommands of these groups and their documentation can be looked up in online reference or with the `--help` argument.

| Resource type | Azure CLI command group |
|---------------|-------------------------|
| [Resource group](/azure/azure-resource-manager/resource-group-overview) | [az group](/cli/azure/group) |
| [Virtual machines](/azure/virtual-machines) | [az vm](/cli/azure/vm) |
| [Storage accounts](/azure/storage/common/storage-introduction) | [az storage account](/cli/azure/storage/account) |
| [Key Vault](/azure/key-vault/key-vault-whatis) | [az keyvault](/cli/azure/keyvault) |
| [Web applications](/azure/ap-service) | [az webapp](/cli/azure/webapp) |
| [SQL databases](/azure/sql-database) | [az sql server](/cli/azure/sql/server) |
| [CosmosDB](/azure/cosmos-db) | [az cosmosdb](/cli/azure/cosmosdb) |

## Finding commands

Commands in the CLI are provided as _subcommands_ of _groups_.
Each group represents a service provided by Azure, and the subgroups divide commands for these services
into logical groupings.

To search for commands, use [az find](/cli/azure/reference-index#az_find). For example, to search for command names containing `secret`,
use the following command:

```azurecli
az find -q secret
```

If you know which group of commands you want to work with, the `--help` argument
may be a better choice. This displays not just detailed information for a command, but when used with a command group, displays all of the available subcommands. For example, when working with Network Security Groups (NSGs) you can find the available
NSG subgroups and commands.

```azurecli
az network nsg --help
```

The CLI has full tab completion for commands under the bash shell.

## Globally available arguments

There are some arguments that are available for every command.

* `--help` prints CLI reference information about commands and their arguments and lists available subgroups and
  commands.
* `--output` changes the output format. The available output formats are `json`, `jsonc` (colorized JSON), `tsv` (Tab-Separated
  Values), and `table` (human-readable ASCII tables). By default the CLI outputs `json`. To learn more about the available
  output formats, see [Output formats for Azure CLI 2.0](format-output-azure-cli.md).
* `--query` uses the [JMESPath query language](http://jmespath.org/) to filter the output returned from Azure services. To learn
  To learn more about queries, see [Query command results with Azure CLI 2.0](query-azure-cli.md) and the [JMESPath tutorial](http://jmespath.org/tutorial.html).
* `--verbose` prints information about resources created in Azure during an operation, and other useful information.
* `--debug` prints even more information about CLI operations, used for debugging purposes. If you encounter a bug, provide output generated with the `--debug` flag on when submitting a bug report.


## Interactive mode

The CLI offers an interactive mode that automatically displays help information and makes it easier to
select subcommands. You enter interactive mode with the `az interactive` command. For more information on interactive mode
and how it helps you learn the CLI, see [Azure CLI 2.0 Interactive Mode](interactive-azure-cli.md).

There is also a [Visual Studio Code plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli) that
offers an interactive experience, including autocomplete and mouse-over documentation.



## Learn CLI basics with quickstarts and tutorials

To get you started with the Azure CLI 2.0, try an in-depth tutorial for setting up virtual machines and using the power
of the CLI to query Azure resources.

> [!div class="nextstepaction"]
> [Create virtual machines with the Azure CLI 2.0 tutorial](azure-cli-vm-tutorial.yml)

If you would rather focus on other services, there are a variety of quickstarts for Azure services that use the CLI.

* [Create a storage account using the Azure CLI](/azure/storage/common/storage-quickstart-create-storage-account-cli)
* [Transfer objects to/from Azure Blob storage using the CLI](/azure/storage/blobs/storage-quickstart-blobs-cli)
* [Create a single Azure SQL database using the Azure CLI](/azure/sql-database/sql-database-get-started-cli)
* [Create an Azure Database for MySQL server using the Azure CLI](/azure/mysql/quickstart-create-mysql-server-database-using-azure-cli)
* [Create an Azure Database for PostgreSQL using the Azure CLI](/azure/postgresql/quickstart-create-server-database-azure-cli)
* [Create a Python web app in Azure](/azure/app-service/app-service-web-get-started-python)
* [Run a custom Docker Hub image in Azure Web Apps for Containers](/azure/app-service/containers/quickstart-custom-docker-image)

## Give feedback

We welcome your feedback for the CLI to help us make improvements and resolve bugs. You can [file an issue on Github](https://github.com/azure/azure-cli/issues) or use the built-in
features of the CLI to leave general feedback with the `az feedback` command.

```azurecli
az feedback
```
