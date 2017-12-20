---
title: Get started with Azure CLI 2.0
description: Get started with Azure CLI 2.0
keywords: Azure CLI, CLI help, Azure help, query, automation,  
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 12/15/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Get started with Azure CLI 2.0

Welcome to the Azure CLI 2.0! The CLI is a tool designed to get you working quickly and efficiently with Azure services
and products, and is geared towards making tasks efficient and easy to automate it. This article is meant to introduce
you to the features of the CLI and is a companion to the [Learn how to use the Azure CLI 2.0](azure-cli-introduction-tutorial.yml)
tutorial.

## Install and log in

If you haven't already, [install the CLI](install-azure-cli.md) or try out the [Azure Cloud Shell](/azure/cloud-shell/overview).

Before performing any operations with the CLI, you will need to log in with the [az login](/cli/azure/index#az_login) command.

```azurecli
az login
```

This will prompt you to log in with an authentication code and a URL to submit it to. There are ways to log in non-interactively,
which are covered in detail in [Log in with Azure CLI 2.0](authenticate-azure-cli.md). 

## Finding commands

Commands in the CLI are provided as _subcommands_ of _groups_, in a manner similar to how many other modern CLIs work.
Each group represents a particular type of service or product provided by Azure, and the subcommands and subgroups of it
break up the way you interact with those resources.

For finding specific commands, there is the [az find](cli/azure/?view=azure-cli-latest#az_find) command which searches the
CLI command index for your search term. If you know the group containing the command you're looking for, the `--help` argument
also prints out the subgroups and commands contained within that group.

For example, when working with virtual machine scale sets (VMSS), you run the following command to find out what commands are available.

```azurecli
az find -q vmss
```

Since the `find` command can be rather slow, if you want to find commands within a specific group, the `--help` argument
may be the better choice. For example, if you will be working with Network Security Groups (NSGs), you can find the supported
NSG operations with the following command.

```azurecli
az network nsg --help
```

## Common commands

There are a few command grops that are used frequently with the CLI. This table lists 
them and links out to their documentation pages in the reference. All subcommands of
these groups, and their documenation, can be looked up in online reference or with the `--help` argument.
 

| Resource type | Azure CLI command group |
|---------------|-------------------------|
| [Resource group](/azure/azure-resource-manager/resource-group-overview) | [az group](/cli/azure/group) |
| [Virtual machines](/azure/virtual-machines) | [az vm](/cli/azure/vm) |
| [Storage accounts](/azure/storage/common/storage-introduction) | [az storage account](/cli/azure/storage/account) |
| [Key Vault](/azure/key-vault/key-vault-whatis) | [az keyvault](/cli/azure/keyvault) |
| [Web applications](/azure/ap-service) | [az webapp](/cli/azure/webapp) |
| [SQL databases](/azure/sql-database) | [az sql server](/cli/azure/sql/server) |
| [CosmosDB](/azure/cosmos-db) | [az cosmosdb](/cli/azure/cosmosdb) |
| [Azure Container Instances](/azure/container-instances) | [az aci](/cli/azure/aci) |

## Interactive mode

The CLI also offers an interactive mode which automatically displays help information and makes it easier to
select subcommands. You can enter this mode with the `az interactive` command. For more information on interactive mode
and how it can help you get familiar with the CLI experience, see [Azure CLI 2.0 Interactive Mode](interactive-azure-cli.md).

There is also a [Visual Studio Code plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli) that
offers a similar interactive experience, including autocomplete and mouse-over documentation.

## Globally available arguments

There are some arguments that are available for every command.

* `--debug` prints verbose information for debugging purposes when running a comamnd. If you encounter a bug, you should
  always try and provide output generated with the `--debug` flag on when submitting a bug report.
* `--verbose` prints more information than usual, but not at the level of debug information.
* `--help` gives you access to the CLI reference information from the command line, and lists available subgroups and
  commands.
* `--output` changes the output format. The available output formats are `json`, `jsonc` (colorized JSON), `tsv` (Tab-Separated
  Values), and `table` (human-readable ASCII tables). By default the CLI outputs `json`. To learn more about the available
  output formats, see [Output formats for Azure CLI 2.0](format-output-azure-cli.md).
* `--query` uses the [JMESPath query language](http://jmespath.org/) to filter the output returned from Azure services
  _before_ displaying it to the user in the chosen output format. To learn how to effectively use queries, see
  [Query command results with Azure CLI 2.0](query-azure-cli.md) and the [JMESPath tutorial](http://jmespath.org/tutorial.html). 

## Learn CLI basics with samples and tutorials

We also offer a short tutorial for you to learn the basics of the CLI, and help you get started with performing
both common day-to-day tasks as well as setting up one-time configurations for you to get going. If you're
interested, go ahead and check out [Learn how to use the Azure CLI 2.0](azure-cli-introduction-tutorial.yml).
There are also a large number of CLI samples to check out. We recommend starting with [Azure CLI Samples for Linux virtual macines](/azure/virtual-machines/linux/cli-samples?toc=%2fcli%2fazure%2ftoc.json).

## Give feedback

We welcome your feedback for the CLI to help us make improvements and resolve bugs. You can [file an issue on Github](https://github.com/azure/azure-cli/issues) or use the built-in features of the CLI to leave general feedback with the `az feedback` command.

```azurecli
az feedback
```
