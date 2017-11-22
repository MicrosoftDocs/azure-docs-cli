---
title: Get started with Azure CLI 2.0
description: Get started with Azure CLI 2.0
keywords: Azure CLI, Azure management, virtual machines, vms, vnet, networks, azure scripting
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 11/23/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Get started with Azure CLI 2.0

Azure CLI 2.0 is a command line tool for managing Azure resources. You can use it through your browser
with [Azure Cloud Shell](/azure/cloud-shell/overview), or you can [install the CLI](install-azure-cli.md) and
run it from your local machine.


The CLI is designed to make administration of Azure resources easy to understand and easy to automate. This article
will heklp you get started by discussing some of the most common tasks performed with the CLI, introduce querying and
output formats for getting information from the CLI outputs, and provide links to tutorials that will help understanding
of how to do certain types of deployment and querying in the Azure ecosystem.

## Authenticating with Azure CLI

If you are using [Azure Cloud Shell](/azure/cloud-shell/overview), authentication is automatically performed for you. Otherwise, you need
to use the `az login` command, and log in interactively with the service:

```azurecli
az login
```

This provides a link to the Azure CLI authentication portal, and a one-time code to authorize with. Authentication expires
if it is not used for a period of 14 days. There are other advanced authentication methods that can be used once
you have configured the appropriate Azure resources:

* For logging in with Managed Service Identities (MSI) see [Configure MSI for an Azure VM](/azure/active-directory/msi-qs-configure-cli-windows-vm?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json) and [Sign in on an Azure VM using MSI](/azure/active-directory/msi-how-to-get-access-token-using-msi?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json)
* For logging in with an Active Directory service principal, see [Create a service principal](create-an-azure-service-principal-azure-cli.md)

## Common operations with Azure

To help with getting started quickly, here is a list of the most common operations used with the CLI. Any of these can have their help information printed with the `---help` option. There is also the online [Azure CLI reference documentation](/cli/azure/).

| TABLE | GOES HERE |
|-------|-----------|
| wtf | who knows |

## Queries and output formats

Oftentimes the full output of a CLI command is not needed, or you need to find specific information from a query to the Azure services. This is where
you can take advantage of the power of the `--query` argument, which is allowed for all CLI commands and operates on the returned output. This
argument takes a [JMESPath](http://jmespath.org/) expression, and evaluates it against the JSON response from contacting the service. For learning the basics
of JMESPath, try out the [JMESPath tutorial](http://jmespath.org/tutorial.html).

Queries are most useful when combined with output formats, which are specified with the `--output` argument to any command. The default output format is JSON,
but there is also support for tab-separated values (TSV) and pretty-printed ASCII tables. When doing your own processing on CLI results, TSV will
be the most useful in many cases. When collecting data for human inspection in the console, prefer using tables.

For more information, see the detailed documentation on [queries](query-azure-cli.md) and [output formats](format-output-azure-cli.md).

## Get samples

To learn more about ways to use the Azure CLI, check out some samples demonstrating common things done with Azure services. Our most popular
samples are for
[Linux VMs](/azure/virtual-machines/virtual-machines-linux-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json),
[Windows VMs](/azure/virtual-machines/virtual-machines-windows-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json),
[Web apps](/azure/app-service-web/app-service-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json), and
[SQL Database](/azure/sql-database/sql-database-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json).f

## Tutorials

There are also a variety of tutorials designed to help users get started with common CLI tasks. These tutorials offer an in-browser experience integrated
with the Azure Cloud Shell to make them easy to run and understand.

* [Deploying an application with microservices](azure-cli-tutorial-microservices.yml): Using the CLI, deploy existing components that fit into a simplified [microservices architecture](/azure/architecture/guide/architecture-styles/microservices).
* [Inspect existing services](azure-cli-tutorial-inspection.yml): Using the CLI, query existing Azure resources to get information on their state and make changes to large numbers of resources all at once.
* [Deploying load balancing](azure-cli-tutorial-balance.yml): Inspect running services and use [Azure Load Balancing](/azure/load-balancer/) to get better performance without needing to create additional VMs or applications.
