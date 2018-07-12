---
title: Differences between Azure CLI products  
description: Understand how Azure CLI products are named and versioned, and how to upgrade.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 07/12/2018
ms.topic: conceptual
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Differences between Azure CLI products

As of the end of June 2018, explicit version numbers have been removed from Azure CLI product names. This change helps eliminate
confusion that sometimes showed up in documentation where users were told to use "the Azure CLI" but it was unclear what version
of the product was being referenced. If you're familiar with the old product names, here is how they have changed:

* Azure CLI versions 2.0 and later are now referred to only as "Azure CLI."
* Earlier Azure CLI versions (1.x and lower) are now referred to as "Azure classic CLI."

In particular, the name change to Azure classic CLI makes it clear that this tool is meant to be used only with the classic deployment
model. The classic CLI is also no longer updated or maintained. For this reason, and many more, it's recommended that you move any classic
deployments to use the Azure Resource Manager model and migrate to the latest available version of the Azure CLI.

If you are still using the classic CLI, you can learn about the process of migrating by seeing the following articles:

* [Migrate from Classic to Azure Resource Manager](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/migration-classic-resource-manager-overview)
* [Install the Azure CLI](install-azure-cli.md)
* [Migrating from Azure classic CLI to Azure CLI](https://github.com/Azure/azure-cli/blob/dev/doc/classic_cli_migration.md)