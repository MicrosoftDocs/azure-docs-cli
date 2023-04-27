---
title: Release notes & updates – Azure CLI | Microsoft Docs
description: Learn about the latest Azure Command-Line Interface (CLI) release notes and updates for both the current and beta versions of the CLI.
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.date: 04/04/2023
ms.topic: article
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli updates, azure cli notes, azure cli versions
---

# Azure CLI release notes

> [!CHANGES]
> * "Reference group" = the first word following `az`.
> 1. Release notes are sorted by reference group and no longer by an internal source code group or description.  There will now be a direct linkable connection between our autogen reference content and our release notes.  For example:
>    - "ARM" is now (az) "deployment", or "bicep" or "resourcemanagement etc.
>    - "App Service" is now "functionapp", or "app config" or "webapp" etc.
>    - "RDBMS" is now "mysql" or "postgres" etc.
>    - "arctransfer" is now "arc"
>    - "AKS" and "aks-preview" are now "aks" for both Core and Extension release notes
> 2. Both Core and Extension command are in a single `Release Notes` doc
> 3. Core and extension release notes have been combined, but as there are no dates for extensoin releases in *.HST, I've made up values.  These dates will need to be entered manually (preferably not), extracted from Github history, or a creative option #3.
> 4. Extra `++++` that cause a line break have been removed from extension release notes
> 5. Only a sample of Core and Extension relase notes have been copied for this POC2
> 6. Source code for extension release notes are in the extension name, like [application-insights](https://github.com/Azure/azure-cli-extensions/tree/main/src/application-insights/HISTORY.rst) instead of `az monitor`.  This new design would sort these release notes under `monitor` as `az application-insights` does not exist.  Extension [alertsmanagement](https://github.com/Azure/azure-cli-extensions/tree/main/src/alertsmanagement/HISTORY.rst) also contains `az monitor` commands.  These release notes will need to be combined under a single `monitor` H2.
> 7. Q: If 2 extensions can contain release notes for a single reference group (like `az monitor`), does this also happen in reverse?  One extension contains > 1 reference group, like **ExtensionNameABC** contains commands for `az abc` and `az def`?

POC3 differences
- block format
- table format
- tags for command group indicating command group type (core, extension).  Can be any meaningful tag we select.
- Q: What value is there to adding a link to the GitHub release PR?

**Block example**

>[version 2.39.0](https://github.com/Azure/azure-cli/pull/26231), August 02, 2022
> 
> - `az account list`: Add TenantId column to table output
> - [az account list](/cli/azure/account#az-account-list): Add TenantId column to table output

>[version 0.2.5](https://github.com/Azure/azure-cli-extensions/blob/main/src/account/HISTORY.rst#025), April 1, 2022 (Extension)
>
> - Update SDK `azure-mgmt-subscription` version to 3.1.1
> - Add new command `az account accept-ownership-status` to support accept subscription ownership status

**Table example**

## account

|Version|Date|Release note
|-|-|-|
|**Version 2.39.0**| August 02, 2022 | - `az account list`: Add TenantId column to table output
|**Version 0.2.5**| April 1, 2022 (Extension)|- Update SDK `azure-mgmt-subscription` version to 3.1.1
| | | - Add new command `az account accept-ownership-status` to support accept subscription ownership status
|**Version 2.34.0**| March 01, 2022 | - `az account management-group entities`: Add a new command group to support entities (Management Groups and Subscriptions) operations for the authenticated user
| | | - `az account management-group hierarchy-settings`: Add a new command group to support operations on hierarchy settings defined at the management group level
| | | - `az account management-group tenant-backfill`: Add a new command group to support backfilling subscriptions for the tenant
| | | - `az account management-group subscription show`: Get the details of a given subscription under a given management group
| | | - `az account management-group subscription show-sub-under-mg`: Show what subscription is under a given management group
| | | - `az account management-group check-name-availability`: Check if a management group name is valid and available
| | | - [BREAKING CHANGE] `az account show`: Drop --sdk-auth
|**Version 2.32.0**| January 04, 2022 (Extension) | - `az account show/set`: Add -n, --name argument
|**Version 0.2.4,**| December 12, 2022 |- Update `minCliCoreVersion` requirement from `2.3.1` to `2.38.0`.
| | | - GA of `az account alias`: Manage subscription alias.
| | | - Update SDK `azure-mgmt-subscription` version to 3.0.0 and api-version to 2021-10-01.
|**Version 0.2.1**| November 1, 2022 (Extension) | - `az account alias create`: add --reseller-id
|**Version 0.2.0**| October 1, 2022 (Extension) | - Breaking Change: remove `az account subscription create`.
| | | - Add `az account alias` commands.
| | | - Add `az account tenant` commands.
| | | - Support sovereign clouds.
|**Version 0.1.0**| June 1, 2022 (Extension) | Initial release.
|**Version 2.31.0**| December 07, 2021 |- `az account management-group`: Add new parameters `--no-register` to skip RP registration for `Microsoft.Management`

## adp

|Version|Date|Release note
|-|-|-|
|**0.1.0**| January 1, 1900 | Initial release.

## advisor

|Version|Date|Release note
|-|-|-|
|**Version 2.39.0**| August 02, 2022 | - Fix #11070: `az advisor recommendation disable`: Fix NoneType error
|**Version 2.0.50**| November 6, 2018| - GA release

## Next command group

**more history here**

## Azure CLI GA release

**Version 2.0.0, February 27, 2017**

This release of Azure CLI 2.0 is the first "Generally Available" release
General availability applies to these command modules:
- Container Service (acs)
- Compute (including Resource Manager, VM, virtual machine scale sets, Managed Disks)
- Networking
- Storage

These command modules can be used in production and are supported by standard Microsoft SLA
You can open issues directly with Microsoft support or on our [github issues list](https://github.com/azure/azure-cli/issues/)
You can ask questions on [StackOverflow using the azure-cli tag](http://stackoverflow.com/questions/tagged/azure-cli),
or contact the product team at [azfeedback@microsoft.com](mailto:azfeedback@microsoft.com)
You can provide feedback from the command line with the `az feedback` command

The commands in these modules are stable and the syntax is not expected to change in upcoming releases of this version of Azure CLI

To verify the version of the CLI, use `az --version`
The output lists the version of the CLI itself (2.0.0 in this release), the individual command modules,
and the versions of Python and GCC that you're using

```text
azure-cli (2.0.0)

acs (2.0.0)
appservice (0.1.1b5)
batch (0.1.1b4)
cloud (2.0.0)
component (2.0.0)
configure (2.0.0)
container (0.1.1b4)
core (2.0.0)
documentdb (0.1.1b2)
feedback (2.0.0)
iot (0.1.1b3)
keyvault (0.1.1b5)
network (2.0.0)
nspkg (2.0.0)
profile (2.0.0)
redis (0.1.1b3)
resource (2.0.0)
role (2.0.0)
sql (0.1.1b5)
storage (2.0.0)
vm (2.0.0)

Python (Darwin) 2.7.10 (default, Jul 30 2016, 19:40:32)
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.34)]
```

> [!Note]
> Some of the command modules have a "b*n*" or "rc*n*" postfix
> These command modules are still in preview and will become generally available in the future

We also have nightly preview builds of the CLI
For information, see these instructions on [getting the nightly builds](https://github.com/Azure/azure-cli#nightly-builds),
and these instructions on [developer setup and contributing code](https://github.com/Azure/azure-cli#developer-setup)

You can report issues with nightly preview builds in the following ways:
- Report issues in our [github issues list](https://github.com/azure/azure-cli/issues/)
- Contact the product team at [azfeedback@microsoft.com](mailto:azfeedback@microsoft.com)
- Provide feedback from the command line with the `az feedback` command

**Tag example**

![tag example](./media/ReleaseNotesScreenCapture1.png)
